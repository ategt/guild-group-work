/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;

import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */

//@Controller
//@RequestMapping(value = "/admin")
//public class AdminPanelController {
//
//    private BlogPostInterface blogPostDao;
//    private UserInterface userDao;
//    private CategoriesInterface categoriesDao;
//
//    @Inject
//    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao) {
//        this.blogPostDao = blogPostDao;
//        this.userDao = userDao;
//        this.categoriesDao = categoriesDao;
//    }
//
//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public String blog(Map model) {
//        List<Category> categories = categoriesDao.listCategories();
//        Category category = new Category();
//
//        List<User> users = userDao.list();
//        model.put("users", users);
//        model.put("category", category);
//        model.put("categories", categories);
//        return "blog";
//    }
//

@Controller
@RequestMapping(value = "/admin")
public class AdminPanelController {

    private StaticPageInterface staticPageDao;

    @Inject
    public AdminPanelController(StaticPageInterface staticPageDao) {
        this.staticPageDao = staticPageDao;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        
        return "adminPanel";
    }


//    @RequestMapping(value = "/create", method = RequestMethod.POST)
//    public String create(@ModelAttribute BlogPost post) {
//
//        blogPostDao.create(post);
//        return "redirect:/";
//    }

//}

}

