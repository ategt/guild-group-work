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

//    ApplicationContext ctx;
//
//    public UserDaoDBImplTest() {
//        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
//    }
//
//    @Before
//    public void setUp() {
//    }
//
//    @After
//    public void tearDown() {
//    }
//
//    /**
//     * Test of create method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testCreate() {
//        System.out.println("create");
//        User user = new User();
//
//        String name = "Billy Bob";
//        String role = "Gretal";
//        String password = "StinkyCheese1";
//        String email = "GreatBilly@JimsBarbiqueEmporium.com";
//        int numberOfComments = 3;
//        int id = 5;
//
//        Date dateJoined = new Date();
//
//        user.setId(id);
//
//        user.setEmail(email);
//        user.setName(name);
//        user.setJoinedOn(dateJoined);
//        user.setNumOfComments(numberOfComments);
//        user.setRole(role);
//        user.setPassword(password);
//
//        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
//        User expResult = user;
//        User result = instance.create(user);
//        assertEquals(expResult, result);
//    }
//
//    /**
//     * Test of create method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testCreateC() {
//        System.out.println("create");
//        User user = new User();
//
//        String name = "Billy Bob";
//        String role = "Gretal";
//        String password = "StinkyCheese1";
//        String email = "GreatBilly@JimsBarbiqueEmporium.com";
//        int numberOfComments = 3;
//        int id = 1;
//
//        Date dateJoined = new Date();
//
//        user.setId(id);
//
//        user.setEmail(email);
//        user.setName(name);
//        user.setJoinedOn(dateJoined);
//        user.setNumOfComments(numberOfComments);
//        user.setRole(role);
//        user.setPassword(password);
//
//        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
//        User expResult = user;
//        User result = instance.create(user);
//        assertEquals(expResult, result);
//        
//        assertTrue( user.getId() > 1 );
//        
//    }
//
//    /**
//     * Test of create method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testCreateB() {
//        System.out.println("create");
//        User user = new User();
//
//        String name = "Billy Bob";
//        String role = "Gretal";
//        String password = "StinkyCheese1";
//        String email = "GreatBilly@JimsBarbiqueEmporium.com";
//        int numberOfComments = 3;
//        int id = 5;
//
//        Date dateJoined = new Date();
//
//        user.setId(id);
//
//        user.setEmail(email);
//        user.setName(name);
//        user.setJoinedOn(dateJoined);
//        user.setNumOfComments(numberOfComments);
//        user.setRole(role);
//        user.setPassword(password);
//
//        user = null;
//
//        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
//        User expResult = user;
//        User result = instance.create(user);
//        assertEquals(expResult, result);
//    }
//
//    /**
//     * Test of get method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        int id = -30;
//        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
//        User expResult = null;
//        User result = instance.get(id);
//        assertEquals(expResult, result);
//
//    }
//
//    /**
//     * Test of get method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testGetB() {
//        System.out.println("get");
//        int id = 0;
//        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
//        User expResult = null;
//        User result = instance.get(id);
//        assertEquals(expResult, result);
//
//    }
//
//    /**
//     * Test of get method, of class UserDaoDBImpl.
//     */
//    @Test
//    public void testGetC() {
////        System.out.println("get");
////        
////        UserInterface instance = ctx.getBean("userDaoDBImpl", UserInterface.class);
////        
////        User user = userFactory();
////        
////        User expResult = user;
////        User returnedUser = instance.create(user);
////        int id = returnedUser.getId();
////        
////        User result = instance.get(id);
////        assertTrue(isUserEqual(result, expResult));
//
//    }
//
//    private User userFactory(){
//         User user = new User();
//
//        String name = "Billy Bob";
//        String role = "Gretal";
//        String password = "StinkyCheese1";
//        String email = "GreatBilly@JimsBarbiqueEmporium.com";
//        int numberOfComments = 3;
//        int id = 5;
//
//        Date dateJoined = new Date();
//
//        user.setId(id);
//
//        user.setEmail(email);
//        user.setName(name);
//        user.setJoinedOn(dateJoined);
//        user.setNumOfComments(numberOfComments);
//        user.setRole(role);
//        user.setPassword(password);
//
//        return user;
//    }
//    
//    private static Boolean isUserEqual(User user1, User user2) {
//        if (user1 == null && user2 == null) {
//            return true;
//        }
//
//        if (user1 == null || user2 == null) {
//            return false;
//        }
//
//        boolean valid = true;
//
//        if (!user1.getEmail().equals(user2.getEmail())) {
//            valid = false;
//        }
//
//        if (!user1.getName().equals(user2.getName())) {
//            valid = false;
//        }
//
//        if (!user1.getPassword().equals(user2.getPassword())) {
//            valid = false;
//        }
//
//        if (!user1.getRole().equals(user2.getRole())) {
//            valid = false;
//        }
//
//        if (!user1.getJoinedOn().equals(user2.getJoinedOn())) {
//            valid = false;
//        }
//
//        if (user1.getId()!= user2.getId()) {
//            valid = false;
//        }
//
//        if (user1.getNumOfComments()!= user2.getNumOfComments()) {
//            valid = false;
//        }
//
//        
//        
//        return valid;
//    }

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
