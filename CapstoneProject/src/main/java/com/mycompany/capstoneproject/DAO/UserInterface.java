/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.User;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface UserInterface {
    
    public User create(User user);
    public User get(int id);
    public void update(User user);
    public void delete(User user);
    public List<User> list();
    
}
