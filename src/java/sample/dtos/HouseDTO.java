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
public class HouseDTO {

    private String houseID;
    private float price;
    private String title;
    private float area;
    private String citiesID;
    private String timePost;
    private String content;
    private int bedroom;
    private int bathroom;
    private String picture;
    private boolean state;
    private String catagories;

    public HouseDTO() {
    }

    public HouseDTO(String houseID, float price, String title, float area, String citiesID, String timePost, String content, int bedroom, int bathroom, String picture) {
        this.houseID = houseID;
        this.price = price;
        this.title = title;
        this.area = area;
        this.citiesID = citiesID;
        this.timePost = timePost;
        this.content = content;
        this.bedroom = bedroom;
        this.bathroom = bathroom;
        this.picture = picture;
    }

    public HouseDTO(String houseID, float price, String title, float area, String citiesID, String timePost, String content, int bedroom, int bathroom, String picture, boolean state) {
        this.houseID = houseID;
        this.price = price;
        this.title = title;
        this.area = area;
        this.citiesID = citiesID;
        this.timePost = timePost;
        this.content = content;
        this.bedroom = bedroom;
        this.bathroom = bathroom;
        this.picture = picture;
        this.state = state;
      
    }
     public HouseDTO(String houseID, float price, String title, float area, String citiesID, String timePost, String content, int bedroom, int bathroom, String picture, boolean state, String catagories) {
        this.houseID = houseID;
        this.price = price;
        this.title = title;
        this.area = area;
        this.citiesID = citiesID;
        this.timePost = timePost;
        this.content = content;
        this.bedroom = bedroom;
        this.bathroom = bathroom;
        this.picture = picture;
        this.state = state;
        this.catagories=catagories;
    }

    public HouseDTO(String houseID, float price, String title, float area, String citiesID, String content, int bedroom, int bathroom, String picture, boolean state, String catagories) {
        this.houseID = houseID;
        this.price = price;
        this.title = title;
        this.area = area;
        this.citiesID = citiesID;
        this.content = content;
        this.bedroom = bedroom;
        this.bathroom = bathroom;
        this.picture = picture;
        this.state = state;
        this.catagories = catagories;
    }

    public String getHouseID() {
        return houseID;
    }

    public void setHouseID(String houseID) {
        this.houseID = houseID;
    }

    public float getPrice() {
        return price;
    }

    public String getCatagories() {
        return catagories;
    }

    public void setCatagories(String catagories) {
        this.catagories = catagories;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public String getCitiesID() {
        return citiesID;
    }

    public void setCitiesID(String citiesID) {
        this.citiesID = citiesID;
    }

    public String getTimePost() {
        return timePost;
    }

    public void setTimePost(String timePost) {
        this.timePost = timePost;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getBedroom() {
        return bedroom;
    }

    public void setBedroom(int bedroom) {
        this.bedroom = bedroom;
    }

    public int getBathroom() {
        return bathroom;
    }

    public void setBathroom(int bathroom) {
        this.bathroom = bathroom;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

}
