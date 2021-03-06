/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DTO.User;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author apprentice
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(name = "login_error", required = false) Integer loginError, Map model) {

        model.put("loginError", loginError);

        return "login";
    }

    @RequestMapping(value = "/createAccount", method = RequestMethod.GET)
    public String createAccount(Map model) {
        User user = new User();
        model.put("user", user);
        return "createAccount";
    }

}
