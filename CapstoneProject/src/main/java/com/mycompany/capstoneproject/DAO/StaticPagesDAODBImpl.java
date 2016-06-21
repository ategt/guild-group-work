/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPages;
import java.util.List;
import javax.inject.Inject;
import org.springframework.jdbc.core.JdbcTemplate;

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
