/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author duong
 */
public class Cart {

    private Map<String, FlowerDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, FlowerDTO> cart) {
        this.cart = cart;
    }

    public Map<String, FlowerDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, FlowerDTO> cart) {
        this.cart = cart;
    }

    public boolean add(String id, FlowerDTO flower) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(id)) {
                int currentQuantity = this.cart.get(id).getQuantity();
                flower.setQuantity(currentQuantity + flower.getQuantity());
            }
            this.cart.put(id, flower);
            check = true;
        } catch (Exception e) {

        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {

        }
        return check;
    }

    public boolean edit(String id, FlowerDTO fl) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, fl);
                    check = true;
                }
            }
        } catch (Exception e) {

        }
        return check;
    }
    
}
