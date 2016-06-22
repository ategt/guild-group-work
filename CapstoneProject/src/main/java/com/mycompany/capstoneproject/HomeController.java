package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.CategoryDAODBImpl;
import com.mycompany.capstoneproject.DAO.HashTagInterface;
import com.mycompany.capstoneproject.DAO.StaticPageInterface;
import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    private BlogPostInterface blogPostDao;
    private CategoriesInterface categoriesDao;
    private HashTagInterface hashTagDao;
    private StaticPageInterface staticPageDao;
    private UserInterface userDao;

    @Inject
    public HomeController(BlogPostInterface BPDao, CategoriesInterface CDao, HashTagInterface HTDao, StaticPageInterface SPDao, UserInterface UDao) {
        this.blogPostDao = BPDao;
        this.categoriesDao = CDao;
        this.hashTagDao = HTDao;
        this.staticPageDao = SPDao;
        this.userDao = UDao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Map model) {
        List<BlogPost> posts = blogPostDao.listBlogs();

        model.put("posts", posts);
        return "home";
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public String category(Map model) {

        List<Category> cat = categoriesDao.listCategories();

        model.put("categories", cat);

        Category category = new Category();

        model.put("category", category);

        return "category";
    }

}
