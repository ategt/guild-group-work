/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.bll;

import com.mycompany.capstoneproject.DAO.ImageInterface;
import com.mycompany.capstoneproject.DTO.Image;
import com.mycompany.capstoneproject.FileController;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author apprentice
 */
public class ImageServicesImpl implements ImageServices {

    @Autowired
    ImageInterface imageDao;

    @Override
    public Image ajaxUploadFile(com.mycompany.capstoneproject.DTO.File uploadedFile, Model model) {
        String filePath;
        Image image = null;
        InputStream inputStream = null;
        try {
            MultipartFile multipartFile = uploadedFile.getFile();
            java.io.File imagesDirectory = new java.io.File("./uploadedImages");

            inputStream = multipartFile.getInputStream();

            java.io.File fileImagesDir = imagesDirectory;
            if (!fileImagesDir.exists()) {
                fileImagesDir.mkdir();
            }

            filePath = saveFileAsMostRecent(inputStream);

            image = addImageToDatabase(multipartFile);

            loadRecentInfoIntoModel(model, filePath, multipartFile);

            String savedPath = saveFileToFileSystem(fileImagesDir, multipartFile);
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

        return image;
    }

    @Override
    public Image addImageToDatabase(MultipartFile multipartFile) throws IOException {
        Image image = buildImageFromMultipartFile(multipartFile);

        return imageDao.create(image);
    }

    private Image buildImageFromMultipartFile(MultipartFile multipartFile) throws IOException {
        Image image = new Image();
        byte[] imageData = multipartFile.getBytes();
        String originalName = multipartFile.getOriginalFilename();
        String contentType = multipartFile.getContentType();
        Long fileSize = multipartFile.getSize();
        String multipartFileName = multipartFile.getName();
        determineHeightAndWidthOfImage(multipartFile, image);
        image.setImage(imageData);
        image.setContentType(contentType);
        image.setOriginalName(originalName);
        image.setDescription("This image was uploaded with ajax.");
        image.setSize(fileSize);
        return image;
    }

    private void determineHeightAndWidthOfImage(MultipartFile multipartFile, Image image) throws IOException {
        //BufferedImage bimg = ImageIO.read(new File(filename));
        BufferedImage bimg = ImageIO.read(multipartFile.getInputStream());

        int width = bimg.getWidth();
        int height = bimg.getHeight();

        image.setHeight(height);
        image.setWidth(width);
    }

    private void loadRecentInfoIntoModel(Model model, String filePath, MultipartFile multipartFile) {
        model.addAttribute("filePath", filePath);
        String originalName = multipartFile.getOriginalFilename();
        String contentType = multipartFile.getContentType();
        Long fileSize = multipartFile.getSize();
        String multipartFileName = multipartFile.getName();
        model.addAttribute("originalName", originalName);
        model.addAttribute("contentType", contentType);
        model.addAttribute("fileSize", fileSize);
        model.addAttribute("multipartFileName", multipartFileName);
        //return originalName;
    }
    
    public void loadRecentInfoIntoModel(Model model, Image image) {
        String originalName = image.getOriginalName();
        String contentType = image.getContentType();
        Long fileSize = image.getSize();
        model.addAttribute("originalName", originalName);
        model.addAttribute("contentType", contentType);
        model.addAttribute("fileSize", fileSize);
        //return originalName;
    }

    private String saveFileAsMostRecent(InputStream inputStream) throws IOException, FileNotFoundException {
        String filePath;
        java.io.File outputFile = new java.io.File("test.file");
        filePath = outputFile.getAbsolutePath();
        OutputStream outputStream = new FileOutputStream(outputFile);
        IOUtils.copy(inputStream, outputStream);
        return filePath;
    }

    private String saveFileToFileSystem(java.io.File fileImagesDir, MultipartFile multipartFile) throws IOException {
        String originalName = multipartFile.getOriginalFilename();

        java.io.File saveFile = null;
        if (fileImagesDir.isDirectory()) {
            saveFile = new java.io.File(fileImagesDir.getAbsolutePath() + "/" + originalName);
        }

        InputStream secondInputStream = multipartFile.getInputStream();
        IOUtils.copy(secondInputStream, new FileOutputStream(saveFile));
        String savedPath = saveFile.getAbsolutePath();
        //model.addAttribute("savedPath", savedPath);
        return savedPath;
    }

}
