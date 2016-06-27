/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class StaticPageDAODBImpl implements StaticPageInterface {

    private static final String SQL_INSERT_STATIC_PAGE = "INSERT INTO capstone.static_page (title, content, image_id) VALUES (?, ?, ?);";
    private static final String SQL_UPDATE_STATIC_PAGE = "UPDATE capstone.static_page SET title=?, content=?, image_id=? WHERE id=?";
    private static final String SQL_GET_STATIC_PAGE_LIST = "SELECT * FROM capstone.static_page";
    private JdbcTemplate jdbcTemplate;

    @Inject
    public StaticPageDAODBImpl(JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public StaticPage create(StaticPage staticPage) {

        jdbcTemplate.update(SQL_INSERT_STATIC_PAGE,
                staticPage.getTitle(),
                staticPage.getContent(),
                staticPage.getImage_id());

        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);  //gets next unique id

        staticPage.setId(id);

        return staticPage;

    }

    private static final String GET_STATIC_PAGE_BY_ID = "SELECT * FROM static_page WHERE id = ?;";

    @Override
    public StaticPage get(Integer id) {
        if (id == null) {
            return null;
        }
        try {
            return jdbcTemplate.queryForObject(GET_STATIC_PAGE_BY_ID, new StaticPageMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }
    }

    private static final String GET_STATIC_PAGE_BY_TITLE = "SELECT * FROM static_page WHERE title = ?;";

    @Override
    public StaticPage getByTitle(String title) {
        if (title == null) {
            return null;
        }
        try {
            return jdbcTemplate.queryForObject(GET_STATIC_PAGE_BY_TITLE, new StaticPageMapper(), title);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public void update(StaticPage staticPage) {

        jdbcTemplate.update(SQL_UPDATE_STATIC_PAGE,
                staticPage.getTitle(),
                staticPage.getContent(),
                staticPage.getImage_id(),
                staticPage.getId());

    }

    @Override
    public void delete(StaticPage staticPage) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<StaticPage> listPages() {

        return jdbcTemplate.query(SQL_GET_STATIC_PAGE_LIST, new StaticPageMapper());

    }

    private static final class StaticPageMapper implements RowMapper<StaticPage> {

        @Override
        public StaticPage mapRow(ResultSet rs, int i) throws SQLException {

            StaticPage staticPage = new StaticPage();

            staticPage.setId(rs.getInt("id"));

            staticPage.setTitle(rs.getString("title"));
            staticPage.setContent(rs.getString("content"));

            Long imageId = rs.getLong("image_id");

            // either use the image Dao or talk to someone about SQL joins.
            // It would be nice if this code could work.
            /*
            ImageDao imageDao = new ImageDao();
            Image image = imageDao.get(imageId);
            staticPage.setImage(image);
             */
            return staticPage;
        }

    }

}
