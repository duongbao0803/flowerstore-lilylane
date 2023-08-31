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
public class FlowerDTO {
    private String productID;
    private String name;
    private int price;
    private int quantity;
    private String image;

    
    public FlowerDTO() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.image = "";
    }

    public FlowerDTO(String productID, String name, int price, int quantity, String image) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }


    public String getProductID() {
        return productID;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }    
}
