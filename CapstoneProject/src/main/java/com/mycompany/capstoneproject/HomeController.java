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
import com.mycompany.capstoneproject.DTO.User;
import com.mycompany.capstoneproject.bll.ImageServices;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    private BlogPostInterface blogPostDao;
    private CategoriesInterface categoriesDao;
    private HashTagInterface hashTagDao;
    private StaticPageInterface staticPageDao;
    private UserInterface userDao;
    private ImageServices imageServices;

    @Inject
    public HomeController(BlogPostInterface BPDao, CategoriesInterface CDao, StaticPageInterface SPDao, UserInterface UDao, HashTagInterface HDao, ImageServices imageServices) {
        this.blogPostDao = BPDao;
        this.categoriesDao = CDao;
        this.hashTagDao = HDao;
        this.staticPageDao = SPDao;
        this.userDao = UDao;
        this.imageServices = imageServices;
    }

    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public String aboutUs(Map model) {

        List<User> users = userDao.list();

        List<User> employees = new ArrayList();

        for (User u : users) {
            if (u.getRole().toUpperCase().equals("ROLE_ADMIN") || u.getRole().toUpperCase().equals("ROLE_AUTHOR")) {

                employees.add(u);
            }
        }

        model.put("employees", employees);

        return "aboutUs";
    }

    @RequestMapping(value = "/blog/waitingApproval", method = RequestMethod.GET)
    public String postsWaitingApproval(Map model) {

        List<BlogPost> posts = blogPostDao.listBlogs();

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
        model.put("posts", posts);
        model.put("categories", categories);
        model.put("hashTag", hash);

        return "waitingApproval";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Map model, @RequestParam(value = "page", required = false) Integer pageNumber) {

        String name = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {

            name = auth.getName(); //get logged in username

            if (name != null) {

                model.put("username", name);

            }
        }

        automaticallyPublishScheduledPosts();
        automaticallyRemoveExpiredPosts();

        Integer offset;
        if (pageNumber == null) {
            offset = 0;
        } else {
            offset = getOffset(pageNumber);
        }
        List<BlogPost> posts = blogPostDao.listBlogsWithLimit(offset);
        List<BlogPost> activePosts = new ArrayList();
        
        for (BlogPost p : posts) {
            if(p.getStatus().toLowerCase().equals("published")){
                activePosts.add(p);
                
            }
        }

        List<StaticPage> staticPages = staticPageDao.listPagesByPosition();
        StaticPage staticPage = new StaticPage();

        List<Category> categories = categoriesDao.listCategories();

        List<HashTag> hash = hashTagDao.listHashTags();

        Integer numOfPosts = blogPostDao.getNumOfPostsPerPage();
        List<Integer> pages = getPages(numOfPosts);

        model.put("pages", pages);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        model.put("posts", activePosts);
        model.put("categories", categories);
        model.put("hashTag", hash);
        return "index";
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public String category(Map model) {

        List<Category> categories = categoriesDao.listCategories();

        model.put("categories", categories);

        Category category = new Category();

        model.put("category", category);

        return "category";
    }

    public Integer getOffset(Integer pageNumber) {
        Integer numOfPosts = 3; //how many posts we want to see on a page
        Integer offset = (pageNumber * numOfPosts) - numOfPosts;
        return offset;
    }

    @RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public User softDeleteUser(@PathVariable("id") Integer userId) {

        User user = userDao.get(userId);

        user.setEnabled(0);

        userDao.update(user);

        return user;

    }

    public void automaticallyPublishScheduledPosts() {
        Date date = new Date();

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();
        for (BlogPost pendingPost : pendingPosts) {
            if (pendingPost.getDateToPostOn().after(date)) {
                blogPostDao.publish(pendingPost);
            }
        }
    }

    public void automaticallyRemoveExpiredPosts() {
        Date date = new Date();

        List<BlogPost> allBlogPosts = blogPostDao.listBlogs();
        for (BlogPost post : allBlogPosts) {

            if(post.getExpireOn() != null){
 

            
            if (post.getExpireOn().before(date)) {

                blogPostDao.delete(post);
            }
            }
        }
    }

    @RequestMapping(value = "/setNumberOfPosts", method = RequestMethod.POST)
    public void setNumberOfPostsPerPage(Integer number) {
        blogPostDao.setNumOfPostsPerPage(number);
    }

    public List<Integer> getPages(Integer number) {
        Integer count = blogPostDao.getNumOfPosts();
        Integer numOfPages = (count / number);
        Integer remainder = (count % number);
        
        if (remainder > 0){
            numOfPages += remainder;
        }
        List<Integer> pages = new ArrayList();
        for (int i = 1; i <= numOfPages; i++) {
            pages.add(i);
        }

        return pages;
    }
}
