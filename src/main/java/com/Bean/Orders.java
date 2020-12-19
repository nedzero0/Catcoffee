package com.Bean;

public class Orders {
    private int id;
    private int orderUser;
    private int table_id;
    private String orderDate;
    private Double totalPrice;
    private int orderStatus;
    private String strStatus;

    //用户姓名
    private String name;
    //餐桌名字,不用了
    private String tableName;


    public String getStrStatus() {
        return strStatus;
    }

    public void setStrStatus(String strStatus) {
        this.strStatus = strStatus;
    }

    public Orders() {

    }

    public Orders(int id, int orderUser, int table_id, String orderDate, Double totalPrice, int orderStatus, String name, String tableName) {
        this.id = id;
        this.orderUser = orderUser;
        this.table_id = table_id;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
        this.name = name;
        this.tableName = tableName;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", orderUser=" + orderUser +
                ", table_id=" + table_id +
                ", orderDate='" + orderDate + '\'' +
                ", totalPrice=" + totalPrice +
                ", orderStatus=" + orderStatus +
                ", strStatus='" + strStatus + '\'' +
                ", name='" + name + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(int orderUser) {
        this.orderUser = orderUser;
    }

    public int getTable_id() {
        return table_id;
    }

    public void setTable_id(int table_id) {
        this.table_id = table_id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }
}
