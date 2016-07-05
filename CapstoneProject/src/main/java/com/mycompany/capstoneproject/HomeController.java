package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.HashTagInterface;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.HashTag;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.DTO.StaticPage;
import com.mycompany.capstoneproject.DTO.User;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.springframework.http.MediaType;
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

    @Inject
    public HomeController(BlogPostInterface BPDao, CategoriesInterface CDao, StaticPageInterface SPDao, UserInterface UDao, HashTagInterface HDao) {
        this.blogPostDao = BPDao;
        this.categoriesDao = CDao;
        this.hashTagDao = HDao;
        this.staticPageDao = SPDao;
        this.userDao = UDao;
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

    @RequestMapping(value = "/adminPanel", method = RequestMethod.GET)
    public String adminPanel(Map model) {

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

        return "adminPanel";
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

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Map model, @RequestParam(value = "page", required = false) Integer pageNumber) {

        automaticallyPublishScheduledPosts();
        automaticallyRemoveExpiredPosts();

        Integer offset;
        if (pageNumber == null) {
            offset = 0;
        } else {
            offset = getOffset(pageNumber);
        }
        List<BlogPost> posts = blogPostDao.listBlogsWithLimit(offset);

        List<StaticPage> staticPages = staticPageDao.listPagesByPosition();
        StaticPage staticPage = new StaticPage();

        List<Category> categories = categoriesDao.listCategories();

        List<HashTag> hash = hashTagDao.listHashTags();

        Integer numOfPosts = blogPostDao.getNumOfPostsPerPage();
        List<Integer> pages = getPages(numOfPosts);

        model.put("pages", pages);
        model.put("staticPage", staticPage);
        model.put("staticPages", staticPages);
        model.put("posts", posts);
        model.put("categories", categories);
        model.put("hashTag", hash);
        return "home";
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
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = format.format(date);

        List<BlogPost> pendingPosts = blogPostDao.listPendingPosts();
        for (BlogPost pendingPost : pendingPosts) {
            String pendingPostDate = format.format(pendingPost.getDateToPostOn());
            if (pendingPostDate.equals(currentDay)) {
                blogPostDao.publish(pendingPost);
            }
        }
    }

    public void automaticallyRemoveExpiredPosts() {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = format.format(date);

        List<BlogPost> allBlogPosts = blogPostDao.listBlogs();
        for (BlogPost post : allBlogPosts) {
            String postExpiresOn = format.format(post.getExpireOn());
            if (postExpiresOn.equals(currentDay)) {
                blogPostDao.delete(post);
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
        List<Integer> pages = new ArrayList();
        for (int i = 1; i <= numOfPages; i++) {
            pages.add(i);
        }

        return pages;
    }
}
