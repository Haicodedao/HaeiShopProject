/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Account {
    private int id;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String user;
    private String pass;
    private RoleAccount role;

    public Account() {
    }

    public Account(int id, String name, String email, String address, String phone, String user, String pass, RoleAccount role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.user = user;
        this.pass = pass;
        this.role = role;
    }
    
    public Account(String name, String email, String address, String phone, String user, String pass, RoleAccount role) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.user = user;
        this.pass = pass;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public RoleAccount getRole() {
        return role;
    }

    public void setRole(RoleAccount role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", name=" + name + ", email=" + email + ", address=" + address + ", phone=" + phone + ", user=" + user + ", pass=" + pass + ", role=" + role + '}';
    }
    
    
}
