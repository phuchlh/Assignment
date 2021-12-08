/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import phuchlh.utils.DBUtils;

/**
 *
 * @author Phúc
 */
public class CarDAO {

    public List<CarDTO> loadCar() throws SQLException, ClassNotFoundException {
        List<CarDTO> list = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select productID, productName, quantity, price, categoryID, status, image "
                        + "from tblProducts ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        String productID = rs.getString("productID");
                        String productName = rs.getString("productName");
                        int quantity = rs.getInt("quantity");
                        String price = rs.getString("price");
                        String cateID = rs.getString("categoryID");
                        String status = rs.getString("status");
                        String image = rs.getString("image");
                        list.add(new CarDTO(productID, productName, price, cateID, status, image, quantity));
                    }
                    return list;
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
        return list;
    }

    public boolean editCar(CarDTO car) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "update tblProducts "
                        + "set productName = ?, quantity = ?, price = ?, status = ?, image = ? "
                        + "where productID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, car.getProductName());
                stm.setInt(2, car.getQuantity());
                stm.setString(3, car.getPrice());
                stm.setString(4, car.getStatus());
                stm.setString(5, car.getImage());
                System.out.println(car.getImage());
                stm.setString(6, car.getProductID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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
}
