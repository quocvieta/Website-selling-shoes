/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Orders {
    private int order_id;
    private String date;
    private int customer_id;
    private float totalMoney;

    public Orders() {
    }

    public Orders(int order_id, String date, int customer_id, float totalMoney) {
        this.order_id = order_id;
        this.date = date;
        this.customer_id = customer_id;
        this.totalMoney = totalMoney;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    @Override
    public String toString() {
        return "Orders{" + "order_id=" + order_id + ", date=" + date + ", customer_id=" + customer_id + ", totalMoney=" + totalMoney + '}';
    }
    
}
