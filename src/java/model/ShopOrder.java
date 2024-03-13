/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class ShopOrder {
    private int id;
    private String date;
    private int cusid;
    private float totalprice;

    public ShopOrder() {
    }

    public ShopOrder(int id, String date, int cusid, float totalprice) {
        this.id = id;
        this.date = date;
        this.cusid = cusid;
        this.totalprice = totalprice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(float totalprice) {
        this.totalprice = totalprice;
    }

    @Override
    public String toString() {
        return "ShopOrder{" + "id=" + id + ", date=" + date + ", cusid=" + cusid + ", totalprice=" + totalprice + '}';
    }
    
}
