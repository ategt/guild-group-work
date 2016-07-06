/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.bll;

import com.mycompany.capstoneproject.DTO.File;
import com.mycompany.capstoneproject.DTO.Image;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author apprentice
 */
public interface ImageServices {

    Image addImageToDatabase(MultipartFile multipartFile) throws IOException;

    Image ajaxUploadFile(File uploadedFile, Model model);

    void loadRecentInfoIntoModel(Model model, Image image);

    List<Integer> filterTestFiles(List<Image> images);
    
    public void loadImageIdsIntoModel(Map model);

}
