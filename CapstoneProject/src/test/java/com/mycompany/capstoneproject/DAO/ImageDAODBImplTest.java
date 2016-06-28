/**
 *
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.Image;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.UUID;
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
public class ImageDAODBImplTest {

    ApplicationContext ctx;

    public ImageDAODBImplTest() {
        ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");

    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of create method, of class ImageDAODBImpl.
     */
    @Test
    public void testCreate() {
        System.out.println("create");
        Image image = null;
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = null;
        Image result = instance.create(image);
        assertEquals(expResult, result);

        // This confirms that create handled a null object.
        assertTrue(true);
    }

    /**
     * Test of create method, of class ImageDAODBImpl.
     */
    @Test
    public void testCreateB() {
        System.out.println("create");
        Image image = new Image();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);
        assertEquals(expResult, result);

        // This confirms that create handled a null object.
        assertTrue(true);
    }

    /**
     * Test of create method, of class ImageDAODBImpl.
     */
    @Test
    public void testCreateC() {
        System.out.println("create");
        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);
        assertEquals(expResult, result);

        assertTrue(isImageEqual(expResult, result));
        assertTrue(image.getId() > 0);
    }

    private static Boolean isImageEqual(Image image1, Image image2) {
        if (image1 == null && image2 == null) {
            return true;
        }

        if (image1 == null || image2 == null) {
            return false;
        }

        boolean valid = true;

        if (!image1.getDescription().equals(image2.getDescription())) {
            valid = false;
        }

        if (!image1.getOriginalName().equals(image2.getOriginalName())) {
            valid = false;
        }

        if (!image1.getContentType().equals(image2.getContentType())) {
            valid = false;
        }

        if (!image1.getUrl().equals(image2.getUrl())) {
            valid = false;
        }

        if (image1.getHeight() != image2.getHeight()) {
            valid = false;
        }

        if (image1.getWidth() != image2.getWidth()) {
            valid = false;
        }

        if (image1.getId() != image2.getId()) {
            valid = false;
        }

        //if (!image1.getImage().equals(image2.getImage())) {
        if (!Arrays.equals(image1.getImage(), image2.getImage())) {
            valid = false;
        }

        if (!Objects.equals(image1.getSize(), image2.getSize())) {
            valid = false;
        }
            
            return valid;
        }

    

    private Image imageFactory() {
        Image image = new Image();

        String url = "http://swc.patsdresses.com/" + UUID.randomUUID().toString();
        String description = "A pretty picture " + UUID.randomUUID().toString();

        byte[] b = new byte[20];
        new java.util.Random().nextBytes(b);
        byte[] imageBytes = b;

//        = image.setId(0);
        image.setUrl(url);
        image.setImage(imageBytes);
        image.setOriginalName(UUID.randomUUID().toString());
        image.setWidth(0);
        image.setHeight(0);
        image.setDescription(description);
        image.setContentType("image/jpeg");
        image.setSize(new Random().nextLong());

        return image;
    }

    /**
     * Test of get method, of class ImageDAODBImpl.
     */
    @Test
    public void testGet() {

        System.out.println("get");
        int id = 0;
        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);

        id = result.getId();

        assertTrue(isImageEqual(expResult, result));

        Image getResult = instance.get(id);
        assertTrue(isImageEqual(getResult, image));
        assertTrue(isImageEqual(getResult, result));

    }

    /**
     * Test of get method, of class ImageDAODBImpl.
     */
    @Test
    public void testGetB() {

        System.out.println("get");
        int id = 0;
        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);

        Image getResult = instance.get(id);

        assertNull(getResult);

    }

    /**
     * Test of get method, of class ImageDAODBImpl.
     */
    @Test
    public void testGetC() {

        System.out.println("get");
        int id = -3;
        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);

        Image getResult = instance.get(id);

        assertNull(getResult);

    }

    /**
     * Test of update method, of class ImageDAODBImpl.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");

        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);

        image.setDescription("Billy in the winter.");

        instance.update(image);

        Image updatedImage = instance.get(image.getId());

        assertTrue(isImageEqual(updatedImage, image));

    }

    /**
     * Test of update method, of class ImageDAODBImpl.
     */
    @Test
    public void testUpdateB() {
        System.out.println("update");

        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);

        instance.update(null);

        // It just has to make it here to pass.
        assertTrue(true);

    }

    /**
     * Test of update method, of class ImageDAODBImpl.
     */
    @Test
    public void testUpdateC() {
        System.out.println("delete");

        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);

        instance.delete(null);

        // It just has to make it here to pass.
        assertTrue(true);

    }

    /**
     * Test of delete method, of class ImageDAODBImpl.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        Image image = imageFactory();
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);
        Image expResult = image;
        Image result = instance.create(image);

        image.setDescription("Billy in the winter.");

        instance.update(image);

        Image updatedImage = instance.get(image.getId());

        assertTrue(isImageEqual(updatedImage, image));

        instance.delete(image);

        Image deletedImage = instance.get(image.getId());

        assertNull(deletedImage);

    }

    /**
     * Test of list method, of class ImageDAODBImpl.
     */
    @Test
    public void testList() {
        System.out.println("list");
        ImageInterface instance = ctx.getBean("imageDaoDBImpl", ImageInterface.class);

        Image image = imageFactory();

        int id = instance.create(image).getId();

        List<Image> expResult = instance.list();
        List<Image> result = instance.list();

        Image sortedImage = result.stream()
                .filter(a -> a.getId() == id)
                .findAny()
                .get();

        assertTrue(isImageEqual(sortedImage, image));

    }

}
