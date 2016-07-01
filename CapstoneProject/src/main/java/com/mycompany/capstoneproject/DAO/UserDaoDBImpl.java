/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class UserDaoDBImpl implements UserInterface {

    private static final String SQL_INSERT_USER = "INSERT INTO user (name, role, password, email, num_of_comments, date_joined , enabled) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_INSERT_USER_AUTHORITY = "INSERT INTO `capstone`.`authorities` (`type`, `user_id`) VALUES (?, ?);";
    private static final String SQL_UPDATE_USER = "UPDATE user SET name = ?, role = ?, password = ?, email = ?, num_of_comments = ?, date_joined = ?, enabled = ? WHERE id = ?";
    private static final String SQL_DELETE_USER = "DELETE FROM user WHERE id = ?";
    private static final String SQL_GET_USER = "SELECT * FROM user WHERE id =?";
    private static final String SQL_GET_USER_LIST = "SELECT * FROM user";

    private JdbcTemplate jdbcTemplate;

    public UserDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public User create(User user) {

        if (user == null) {
            return null;
        }

        Date date = new Date();

        user.setJoinedOn(date);
        user.setRole("ROLE_USER");

        jdbcTemplate.update(SQL_INSERT_USER,
                user.getName(),
                user.getRole(),
                user.getPassword(),
                user.getEmail(),
                user.getNumOfComments(),
                user.getJoinedOn(),
                user.getEnabled());

        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        user.setId(id);

        jdbcTemplate.update(SQL_INSERT_USER_AUTHORITY,
                user.getRole(),
                user.getId());

        return user;

    }

    @Override
    public User get(int id) {

        try {
            return jdbcTemplate.queryForObject(SQL_GET_USER, new UserMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public void update(User user) {

        //UPDATE user SET name = ?, role = ?, password = ?, email = ?, num_of_comments = ?, date_joined = ? WHERE id = ?
        if (user == null) {
            return;
        }

        if (user.getId() > 0) {

            jdbcTemplate.update(SQL_UPDATE_USER,
                    user.getName(),
                    user.getRole(),
                    user.getPassword(),
                    user.getEmail(),
                    user.getNumOfComments(),
                    user.getJoinedOn(),
                    user.getEnabled(),
                    user.getId());
        }
    }

    @Override
    public void delete(User user) {
        if (user == null) {
            return;
        }
        jdbcTemplate.update(SQL_DELETE_USER, user.getId());
    }

    @Override
    public List<User> list() {
        return jdbcTemplate.query(SQL_GET_USER_LIST, new UserMapper());
    }

    private static final class UserMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet rs, int i) throws SQLException {

            User user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setRole(rs.getString("role"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setNumOfComments(rs.getInt("num_of_comments"));
            user.setJoinedOn(rs.getTimestamp("date_joined"));
            user.setEnabled(rs.getInt("enabled"));

            return user;
        }
    }

}
