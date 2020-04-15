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
import sample.dtos.UserDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class UserDAO {

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

    public UserDTO checkLogin(String userID, String password) {
        UserDTO result = null;
        try {
            String sql = "SELECT UserID, UserName, Email, Address, Phone,RoleID FROM Users WHERE UserID=? AND Password=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("UserName");
                String roleID = rs.getString("RoleID");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                result = new UserDTO(userID, userName, email, phone, address, roleID);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> searchUserByName(String name) {
        List<UserDTO> result = null;
        try {
            String sql = "SELECT UserID, UserName, Email, Phone, Address, RoleID FROM Users WHERE UserName like ?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String userID = rs.getString("UserID");
                String userName = rs.getString("UserName");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String role = rs.getString("RoleID");
                UserDTO dto = new UserDTO(userID, userName, email, phone, address, role);
                result.add(dto);
            }

        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteUserByID(String userID) {
        boolean result = false;
        try {
            String sql = "DELETE Users WHERE UserID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertUser(UserDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO Users(UserID, Password, UserName, Email, Phone, Address, RoleID) "
                    + "VALUES(?,?,?,?,?,?,?)";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUserID());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getUserName());
            preStm.setString(4, dto.getEmail());
            preStm.setString(5, dto.getPhone());
            preStm.setString(6, dto.getAddress());
            preStm.setString(7, dto.getRoleID());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateUser(UserDTO dto) {
        boolean result = false;
        try {
            String sql = "UPDATE Users "
                    + "SET UserName=?, Password=?, Email=?, Address=?, Phone=?,RoleID=? "
                    + "WHERE UserID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUserName());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getEmail());
            preStm.setString(4, dto.getAddress());
            preStm.setString(5, dto.getPhone());
            preStm.setString(6, dto.getRoleID());
            preStm.setString(7, dto.getUserID());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean checkExists(String userID) {
        boolean result = false;
        try {
            String sql = "SELECT userID FROM Users WHERE UserID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getPasswordByEmail(String email) {
        String result = "";
        try {
            String sql = "SELECT Password FROM Users WHERE Email=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("Password");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getUserIDByEmail(String email) {
        String result = "";
        try {
            String sql = "SELECT UserID FROM Users WHERE Email=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("UserID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
