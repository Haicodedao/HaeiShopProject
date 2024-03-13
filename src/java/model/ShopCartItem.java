/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class ShopCartItem {
//    id int identity(1,1) primary key,
//	quantity float not null,
//	price float not null,
//	pid int,
//	shopid int,
//	FOREIGN KEY (pid) REFERENCES Product(pid),
//	FOREIGN KEY (shopid) REFERENCES ShopOrder(shopid)

    private int oid, pid;
    private int quantity;
    private float price;

    public ShopCartItem() {
    }

    public ShopCartItem(int oid, int pid, int quantity, float price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ShopCartItem{" + "oid=" + oid + ", pid=" + pid + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
