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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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

        return "aboutUs";
    }
    

    
    @RequestMapping(value = "/blog/waitingApproval", method = RequestMethod.GET)
    public String postsWaitingApproval(Map model) {
        
//         Integer offset;
//        if (pageNumber == null) {
//            offset = 0;
//        } else {
//            offset = getOffset(pageNumber);
//        }
//        
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

        Integer offset;
        if (pageNumber == null) {
            offset = 0;
        } else {
            offset = getOffset(pageNumber);
        }
        List<BlogPost> posts = blogPostDao.listBlogsWithLimit(offset);

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

    @RequestMapping(value = "/showImage/{id}", produces = MediaType.IMAGE_PNG_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public Image getImage(@PathVariable Integer postId) throws MalformedURLException, IOException {

        BlogPost post = blogPostDao.getById(postId);

        Image image = post.getImage();

//            ByteArrayInputStream input = new ByteArrayInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();

//          File imgPath = new File();
        if (image != null) {
            post.setImage(image);
        } else {
            Image i = new Image();
            i.setId(postId);
            i.setUrl("http://vignette3.wikia.nocookie.net/lego/images/a/ac/No-Image-Basic.png/revision/latest?cb=20130819001030");
//                String imageString = i.toString();

            post.setImage(i);
            return i;
        }

        return image;
    }

//
//    @RequestMapping(value = "/home/{pageNumber}", method = RequestMethod.GET)
//    public String populateHomePage(@PathVariable("pageNumber") int pageNumber, Map model) {
//        Integer offset = 3; //hardcoding for second page, will figure out once i get it working
//        List<BlogPost> blogList = blogPostDao.listBlogsWithLimit(offset);
//
//        model.put("blogList", blogList);
//        return "home";
//    }
    public Integer getOffset(Integer pageNumber) {
        Integer numOfPosts = 3; //how many posts we want to see on a page
        Integer offset = (pageNumber * numOfPosts) - numOfPosts;
        return offset;
    }
}
