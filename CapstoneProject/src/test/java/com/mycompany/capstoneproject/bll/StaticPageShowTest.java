/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.bll;

import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.HashMap;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author apprentice
 */
public class StaticPageShowTest {

    
    ApplicationContext ctx;

    public StaticPageShowTest() {
        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of showById method, of class StaticPageShow.
     */
<<<<<<< HEAD
//    @Test
//    public void testShowById() {
=======
    @Test
    public void testShowById() {
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f
//        System.out.println("showById");
//        Integer staticPageId = null;
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showById(staticPageId, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNull(staticPage);
//        assertNull(staticPageObject);
//        
<<<<<<< HEAD
//    }
//    
=======
    }
    
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f

    /**
     * Test of showById method, of class StaticPageShow.
     */
<<<<<<< HEAD
//    @Test
//    public void testShowByIdA() {
=======
    @Test
    public void testShowByIdA() {
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f
//        System.out.println("showById");
//        Integer staticPageId = 1;
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showById(staticPageId, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNotNull(staticPage);
//        assertNotNull(staticPageObject);
//        
//        assertEquals(staticPage.getContent(), "TEST");
//        assertEquals(staticPage.getTitle(), "BOB");
<<<<<<< HEAD
//        
//    }
//    
=======
        
    }
    
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f
    /**
     * Test of showById method, of class StaticPageShow.
     */
    @Test
    public void testShowByTitle() {
//        System.out.println("showByTitle");
//        String staticPageTitle = null;
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showByTitle(staticPageTitle, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNull(staticPage);
//        assertNull(staticPageObject);
//        
    }
    
    /**
     * Test of showById method, of class StaticPageShow.
     */
    @Test
    public void testShowByTitleC() {
//        System.out.println("showByTitle");
//        String staticPageTitle = "Billy";
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showByTitle(staticPageTitle, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNull(staticPage);
//        assertNull(staticPageObject);
        
    }
    
    /**
     * Test of showById method, of class StaticPageShow.
     */
    @Test
    public void testShowByTitleD() {
//        System.out.println("showByTitle");
//        String staticPageTitle = "";
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showByTitle(staticPageTitle, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNull(staticPage);
//        assertNull(staticPageObject);
        
    }
    

    /**
     * Test of showById method, of class StaticPageShow.
     */
<<<<<<< HEAD
//    @Test
//    public void testShowByTitleB() {
=======
    @Test
    public void testShowByTitleB() {
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f
//        System.out.println("showByTitle");
//        String staticPageTitle = "BOB";
//        Map<String, Object> model = new HashMap();
//        StaticPageInterface staticPageDao = ctx.getBean("staticPageDao", StaticPageInterface.class);
//        String expResult = "staticPageSkeleton";
//        String result = StaticPageShow.showByTitle(staticPageTitle, model, staticPageDao);
//        
//        Object staticPageObject = model.get("staticPage");
//        StaticPage staticPage = null;
//        
//        if ( staticPageObject instanceof StaticPage ) {
//            
//            staticPage = (StaticPage) staticPageObject;
//            
//        }
//            
//        assertEquals(expResult, result);
//        
//        assertNotNull(staticPage);
//        assertNotNull(staticPageObject);
//        
//        assertEquals(staticPage.getContent(), "TEST");
//        assertEquals(staticPage.getTitle(), "BOB");
//        
<<<<<<< HEAD
//    }
=======
    }
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f
    
}
