/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgsits.connect.dao;

import com.sgsits.connect.entities.User;
import java.sql.*;

/**
 *
 * @author bisha
 */
public class Userdao {
    
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
     public boolean saveUser(User user)
    {
        boolean f=false;
        try{
            //user--> databse
            
            
            String query="insert into user(name,email,mobile,password) values (?,?,?,?)";
            
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getMobile());
            pstmt.setString(4, user.getPassword());
            
            pstmt.executeUpdate();
            f=true;
            
            
            
    }catch(Exception e)
    {
        e.printStackTrace();
    }
        
     return f;
    }
     
     //get user by email and password
     
     public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try {
            
            String query="select * from user where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set=pstmt.executeQuery();
            
            if(set.next())
            {
                user = new User();
                String name=set.getString("name");
                user.setName(name);
                
//                user.setProfile(set.getString("profile"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setMobile(set.getString("mobile"));
                user.setPassword(set.getString("password"));
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
     
     public User getUserByUserId(int userId)
     {
          User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setPassword(set.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return user;
     }
}
