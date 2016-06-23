/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value="/blog")
public class BlogController {
    
    private BlogPostInterface blogPostDao;
    private UserInterface userDao;
    
    @Inject
    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao){
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
    }
    
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String blog(Map model) {

        return "blog";
    }
    
    @RequestMapping(value="/", method=RequestMethod.POST)
    @ResponseBody
    public BlogPost createPost(BlogPost post){
        
        return blogPostDao.create(post);
        
    }
    
        @RequestMapping(value = "/{id}" , method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer postId , Map model){
        
        BlogPost post = blogPostDao.getById(postId);
        
        return "showSingleBlog";
    }
    
    @RequestMapping(value = "/{slug}/{id}" , method = RequestMethod.GET)
    @ResponseBody
    public BlogPost getPost(@PathVariable String slug , Integer postId){
        
        BlogPost post = blogPostDao.getBySlug(slug);
        
        
        
        
        
        return post;
    }
}
