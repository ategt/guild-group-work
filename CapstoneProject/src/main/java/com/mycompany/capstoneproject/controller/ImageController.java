/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.controller;

import com.mycompany.capstoneproject.DAO.BlogPostDBImpl;
import com.mycompany.capstoneproject.DAO.CategoriesInterface;
import com.mycompany.capstoneproject.DAO.ImageInterface;
import com.mycompany.capstoneproject.DTO.Category;
import com.mycompany.capstoneproject.DTO.File;
import com.mycompany.capstoneproject.DTO.Image;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author apprentice
 */
@Controller
@RequestMapping(value = "/image")
public class ImageController {

    private ImageInterface imageDao;

    @Inject
    public ImageController(ImageInterface imageDao) {
        this.imageDao = imageDao;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/showimage/{id}")
    @ResponseBody
    public void getImage(@PathVariable("id") Integer id, HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {

        Image image = imageDao.get(id);

        response.setContentLengthLong(image.getSize());
        response.setContentType(image.getContentType());

        response.getOutputStream().write(image.getImage());
        response.getOutputStream().close();

    }

    @RequestMapping(method = RequestMethod.GET, value = "/imagelist")
    @ResponseBody
    public List<Integer> getAllImages() {

        List<Image> images = imageDao.list();

        List<Integer> intList =  images.stream().map(Image::getId).collect(Collectors.toList());
        
        return intList;
    }

    
    
    
    
    @RequestMapping(method = RequestMethod.GET, value = "/imagetest")
    public String imagePickerTest(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList =  images.stream()
                .filter(a -> a != null)
                .filter(a -> a.getDescription() != null)
                .filter(a -> a.getDescription().toLowerCase().contains("ajax"))
                .map(Image::getId)
                .collect(Collectors.toList());
        
        model.put("imageIdList", imageIdList);
        
        return "pickerTest";
    }

    
    
    @RequestMapping(method = RequestMethod.GET, value = "/imagetestb")
    public String imagePickerTestB(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList =  images.stream()
                .filter(a -> a != null)
                .filter(a -> a.getDescription() != null)
                .filter(a -> a.getDescription().toLowerCase().contains("ajax"))
                .map(Image::getId)
                .collect(Collectors.toList());
        
        model.put("imageIdList", imageIdList);
        
        return "pickerTestB";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/imageadmin")
    public String imageAdmin(Map model) {

        List<Image> images = imageDao.list();

        List<Integer> imageIdList =  images.stream()
                .filter(a -> a != null)
                .filter(a -> a.getDescription() != null)
                .filter(a -> a.getDescription().toLowerCase().contains("ajax"))
                .map(Image::getId)
                .collect(Collectors.toList());
        
        model.put("imageIdList", imageIdList);
        
        return "imageAdmin";
    }
    
    
        
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") Integer contactId) {
        
        Image image = imageDao.get(contactId);
        
        imageDao.delete(image);
        
    }
    
    
    @RequestMapping(method = RequestMethod.POST, value = "/imageadmin")
    public String fileUploaded(Model model, @Validated File file,
            BindingResult result) {

        String filePath = "";

        String returnVal = "successFile";
        if (result.hasErrors()) {
            returnVal = "imageAdmin";
        } else {
            InputStream inputStream = null;
            try {
                MultipartFile multipartFile = file.getFile();
                //multipartFile.
                // IOUtils.copy(byteArrayInputStream, new FileOutputStream(outputFileName));

                inputStream = multipartFile.getInputStream();

                java.io.File fileImagesDir = new java.io.File("./uploadedImages");
                if (!fileImagesDir.exists()) {
                    fileImagesDir.mkdir();
                }

                java.io.File outputFile = new java.io.File("test.file");
                filePath = outputFile.getAbsolutePath();
                OutputStream outputStream = new FileOutputStream(outputFile);
                IOUtils.copy(inputStream, outputStream);
                model.addAttribute("filePath", filePath);

                String originalName = multipartFile.getOriginalFilename();
                String contentType = multipartFile.getContentType();
                Long fileSize = multipartFile.getSize();
                String multipartFileName = multipartFile.getName();

                model.addAttribute("originalName", originalName);
                model.addAttribute("contentType", contentType);
                model.addAttribute("fileSize", fileSize);
                model.addAttribute("multipartFileName", multipartFileName);

                java.io.File saveFile = null;
                if (fileImagesDir.isDirectory()) {
                    saveFile = new java.io.File(fileImagesDir.getAbsolutePath() + "/" + originalName);
                }

                InputStream secondInputStream = multipartFile.getInputStream();
                IOUtils.copy(secondInputStream, new FileOutputStream(saveFile));
                String savedPath = saveFile.getAbsolutePath();
                model.addAttribute("savedPath", savedPath);

            } catch (IOException ex) {
                Logger.getLogger(FileController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    inputStream.close();
                } catch (IOException ex) {
                    Logger.getLogger(FileController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return returnVal;
    }

//    @RequestMapping(method = RequestMethod.DELETE, value = "/")
//    @ResponseBody
//    public String imageDelete(@RequestBody()  , Map model) {
//
//        List<Image> images = imageDao.list();
//
//        List<Integer> imageIdList =  images.stream()
//                .filter(a -> a != null)
//                .filter(a -> a.getDescription() != null)
//                .filter(a -> a.getDescription().toLowerCase().contains("ajax"))
//                .map(Image::getId)
//                .collect(Collectors.toList());
//        
//        model.put("imageIdList", imageIdList);
//        
//        return "imagesAdmin";
//    }
    
}
