package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostInterface;
import com.mycompany.capstoneproject.DTO.BlogPost;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
        
    private BlogPostInterface blogPostDao;
    
    @Inject
    public HomeController(BlogPostInterface dao){
        this.blogPostDao = dao;
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home(Map model){
        List<BlogPost> posts = blogPostDao.listBlogs();
        
        model.put("posts", posts);
        return "home";
    }
}
