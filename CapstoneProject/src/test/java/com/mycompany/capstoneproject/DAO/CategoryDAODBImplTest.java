/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.Category;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author apprentice
 */
public class CategoryDAODBImplTest {

  

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of create method, of class CategoryDAODBImpl.
     */
    @Test
    public void testCreate() {
        System.out.println("");
        System.out.println("");
        System.out.println("create");
        System.out.println("");


        Category category = new Category();

        category.setId(1);
        category.setName("Sports");
        System.out.println(category.getId() + category.getName());

        category.setId(2);
        category.setName("Weather");
        System.out.println(category.getId() + category.getName());

        category.setId(3);
        category.setName("Politics");
        System.out.println(category.getId() + category.getName());

        category.setId(4);
        category.setName("Cats");
        System.out.println(category.getId() + category.getName());

    }

    /**
     * Test of get method, of class CategoryDAODBImpl.
     */
    @Test
    public void testGet() {
        System.out.println("");
        System.out.println("");
        System.out.println("get");
        System.out.println("");

        Category category = new Category();

        category.setId(1);
        category.setName("Sports");
        String name1 = category.getName();
        int id1 = category.getId();

        category.setId(2);
        category.setName("Weather");
        String name2 = category.getName();
        int id2 = category.getId();

        category.setId(3);
        category.setName("Politics");
        String name3 = category.getName();
        int id3 = category.getId();

        category.setId(4);
        category.setName("Cats");
        String name4 = category.getName();
        int id4 = category.getId();

        System.out.println(id1 + " , " + name1);
        System.out.println(id2 + " , " + name2);
        System.out.println(id3 + " , " + name3);
        System.out.println(id4 + " , " + name4);

    }

    /**
     * Test of update method, of class CategoryDAODBImpl.
     */
    @Test
    public void testUpdate() {
        System.out.println("");
        System.out.println("");
        System.out.println("update");
        System.out.println("");


        Category category = new Category();

        category.setId(1);
        category.setName("Sports");
        System.out.println("Old : " + category.getId() + category.getName());
        category.setName("sports");
        System.out.println("New : " + category.getId() + category.getName());

        category.setId(2);
        category.setName("Weather");
        System.out.println("Old : " +category.getId() + category.getName());
        category.setName("weather");
        System.out.println("New : " +category.getId() + category.getName());

        category.setId(3);
        category.setName("Politics");
        System.out.println("Old : " +category.getId() + category.getName());
        category.setName("politics");
        System.out.println("New : " + category.getId() + category.getName());

        category.setId(4);
        category.setName("Cats");
        System.out.println("Old : " +category.getId() + category.getName());
        category.setName("cats");
        System.out.println("New : " + category.getId() + category.getName());

    }



    /**
     * Test of listCategories method, of class CategoryDAODBImpl.
     */
    @Test
    public void testListCategories() {
        System.out.println("");
        System.out.println("");
        System.out.println("listCategories");
        System.out.println("");

        Category category = new Category();


        List<String> cats = new ArrayList();

        category.setName("Sports");
        String name = category.getName();

        category.setName("Politics");
        String politics = category.getName();

        category.setName("Weather");
        String weather = category.getName();

        cats.add(name);
        cats.add(politics);
        cats.add(weather);

        System.out.println(cats);
    }
    
//    public CategoryDAODBImplTest() {
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
//     * Test of create method, of class CategoryDAODBImpl.
//     */
//    @Test
//    public void testCreate() {
//        System.out.println("");
//        System.out.println("");
//        System.out.println("create");
//        System.out.println("");
////        Category category = null;
////        CategoryDAODBImpl instance = null;
////        Category expResult = null;
////        Category result = instance.create(category);
////        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//
//        Category category = new Category();
//
//        category.setId(1);
//        category.setName("Sports");
//        System.out.println(category.getId() + category.getName());
//
//        category.setId(2);
//        category.setName("Weather");
//        System.out.println(category.getId() + category.getName());
//
//        category.setId(3);
//        category.setName("Politics");
//        System.out.println(category.getId() + category.getName());
//
//        category.setId(4);
//        category.setName("Cats");
//        System.out.println(category.getId() + category.getName());
//
//    }
//
//    /**
//     * Test of get method, of class CategoryDAODBImpl.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("");
//        System.out.println("");
//        System.out.println("get");
//        System.out.println("");
////        Integer id = null;
////        CategoryDAODBImpl instance = null;
////        Category expResult = null;
////        Category result = instance.get(id);
////        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//
//        Category category = new Category();
//
//        category.setId(1);
//        category.setName("Sports");
//        String name1 = category.getName();
//        int id1 = category.getId();
//
//        category.setId(2);
//        category.setName("Weather");
//        String name2 = category.getName();
//        int id2 = category.getId();
//
//        category.setId(3);
//        category.setName("Politics");
//        String name3 = category.getName();
//        int id3 = category.getId();
//
//        category.setId(4);
//        category.setName("Cats");
//        String name4 = category.getName();
//        int id4 = category.getId();
//
//        System.out.println(id1 + " , " + name1);
//        System.out.println(id2 + " , " + name2);
//        System.out.println(id3 + " , " + name3);
//        System.out.println(id4 + " , " + name4);
//
//    }
//
//    /**
//     * Test of update method, of class CategoryDAODBImpl.
//     */
//    @Test
//    public void testUpdate() {
//        System.out.println("");
//        System.out.println("");
//        System.out.println("update");
//        System.out.println("");
////        Category category = null;
////        CategoryDAODBImpl instance = null;
////        instance.update(category);
//        // TODO review the generated test code and remove the default call to fail.
//
//        Category category = new Category();
//
//        category.setId(1);
//        category.setName("Sports");
//        System.out.println("Old : " + category.getId() + category.getName());
//        category.setName("sports");
//        System.out.println("New : " + category.getId() + category.getName());
//
//        category.setId(2);
//        category.setName("Weather");
//        System.out.println("Old : " +category.getId() + category.getName());
//        category.setName("weather");
//        System.out.println("New : " +category.getId() + category.getName());
//
//        category.setId(3);
//        category.setName("Politics");
//        System.out.println("Old : " +category.getId() + category.getName());
//        category.setName("politics");
//        System.out.println("New : " + category.getId() + category.getName());
//
//        category.setId(4);
//        category.setName("Cats");
//        System.out.println("Old : " +category.getId() + category.getName());
//        category.setName("cats");
//        System.out.println("New : " + category.getId() + category.getName());
//
//    }
//
//    /**
//     * Test of delete method, of class CategoryDAODBImpl.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("");
//        System.out.println("");
//        System.out.println("delete");
//        System.out.println("");
////        Category category = null;
////        CategoryDAODBImpl instance = null;
////        instance.delete(category);
//        // TODO review the generated test code and remove the default call to fail.
////        
////        Category category = new Category();
////        
////       
////        
////        category.setId(1);
////        category.setName("Sports");
////        String name1 = category.getName();
////        int id1 = category.getId();
////
////        category.setId(2);
////        category.setName("Weather");
////        String name2 = category.getName();
////        int id2 = category.getId();
////
////        category.setId(3);
////        category.setName("Politics");
////        String name3 = category.getName();
////        int id3 = category.getId();
////
////        category.setId(4);
////        category.setName("Cats");
////        String name4 = category.getName();
////        int id4 = category.getId();
////
////        System.out.println(id1 + " , " + name1);
////        System.out.println(id2 + " , " + name2);
////        System.out.println(id3 + " , " + name3);
////        System.out.println(id4 + " , " + name4);
////        
////      
////        
//        
//
//    }
//
//    /**
//     * Test of listCategories method, of class CategoryDAODBImpl.
//     */
//    @Test
//    public void testListCategories() {
//        System.out.println("");
//        System.out.println("");
//        System.out.println("listCategories");
//        System.out.println("");
//
//        Category category = new Category();
////        CategoryDAODBImpl instance = null;
////        List<Category> expResult = null;
////        List<Category> result = instance.listCategories();
////        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//
//        List<String> cats = new ArrayList();
//
//        category.setName("Sports");
//        String name = category.getName();
//
//        category.setName("Politics");
//        String politics = category.getName();
//
//        category.setName("Weather");
//        String weather = category.getName();
//
//        cats.add(name);
//        cats.add(politics);
//        cats.add(weather);
//
//        System.out.println(cats);
//
//    }
//
//    private CategoryDAODBImpl CategoryDAODBImpl() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

}
