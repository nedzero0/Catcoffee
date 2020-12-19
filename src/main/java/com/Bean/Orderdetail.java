package com.Bean;

//订单详情  每一列的
public class Orderdetail {
    private int id;
    private int orderID;
    private int food_id;
    private int foodCount;
    private String foodName;
    private Double totalPrice;


    public Orderdetail(int orderID, int food_id, int foodCount, String foodName, Double totalPrice) {
        this.orderID = orderID;
        this.food_id = food_id;
        this.foodCount = foodCount;
        this.foodName = foodName;
        this.totalPrice = totalPrice;
    }

    public Orderdetail(int id, int orderID, int food_id, int foodCount, String foodName, Double totalPrice) {
        this.id = id;
        this.orderID = orderID;
        this.food_id = food_id;
        this.foodCount = foodCount;
        this.foodName = foodName;
        this.totalPrice = totalPrice;
    }

    public Orderdetail() {
    }

    @Override
    public String toString() {
        return "Orderdetail{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", food_id=" + food_id +
                ", foodCount=" + foodCount +
                ", foodName='" + foodName + '\'' +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public int getFoodCount() {
        return foodCount;
    }

    public void setFoodCount(int foodCount) {
        this.foodCount = foodCount;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
