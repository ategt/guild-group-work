/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DTO;

import java.util.Date;
import java.util.List;

/**
 *
 * @author apprentice
 */
public class BlogPost {

    private int id;
    private String slug;
    private Category category;
    private List<Comment> comments;
    private String title;
    private String content;
    private User author;
    private Image image;
    private List<HashTag> hashTag;
    private Date postedOn;
    private Date expireOn;
    private Date dateToPostOn;
    private String status;
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
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

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public List<HashTag> getHashTag() {
        return hashTag;
    }

    public void setHashTag(List<HashTag> hashTag) {
        this.hashTag = hashTag;
    }

    public Date getPostedOn() {
        return postedOn;
    }

    public void setPostedOn(Date postedOn) {
        this.postedOn = postedOn;
    }

    public Date getExpireOn() {
        return expireOn;
    }

    public void setExpireOn(Date expireOn) {
        this.expireOn = expireOn;
    }

    public Date getDateToPostOn() {
        return dateToPostOn;
    }

    public void setDateToPostOn(Date dateToPostOn) {
        this.dateToPostOn = dateToPostOn;
    }
}
