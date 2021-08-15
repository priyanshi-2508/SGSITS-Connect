/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgsits.connect.helper;
import java.sql.*;

/**
 *
 * @author bishal
 */
public class ConnectionProvider {
    
      private static Connection con;
    
    public static Connection getConnection(){
        
        try{
            if(con == null)
            {
                //driver class load
                Class.forName("com.mysql.jdbc.Driver");
                //create a connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgsitsconnect","root","root");
            
            }
           
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
    
}
