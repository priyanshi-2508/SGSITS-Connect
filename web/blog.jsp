<%-- 
    Document   : index
    Created on : 3 Apr, 2021, 12:32:20 AM
    Author     : jatin
--%>

<%@page import="com.sgsits.connect.entities.User"%>
<%@page import="com.sgsits.connect.entities.Category"%>
<%@page import="com.sgsits.connect.dao.PostDAO"%>
<%@page import="com.sgsits.connect.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Page</title>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    </head>
    <body>
    
        <!--navbar-->
        <%@include file="normalnavbar.jsp"%>
        
        <!--head section of page-->
        <div class="container-fluid p-0 m-0 ">
            <div class="jumbotron site-content">
                <div class="container">
                    <h3 class="display-3">Welcome to Blogs</h3>
                    <p>Have a read through our awesome blogs</p>
                    <a href="post.jsp" class="btn btn-outline-dark" onclick="CheckUser()" id="post_btn"><i class="fa fa-graduation-cap"> </i> Write a Blog</a>
                    <!--<a href="login.jsp" class="btn btn-outline-dark"><i class="fa fa-user"></i> Login</a>-->
                </div>
            </div>    
        </div>
        
        <br>
        <!--site content-->
        
 
        <main>
            <div class="container-fluid blog-main-div">
                <div class="row">
                    <!--25% left side for categories-->
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <div class="list-group">
                            <a href="#" onclick="getPost(0)" class="list-group-item list-group-item-dark active">
                              All Blogs
                            </a>
                                <!--using getAllCategories of postDAO returns a list of category object-->
                                <%
                                    
                                    PostDAO d=new PostDAO(ConnectionProvider.getConnection());
                                    ArrayList<Category> list=d.getAllCategories();
                                    
                                    for(Category cc:list){
                                  
                                %>
                                <a href="#" onclick="getPost(<%= cc.getCid()%>)" class="list-group-item list-group-item-action">
                                       <%=cc.getName().toUpperCase()%>
                                </a>
                                <%
                                    }  
                                %>
                        </div>
                    </div>
                    
                    <!--75% right for blogs-->
                    <!--All pOsts-->
                    <div class="col-md-8 ">
                        <div class="container text-center" id="loader">
                            <i class="fas fa-sync fa-3x fa-spin"></i>
                            <h3>Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                             
                    </div>
                </div>
            </div>
        </main>
    
        
        
        <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
       <!--sending request with the help of ajax-->
       <script>
       function getPost(catId){    
              $("#loader").show();
              $("#post-container").hide();
              
              $.ajax({
                  url:"loadPost.jsp",
                  data:{cid : catId},
                  success: function (data, textStatus, jqXHR) {
                      console.log(data);
                      $("#loader").hide();
                      $("#post-container").show();
                      $("#post-container").html(data);
                  }
              });
        }
        
        $(document).ready(function(e){
            getPost(0);
        });
       </script>
<!--       <script>
           
           $("#post_btn").onClick({
               
           })
       </script>-->
    </body>
</html>
