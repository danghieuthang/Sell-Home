/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.dtos.CitiesDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class CitiesDAO {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
        }
    }

    public List<CitiesDTO> getListCity() {

        List<CitiesDTO> result = null;
        try {
            String sql = "SELECT ID, Name FROM Cities";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result=new ArrayList<>();
            while (rs.next()) {
                String citiesID = rs.getString("ID");
                String name = rs.getString("Name");
                CitiesDTO dto=new CitiesDTO(citiesID, name);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isExists(String id) {
        boolean result = false;
        try {
            String sql = "SELECT * FROM Cities WHERE ID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs=preStm.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return result;
    }
    public String getCities(String id) {
        String result = null;
        try {
            String sql = "SELECT Name FROM Cities WHERE ID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs=preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("Name");
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return result;
    }
}
