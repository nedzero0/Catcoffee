package com.Bean;

import java.util.Date;

public class Dinnertable {
    private int id;
    private String tableName;
    private int tableStatus;
    private String orderDate;

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Dinnertable() {

    }

    public Dinnertable(int id, int tableStatus) {
        this.id = id;
        this.tableStatus = tableStatus;
    }

    public Dinnertable(int id, int tableStatus, String orderDate) {
        this.id = id;
        this.tableStatus = tableStatus;
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Dinnertable{" +
                "id=" + id +
                ", tableName='" + tableName + '\'' +
                ", tableStatus=" + tableStatus +
                ", orderDate='" + orderDate + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getTableStatus() {
        return tableStatus;
    }

    public void setTableStatus(int tableStatus) {
        this.tableStatus = tableStatus;
    }


}
