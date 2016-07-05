/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject;

import com.mycompany.capstoneproject.DAO.BlogPostDBImpl;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DTO.Category;
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
@RequestMapping(value = "/category")
public class CategoriesController {

    private CategoriesInterface categoryDAO;
    private Category category;

    @Inject
    public CategoriesController(CategoriesInterface dao) {
        this.categoryDAO = dao;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public Category create(@Valid @RequestBody Category category) {

        return categoryDAO.create(category);

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") Integer categoryId) {

        Category category = categoryDAO.get(categoryId);

        categoryDAO.delete(category);

    }

    @RequestMapping(value = "/editCategory/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer categoryId, Map model) {

        Category category = categoryDAO.get(categoryId);

        model.put("category", category);

        return "editCategory";
    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    @ResponseBody
    public Category editSubmit(@Valid @RequestBody Category category) {

        categoryDAO.update(category);

        return category;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Category show(@PathVariable("id") Integer categoryId) {

        Category category = categoryDAO.get(categoryId);

        return category;
    }

}
