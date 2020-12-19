package com.Bean;

public class User {
    private int id;
    private String account;
    private String name;
    private String password;
    private String phone;
    private String sex;
    private String age;
    private String address;
    private String img;

    public User(String account, String name, String password, String phone, String sex, String age, String address, String img) {
        this.account = account;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.address = address;
        this.img = img;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User() {

    }

    public User(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public User(int id, String account, String name, String password) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.password = password;
    }

    public User(String account, String name, String password) {
        this.account = account;
        this.name = name;
        this.password = password;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", address='" + address + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
