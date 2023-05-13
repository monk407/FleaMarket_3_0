package com.endless.pojo;

import java.util.List;

public class User {
    private int id;//用户id
    private String username;//用户名
    private String email;//用户邮箱
    private String password;//用户密码
    private String name;//用户姓名
    private String phone;//用户电话
    private String address;//用户地址
    private boolean isadmin=false;//是否为管理员，普通用户为false，管理员为true，数据库user表中普通用户为0，管理员为1
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + ", name="
                + name + ", phone=" + phone + ", address=" + address + ", isadmin=" + isadmin +"]";
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public boolean isIsadmin() {
        return isadmin;
    }
    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }
    public User(int id, String username, String email, String password, String name, String phone, String address,
                boolean isadmin) {
        super();
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.isadmin = isadmin;
    }
    public User( String username, String email, String password, String name, String phone, String address) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.isadmin = false;
    }

    public User(String username, String email, String password, String name, String phone, String address, boolean isadmin) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.isadmin = isadmin;
    }

    public User() {
        super();
    }


}

