/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Phúc
 */
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String urlString = "jdbc:sqlserver://localhost\\PHUC:1433;databaseName=ASM3Week";
        con = DriverManager.getConnection(urlString, "sa", "HongPhuc228");
        return con;               
    }
}
