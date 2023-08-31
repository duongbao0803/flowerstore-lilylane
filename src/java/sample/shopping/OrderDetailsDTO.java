/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author duong
 */
public class OrderDetailsDTO {

    private int orderID;
    private String productID;
    private int price;
    private int quantity;

    public OrderDetailsDTO() {
    }

    public OrderDetailsDTO(int orderID, String productID, int price, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    } 
}
