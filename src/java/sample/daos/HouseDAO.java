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
import java.util.Calendar;
import java.util.List;
import sample.dtos.HouseDTO;
import sample.utils.DBUtil;

/**
 *
 * @author dhtha
 */
public class HouseDAO {

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

    public boolean isExists(String id) {
        boolean result = false;
        try {
            String sql = "SELECT *"
                    + "  FROM House WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
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

    public HouseDTO getHouseByHouseID(String id) {
        HouseDTO result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID, Catagories, TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String citiesID = rs.getString("CitiesID");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                String catagories = rs.getString("Catagories");
                result = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state, catagories);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> getAllHouse() {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID, Catagories, TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String citiesID = rs.getString("CitiesID");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                String catagories = rs.getString("Catagories");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state, catagories);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> searchByTitleAndState(String title, String stateS) {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID, Catagories, TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE Title LIKE ? AND State LIKE ?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + title + "%");
            preStm.setString(2, "%" + stateS + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String citiesID = rs.getString("CitiesID");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                String catagories = rs.getString("Catagories");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state, catagories);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> getAllHouseAlready() {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID, Catagories, TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE State=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String citiesID = rs.getString("CitiesID");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                String catagories = rs.getString("Catagories");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state, catagories);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> search(String keyword, String citiesID, String catagories, String bedroomS, String bathroomS) {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID ,TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE (Title like ? OR Content like ?) AND"
                    + " CitiesID like ? AND Catagories like ? "
                    + "AND Bedroom like ? AND Bathroom like ? AND State=?";

            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + keyword + "%");
            preStm.setString(2, "%" + keyword + "%");
            preStm.setString(3, "%" + citiesID + "%");
            preStm.setString(4, "%" + catagories + "%");
            preStm.setString(5, "%" + bedroomS + "%");
            preStm.setString(6, "%" + bathroomS + "%");
            preStm.setBoolean(7, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");

                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> searchAllGreaterThan5(String keyword, String citiesID, String catagories, String bedroomS, String bathroomS) {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID ,TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE (Title like ? OR Content like ?) AND"
                    + " CitiesID like ? AND Catagories like ? "
                    + "AND Bedroom >=? AND Bathroom >=? AND State=?";

            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + keyword + "%");
            preStm.setString(2, "%" + keyword + "%");
            preStm.setString(3, "%" + citiesID + "%");
            preStm.setString(4, "%" + catagories + "%");

            preStm.setInt(5, 5);
            preStm.setInt(6, 5);
            preStm.setBoolean(7, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");

                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> searchBedGreaterThan5(String keyword, String citiesID, String catagories, String bedroomS, String bathroomS) {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID ,TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE (Title like ? OR Content like ?) AND"
                    + " CitiesID like ? AND Catagories like ? "
                    + "AND Bedroom >=? AND Bathroom like ? AND State=?";

            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + keyword + "%");
            preStm.setString(2, "%" + keyword + "%");
            preStm.setString(3, "%" + citiesID + "%");
            preStm.setString(4, "%" + catagories + "%");

            preStm.setInt(5, 5);
            preStm.setString(6, "%" + bathroomS + "%");
            preStm.setBoolean(7, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");

                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<HouseDTO> searchBathGreaterThan5(String keyword, String citiesID, String catagories, String bedroomS, String bathroomS) {
        List<HouseDTO> result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID ,TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE (Title like ? OR Content like ?) AND"
                    + " CitiesID like ? AND Catagories like ? "
                    + "AND Bedroom like ? AND Bathroom >=? AND State=?";

            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + keyword + "%");
            preStm.setString(2, "%" + keyword + "%");
            preStm.setString(3, "%" + citiesID + "%");
            preStm.setString(4, "%" + catagories + "%");
            preStm.setString(5, "%" + bedroomS + "%");
            preStm.setInt(6, 5);
            preStm.setBoolean(7, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state);
                result.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public HouseDTO getHouseByID(String id) {
        HouseDTO result = null;
        try {
            String sql = "SELECT HouseID,Price,Title,Area,CitiesID ,TimePost "
                    + ",Content ,Bedroom ,Bathroom ,Picture, State"
                    + "  FROM House WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();

            if (rs.next()) {
                String houseID = rs.getString("HouseID");
                float price = rs.getFloat("Price");
                String title = rs.getString("Title");
                float area = rs.getFloat("Area");
                String citiesID = rs.getString("CitiesID");
                String timePost = rs.getString("TimePost");
                String content = rs.getString("Content");
                int bedroom = rs.getInt("Bedroom");
                int bathroom = rs.getInt("Bathroom");
                String picture = rs.getString("Picture");
                boolean state = rs.getBoolean("State");
                result = new HouseDTO(houseID, price, title, area, citiesID, timePost, content, bedroom, bathroom, picture, state);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertHouse(HouseDTO dto) {
        boolean result = false;
        try {
            String sql = "INSERT INTO "
                    + "House(HouseID, Title, Price, Picture, Content, Bedroom, Bathroom, TimePost, State, Area, CitiesID, Catagories) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getHouseID());
            preStm.setString(2, dto.getTitle());
            preStm.setFloat(3, dto.getPrice());
            preStm.setString(4, dto.getPicture());
            preStm.setString(5, dto.getContent());
            preStm.setInt(6, dto.getBedroom());
            preStm.setInt(7, dto.getBathroom());
            Calendar cal = Calendar.getInstance();
            String time = cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR);
            preStm.setString(8, time);
            preStm.setBoolean(9, dto.isState());
            preStm.setFloat(10, dto.getArea());
            preStm.setString(11, dto.getCitiesID());
            preStm.setString(12, dto.getCatagories());
            result = preStm.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateHouse(HouseDTO dto) {
        boolean result = false;
        try {
            String sql = "UPDATE House "
                    + "SET Title=?, Price=?, Picture=?, Content=?, Bedroom=?, "
                    + "Bathroom=?, TimePost=?, State=?, Area=?, CitiesID=?, Catagories=? "
                    + "WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(12, dto.getHouseID());
            preStm.setString(1, dto.getTitle());
            preStm.setFloat(2, dto.getPrice());
            preStm.setString(3, dto.getPicture());
            preStm.setString(4, dto.getContent());
            preStm.setInt(5, dto.getBedroom());
            preStm.setInt(6, dto.getBathroom());
            Calendar cal = Calendar.getInstance();
            String time = cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR);
            preStm.setString(7, time);
            preStm.setBoolean(8, dto.isState());
            preStm.setFloat(9, dto.getArea());
            preStm.setString(10, dto.getCitiesID());
            preStm.setString(11, dto.getCatagories());
            result = preStm.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteHosueByID(String houseID) {
        boolean result = false;
        try {
            String sql = "DELETE FROM House WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, houseID);
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public void buyHouseByHouseID(String houseID) {
        try {
            String sql = "Update House SET State=? WHERE HouseID=?";
            conn = DBUtil.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, false);
            preStm.setString(2, houseID);
            preStm.executeUpdate();
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
    }
}
