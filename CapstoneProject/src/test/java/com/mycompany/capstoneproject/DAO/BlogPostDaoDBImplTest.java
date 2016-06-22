/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.User;
import java.util.Date;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author apprentice
 */
public class BlogPostDaoDBImplTest {
    
    ApplicationContext ctx;

    public BlogPostDaoDBImplTest() {
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
}
