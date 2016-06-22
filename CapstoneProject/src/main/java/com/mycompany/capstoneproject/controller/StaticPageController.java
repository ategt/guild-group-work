/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.controller;

import com.mycompany.capstoneproject.DAO.StaticPageDAODBImpl;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.StaticPage;
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

        return showById( staticPageId,  model);
    }
        

    @RequestMapping(value = "/ById/{id}", method = RequestMethod.GET)
    public String showById(@PathVariable("id") Integer staticPageId, Map model) {

        StaticPage staticPage = staticPageDao.get(staticPageId);

        model.put("staticPage", staticPage);

        return "staticPageSkeleton";
    }

}
