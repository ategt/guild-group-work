/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.Category;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class CategoryDAODBImpl implements CategoriesInterface {

    //create query
    private static final String SQL_INSERT_CATEGORY = "INSERT INTO category (name) VALUES (?)";

    //update query
    private static final String SQL_UPDATE_CATEGORY = "UPDATE category SET name = ? WHERE id = ?";

    //delete query
    private static final String SQL_DELETE_CATEGORY = "DELETE FROM category where id = ?";

    //get query
    private static final String SQL_GET_CATEGORY = "SELECT * FROM category where id = ?";

    //list query
    private static final String SQL_GET_CATEGORY_LIST = "SELECT * FROM category";

    private JdbcTemplate jdbcTemplate;

    public CategoryDAODBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Category create(Category category) {
        jdbcTemplate.update(SQL_INSERT_CATEGORY,
                category.getName()
        );

        int id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        category.setId(id);

        return category;
    }

    @Override

    public Category get(Integer id) {
        return jdbcTemplate.queryForObject(SQL_GET_CATEGORY, new CategoryDAODBImpl.CategoryMapper(), id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void update(Category category) {
        jdbcTemplate.update(SQL_UPDATE_CATEGORY,
                category.getName(),
                category.getId()
        );
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(Category category) {
        jdbcTemplate.update(SQL_DELETE_CATEGORY, category.getId());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Category> listCategories() {
        return jdbcTemplate.query(SQL_GET_CATEGORY_LIST, new CategoryDAODBImpl.CategoryMapper());
    }

    private static final class CategoryMapper implements RowMapper<Category> {

        public Category mapRow(ResultSet rs, int i) throws SQLException {

            Category category = new Category();

            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));

            return category;
        }

    }

}
