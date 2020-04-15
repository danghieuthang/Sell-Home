/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

/**
 *
 * @author dhtha
 */
public class House_OrderDTO {
    private String orderID;
    private String houseID;
    private HouseDTO house;
    public House_OrderDTO() {
    }

    public House_OrderDTO(String orderID, String houseID) {
        this.orderID = orderID;
        this.houseID = houseID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getHouseID() {
        return houseID;
    }

    public void setHouseID(String houseID) {
        this.houseID = houseID;
    }

    public HouseDTO getHouse() {
        return house;
    }

    public void setHouse(HouseDTO house) {
        this.house = house;
    }
    
    
    
}
