/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.capstoneproject.DAO;

import com.mycompany.capstoneproject.DTO.Image;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class ImageDAODBImpl implements ImageInterface {

    private static final String SQL_INSERT_IMAGE = "INSERT INTO image (url, image, original_name, width, height, description, content_type, image_size) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SQL_UPDATE_IMAGE = "UPDATE image SET url = ?, image = ?, original_name = ?, width = ?, height = ?, description = ?, content_type = ? , image_size = ?  WHERE id = ?";
    private static final String SQL_GET_IMAGE_BY_ID = "SELECT * FROM image WHERE id = ?";
    private static final String SQL_DELETE_IMAGE_BY_ID = "DELETE FROM image WHERE id =?";
    private static final String SQL_GET_IMAGE_LIST = "SELECT * FROM image";
    //private static final String SQL_GET_IMAGE_THUMB_DEFAULT = "SELECT default_thumb FROM image_preferences ORDER BY id ASC LIMIT 1";
    private static final String SQL_GET_IMAGE_THUMB_DEFAULT = "SELECT image.* FROM image\n"
            + "JOIN image_preferences\n"
            + "ON image_preferences.default_thumb=image.id\n"
            + "ORDER BY image_preferences.id ASC LIMIT 1;";

    private static final String SQL_CREATE_IMAGE_THUMB_DEFAULT = "INSERT INTO image_preferences (default_thumb) VALUES (?)";
    private static final String SQL_UPDATE_IMAGE_THUMB_DEFAULT = "UPDATE image_preferences SET default_thumb = ? WHERE id = ?;";
    private static final String SQL_GET_IMAGE_DEFAULT_ID = "SELECT id FROM image_preferences\n"
            + "ORDER BY image_preferences.id ASC LIMIT 1;";

    private JdbcTemplate jdbcTemplate;

    public ImageDAODBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Image create(Image image) {

        if (image == null) {
            return null;
        }

        jdbcTemplate.update(SQL_INSERT_IMAGE,
                image.getUrl(),
                image.getImage(),
                image.getOriginalName(),
                image.getWidth(),
                image.getHeight(),
                image.getDescription(),
                image.getContentType(),
                image.getSize());

        Integer id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);  //gets next unique id

        image.setId(id);

        return image;

    }

    @Override
    public Image get(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_IMAGE_BY_ID, new ImageMapper(), id);
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public Image getDefaultThumb() {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_IMAGE_THUMB_DEFAULT, new ImageMapper());
        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void setDefaultThumb(Image image) {

        if (image == null) {
            return;
        }

        try {
            Integer id = jdbcTemplate.queryForObject(SQL_GET_IMAGE_DEFAULT_ID, Integer.class);
            jdbcTemplate.update(SQL_UPDATE_IMAGE_THUMB_DEFAULT,
                    image.getId(),
                    id);

        } catch (org.springframework.dao.EmptyResultDataAccessException ex) {
            jdbcTemplate.update(SQL_CREATE_IMAGE_THUMB_DEFAULT,
                    image.getId());
        }

    }

    @Override
    public void update(Image image) {

        if (image == null) {
            return;
        }

        jdbcTemplate.update(SQL_UPDATE_IMAGE,
                image.getUrl(),
                image.getImage(),
                image.getOriginalName(),
                image.getWidth(),
                image.getHeight(),
                image.getDescription(),
                image.getContentType(),
                image.getSize(),
                image.getId());

    }

    @Override
    public void delete(Image image) {
        if (image == null) {
            return;
        }

        jdbcTemplate.update(SQL_DELETE_IMAGE_BY_ID, image.getId());
    }

    @Override
    public List<Image> list() {
        return jdbcTemplate.query(SQL_GET_IMAGE_LIST, new ImageMapper());
    }

    private static final class ImageMapper implements RowMapper<Image> {

        @Override
        public Image mapRow(ResultSet rs, int i) throws SQLException {

            Image image = new Image();

            image.setId(rs.getInt("id"));

            image.setUrl(rs.getString("url"));
            image.setImage(rs.getBytes("image"));
            image.setOriginalName(rs.getString("original_name"));
            image.setWidth(rs.getInt("width"));
            image.setHeight(rs.getInt("height"));
            image.setDescription(rs.getString("description"));
            image.setContentType(rs.getString("content_type"));
            image.setSize(rs.getLong("image_size"));

            return image;
        }

    }

}
