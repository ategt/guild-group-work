/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.controller;

import com.mycompany.capstoneproject.DAO.ImageInterface;
import com.mycompany.capstoneproject.DAO.StaticPageDAODBImpl;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.Comment;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.DTO.User;
import com.mycompany.capstoneproject.bll.StaticPageShow;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/static")
public class StaticPageController {

    private StaticPageInterface staticPageDao;
    private ImageInterface imageDao;

    @Inject
    public StaticPageController(StaticPageInterface staticPageDao, ImageInterface imageDao) {
        this.staticPageDao = staticPageDao;
        this.imageDao = imageDao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);

        return "static";
    }

    @RequestMapping(value = "/byid/{id}", method = RequestMethod.GET)
    public String showbyid(@PathVariable("id") Integer staticPageId, Map model) {

        return StaticPageShow.showById(staticPageId, model, staticPageDao);
    }

    @RequestMapping(value = "/ById/{id}", method = RequestMethod.GET)
    public String showById(@PathVariable("id") Integer staticPageId, Map model) {

        return StaticPageShow.showById(staticPageId, model, staticPageDao);
    }

    @RequestMapping(value = "/bytitle/{title}", method = RequestMethod.GET)
    public String showbytitle(@PathVariable("title") String title, Map model) {

        return StaticPageShow.showByTitle(title, model, staticPageDao);
    }

    @RequestMapping(value = "/byTitle/{title}", method = RequestMethod.GET)
    public String showByTitle(@PathVariable("title") String title, Map model) {

        return StaticPageShow.showByTitle(title, model, staticPageDao);
    }

    @RequestMapping(value = "/title/{title}", method = RequestMethod.GET)
    public String showByJusttitle(@PathVariable("title") String title, Map model) {

        return StaticPageShow.showByTitle(title, model, staticPageDao);
    }

    @RequestMapping(value = "/Title/{title}", method = RequestMethod.GET)
    public String showByJustTitle(@PathVariable("title") String title, Map model) {

        return StaticPageShow.showByTitle(title, model, staticPageDao);
    }

    //this method takes user from main admin page to the edit page for the partiuclar static page clicked on
    //this method is used to create the 
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute StaticPage staticPage, Map model) {

        staticPageDao.create(staticPage);

        model.put("staticPage", staticPage);
        
        return "redirect:/static/";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute StaticPage staticPage) {

        staticPageDao.create(staticPage);

        return "adminPanel";

    }

}
