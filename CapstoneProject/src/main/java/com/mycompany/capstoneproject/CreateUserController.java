/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.UserInterface;
import com.mycompany.capstoneproject.DTO.User;
import com.mycompany.capstoneproject.DTO.User;
import java.util.Map;
import javax.inject.Inject;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value = "/createUser")
public class CreateUserController {

    private UserInterface createUserDAO;


    @Inject
    public CreateUserController(UserInterface dao) {
        this.createUserDAO = dao;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public User create(@Valid @RequestBody User createUser) {

        return createUserDAO.create(createUser);

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") Integer createUserId) {

        User user = createUserDAO.get(createUserId);

        createUserDAO.delete(user);

    }

    @RequestMapping(value = "/editUser/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer createUserId, Map model) {

        User createUser = createUserDAO.get(createUserId);

        model.put("createUser", createUser);

        return "editUser";
    }
}

