/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.User;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    private CategoriesInterface categoriesDao;
    
    @Inject
    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao){
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
    }
    
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String blog(Map model) {
        List<Category> categories = categoriesDao.listCategories();
        Category category = new Category();

        List<User> users = userDao.list();
        model.put("users", users);
        model.put("category", category);
        model.put("categories", categories);
        return "blog";
    }
    
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String create(@ModelAttribute BlogPostCommand postCommand){
        User author = userDao.get(postCommand.getAuthorId());
        Category category = categoriesDao.get(postCommand.getCategoryId());
        
        Date datePosted = new Date();
        Date postExpires = new Date();
        Date postOn = new Date();
        
        BlogPost post = new BlogPost();
        post.setTitle(postCommand.getTitle());
        post.setSlug(postCommand.getTitle());
        post.setAuthor(author);
        post.setCategory(category);
        post.setContent(postCommand.getContent());
        post.setPostedOn(datePosted);
        post.setExpireOn(postExpires);
        post.setDateToPostOn(postOn);
        
        blogPostDao.create(post);
        return "redirect:/";
    }
}
