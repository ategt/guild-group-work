/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class BlogPostDBImpl implements BlogPostInterface {

    private static final String SQL_INSERT_BLOGPOST = "INSERT INTO post (title, user_id, content, date_posted, expires_on, post_on, slug, status, thumb_image, expired) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

    private static final String SQL_INSERT_POST_AND_CATEGORY = "INSERT INTO category_post(category_id, post_id) VALUES(?, ?)";

    private static final String SQL_GET_BLOGPOST = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id\n"
            + "LEFT JOIN image\n"
            + "ON post.thumb_image=image.id\n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id AND post.id = ?";

    private static final String SQL_UPDATE_BLOGPOST = "UPDATE post SET title = ?, user_id = ?, content = ?, date_posted = ?, expires_on = ?, post_on = ?, slug = ?, status = ?, thumb_image = ? WHERE id = ?";

    private static final String SQL_DELETE_BLOGPOST = "UPDATE `capstone`.`post` SET `expired`=1 WHERE `id`=? ";

    private static final String SQL_GET_DEFAULT_CATEGORY = "SELECT id FROM capstone.category\n"
            + "ORDER BY id ASC\n"
            + "LIMIT 1;";

    private static final String SQL_GET_DEFAULT_AUTHOR = "SELECT id FROM capstone.user\n"
            + "ORDER BY id ASC\n"
            + "LIMIT 1;";

    private static final String SQL_GET_DEFAULT_IMAGE = "SELECT id FROM capstone.image\n"
            + "ORDER BY id ASC\n"
            + "LIMIT 1;";

    private static final String SQL_GET_BLOGPOST_LIST = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id\n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "LEFT JOIN image\n"
            + "ON post.thumb_image=image.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id";

    private static final String SQL_GET_PENDING_POSTS = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id\n"
            + "LEFT JOIN image\n"
            + "ON post.thumb_image=image.id\n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id AND status = 'Pending'";

    private static final String SQL_GET_BLOGPOST_LIST_WITH_LIMIT = "SELECT * FROM post \n"
            + "JOIN category_post \n"
            + "ON category_post.post_id=post.id AND post.expired = 0 AND post.status = 'published' \n"
            + "JOIN category\n"
            + "ON category_post.category_id=category.id\n"
            + "LEFT JOIN image\n"
            + "ON post.thumb_image=image.id\n"
            + "JOIN user\n"
            + "ON user.id=user_id\n"
            + "ORDER BY date_posted\n"
            + "LIMIT ?, 3";

    private static final String SQL_GET_BLOG_COUNT = "SELECT COUNT(*) AS total FROM capstone.post WHERE post.status = 'published' AND post.expired = '0'";

    private static final String SQL_GET_SLUG_LIST = "SELECT slug FROM capstone.post";
    
    private static final String SQL_PUBLISH_POST = "UPDATE `capstone`.`post` SET `status`='published' WHERE `id`= ?";
    
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

        int imageId = 0;

        if (post.getImage() == null) {
            imageId = jdbcTemplate.queryForObject(SQL_GET_DEFAULT_IMAGE, Integer.class);
        } else {
            imageId = post.getImage().getId();
        }

        post.setStatus("Pending");

        jdbcTemplate.update(SQL_INSERT_BLOGPOST,
                post.getTitle(),
                authorId,
                post.getContent(),
                post.getPostedOn(),
                post.getExpireOn(),
                post.getDateToPostOn(),
                post.getSlug(),
                post.getStatus(),
                imageId,
                post.getExpired()
                );

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

        try {
            return jdbcTemplate.queryForObject(SQL_GET_BLOGPOST, new BlogPostMapper(), id);
        }catch(EmptyResultDataAccessException e){
            return null;
        }

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
        
        Integer imageId;
        
        if ( post.getImage() == null ) {
            imageId = null;
        } else {
            imageId = post.getImage().getId();
        }

        if (post.getId() > 0) {

            try {
                post.setStatus("Pending");

                jdbcTemplate.update(SQL_UPDATE_BLOGPOST,
                        post.getTitle(),
                        post.getAuthor().getId(),
                        post.getContent(),
                        post.getPostedOn(),
                        post.getExpireOn(),
                        post.getDateToPostOn(),
                        post.getSlug(),
                        post.getStatus(),
                        imageId,
                        post.getId());

            } catch (org.springframework.dao.DataIntegrityViolationException ex) {
                Logger.getLogger(com.mycompany.capstoneproject.DAO.BlogPostDBImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(BlogPost post) {
        if (post == null) {
            return;
        }
        jdbcTemplate.update(SQL_DELETE_BLOGPOST, post.getId());
    }

    @Override
    public List<BlogPost> listBlogs() {
        return jdbcTemplate.query(SQL_GET_BLOGPOST_LIST, new BlogPostMapper());
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

    @Override
    public List<BlogPost> listPendingPosts() {
        return jdbcTemplate.query(SQL_GET_PENDING_POSTS, new BlogPostMapper());
    }

    @Override
    public List<String> listSlugs() {
        return jdbcTemplate.query(SQL_GET_SLUG_LIST, new SlugMapper());
    }

    @Override
    public BlogPost publish(BlogPost post) {
        
        jdbcTemplate.update(SQL_PUBLISH_POST, post.getId());
        
        return post;
        
    }

    @Override
    public void setNumOfPostsPerPage(Integer number) {
        Integer numberOfPosts = 3; //hardcoding this until adam is done with the admin panel. 
                                   //I want to add a feature that allows the admin to 
                                   //input how many posts per page they want
    }

    @Override
    public Integer getNumOfPostsPerPage() {
        return 3; //hardcoding for now
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
            post.setStatus(rs.getString("status"));
            post.setExpired(rs.getInt("expired"));
            Image image = new Image();

            image.setId(rs.getInt("image.id"));

            image.setUrl(rs.getString("image.url"));
            image.setImage(rs.getBytes("image.image"));
            image.setOriginalName(rs.getString("image.original_name"));
            image.setWidth(rs.getInt("image.width"));
            image.setHeight(rs.getInt("image.height"));
            image.setDescription(rs.getString("image.description"));
            image.setContentType(rs.getString("image.content_type"));
            image.setSize(rs.getLong("image.image_size"));

            //int imageId = rs.getInt("thumb_image");
            //Image image = imageDao.get(imageId);
            post.setImage(image);

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

    private static final class SlugMapper implements RowMapper<String> {

        public String mapRow(ResultSet rs, int i) throws SQLException {
            String slug = rs.getString("slug");

            return slug;
        }

    }

}
