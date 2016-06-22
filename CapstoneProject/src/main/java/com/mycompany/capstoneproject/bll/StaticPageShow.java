/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.bll;

import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.Map;

/**
 *
 * @author apprentice
 */
public class StaticPageShow {
    
    public static String showById(Integer staticPageId, Map model, StaticPageInterface staticPageDao){
    
        StaticPage staticPage = staticPageDao.get(staticPageId);
        model.put("staticPage", staticPage);
        
        return "staticPageSkeleton";
    }

    public static String showByTitle(String title, Map model, StaticPageInterface staticPageDao){
    
        StaticPage staticPage = staticPageDao.getByTitle(title);
        model.put("staticPage", staticPage);
        
        return "staticPageSkeleton";
    }

}
