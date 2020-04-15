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
import sample.dtos.House_OrderDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class House_OrderDAO {

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

    public boolean insert(House_OrderDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO House_Order(OrderID, HouseID) "
                    + "VALUES(?,?)";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getOrderID());
            preStm.setString(2, dto.getHouseID());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<House_OrderDTO> getHouseOrderByOrderID(String orderID) {
        List<House_OrderDTO> result=null;
        try {
            String sql="SELECT OrderID, HouseID FROM House_Order WHERE OrderID=?";
            conn=DBUtil.getConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs=preStm.executeQuery();
            result=new ArrayList<>();
            while(rs.next()){
                String houseID=rs.getString("HouseID");
                House_OrderDTO dto=new House_OrderDTO(orderID, houseID);
                result.add(dto);
            }
        } catch (Exception e) {
        }finally{
            closeConnection();
        }
        return result;
    }
}
