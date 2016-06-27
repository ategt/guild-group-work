/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
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
    private static final String SQL_INSERT_HASHTAG_POST = "INSERT INTO hashtag_post (hashtag_id, post_id) VALUES (?, ?);";
    private static final String SQL_SELECT_HASHTAG = "SELECT * FROM capstone.hashtag WHERE hashtag.name= ?";
    private static final String SQL_SELECT_POST_WITH_HASHTAG = "SELECT * FROM hashtag \n"
            + "JOIN hashtag_post \n"
            + "ON hashtag_post.hashtag_id=hashtag.id \n"
            + "JOIN post \n"
            + "ON hashtag_post.post_id=post.id AND hashtag.name = ? \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id \n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id \n"
            + "JOIN user \n"
            + "ON user.id=user_id";
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
    public HashTag get(String name) {
        return jdbcTemplate.queryForObject(SQL_SELECT_HASHTAG, new HashTagMapper(), name);
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
    public List<BlogPost> listBlogs(HashTag hashTag) {
        return jdbcTemplate.query(SQL_SELECT_POST_WITH_HASHTAG, new HashTagPostMapper(), hashTag.getName());
    }

    @Override
    public List<String> findHashTags(String content) {
        Pattern MY_PATTERN = Pattern.compile("#(\\S+)");
        Matcher mat = MY_PATTERN.matcher(content);
        List<String> strs = new ArrayList<String>();
        while (mat.find()) {
            //System.out.println(mat.group(1));
            strs.add("#" + mat.group(1));
        }

        return strs;
    }

    @Override
    public List<HashTag> listHashTags() {
        return jdbcTemplate.query(SQL_GET_HASHTAG_LIST, new HashTagMapper());
    }

    @Override
    public void updateHashTagPostTable(HashTag hashtag, BlogPost post) {
        jdbcTemplate.update(SQL_INSERT_HASHTAG_POST, hashtag.getId(), post.getId());
    }

    private static final class HashTagMapper implements RowMapper<HashTag> {

        public HashTag mapRow(ResultSet rs, int i) throws SQLException {

            HashTag hashtag = new HashTag();

            hashtag.setId(rs.getInt("id"));
            hashtag.setName(rs.getString("name"));

            return hashtag;
        }

    }

    private static final class HashTagPostMapper implements RowMapper<BlogPost> {

        public BlogPost mapRow(ResultSet rs, int i) throws SQLException {

            BlogPost post = new BlogPost();

            User user = new User();
            user.setId(rs.getInt("user_id"));
            user.setName(rs.getString("user.name"));

            post.setAuthor(user);

            Category category = new Category();
            category.setId(rs.getInt("category_id"));

            post.setCategory(category);
            post.setId(rs.getInt("id"));
            post.getCategory().setName(rs.getString("category.name"));
            post.setTitle(rs.getString("title"));
            post.setContent(rs.getString("content"));
            post.setPostedOn(rs.getDate("date_posted"));
            post.setExpireOn(rs.getDate("expires_on"));
            post.setDateToPostOn(rs.getDate("post_on"));

            return post;
        }

    }
}
