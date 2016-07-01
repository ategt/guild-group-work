/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.Image;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface ImageInterface {

    public Image create(Image image);

    public Image get(int id);

    public void update(Image image);

    public void delete(Image image);

    public List<Image> list();

    public Image getDefaultThumb();
    
    public void setDefaultThumb(Image image);

}
