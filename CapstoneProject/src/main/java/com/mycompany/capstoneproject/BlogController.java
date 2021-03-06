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
import com.mycompany.capstoneproject.bll.ImageServices;
import com.mycompany.capstoneproject.bll.StaticPageServices;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.inject.Inject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
    private ImageInterface imageDao;
    private ImageServices imageServices;
    private StaticPageServices staticPageServices;

    @Inject
    public BlogController(BlogPostInterface blogPostDao, UserInterface userDao, CategoriesInterface categoriesDao, StaticPageInterface staticPageDao, HashTagInterface HDao, ImageInterface imageDao, ImageServices imageServices, StaticPageServices staticPageServices) {

        this.blogPostDao = blogPostDao;
        this.userDao = userDao;
        this.categoriesDao = categoriesDao;
        this.staticDao = staticPageDao;
        this.hashTagDao = HDao;
        this.imageDao = imageDao;
        this.imageServices = imageServices;
        this.staticPageServices = staticPageServices;

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String blog(Map model) {

        List<Category> categories = categoriesDao.listCategories();
        Category category = new Category();
        Image image = new Image();
        BlogPost blogPost = new BlogPost();
        blogPost.setImage(image);

        loadStaticPagesIntoModel(model);

        imageServices.loadImageIdsIntoModel(model);

        List<User> users = userDao.list();
        model.put("users", users);
        model.put("category", category);
        model.put("categories", categories);
        model.put("blogPost", blogPost);
        return "blog";
    }

    private void loadStaticPagesIntoModel(Map model) {
        staticPageServices.loadStaticPagesIntoModelInOrder(model);

//        List<StaticPage> staticPages = staticDao.listPagesByPosition();
//        StaticPage staticPage = new StaticPage();
//        model.put("staticPages", staticPages);
    }

    @RequestMapping(value = "/imagetest", method = RequestMethod.GET)
    public String blogImageTest(Map model) {

        imageServices.loadImageIdsIntoModel(model);

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

        imageServices.loadImageIdsIntoModel(model);
        staticPageServices.loadStaticPagesIntoModelInOrder(model);

        List<Category> categories = categoriesDao.listCategories();
        loadStaticPagesIntoModel(model);

        model.put("categories", categories);
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
        String slug = createSlug(blogPost.getTitle());
        blogPost.setSlug(slug);

        // Do something here to recheck for #hashTags.
        blogPost.setContent(blogPostCommand.getContent());

        List<HashTag> hashTags = searchThroughContentForHashTags(blogPostCommand.getContent());
        blogPost.setHashTag(hashTags);

        int categoryId = blogPostCommand.getCategoryId();
        Category category = categoriesDao.get(categoryId);

        blogPost.setCategory(category);

        Image thumbImage = imageDao.get(blogPostCommand.getThumbId());
        blogPost.setImage(thumbImage);

        blogPostDao.update(blogPost);

        loadStaticPagesIntoModel(model);

        model.put("post", blogPost);

        return "showSingleBlogCreate";
    }
    
                
    @RequestMapping(value = "/editPosts", method = RequestMethod.GET)
    public String blogEditPosts(Map model) {

        List<BlogPost> blogPosts = blogPostDao.listBlogs();

        model.put("blogPosts", blogPosts);
        return "editBlogAdmin";
    }
            
            

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createRequest(@ModelAttribute BlogPostCommand postCommand, Map model) {
        BlogPost post = convertPostCommandToPost(postCommand);

        blogPostDao.create(post);

        

        loadStaticPagesIntoModel(model);

        model.put("post", post);
        return "showSingleBlogCreate";
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

        Comment comment = new Comment();
        comment.setComment("This test is dope, yo");
        List<Comment> comments = new ArrayList();
        comments.add(comment);
        Image img = new Image();
        img.setUrl("");

        int thumgId = postCommand.getThumbId();
        Image thumbImage = imageDao.get(thumgId);

        if (thumbImage == null) {
            thumbImage = imageDao.getDefaultThumb();
        }

//        List<HashTag> hashTags = searchThroughContentForHashTags(postCommand.getContent());
        if (postCommand.getPublishOn() == null) {
            postCommand.setPublishOn(new Date());
        }
        BlogPost post = new BlogPost();
        post.setTitle(postCommand.getTitle());
        //post.setSlug(postCommand.getTitle());

        post.setTitle(postCommand.getTitle());
        String slug = createSlug(post.getTitle());
        post.setSlug(slug);

        post.setAuthor(author);
        post.setCategory(category);
        post.setContent(postCommand.getContent());
        post.setComments(comments);
        post.setImage(thumbImage);
//        post.setHashTag(hashTags);
        post.setPostedOn(datePosted);
        post.setExpireOn(postCommand.getExpireOn());
        post.setDateToPostOn(postCommand.getPublishOn());
        post.setImage(thumbImage);
        post.setExpired(0);
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
        
       
        
        model.put("post", post);
       
        loadStaticPagesIntoModel(model);

        return "showSingleBlog";
    }

//    @RequestMapping(value = "/{slug}/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public BlogPost getPost(@PathVariable String slug, Integer postId) {
//
//        BlogPost post = blogPostDao.getBySlug(slug);
//
//        return post;
//    }
    @RequestMapping(value = "/category/{name}", method = RequestMethod.GET)
    public String showByCategory(@PathVariable("name") String category, Map model) {

        List<BlogPost> list = blogPostDao.listBlogs();

        List<BlogPost> newArray = new ArrayList();

        BlogPost post = new BlogPost();

        for (BlogPost blogPost : list) {

            if (category.toLowerCase().equals(blogPost.getCategory().getName().toLowerCase())) {
                if(blogPost.getExpired()== 0 ){
                     newArray.add(blogPost);
                }
               

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

        loadStaticPagesIntoModel(model);

        model.put("pages", pages);
        model.put("staticPage", staticPage);
        //model.put("staticPages", staticPages);
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

    public String createSlug(String title) {
        String slug = title.replace(" ", "-");
        List<String> slugs = blogPostDao.listSlugs();
        Integer numOfRepeats = 0;

        slugs = slugs.stream()
                .filter(s -> s != null)
                .collect(Collectors.toList());

        for (String str : slugs) {
            String[] strArray = str.split("_"); //split between slug and number of repeats
            String myTitle = strArray[0];       //grab slug
            if (myTitle.equals(slug)) {           //find number of times slug repeat
                numOfRepeats++;
            }
        }
        for (String str : slugs) {
            String[] strArray = str.split("_");
            String myTitle = strArray[0];
            if (myTitle.equals(slug)) {
                slug = slug + "_" + numOfRepeats;
            }
        }

        return slug;

    }

    @RequestMapping(value = "/publish/{id}", method = RequestMethod.POST)
    public String publishPost(@PathVariable("id") Integer postId, Map model) {
        BlogPost post = blogPostDao.getById(postId);
        List<HashTag> foundHashTags = searchThroughContentForHashTags(post.getContent());
        post.setHashTag(foundHashTags);
        blogPostDao.publish(post);
        updateHashTags(post);
        List<StaticPage> staticPages = staticDao.listPages();
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
        return "admin";
    }
    @RequestMapping(value = "/publish/{id}", method = RequestMethod.GET)
    public String publish(@PathVariable("id") Integer postId, Map model) {
        BlogPost post = blogPostDao.getById(postId);
        List<HashTag> foundHashTags = searchThroughContentForHashTags(post.getContent());
        post.setHashTag(foundHashTags);
        blogPostDao.publish(post);
        updateHashTags(post);
        List<StaticPage> staticPages = staticDao.listPages();
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
        return "admin";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public BlogPost delete(@PathVariable("id") int id) {
        BlogPost post = blogPostDao.getById(id);
        blogPostDao.delete(post);
        return post;
    }

}
