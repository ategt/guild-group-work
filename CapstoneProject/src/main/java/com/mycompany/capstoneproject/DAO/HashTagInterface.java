/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.BlogPost;
import com.mycompany.capstoneproject.DTO.HashTag;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface HashTagInterface {

    public HashTag create(HashTag hashTag);
    
    public void updateHashTagPostTable(HashTag hashtag, BlogPost post);

    public HashTag get(String name);

    public void update(HashTag hashTag);

    public void delete(HashTag hashTag);

    public List<BlogPost> listBlogs(HashTag hashTag);

    public List<HashTag> listHashTags();

    public List<String> findHashTags(String content);
    
    public void incrementNumOfUses(HashTag hashtag);

}
