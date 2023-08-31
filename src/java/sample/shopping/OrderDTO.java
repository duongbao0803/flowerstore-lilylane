/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.Date;



/**
 *
 * @author duong
 */
public class OrderDTO {

    private String userID;
    private Date date;
    private int total;
    private String method;

    public OrderDTO() {
    }

    public OrderDTO(String userID, Date date, int total, String method) {

        this.userID = userID;
        this.date = date;
        this.total = total;
        this.method = method;
    }


    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
 
    
    
    
}
    
