/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author duong
 */
public class FlowerDAO {

    private static final String LIST = "SELECT productID, name, price, quantity, image FROM tblProducts";
    private static final String LIST_BUY = "SELECT productID, name, price, quantity, image FROM tblProducts WHERE productID = ?";
    private static final String UPDATE_FLOWER = "UPDATE tblProducts SET quantity = ? WHERE productID = ?";

    public List<FlowerDTO> getListFlower() throws SQLException {
        List<FlowerDTO> listFlower = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                if (quantity > 0) {
                    listFlower.add(new FlowerDTO(productID, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listFlower;
    }

    public FlowerDTO getFlower(String productID, int quantity) throws SQLException {
        FlowerDTO listBuy = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_BUY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    String image = rs.getString("image");
                    listBuy = new FlowerDTO(productID, name, price, quantity, image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBuy;
    }

//    public boolean updateFlower(FlowerDTO flower) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE_FLOWER);
//                ptm.setString(1, flower.getProductID());
//                ptm.setInt(2, flower.getQuantity());
//                check = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
    public boolean updateFlower(FlowerDTO cart) throws SQLException {
        FlowerDTO flower = null;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            flower = getFlowerID(cart.getProductID());
            if (flower.getQuantity() >= cart.getQuantity()) {
                int newQuantity = flower.getQuantity() - cart.getQuantity();
                conn = DBUtils.getConnection();
                ptm = conn.prepareStatement(UPDATE_FLOWER);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, flower.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public FlowerDTO getFlowerID(String productID) throws SQLException {
        FlowerDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_BUY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    product = new FlowerDTO(productID, name, price, quantity, image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }
}
