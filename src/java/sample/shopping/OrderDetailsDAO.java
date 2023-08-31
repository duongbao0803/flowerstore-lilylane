/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author duong
 */
public class OrderDetailsDAO {
        private static final String INSERT = "INSERT INTO tblOrderDetails (orderID, productID, price, quantity) VALUES(?,?,?,?)";

    public boolean insert(FlowerDTO flower, int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, orderID);
                ptm.setString(2, flower.getProductID());
                ptm.setInt(3, flower.getPrice());
                ptm.setInt(4, flower.getQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    
}
    

