/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.List;
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
public class StaticPageDAODBImplTest {

    ApplicationContext ctx;

    public StaticPageDAODBImplTest() {
        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

////    /**
////     * Test of create method, of class StaticPageDAODBImpl.
////     */
////    @Test
////    public void testCreate() {
////        System.out.println("create");
////        StaticPage stat = null;
////        StaticPageDAODBImpl instance = null;
////        StaticPage expResult = null;
////        StaticPage result = instance.create(stat);
////        assertEquals(expResult, result);
////        // TODO review the generated test code and remove the default call to fail.
////        fail("The test case is a prototype.");
////    }
    /**
     * Test of get method, of class StaticPageDAODBImpl.
     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        Integer id = null;
//        StaticPageDAODBImpl instance = ctx.getBean("staticPageDao", StaticPageDAODBImpl.class);
//        StaticPage expResult = null;
//        StaticPage result = instance.get(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        //fail("The test case is a prototype.");
//    }

    /**
     * Test of get method, of class StaticPageDAODBImpl.
     */
//    @Test
//    public void testGetB() {
//        System.out.println("get");
//        Integer id = 1;
//        StaticPageDAODBImpl instance = ctx.getBean("staticPageDao", StaticPageDAODBImpl.class);
//        StaticPage expResult = null;
//        StaticPage result = instance.get(id);
//        assertNotNull(result);
//        // TODO review the generated test code and remove the default call to fail.
//        //fail("The test case is a prototype.");
//    }

    /**
     * Test of get method, of class StaticPageDAODBImpl.
     */
//    @Test
//    public void testGetC() {
//        System.out.println("get");
//        Integer id = 1;
//        StaticPageDAODBImpl instance = ctx.getBean("staticPageDao", StaticPageDAODBImpl.class);
//
//        StaticPage result = instance.get(id);
//        
//        StaticPage expResult = new StaticPage();
//
//        expResult.setContent("TEST");
//        expResult.setTitle("BOB");
//        expResult.setId(1);
//
//        assertTrue(verifyStaticPage(expResult, result ));
//        
//    }

//    private Boolean verifyStaticPage(StaticPage staticPage1, StaticPage staticPage2) {
//
//        assertEquals(staticPage1.getContent(), staticPage2.getContent());
//        assertEquals(staticPage1.getTitle(), staticPage2.getTitle());
//        assertEquals(staticPage1.getId(), staticPage2.getId());
//        
//        if (staticPage1 == null && staticPage2 == null) {
//            return true;
//        }
//
//        if (staticPage1 == null || staticPage2 == null) {
//            return false;
//        }
//
//        boolean valid = true;
//
//        if (!staticPage1.getContent().equals(staticPage2.getContent())) {
//            valid = false;
//        }
//
//        if (!staticPage1.getTitle().equals(staticPage2.getTitle())) {
//            valid = false;
//        }
//
//        if (staticPage1.getId() != staticPage2.getId()) {
//            valid = false;
//        }
//
//        return valid;
//
//    }

////    /**
////     * Test of update method, of class StaticPageDAODBImpl.
////     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        StaticPage stat = null;
//        StaticPageDAODBImpl instance = null;
//        instance.update(stat);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    /**
//     * Test of delete method, of class StaticPageDAODBImpl.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        StaticPage stat = null;
//        StaticPageDAODBImpl instance = null;
//        instance.delete(stat);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    /**
//     * Test of listBlogs method, of class StaticPageDAODBImpl.
//     */
//    @Test
//    public void testListBlogs() {
//        System.out.println("listBlogs");
//        StaticPageDAODBImpl instance = null;
//        List<StaticPage> expResult = null;
//        List<StaticPage> result = instance.listBlogs();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
}
