/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.User;
import java.util.Date;
import java.util.UUID;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author apprentice
 */
public class BlogPostDBImplTest {

    ApplicationContext ctx;

    public BlogPostDBImplTest() {
        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void testGet() {
        System.out.println("Get Post");
        
        Integer id = null;
        BlogPostInterface instance = ctx.getBean("blogPostDao", BlogPostInterface.class);
        BlogPost expResult = null;
        BlogPost result = instance.getById(id);
        assertEquals(expResult, result);
        
    }
    @Test
    public void testCreate() {
        System.out.println("Create Post");
        BlogPost post = new BlogPost();
        User author = new User();
        author.setId(1);        
        Date date = new Date();
        post.setTitle("Test 1");
        post.setAuthor(author);
        post.setContent("Testing 1.2.3..");
        post.setPostedOn(date);
        post.setExpireOn(date);
        post.setDateToPostOn(date);
        post.setSlug("Test");
        
        BlogPostInterface instance = ctx.getBean("blogPostDao", BlogPostInterface.class);
        BlogPost expResult = post;
        BlogPost result = instance.create(post);
        assertEquals(expResult, result);
        
    }

    @Test
    public void testNullUpdate() {
//        System.out.println("delete");
//
//        BlogPostInterface blogPostDao = ctx.getBean("blogPostDao", BlogPostInterface.class);
//        UserInterface userDaoDBImpl = ctx.getBean("userDaoDBImpl", UserInterface.class);
//
//        BlogPost post = blogPostFactory();
//        BlogPost expResult = post;
//        BlogPost result = blogPostDao.create(post);
//        assertEquals(expResult, result);
//
//        int id = result.getId();
//        assertTrue(result.getId() != 0);
//        //assertTrue(result.getId() >= blogPostDao.size());
//
//        // Test get method.
//        BlogPost returnedPost = blogPostDao.getById(id);
//        assertTrue(verifyBlogPost(returnedPost, result));
//        blogPostDao.update(null);
//        blogPostDao.delete(post);
//        returnedPost = blogPostDao.getById(id);
//        assertEquals(returnedPost, null);
//
//        //This is a test update with nulls.
//        // If it makes it to here, it passed.
//        assertTrue(true);

    }

    @Test
    public void testNullGet() {
        System.out.println("get - null");

        BlogPostInterface blogPostDao = ctx.getBean("blogPostDao", BlogPostInterface.class);

        // Test get method.
        BlogPost returnedPost = blogPostDao.getById(null);

        assertEquals(returnedPost, null);

        //This is a test get with nulls.
        // If it makes it to here, it passed.
        assertTrue(true);
    }

    private static Boolean verifyBlogPost(BlogPost blogPost1, BlogPost blogPost2) {
        if (blogPost1 == null && blogPost2 == null) {
            return true;
        }

        if (blogPost1 == null || blogPost2 == null) {
            return false;
        }

        boolean valid = true;

        if (!blogPost1.getTitle().equals(blogPost2.getTitle())) {
            valid = false;
        }
       
        if ( blogPost1.getSlug() == null && blogPost2.getSlug() == null ) {
            
        } else if ( blogPost1.getSlug() == null || blogPost2.getSlug() == null ) {
            valid = false;
        } else if (!blogPost1.getSlug().equals(blogPost2.getSlug())) {
            valid = false;
        } 

        if (!blogPost1.getContent().equals(blogPost2.getContent())) {
            valid = false;
        }

        if (blogPost1.getId() != blogPost2.getId()) {
            valid = false;
        }

        if (!isSameDay(blogPost1.getDateToPostOn(), blogPost2.getDateToPostOn())) {
            valid = false;
        }

        if (!isSameDay(blogPost1.getExpireOn(), blogPost2.getExpireOn())) {
            valid = false;
        }

        if (!isSameDay(blogPost1.getPostedOn(), blogPost2.getPostedOn())) {
            valid = false;
        }

        return valid;
    }

    private static boolean isSameDay(java.util.Date date1, java.util.Date date2) {
        if (date1 == null && date2 == null) {
            return true;
        }
        java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("yyyyMMdd");

        if (date1 == null || date2 == null) {
            return false;
        }
        return fmt.format(date1).equals(fmt.format(date2));
    }

    private BlogPost blogPostFactory() {

        BlogPost blogPost = new BlogPost();

        Date dateToPostOn = new Date();
        Date expireOn = new Date();
        Date postedOn = new Date();

        UUID uuid = UUID.randomUUID();
        String content = uuid.toString();

        String title = UUID.randomUUID().toString();

//        blogPost.setAuthor(author);
//        blogPost.setCategory(category);
//        blogPost.setComments(comments);
        blogPost.setContent(content);
        blogPost.setDateToPostOn(dateToPostOn);
        blogPost.setExpireOn(expireOn);
        //blogPost.setHashTag(hashTag);
        //blogPost.setId(0);
        //blogPost.setImage(image);
        blogPost.setPostedOn(postedOn);
        //blogPost.setSlug(slug);
        blogPost.setTitle(title);

        return blogPost;

    }

}
