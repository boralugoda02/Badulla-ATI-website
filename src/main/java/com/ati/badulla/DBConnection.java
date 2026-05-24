
package com.ati.badulla;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
     private static final String URL = "jdbc:mysql://localhost:3306/ati_badulla_db";
    private static final String USER = "root";
    private static final String PASSWORD = "";  
    
    public static Connection getConnection()  {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
             return DriverManager.getConnection(URL, USER, PASSWORD);
           
        } catch (Exception e) {
            System.out.println("DB Connection Error!");
            e.printStackTrace();
        }
        return null;
    }
}
