/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.User;
import java.util.Date;
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
public class UserDaoDBImplTest {

    ApplicationContext ctx;

    public UserDaoDBImplTest() {
        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of create method, of class UserDaoDBImpl.
     */
    @Test
    public void testCreate() {
        System.out.println("create");
        User user = new User();

        String name = "Billy Bob";
        String role = "Gretal";
        String password = "StinkyCheese1";
        String email = "GreatBilly@JimsBarbiqueEmporium.com";
        int numberOfComments = 3;
        int id = 5;

        Date dateJoined = new Date();

        user.setId(id);

        user.setEmail(email);
        user.setName(name);
        user.setJoinedOn(dateJoined);
        user.setNumOfComments(numberOfComments);
        user.setRole(role);
        user.setPassword(password);
        
        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
        User expResult = user;
        User result = instance.create(user);
        assertEquals(expResult, result);
    }

//
//    /**
//     * Test of get method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        int id = 0;
//        UserDaoDBImpl instance = null;
//        User expResult = null;
//        User result = instance.get(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of update method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        User user = null;
//        UserDaoDBImpl instance = null;
//        instance.update(user);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of delete method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        User user = null;
//        UserDaoDBImpl instance = null;
//        instance.delete(user);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of list method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testList() {
//        System.out.println("list");
//        UserDaoDBImpl instance = null;
//        List<User> expResult = null;
//        List<User> result = instance.list();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
}
