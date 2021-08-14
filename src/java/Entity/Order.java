/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author drako
 */
public class Order {
    private int OrderId;
    private User customer;
    private HashMap<Integer, OrderDetail> hmItems;
    private float totalPrice;
    private String buyDate;

    public Order() {
    }

    public Order(int OrderId, User customer, HashMap<Integer, OrderDetail> hmItems, float totalPrice, String buyDate) {
        this.OrderId = OrderId;
        this.customer = customer;
        this.hmItems = hmItems;
        this.totalPrice = totalPrice;
        this.buyDate = buyDate;
    }

    
    public String getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(String buyDate) {
        this.buyDate = buyDate;
    }
    
    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public HashMap<Integer, OrderDetail> getItems() {
        return hmItems;
    }

    public void setItems(HashMap<Integer, OrderDetail> items) {
        this.hmItems = items;
    }
    
}
