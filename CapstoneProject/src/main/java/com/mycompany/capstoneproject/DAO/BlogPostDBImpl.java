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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class BlogPostDBImpl implements BlogPostInterface {

    private static final String SQL_INSERT_BLOGPOST = "INSERT INTO post (title, user_id, content, date_posted, expires_on, post_on) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String SQL_INSERT_POST_AND_CATEGORY = "INSERT INTO category_post(category_id, post_id) VALUES(?, ?)";

    private static final String SQL_GET_BLOGPOST = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id\n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id AND post.id = ?";

    private static final String SQL_UPDATE_BLOGPOST = "UPDATE post SET title = ?, user_id = ?, content = ?, date_posted = ?, expires_on = ?, post_on = ? WHERE id = ?";

    private static final String SQL_DELETE_BLOGPOST = "DELETE FROM post where id = ?";

    private static final String SQL_GET_DEFAULT_CATEGORY = "SELECT id FROM capstone.category\n"
            + "ORDER BY id ASC\n"
            + "LIMIT 1;";

    private static final String SQL_GET_DEFAULT_AUTHOR = "SELECT id FROM capstone.user\n"
            + "ORDER BY id ASC\n"
            + "LIMIT 1;";

    private static final String SQL_GET_BLOGPOST_LIST = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id\n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id";

    private static final String SQL_GET_BLOGPOST_LIST_WITH_LIMIT = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id \n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id\n"
            + "ORDER BY date_posted\n"
            + "LIMIT ?, 3";

    private static final String SQL_GET_BLOG_COUNT = "SELECT COUNT(*) AS total FROM capstone.post";

    private JdbcTemplate jdbcTemplate;

    @Inject
    public BlogPostDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public BlogPost create(BlogPost post) {

        int authorId = 0;

        if (post.getAuthor() == null) {
            authorId = jdbcTemplate.queryForObject(SQL_GET_DEFAULT_AUTHOR, Integer.class);
        } else {
            authorId = post.getAuthor().getId();
        }

        jdbcTemplate.update(SQL_INSERT_BLOGPOST,
                post.getTitle(),
                authorId,
                post.getContent(),
                post.getPostedOn(),
                post.getExpireOn(),
                post.getDateToPostOn());

        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        post.setId(id);

        int categoryId = 0;

        if (post.getCategory() == null) {
            // Set category to zero, or a default category.
            categoryId = jdbcTemplate.queryForObject(SQL_GET_DEFAULT_CATEGORY, Integer.class);
        } else {
            categoryId = post.getCategory().getId();
        }

        jdbcTemplate.update(SQL_INSERT_POST_AND_CATEGORY,
                categoryId,
                post.getId());

        return post;
    }

    @Override
    public BlogPost getById(Integer id) {

        if (id == null) {
            return null;
        }

        try {
            return jdbcTemplate.queryForObject(SQL_GET_BLOGPOST, new BlogPostMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }

        //return jdbcTemplate.queryForObject(SQL_GET_BLOGPOST, new BlogPostWithCategoryMapper(), id);
    }

    @Override
    public void update(BlogPost post) {

        if (post == null) {
            return;
        }

        if (post.getAuthor() == null) {
            Logger.getLogger(com.mycompany.capstoneproject.DAO.BlogPostDBImpl.class.getName()).log(Level.INFO, null, "Author not set, update aborted.");
            return;
        }

        if (post.getCategory() == null) {
            Logger.getLogger(com.mycompany.capstoneproject.DAO.BlogPostDBImpl.class.getName()).log(Level.INFO, null, "Category not set, update aborted.");
            return;
        }

        if (post.getId() > 0) {

            try {
                jdbcTemplate.update(SQL_UPDATE_BLOGPOST,
                        post.getTitle(),
                        post.getAuthor().getId(),
                        post.getCategory().getId(),
                        post.getContent(),
                        post.getPostedOn(),
                        post.getExpireOn(),
                        post.getDateToPostOn(),
                        post.getId()
                );

            } catch (org.springframework.dao.DataIntegrityViolationException ex) {
                Logger.getLogger(com.mycompany.capstoneproject.DAO.BlogPostDBImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(BlogPost post) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listBlogs() {
        return jdbcTemplate.query(SQL_GET_BLOGPOST_LIST, new BlogPostMapper());
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

    @Override
    public List<BlogPost> listBlogs(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BlogPost> listBlogsWithLimit(int offset) {
                return jdbcTemplate.query(SQL_GET_BLOGPOST_LIST_WITH_LIMIT, new BlogPostMapper(), offset);
    }

    @Override
    public Integer getNumOfPosts() {

        List<Integer> count = jdbcTemplate.query(SQL_GET_BLOG_COUNT, new CountMapper());
        int numOfPosts = count.get(0);
        return numOfPosts;

    }

    private static final class BlogPostMapper implements RowMapper<BlogPost> {

        public BlogPost mapRow(ResultSet rs, int i) throws SQLException {
            
            
    

            BlogPost post = new BlogPost();

            User user = new User();
//            user.setId(rs.getInt("user_id"));
//            userDao.get(rs.getInt("user_id"));


            user.setId(rs.getInt("user_id"));
            user.setName(rs.getString("user.name"));

            post.setAuthor(user);

            Category category = new Category();
            category.setId(rs.getInt("category_id"));

            post.setCategory(category);
            post.setId(rs.getInt("id"));
            post.getCategory().setName(rs.getString("name"));
            post.setTitle(rs.getString("title"));
            post.setContent(rs.getString("content"));
            post.setPostedOn(rs.getDate("date_posted"));
            post.setExpireOn(rs.getDate("expires_on"));
            post.setDateToPostOn(rs.getDate("post_on"));

            return post;
        }

    }
//

    private static final class CountMapper implements RowMapper<Integer> {

        public Integer mapRow(ResultSet rs, int i) throws SQLException {
            Integer count = rs.getInt(1);

            return count;
        }

    }

}
