/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPages;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface StaticPagesInterface {
    
        public StaticPages create(StaticPages stat);
    public StaticPages get(Integer id);
    public void update(StaticPages stat);
    public void delete(StaticPages stat);
    public List<StaticPages> listBlogs();
    
}
