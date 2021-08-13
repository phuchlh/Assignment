/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import phuchlh.utils.DBUtils;

/**
 *
 * @author Phúc
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password, String status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select userID, password, fullname, roleID, address, status "
                        + "from tblUsers "
                        + "where userID = ? and password = ? and status = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                stm.setString(3, status);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    user = new UserDTO(userID, password, fullname, address, roleID, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return user;
    }

    public List<UserDTO> searchUser(String search) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<UserDTO> userList = new ArrayList<UserDTO>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select userID, password, fullname, address, roleID, status "
                        + "from tblUsers "
                        + "where fullname like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = "***";
                    String fullName = rs.getString("fullname");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String status = rs.getString("status");
                    userList.add(new UserDTO(userID, password, fullName, address, roleID, status));
                    System.out.println(userList);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return userList;
    }
    
    public boolean deleteUser(String userID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean checkDelete = false;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                String sql = "delete tblUsers "
                        + "where userID = ?";
                stm=con.prepareStatement(sql);
                stm.setString(1, userID);
                checkDelete = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(stm!= null) stm.close();
            if(con!=null) con.close();
        }
        return checkDelete;
    }
}
