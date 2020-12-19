package com.Bean;

public class Food {
    private int id;
    private String foodName;
    private int foodType_id;
    private Double price;
    private String remark;
    private int popularity;
    private int comment;
    private String img;

    private String typeName;

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Food() {

    }

    public Food(int id, String foodName, int foodType_id, Double price, String remark, int popularity, int comment, String img, String typeName) {
        this.id = id;
        this.foodName = foodName;
        this.foodType_id = foodType_id;
        this.price = price;
        this.remark = remark;
        this.popularity = popularity;
        this.comment = comment;
        this.img = img;
        this.typeName = typeName;
    }

    public Food(String foodName, int foodType_id, Double price) {
        this.foodName = foodName;
        this.foodType_id = foodType_id;
        this.price = price;
    }

    public Food(String foodName, int foodType_id, Double price, String remark, int popularity, int comment, String img) {
        this.foodName = foodName;
        this.foodType_id = foodType_id;
        this.price = price;
        this.remark = remark;
        this.popularity = popularity;
        this.comment = comment;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public int getFoodType_id() {
        return foodType_id;
    }

    public void setFoodType_id(int foodType_id) {
        this.foodType_id = foodType_id;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getPopularity() {
        return popularity;
    }

    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", foodName='" + foodName + '\'' +
                ", foodType_id=" + foodType_id +
                ", price=" + price +
                ", remark='" + remark + '\'' +
                ", popularity=" + popularity +
                ", comment=" + comment +
                ", img='" + img + '\'' +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
