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

/**
 *
 * @author apprentice
 */
public class StaticPageDAODBImpl implements StaticPageInterface {

     private JdbcTemplate jdbcTemplate;

    @Inject
    public StaticPageDAODBImpl(JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
        
    }
    
    @Override
    public StaticPage create(StaticPage stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static final String GET_STATIC_PAGE_BY_ID = "SELECT * FROM asdf WHERE id = ?;";
    
    @Override
    public StaticPage get(Integer id) {
        if (id == null)
            return null;
        try {
            return jdbcTemplate.queryForObject(GET_STATIC_PAGE_BY_ID, new StaticPageMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex){
            return null;
        }
    }

    
    private static final class StaticPageMapper implements RowMapper<StaticPage> {

        @Override
        public StaticPage mapRow(ResultSet rs, int i) throws SQLException {

            StaticPage staticPage = new StaticPage();

            //staticPage.setId(rs.getInt("id"));

//            staticPage.setFirstName(rs.getString("first_name"));
//            staticPage.setLastName(rs.getString("last_name"));
//            staticPage.setStreetNumber(rs.getString("street_number"));
//            staticPage.setStreetName(rs.getString("street_name"));
//            staticPage.setCity(rs.getString("city"));
//            staticPage.setState(rs.getString("state"));
//            staticPage.setZip(rs.getString("zip"));

            return staticPage;
        }

    }

    
    @Override
    public void update(StaticPage stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(StaticPage stat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<StaticPage> listBlogs() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
