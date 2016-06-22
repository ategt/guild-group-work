/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.User;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author apprentice
 */
public class UserDaoDBImpl implements UserInterface {

    private static final String SQL_INSERT_USER = "INSERT INTO user (name, role, password, email, num_of_comments) VALUES (?, ?, ?, ?, ?)";

    private JdbcTemplate jdbcTemplate;
    
    public UserDaoDBImpl(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
    
    @Override
    public User create(User user) {

        jdbcTemplate.update(SQL_INSERT_USER, 
                user.getName(),
                user.getRole(),
                user.getPassword(),
                user.getEmail(),
                user.getNumOfComments(),
                user.getJoinedOn());
        
        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
        
        user.setId(id);
        return user;
        
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
