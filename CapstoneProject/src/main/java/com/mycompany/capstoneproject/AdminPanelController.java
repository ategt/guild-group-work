
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
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
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

    @Inject
    public AdminPanelController(StaticPageInterface staticPageDao, BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao) {
        this.staticPageDao = staticPageDao;
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        
        return "adminPanel";
    }
    
//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
//    public String editById(@PathVariable("id") Integer id, Map model) {
//
//        BlogPost blogPost = blogPostDao.getById(id);
//
//        List<User> users = userDao.list();
//        BlogPostCommand blogPostCommand = convertCommandToBlogPost(blogPost);
//
//        if (blogPostCommand == null) {
//            return "unableToEdit";
//        }
//
//        List<Category> categories = categoriesDao.listCategories();
//        model.put("categories", categories);
//
////        List<User> users = userDao.list();
//        model.put("users", users);
//        model.put("blogPostCommand", blogPostCommand);
//
//        return "editBlog";
//    }
//
//    @RequestMapping(value = "/edit/", method = RequestMethod.POST)
//    public String submitEditById(@ModelAttribute("blogPostCommand") BlogPostCommand blogPostCommand, Map model) {
//        if (blogPostCommand == null) {
//            return "unableToEdit";
//        }
//
//        int blogPostId = blogPostCommand.getId();
//
//        BlogPost blogPost = blogPostDao.getById(blogPostId);
//
//        int authorId = blogPostCommand.getAuthorId();
//
//        User user = userDao.get(authorId);
//
//        blogPost.setAuthor(user);
//
//        // Consider resluging.
//        blogPost.setTitle(blogPostCommand.getTitle());
//
//        // Do something here to recheck for #hashTags.
//        blogPost.setContent(blogPostCommand.getContent());
//
//        int categoryId = blogPostCommand.getCategoryId();
//        Category category = categoriesDao.get(categoryId);
//
//        blogPost.setCategory(category);
//
//        blogPostDao.update(blogPost);
//
//        //List<User> users = userDao.list();
//        //BlogPostCommand blogPostCommand = convertCommandToBlogPost(blogPost);
////        List<Category> categories = categoriesDao.listCategories();
////        model.put("categories", categories);
////
////        List<User> users = userDao.list();
////        model.put("users", users);
////        model.put("blogPostCommand", blogPostCommand);
//        BlogPost post = blogPostDao.getById(blogPostId);
//
//        model.put("post", post);
//
//        //model.put("users", users);
//        //model.put("blogPost", blogPost);
////        List<Category> categories = categoriesDao.listCategories();
////
////        model.put("categories", categories);
//        return "showSingleBlog";
//    }

}

