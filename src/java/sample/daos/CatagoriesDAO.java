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
import sample.dtos.CatagoriesDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class CatagoriesDAO {

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

    public List<CatagoriesDTO> getListCatagories() {
        List<CatagoriesDTO> result = null;
        try {
            String sql = "SELECT Name From Catagories";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String name = rs.getString("Name");
                CatagoriesDTO dto = new CatagoriesDTO(name);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean isExists(String name) {
        boolean result = false;
        try {
            String sql = "SELECT Name From Catagories WHERE Name =?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, name);
            rs = preStm.executeQuery();

            if (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
