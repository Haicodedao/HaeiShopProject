/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Product {

    private int id;
    private String description;
    private String title;
    private float price;
    private String img;
    private Account account;
    private Category category;
    private int quantity;
    public Product() {
    }

    public Product(int id, String description, String title, float price, String img, Account account, Category category, int quantity) {
        this.id = id;
        this.description = description;
        this.title = title;
        this.price = price;
        this.img = img;
        this.account = account;
        this.category = category;
        this.quantity = quantity;
    }

    public Product(String description, String title, float price, String img, Account account, Category category, int quantity) {
        this.description = description;
        this.title = title;
        this.price = price;
        this.img = img;
        this.account = account;
        this.category = category;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", description=" + description + ", title=" + title + ", price=" + price + ", img=" + img + ", account=" + account + ", category=" + category + ", quantity=" + quantity + '}';
    }

    
    
    
    
}
