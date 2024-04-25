/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Products {
    private int product_id;
    private String name;
    private String brand;
    private String color;
    private float price;
    private String image_url;
    private List<ProductSizes> productSizes;

    // Constructors, getters, setters, và các phương thức khác

    public List<ProductSizes> getProductSizes() {
        return productSizes;
    }

    public void setProductSizes(List<ProductSizes> productSizes) {
        this.productSizes = productSizes;
    }

    public Products() {
    }

    public Products(int product_id, String name, String brand, String color, float price, String image_url) {
        this.product_id = product_id;
        this.name = name;
        this.brand = brand;
        this.color = color;
        this.price = price;
        this.image_url = image_url;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    @Override
    public String toString() {
        return "Products{" + "product_id=" + product_id + ", name=" + name + ", brand=" + brand + ", color=" + color + ", price=" + price + ", image_url=" + image_url + '}';
    }
    
    
}
