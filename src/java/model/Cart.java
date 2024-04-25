/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int product_id) {
        return getItemById(product_id).getQuantity();
    }

    private Item getItemById(int product_id) {
        for (Item i : items) {
            if (i.getProduct().getProduct_id() == product_id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item i) {
        if (getItemById(i.getProduct().getProduct_id()) != null && 
                getItemById(i.getProduct().getProduct_id()).getSize() == i.getSize()) {
            Item item = getItemById(i.getProduct().getProduct_id());
            item.setQuantity(item.getQuantity() + i.getQuantity());
        } else {
            items.add(i);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public float getTotalMoney() {
        float t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    private Products getProductById(int id, List<Products> list) {
        for (Products i : list) {
            if (i.getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<Products> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int size = Integer.parseInt(n[1]); // Giả định rằng sizeId là phần tử thứ hai trong mảng n
                    int quantity = Integer.parseInt(n[2]);
                    Products p = getProductById(id, list);
                    Item t = new Item(p, size, quantity, (float) p.getPrice());
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
        }
    }
}
