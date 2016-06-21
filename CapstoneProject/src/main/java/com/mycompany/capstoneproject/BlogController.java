/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value="/blog")
public class BlogController {
    
    private BlogPostInterface blogPostDao;
    
    @Inject
    public BlogController(BlogPostInterface blogPostDao){
        this.blogPostDao = blogPostDao;
    }
    
    @RequestMapping(value="/", method=RequestMethod.POST)
    public BlogPost createPost(BlogPost post){
        
        return blogPostDao.create(post);
        
    }
}
