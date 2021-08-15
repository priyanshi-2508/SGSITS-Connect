/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgsits.connect.dao;

/**
 *
 * @author jatin
 */
import java.util.*;
import java.sql.*;
import com.sgsits.connect.entities.Category;
import com.sgsits.connect.entities.Post;
public class PostDAO {
    Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }
//get all categories    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            //query to get data from category table
            String q="select * from category";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            //loop until the resultset is empty
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                
                //create new object of category class and add to list
                Category c= new Category(cid,name,description);
                list.add(c);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }


//save post --- inserting post in database    
    public boolean savePost(Post p){
        boolean flag=false;
        try{
             String q = "insert into post(title,pcontent,pcode,ppic,catid,userId) values (?,?,?,?,?,?)";
             PreparedStatement pstmt=con.prepareStatement(q);
             pstmt.setString(1, p.getTitle());
             pstmt.setString(2, p.getpContent());
             pstmt.setString(3, p.getpCode());
             pstmt.setString(4, p.getpPic());
             pstmt.setInt(5, p.getCatId());
             pstmt.setInt(5, p.getUserId());
             pstmt.executeUpdate();
             flag=true;
             
        }catch(Exception e){
          e.printStackTrace();
        }
        return flag;
    }


//get all posts    
        public ArrayList<Post> getAllPost(){
        ArrayList<Post> list=new ArrayList<>();
        try{
            //query to get data from category table
            String q="select * from post order by pid desc";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            //loop until the resultset is empty
            while(set.next()){
                int pid=set.getInt("pid");
                String ptitle=set.getString("title");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("date");
                int catid=set.getInt("catid");
                int userId = set.getInt("userId");
                Post p = new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userId);
                list.add(p);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }



//get post by category 
    public ArrayList<Post> getAllPostByCategory(int catId) {
        ArrayList<Post> list=new ArrayList<>();
        try {
            PreparedStatement pstmt;
            pstmt = con.prepareStatement("select * from post where catid=?");
            pstmt.setInt(1,catId);
            ResultSet set= pstmt.executeQuery();
            
            while(set.next()){
                int pid=set.getInt("pid");
                String ptitle=set.getString("title");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("date");
                int catid=set.getInt("catid");
                //int userId=set.getInt("userid");
                int userId = set.getInt("userId");
                Post p =new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userId);
                
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    //get Post by postid
    public Post getPostbyPostId(int postId)
    {
        Post post=null;
        String q = "select * from post where pid=?";
        try{
        PreparedStatement pt=this.con.prepareStatement(q);
        pt.setInt(1,postId);
        ResultSet set=pt.executeQuery();
        if(set.next())
        {
            
            int pid=set.getInt("pid");
                String ptitle=set.getString("title");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("date");
                int cid=set.getInt("catId");
              
               int userId=set.getInt("userId");
             post=new Post(pid, ptitle, pcontent, pcode, ppic, date, cid,userId);
            
        }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return post;
    }
    
}

