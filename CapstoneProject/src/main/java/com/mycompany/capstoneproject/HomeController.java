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

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Map model) {
        List<BlogPost> posts = blogPostDao.listBlogsWithLimit(3);
        
        List<StaticPage> staticPages = staticPageDao.listPages();
        StaticPage staticPage = new StaticPage();
        
        List<Category> categories = categoriesDao.listCategories();
        
        List<HashTag> hash = hashTagDao.listHashTags();
        
        Integer count = blogPostDao.getNumOfPosts();
        Integer numOfPages = (count/3);
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

        return "home";
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public String category(Map model) {

        List<Category> categories = categoriesDao.listCategories();

        model.put("categories", categories);

        Category category = new Category();

        model.put("category", category);

        return "category";
    }
    
    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public String aboutUs(Map model) {

      

        return "aboutUs";
    }
    
    @RequestMapping(value="/home/{pageNumber}", method=RequestMethod.GET)
    public List<BlogPost> populateHomePage(@PathVariable("pageNumber") int pageNumber){
        return blogPostDao.listBlogsWithLimit(pageNumber);
    }

}
