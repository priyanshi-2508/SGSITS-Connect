/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgsits.connect.entities;
import java.sql.*;
/**
 *
 * @author jatin
 */
public class Post {
    private int pid;
    private String title;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId; 
    
    //constructors
    
    public Post() {
        
    }

    public Post(int pid, String title, String pContent, String pCode, String pPic, Timestamp pDate, int catId) {
        this.pid = pid;
        this.title = title;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public Post(String title, String pContent, String pCode, String pPic, Timestamp pDate, int catId) {
        this.title = title;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }
    
    public Post(String title, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int userId) {
        this.title = title;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(int pid, String title, String pContent, String pCode, String pPic, Timestamp pDate) {
        this.pid = pid;
        this.title = title;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
    }

//    public Post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp date, int catid, int userId) {
//        this.pid = pid;
//        this.title = title;
//        this.pContent = pContent;
//        this.pCode = pCode;
//        this.pPic = pPic;
//        this.pDate = pDate;
//    }
//    

    public Post(int pid, String title, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
        this.pid = pid;
        this.title = title;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
    }
    
    
    
    //getters
    public int getPid() {
        return pid;
    }

    public String getTitle() {
        return title;
    }

    public String getpContent() {
        return pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public int getCatId() {
        return catId;
    }
    
    public int getUserId(){
    return userId;
    }
    
    //Setters
    public void setPid(int pid) {
        this.pid = pid;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
       
}

