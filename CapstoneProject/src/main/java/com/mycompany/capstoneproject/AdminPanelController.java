
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.HashTagInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;

import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.DTO.User;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */

@Controller
@RequestMapping(value = "/adminPanel")
public class AdminPanelController {

    private StaticPageInterface staticPageDao;
    private BlogPostInterface blogPostDao;
    private UserInterface userDao;
    private CategoriesInterface categoriesDao;
    private HashTagInterface hashTagDao;

    @Inject
    public AdminPanelController(StaticPageInterface staticPageDao, BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao, HashTagInterface hashTagDao) {
        this.staticPageDao = staticPageDao;
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
        this.hashTagDao = hashTagDao;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();
        
        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();
        
        List<HashTag> hashTags = hashTagDao.listHashTags();
        
        List<Category> categories = categoriesDao.listCategories();
        
        List<User> users = userDao.list();
        
        model.put("users", users);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        
        return "adminPanel";
    }

}

