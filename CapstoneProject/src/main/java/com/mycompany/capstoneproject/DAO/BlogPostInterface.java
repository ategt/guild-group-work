/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.HashTag;
import java.util.Date;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface BlogPostInterface {

    public BlogPost create(BlogPost post);

    public BlogPost getById(Integer id);

    public BlogPost getBySlug(String slug);

    public void update(BlogPost post);

    public void delete(BlogPost post);

    public List<BlogPost> listBlogs();

    public List<BlogPost> listBlogs(Date date);

    public List<BlogPost> listBlogsWithLimit(int pageNumber);

    public Integer getNumOfPosts();

    public List<BlogPost> listPendingPosts();

    public List<String> listSlugs();

    public BlogPost publish(BlogPost post);

    public void setNumOfPostsPerPage(Integer number);

    public Integer getNumOfPostsPerPage();

}
