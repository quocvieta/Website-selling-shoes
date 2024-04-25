/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class ProductSizes {
    private int size_id, product_id, size, quantity;

    public ProductSizes() {
    }

    public ProductSizes(int size_id, int product_id, int size, int quantity) {
        this.size_id = size_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
    }

    public int getSize_id() {
        return size_id;
    }

    public void setSize_id(int size_id) {
        this.size_id = size_id;
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

    @Override
    public String toString() {
        return "ProductSizes{" + "size_id=" + size_id + ", product_id=" + product_id + ", size=" + size + ", quantity=" + quantity + '}';
    }

    
}
