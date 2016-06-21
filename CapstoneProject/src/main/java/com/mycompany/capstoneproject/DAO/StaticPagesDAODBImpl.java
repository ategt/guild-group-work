/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPages;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author apprentice
 */
public class StaticPagesDAODBImpl implements StaticPagesInterface {

     private JdbcTemplate jdbcTemplate;

    @Inject
    public StaticPagesDAODBImpl(JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
        
    }
    
    @Override
    public StaticPages create(StaticPages stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static final String GET_STATIC_PAGE_BY_ID = "SELECT * FROM asdf WHERE id = ?;";
    
    @Override
    public StaticPages get(Integer id) {
        if (id == null)
            return null;
        try {
            return jdbcTemplate.queryForObject(GET_STATIC_PAGE_BY_ID, new StaticPagesMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex){
            return null;
        }
    }

    
    private static final class StaticPageMapper implements RowMapper<StaticPages> {

        @Override
        public StaticPages mapRow(ResultSet rs, int i) throws SQLException {

            StaticPages staticPages = new StaticPages();

            staticPages.setId(rs.getInt("id"));

//            staticPages.setFirstName(rs.getString("first_name"));
//            staticPages.setLastName(rs.getString("last_name"));
//            staticPages.setStreetNumber(rs.getString("street_number"));
//            staticPages.setStreetName(rs.getString("street_name"));
//            staticPages.setCity(rs.getString("city"));
//            staticPages.setState(rs.getString("state"));
//            staticPages.setZip(rs.getString("zip"));

            return staticPages;
        }

    }

    
    @Override
    public void update(StaticPages stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(StaticPages stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<StaticPages> listBlogs() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
