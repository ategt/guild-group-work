
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        
        List<BlogPost> posts = blogPostDao.listBlogs();
        
        model.put("posts", posts);
        model.put("users", users);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        
        return "adminPanel";
    }
    
    
    @RequestMapping(value = "/pendingPosts", method = RequestMethod.GET)
    public String pendingPosts(Map model) {
        
        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();

        model.put("pendingPosts", pendingPosts);
        
        return "ADMINPANEL/pendingPostsAdmin";
    }
    
    
    @RequestMapping(value = "/hashtags", method = RequestMethod.GET)
    public String hashTags(Map model) {

        
        List<HashTag> hashTags = hashTagDao.listHashTags();

        model.put("hashtags", hashTags);
        
        return "ADMINPANEL/hashtagAdmin";
    }
    
      @RequestMapping(value = "/editPosts", method = RequestMethod.GET)
    public String editPosts(Map model) {
   
         List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();
        
        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();
        
        List<HashTag> hashTags = hashTagDao.listHashTags();
        
        List<Category> categories = categoriesDao.listCategories();
        
        List<User> users = userDao.list();
        
        List<BlogPost> posts = blogPostDao.listBlogs();
        
        model.put("posts", posts);
        model.put("users", users);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        
        
   
        return "ADMINPANEL/editBlogPostsAdmin";
    }
    
      @RequestMapping(value = "/staticPages", method = RequestMethod.GET)
    public String staticPages(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
   
        model.put("staticPages", staticPages);
        
        return "ADMINPANEL/staticPageEditSkeletonAdmin";
    }

      @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(Map model) {
        
        List<User> users = userDao.list();
        
        List<User> activeUsers = new ArrayList();
        
          for (User user : users) {
              if(user.getEnabled() == 1){
                  activeUsers.add(user);
              }
          }
 
        model.put("users", activeUsers);
        
        return "ADMINPANEL/usersAdmin";
    }
    
      @RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") Integer userId) {

//               List<Product> products = productDao.listProduct();
//        
//        model.put("products", products);
//        
//        
//        List<State> states = stateDao.listStates();
//        
//        model.put("states", states);
        User user = userDao.get(userId);
        
        userDao.delete(user);


    }
    
     @RequestMapping(value = "/adminPanel/", method = RequestMethod.PUT)
    public String edit(@PathVariable("id") Integer orderId, Map model , User u){
 

        Integer id = u.getId();
        String username = u.getName();
        String password = u.getPassword();
        String email = u.getEmail();
        String role = u.getRole();
        Integer enabled = u.getEnabled();

        User user = new User();

        user.setId(id);
        user.setName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);
        user.setEnabled(enabled);
        
        userDao.update(user);

       User users = userDao.get(orderId);

        

        model.put("users", users);

       
        
        

        return "ADMINPANEL/usersAdmin";
    }
    
      @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public String categories(Map model) {
        
        List<Category> categories = categoriesDao.listCategories();

        model.put("categories", categories);
        
        return "ADMINPANEL/categoryAdmin";
    }
}

