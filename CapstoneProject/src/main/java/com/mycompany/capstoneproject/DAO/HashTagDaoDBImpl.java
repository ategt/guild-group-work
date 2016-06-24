/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.inject.Inject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class HashTagDaoDBImpl implements HashTagInterface {

    private static final String SQL_INSERT_HASHTAG = "INSERT INTO hashtag (name) VALUES (?)";
    private static final String SQL_SELECT_HASHTAG = "";
    private static final String SQL_UPDATE_HASHTAG = "";
    private static final String SQL_DELETE_HASHTAG = "";
    private static final String SQL_GET_HASHTAG_LIST = "SELECT * FROM hashtag";

    private JdbcTemplate jdbcTemplate;

    @Inject
    public HashTagDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public HashTag create(HashTag hashTag) {
        jdbcTemplate.update(SQL_INSERT_HASHTAG, hashTag.getName());
        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
        hashTag.setId(id);
        return hashTag;
    }

    @Override
    public HashTag get(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(HashTag hashTag) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(HashTag hashTag) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<HashTag> listBlogs() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<String> findHashTags(String content) {
        Pattern MY_PATTERN = Pattern.compile("#(\\S+)");
        Matcher mat = MY_PATTERN.matcher(content);
        List<String> strs = new ArrayList<String>();
        while (mat.find()) {
            //System.out.println(mat.group(1));
            strs.add(mat.group(1));
        }

        return strs;
    }

    @Override
    public List<HashTag> listHashTags() {
        return jdbcTemplate.query(SQL_GET_HASHTAG_LIST, new HashTagMapper());
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
