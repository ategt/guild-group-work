/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DTO;

/**
 *
 * @author apprentice
 */
public class StaticPage {

    private int id;
    private String title;
    private int image_id;
    private String content;
    private int tab_position;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTab_position() {
        return tab_position;
    }

    public void setTab_position(int tab_position) {
        this.tab_position = tab_position;
    }

}
