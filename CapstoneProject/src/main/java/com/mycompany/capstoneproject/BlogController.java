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
import com.mycompany.capstoneproject.DTO.BlogPostCommand;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.Comment;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.StaticPage;
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
    private StaticPageInterface staticDao;
    private HashTagInterface hashTagDao;

    @Inject
    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao, StaticPageInterface SDao, HashTagInterface HDao) {

        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
        this.staticDao = SDao;
        this.hashTagDao = HDao;
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

    @RequestMapping(value = "/imagetest", method = RequestMethod.GET)
    public String blogImageTest(Map model) {

        List<Category> categories = categoriesDao.listCategories();
        Category category = new Category();

        List<User> users = userDao.list();
        model.put("users", users);
        model.put("category", category);
        model.put("categories", categories);
        return "blogImageTest";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editById(@PathVariable("id") Integer id, Map model) {

        BlogPost blogPost = blogPostDao.getById(id);

        List<User> users = userDao.list();

        if (blogPost == null) {
            return "unableToEdit";
        }

        List<Category> categories = categoriesDao.listCategories();
        model.put("categories", categories);

//        List<User> users = userDao.list();
        model.put("users", users);
        model.put("blogPost", blogPost);

        return "editBlog";
    }

    @RequestMapping(value = "/edit/", method = RequestMethod.POST)
    public String submitEditById(@ModelAttribute("blogPostCommand") BlogPostCommand blogPostCommand, Map model) {
        if (blogPostCommand == null) {
            return "unableToEdit";
        }

        int blogPostId = blogPostCommand.getId();

        BlogPost blogPost = blogPostDao.getById(blogPostId);

        int authorId = blogPostCommand.getAuthorId();

        User user = userDao.get(authorId);

        blogPost.setAuthor(user);

        // Consider resluging.
        blogPost.setTitle(blogPostCommand.getTitle());
        blogPost.setSlug(blogPostCommand.getTitle());

        // Do something here to recheck for #hashTags.
        blogPost.setContent(blogPostCommand.getContent());

        List<HashTag> hashTags = searchThroughContentForHashTags(blogPostCommand.getContent());
        blogPost.setHashTag(hashTags);

        int categoryId = blogPostCommand.getCategoryId();
        Category category = categoriesDao.get(categoryId);

        blogPost.setCategory(category);

        blogPostDao.update(blogPost);

        //List<User> users = userDao.list();
        //BlogPostCommand blogPostCommand = convertCommandToBlogPost(blogPost);
//        List<Category> categories = categoriesDao.listCategories();
//        model.put("categories", categories);
//
//        List<User> users = userDao.list();
//        model.put("users", users);
//        model.put("blogPostCommand", blogPostCommand);
        BlogPost post = blogPostDao.getById(blogPostId);

        model.put("post", post);

        //model.put("users", users);
        //model.put("blogPost", blogPost);
//        List<Category> categories = categoriesDao.listCategories();
//
//        model.put("categories", categories);
        return "showSingleBlog";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createRequest(@ModelAttribute BlogPostCommand postCommand, Map model) {
        BlogPost post = convertPostCommandToPost(postCommand);
        post.setStatus("Pending");
        blogPostDao.create(post);

        updateHashTags(post);

        model.put("post", post);
        return "showSingleBlog";

    }

    private void updateHashTags(BlogPost post) {
        List<String> str = hashTagDao.listHashTagNames();
        List<HashTag> hashTags = post.getHashTag();
        for (String hashTag : str) {
            if (!str.contains(hashTag)) {
                HashTag newHashTag = new HashTag();
                newHashTag.setName(hashTag.toLowerCase());
                hashTags.add(newHashTag);
            } else {
                HashTag hash = hashTagDao.get(hashTag);
                hashTags.add(hash);
            }
        }

        for (HashTag hashTag : hashTags) {
            hashTagDao.updateHashTagPostTable(hashTag, post);
        }
    }

    private BlogPost convertPostCommandToPost(BlogPostCommand postCommand) {
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
        
        List<HashTag> hashTags = searchThroughContentForHashTags(postCommand.getContent());
//        List<HashTag> hashTags = new ArrayList();
//        List<String> existingHashTags = hashTagDao.listHashTagNames();
//
//        for (String hashTag : str) {
//
//            if (!existingHashTags.contains(hashTag)) {
//                HashTag newHashTag = new HashTag();
//                newHashTag.setName(hashTag.toLowerCase());
//                hashTagDao.create(newHashTag);
//                hashTags.add(newHashTag);
//            } else {
//                HashTag existingHashTag = hashTagDao.get(hashTag);
//                existingHashTag.setNumOfUses(existingHashTag.getNumOfUses() + 1);
//                hashTagDao.incrementNumOfUses(existingHashTag);
//            }
//
////            if (hashTags.contains(newHashTag.getName())) {
////
////            } else {
////            }
//        }

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
        return post;
    }

    private BlogPostCommand convertCommandToBlogPost(BlogPost blogPost) {
        if (blogPost == null) {
            return null;
        }

        BlogPostCommand blogPostCommand = new BlogPostCommand();

        int blogAuthorId;

        if (blogPost.getAuthor() == null) {
            blogAuthorId = 0;
        } else {
            blogAuthorId = blogPost.getAuthor().getId();
        }

        blogPostCommand.setAuthorId(blogAuthorId);

        int categoryId;

        if (blogPost.getCategory() == null) {
            categoryId = 0;
        } else {
            categoryId = blogPost.getCategory().getId();
        }

        blogPostCommand.setCategoryId(categoryId);

        blogPostCommand.setContent(blogPost.getContent());
        blogPostCommand.setId(blogPost.getId());
        blogPostCommand.setTitle(blogPost.getTitle());

        return blogPostCommand;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer postId, Map model) {

        BlogPost post = blogPostDao.getById(postId);

//        User author = userDao.get(post.getAuthor().getId());
//        post.setAuthor(author);
//        Category category = categoriesDao.get(post.getCategory().getId());
//        post.setCategory(category);
        model.put("post", post);

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

    @RequestMapping(value = "/category/{name}", method = RequestMethod.GET)
    public String showByCategory(@PathVariable("name") String category, Map model) {

        List<BlogPost> list = blogPostDao.listBlogs();

        List<BlogPost> newArray = new ArrayList();

        BlogPost post = new BlogPost();

        for (BlogPost blogPost : list) {

            if (category.toLowerCase().equals(blogPost.getCategory().getName().toLowerCase())) {
                newArray.add(blogPost);

            }

        }
        list = newArray;

        model.put("cat", category);

        model.put("categoryList", newArray);

        List<StaticPage> staticPages = staticDao.listPages();
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
//        model.put("posts", posts);
        model.put("categories", categories);
        model.put("hashTag", hash);

        return "categoryBlogPosts";
    }

    public List<HashTag> searchThroughContentForHashTags(String content) {
        List<String> str = hashTagDao.findHashTags(content);
        List<HashTag> hashTags = new ArrayList();
        List<String> existingHashTags = hashTagDao.listHashTagNames();

        for (String hashTag : str) {

            if (!existingHashTags.contains(hashTag)) {
                HashTag newHashTag = new HashTag();
                newHashTag.setName(hashTag.toLowerCase());
                hashTagDao.create(newHashTag);
                hashTags.add(newHashTag);
            } else {
                HashTag existingHashTag = hashTagDao.get(hashTag);
                existingHashTag.setNumOfUses(existingHashTag.getNumOfUses() + 1);
                hashTagDao.incrementNumOfUses(existingHashTag);
                hashTags.add(existingHashTag);
            }

        }
        
        return hashTags;
    }

}
