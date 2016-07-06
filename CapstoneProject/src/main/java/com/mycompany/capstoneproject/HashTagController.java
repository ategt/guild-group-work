/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.HashTagInterface;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value = "/hashtag")
public class HashTagController {

    private BlogPostInterface blogPostDao;
    private CategoriesInterface categoriesDao;
    private HashTagInterface hashTagDao;
    private StaticPageInterface staticPageDao;
    private UserInterface userDao;

    @Inject
    public HashTagController(BlogPostInterface BPDao, CategoriesInterface CDao, StaticPageInterface SPDao, UserInterface UDao, HashTagInterface HDao) {
        this.blogPostDao = BPDao;
        this.categoriesDao = CDao;
        this.hashTagDao = HDao;
        this.staticPageDao = SPDao;
        this.userDao = UDao;
    }

    @RequestMapping(value = "/{hashtag}", method = RequestMethod.GET)
    public String getPostsByHashTag(@PathVariable("hashtag") String hashTagName, Map model) {

        HashTag hashTag = hashTagDao.get(hashTagName);

        List<BlogPost> posts = hashTagDao.listBlogs(hashTag);
        
        List<BlogPost> activePosts = new ArrayList();
        
        for (BlogPost p : posts) {
            if(p.getStatus().toLowerCase().equals("published")){
                activePosts.add(p);
            }
        }

        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();

        List<Category> categories = categoriesDao.listCategories();

        List<HashTag> hash = hashTagDao.listHashTags();

        Integer count = blogPostDao.getNumOfPosts();
        Integer numOfPages = (count / 3);
        List<Integer> pages = new ArrayList();
        for (int i = 1; i <= numOfPages; i++) {
            pages.add(i);
        }

        model.put("pages", pages);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        model.put("posts", activePosts);
        model.put("categories", categories);
        model.put("hashTag", hash);
        return "index";
    }

}
