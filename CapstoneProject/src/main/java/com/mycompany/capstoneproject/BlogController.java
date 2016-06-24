/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.Comment;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value = "/blog")
public class BlogController {

    private BlogPostInterface blogPostDao;
    private UserInterface userDao;
    private CategoriesInterface categoriesDao;

    @Inject
    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao) {
        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String blog(Map model) {
        List<Category> categories = categoriesDao.listCategories();
        Category category = new Category();

        List<User> users = userDao.list();
        model.put("users", users);
        model.put("category", category);
        model.put("categories", categories);
        return "blog";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editById(@PathVariable("id") Integer id, Map model) {

        BlogPost blogPost = blogPostDao.getById(id);
        
        model.put("blogPost", blogPost);
        
        return "editBlog";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute BlogPostCommand postCommand, Map model) {
        User author = userDao.get(postCommand.getAuthorId());
        Category category = categoriesDao.get(postCommand.getCategoryId());

        Date datePosted = new Date();
        Date postExpires = new Date();
        Date postOn = new Date();

        Comment comment = new Comment();
        comment.setComment("This test is dope, yo");
        List<Comment> comments = new ArrayList();
        comments.add(comment);

        Image img = new Image();
        img.setUrl("");

        HashTag hashtag = new HashTag();
        hashtag.setName("#blessed");
        List<HashTag> hashTags = new ArrayList();
        hashTags.add(hashtag);

        BlogPost post = new BlogPost();
        post.setTitle(postCommand.getTitle());
        post.setSlug(postCommand.getTitle());
        post.setAuthor(author);
        post.setCategory(category);
        post.setContent(postCommand.getContent());
        post.setComments(comments);
        post.setImage(img);
        post.setHashTag(hashTags);
        post.setPostedOn(datePosted);
        post.setExpireOn(postExpires);
        post.setDateToPostOn(postOn);

        blogPostDao.create(post);

        model.put("post", post);
        return "showSingleBlog";

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer postId, Map model) {

        BlogPost posts = blogPostDao.getById(postId);

        model.put("singlePost", posts);

//        List<Category> categories = categoriesDao.listCategories();
//
//        model.put("categories", categories);
        return "showSingleBlog";
    }

    @RequestMapping(value = "/{slug}/{id}", method = RequestMethod.GET)
    @ResponseBody
    public BlogPost getPost(@PathVariable String slug, Integer postId) {

        BlogPost post = blogPostDao.getBySlug(slug);

        return post;
    }
}
