
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.HashTagInterface;
import com.mycompany.capstoneproject.DAO.ImageInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;

import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.File;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.DTO.User;
import com.mycompany.capstoneproject.bll.ImageServices;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value = "/adminPanel")
public class AdminPanelController {

    private StaticPageInterface staticPageDao;
    private BlogPostInterface blogPostDao;
    private UserInterface userDao;
    private CategoriesInterface categoriesDao;
    private HashTagInterface hashTagDao;

    @Inject
    public AdminPanelController(StaticPageInterface staticPageDao, BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao, HashTagInterface hashTagDao) {
        this.staticPageDao = staticPageDao;
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
        this.hashTagDao = hashTagDao;
    }

    @RequestMapping(value = "/old", method = RequestMethod.GET)
    public String admin(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();

        List<HashTag> hashTags = hashTagDao.listHashTags();

        List<Category> categories = categoriesDao.listCategories();

        List<User> users = userDao.list();

        List<BlogPost> posts = blogPostDao.listBlogs();

        model.put("posts", posts);
        model.put("users", users);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);

        return "adminPanel";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String adminTest(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();

        List<HashTag> hashTags = hashTagDao.listHashTags();
        HashTag hashTag = new HashTag();

        List<Category> categories = categoriesDao.listCategories();
        Category category = new Category();

        List<User> users = userDao.list();
        User user = new User();

        List<BlogPost> posts = blogPostDao.listBlogs();

        model.put("category", category);
        model.put("posts", posts);
        model.put("users", users);
        model.put("user", user);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("hashTag", hashTag);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);

        return "adminPanelTest";
    }

    @RequestMapping(value = "/pendingPosts", method = RequestMethod.GET)
    public String pendingPosts(Map model) {

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();

        model.put("pendingPosts", pendingPosts);

        return "ADMINPANEL/pendingPostsAdmin";
    }

    @RequestMapping(value = "/hashtags", method = RequestMethod.GET)
    public String hashTags(Map model) {

        List<HashTag> hashTags = hashTagDao.listHashTags();

        model.put("hashtags", hashTags);

        return "ADMINPANEL/hashtagAdmin";
    }

    @RequestMapping(value = "/editPosts", method = RequestMethod.GET)
    public String editPosts(Map model) {

        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();

        List<HashTag> hashTags = hashTagDao.listHashTags();

        List<Category> categories = categoriesDao.listCategories();

        List<User> users = userDao.list();
        List<User> activeUsers = new ArrayList();

        for (User user : users) {
            if (user.getEnabled() == 1) {
                activeUsers.add(user);
            }
        }

        List<BlogPost> posts = blogPostDao.listBlogs();

        model.put("users", activeUsers);
        model.put("posts", posts);
        model.put("categories", categories);
        model.put("hashtags", hashTags);
        model.put("pendingPosts", pendingPosts);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);

        return "ADMINPANEL/editBlogPostsAdmin";
    }

    @RequestMapping(value = "/staticPages", method = RequestMethod.GET)
    public String staticPages(Map model) {
        List<StaticPage> staticPages = staticPageDao.listPages();

        model.put("staticPages", staticPages);

        return "ADMINPANEL/staticPageEditSkeletonAdmin";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(Map model) {

        List<User> users = userDao.list();

        List<User> activeUsers = new ArrayList();

        for (User user : users) {
            if (user.getEnabled() == 1) {
                activeUsers.add(user);
            }
        }

        model.put("users", activeUsers);

        return "ADMINPANEL/usersAdmin";
    }

    @RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") Integer userId) {

        User user = userDao.get(userId);

        userDao.delete(user);

    }

    @RequestMapping(value = "/adminPanel/", method = RequestMethod.PUT)
    public String edit(@PathVariable("id") Integer orderId, Map model, User u) {

        Integer id = u.getId();
        String username = u.getName();
        String password = u.getPassword();
        String email = u.getEmail();
        String role = u.getRole();
        Integer enabled = u.getEnabled();

        User user = new User();

        user.setId(id);
        user.setName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);
        user.setEnabled(enabled);

        userDao.update(user);

        User users = userDao.get(orderId);

        model.put("users", users);

        return "ADMINPANEL/usersAdmin";
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public String categories(Map model) {

        List<Category> categories = categoriesDao.listCategories();

        model.put("categories", categories);

        return "ADMINPANEL/categoryAdmin";
    }

    @RequestMapping(value = "/images", method = RequestMethod.GET)
    public String images(Map model) {

        return "imageAdmin";
    }

    @Autowired
    private ImageInterface imageDao;

    @Autowired
    private ImageServices imageServices;

    @RequestMapping(method = RequestMethod.GET, value = "/showimage/{id}")
    @ResponseBody
    public void getImage(@PathVariable("id") Integer id, HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {

        Image image = null;

        if (id == 0) {
            image = imageDao.getDefaultThumb();
        } else {
            image = imageDao.get(id);
        }

        response.setContentLengthLong(image.getSize());
        response.setContentType(image.getContentType());

        response.getOutputStream().write(image.getImage());
        response.getOutputStream().close();

    }

    @RequestMapping(method = RequestMethod.GET, value = "/imagelist")
    @ResponseBody
    public List<Integer> getAllImages() {

        List<Image> images = imageDao.list();

        List<Integer> intList = images.stream().map(Image::getId).collect(Collectors.toList());

        return intList;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/imagetest")
    public String imagePickerTest(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList = filterTestFiles(images);

        model.put("imageIdList", imageIdList);

        return "pickerTest";
    }

    private List<Integer> filterTestFiles(List<Image> images) {
        List<Integer> imageIdList = images.stream()
                .filter(a -> a != null)
                //.filter(a -> a.getUrl() == null || !a.getUrl().toLowerCase().contains("patsdresses.com"))
                .filter(a -> a.getDescription() != null)
                .filter(a -> a.getDescription().toLowerCase().contains("ajax"))
                .map(Image::getId)
                .collect(Collectors.toList());
        return imageIdList;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/imagetestb")
    public String imagePickerTestB(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList = filterTestFiles(images);

        model.put("imageIdList", imageIdList);

        return "pickerTestB";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/imageadmin")
    public String imageAdmin(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList = filterTestFiles(images);

        model.put("imageIdList", imageIdList);

        return "imageAdmin";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteImage(@PathVariable("id") Integer contactId) {

        Image image = imageDao.get(contactId);

        imageDao.delete(image);

    }

    @RequestMapping(method = RequestMethod.POST, value = "/imageadmin")
    public String fileUploaded(Model model, @Validated File file,
            BindingResult result) {

        String returnVal = "successFile";
        if (result.hasErrors()) {
            returnVal = "imageAdmin";
        } else {

            try {
                MultipartFile multipartFile = file.getFile();
                Image image = imageServices.addImageToDatabase(multipartFile);
                imageServices.loadRecentInfoIntoModel(model, image);
            } catch (IOException ex) {
                Logger.getLogger(ImageController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return returnVal;
    }

    @RequestMapping(value = "/upload/", method = RequestMethod.POST)
    @ResponseBody
    public Integer ajaxFileUploaded(Model model, @Validated com.mycompany.capstoneproject.DTO.File file,
            BindingResult result) {

        Integer returnId = null;

        if (result.hasErrors()) {
            return 0;
        } else {
            Image image = imageServices.ajaxUploadFile(file, model);
            if (image != null) {

                returnId = image.getId();

            }

        }
        return returnId;
    }

    @RequestMapping(value = "/defaultimage/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Integer setDefaultImage(@PathVariable("id") Integer id) {

        Image defaultImage = imageDao.get(id);

        imageDao.setDefaultThumb(defaultImage);

        Image returnedImage = imageDao.getDefaultThumb();

        int returnedImageId = returnedImage.getId();

        return returnedImageId;
    }

}
