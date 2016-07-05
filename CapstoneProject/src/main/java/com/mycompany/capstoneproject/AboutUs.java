
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
import com.mycompany.capstoneproject.DAO.UserDaoDBImpl;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.DTO.User;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/aboutUs")
public class AboutUs {

    private StaticPageInterface staticPageDao;
    private UserInterface userDAO;

    @Inject
    public AboutUs(StaticPageInterface staticPageDao , UserInterface userDao ) {
        this.staticPageDao = staticPageDao;
        this.userDAO = userDao;
        
     
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Map model) {
//        List<StaticPage> staticPages = staticPageDao.listPages();
//        StaticPage staticPage = new StaticPage();
//        
//        
//
//        model.put("staticPage", staticPage);
//        model.put("staticPages", staticPages);

     Date date = new Date();
     
     SimpleDateFormat formatter = new SimpleDateFormat("MMM dd,yyyy");

    List<User> users = userDAO.list();
    
    List<User> employees = new ArrayList();
    
        for (User u : users) {
            if(u.getRole().toUpperCase().equals("ROLE_ADMIN") || u.getRole().toUpperCase().equals("ROLE_AUTHOR")){
                    
                employees.add(u);
            }
        }
        
      
        
        
        model.put("employees", employees);

        return "aboutUs";
    }

}
