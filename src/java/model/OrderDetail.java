/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int order_id;
    private int product_id;
    private int size;
    private int quantity;
    private float price;

    public OrderDetail() {
    }

    public OrderDetail(int order_id, int product_id, int size, int quantity, float price) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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
        return "OrderDetail{" + "order_id=" + order_id + ", product_id=" + product_id + ", size=" + size + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
}
