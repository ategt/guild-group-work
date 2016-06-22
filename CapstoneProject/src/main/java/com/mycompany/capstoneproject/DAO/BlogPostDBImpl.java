/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.HashTag;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class BlogPostDBImpl implements BlogPostInterface {

    private static final String SQL_INSERT_BLOGPOST = "INSERT INTO post (title, user_id, content, date_posted, expires_on, post_on) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SQL_INSERT_POST_AND_CATEGORY = "INSERT INTO category_post(category_id, post_id) VALUES(?, ?)";
    private JdbcTemplate jdbcTemplate;

    public BlogPostDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public BlogPost create(BlogPost post) {
        jdbcTemplate.update(SQL_INSERT_BLOGPOST, 
                post.getTitle(),
                post.getAuthor().getId(), 
                post.getContent(), 
                post.getPostedOn(), 
                post.getExpireOn(),
                post.getDateToPostOn());
        
        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
        
        post.setId(id);
        
//        jdbcTemplate.update(SQL_INSERT_POST_AND_CATEGORY,
//                post.getCategory().getId(),
//                post.getId());
        
        return post;
    }

    @Override
    public BlogPost getById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(BlogPost post) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(BlogPost post) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listBlogs() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listBlogs(Integer start) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listByHashTags(HashTag hashTag) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listByCategory(Category category) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BlogPost getBySlug(String slug) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
