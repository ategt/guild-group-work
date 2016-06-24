/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.HashTag;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface HashTagInterface {
    
        public HashTag create(HashTag hashTag);
    public HashTag get(Integer id);
    public void update(HashTag hashTag);
    public void delete(HashTag hashTag);
    public List<HashTag> listHashTags();
    
}
