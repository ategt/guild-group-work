/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.StaticPage;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface StaticPageInterface {
    
    public StaticPage create(StaticPage stat);
    public StaticPage get(Integer id);
    public StaticPage getByTitle(String title);
    public void update(StaticPage stat);
    public void delete(StaticPage stat);
    public List<StaticPage> listPages();
    
}
