/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.HashTag;
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
public class HashTagDAODBImpl implements HashTagInterface{
    
     //create query
    private static final String SQL_INSERT_HASHTAG = "INSERT INTO hashtag (name) VALUES (?)";

    //update query
    private static final String SQL_UPDATE_HASHTAG = "UPDATE hashtag SET name = ? WHERE id = ?";

    //delete query
    private static final String SQL_DELETE_HASHTAG = "DELETE FROM hashtag where id = ?";

    //get query
    private static final String SQL_GET_HASHTAG = "SELECT * FROM hashtag where id = ?";

    //list query
    private static final String SQL_GET_HASHTAG_LIST = "SELECT * FROM hashtag";

    private JdbcTemplate jdbcTemplate;

    public HashTagDAODBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public HashTag create(HashTag hashtag) {
        jdbcTemplate.update(SQL_INSERT_HASHTAG,
                hashtag.getName()
               
            );
               
        

        int id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        hashtag.setId(id);

        return hashtag;
    }

    @Override

    public HashTag get(Integer id) {
        return jdbcTemplate.queryForObject(SQL_GET_HASHTAG, new HashTagDAODBImpl.HashTagMapper(), id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void update(HashTag hashtag) {
        jdbcTemplate.update(SQL_UPDATE_HASHTAG,
               
                hashtag.getName(),
                hashtag.getId()
        );
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(HashTag hashtag) {
        jdbcTemplate.update(SQL_DELETE_HASHTAG, hashtag.getId());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<HashTag> listHashTags() {
        return jdbcTemplate.query(SQL_GET_HASHTAG_LIST, new HashTagDAODBImpl.HashTagMapper());
    }

    private static final class HashTagMapper implements RowMapper<HashTag> {

        public HashTag mapRow(ResultSet rs, int i) throws SQLException {

            HashTag hashtag = new HashTag();

            hashtag.setId(rs.getInt("id"));
            hashtag.setName(rs.getString("name"));

            return hashtag;
        }

    }
    
    
    
}
