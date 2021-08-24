/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import phuchlh.utils.DBUtils;

/**
 *
 * @author Phúc
 */
public class CartDAO {

    public boolean addUserIDToOrder(String userID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into tblOders(userID) "
                        + "values (?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public int checkOrderIDByUserID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = -1;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select orderID "
                        + "from tblOders o inner join tblUsers u "
                        + "on o.userID = u.userID";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("orderID");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean addToCart(int orderID, String productID, String price, int quantity, String status, String userID, String carName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into tblOrderDetails(orderID, productID, price, quantity, status, userID, productName) "
                        + "values (?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, orderID);
                stm.setString(2, productID);
                stm.setString(3, price);
                stm.setInt(4, quantity);
                stm.setString(5, status);
                stm.setString(6, userID);
                stm.setString(7, carName);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<CartDTO> getProductFromCart(String userID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<CartDTO> cartLít = new ArrayList<CartDTO>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select orderDetailID, orderID, productID, price, quantity, productName, status "
                        + "from tblOrderDetails "
                        + "where userID = ? and status = 'active'";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String productID = rs.getString("productID");
                    String price = rs.getString("price");
                    int quantity = rs.getInt("quantity");
                    String productName = rs.getString("productName");
                    int orderDetail = rs.getInt("orderDetailID");
                    String status = rs.getString("status");
                    cartLít.add(new CartDTO(orderDetail, orderID, productID, productName, price, quantity, status));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return cartLít;
    }

    public boolean checkout(String status, String totalPrice, String userID, Timestamp time) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "insert into tblOders(userID, dateOrder, totalPrice, status) "
                        + "values (?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setTimestamp(2, time);
                stm.setString(3, totalPrice);
                stm.setString(4, status);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    
    public boolean changeStatus(String userID) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                String sql = "update tblOrderDetails "
                        + "set status = 'disable' "
                        + "where userID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate()> 0 ? true:false;
            }
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
