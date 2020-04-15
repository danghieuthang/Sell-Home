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
import sample.dtos.OrderDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class OrdersDAO {

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

    public List<OrderDTO> getListOrderByUserID(String userID) {
        List<OrderDTO> result = null;
        try {
            String sql = "SELECT OrderID, UserID, Time, Total FROM Orders WHERE UserID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String orderID = rs.getString("OrderID");
                String time = rs.getString("Time");
                float total = rs.getFloat("Total");
                OrderDTO dto = new OrderDTO(orderID, userID, time, total);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertOrder(OrderDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO Orders(OrderID, UserID, Time, Total)"
                    + " VALUES(?,?,?,?)";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getOrderID());
            preStm.setString(2, dto.getUserID());
            preStm.setString(3, dto.getTime());
            preStm.setFloat(4, dto.getTotal());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public int sizeOfOrder() {
        int result = 0;
        try {
            String sql = "SELECT count(OrderID) as size "
                    + "FROM Orders";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("size");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
