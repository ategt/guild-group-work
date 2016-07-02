/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DTO;

import java.util.Date;

/**
 *
 * @author apprentice
 */
public class BlogPostCommand {

    private int categoryId;
    private String title;
    private String content;
    private int authorId;
    private int id;
    private int thumbId;
    private Date date;

    public Date getPublishOn() {
        return date;
    }

    public void setPublishOn(Date publishOn) {
        this.date = publishOn;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the thumbId
     */
    public int getThumbId() {
        return thumbId;
    }

    /**
     * @param thumbId the thumbId to set
     */
    public void setThumbId(int thumbId) {
        this.thumbId = thumbId;
    }

}
