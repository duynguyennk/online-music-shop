/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author drako
 */
public class OrderDetail {
    private int OrderDetailId;
    private Product product;
    private int quantity;
    private float price;
    private Order order;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    
    

    public OrderDetail() {
    }
    
    

    public OrderDetail(int OrderDetailId, Product product, int quantity, float price) {
        this.OrderDetailId = OrderDetailId;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderDetailId() {
        return OrderDetailId;
    }

    public void setOrderDetailId(int OrderDetailId) {
        this.OrderDetailId = OrderDetailId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
    
    
}
