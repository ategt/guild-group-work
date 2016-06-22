/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.controller;

import com.mycompany.capstoneproject.DAO.StaticPageDAODBImpl;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.bll.StaticPageShow;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/aboutus")
public class StaticPageController {

    private StaticPageInterface staticPageDao;

    @Inject
    public StaticPageController(StaticPageInterface staticPageDao) {
        this.staticPageDao = staticPageDao;
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


    @RequestMapping(value = "/ById/{id}", method = RequestMethod.GET)
    public String editById(@PathVariable("id") Integer staticPageId, Map model) {

        StaticPage staticPage = staticPageDao.get(staticPageId);

        model.put("staticPage", staticPage);

        return "staticPageSkeleton";
    }

}
