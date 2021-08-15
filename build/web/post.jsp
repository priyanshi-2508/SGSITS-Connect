<%-- 
    Document   : post.jsp
    Created on : 7 Apr, 2021, 1:21:29 AM
    Author     : jatin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.sgsits.connect.entities.Category"%>
<%@page import="com.sgsits.connect.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sgsits.connect.dao.PostDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Write your blog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <%@include file="normalnavbar.jsp"%>
        <div class="container-fluid ">
            <div class="container blog_form">
                <h5 class="display-4">Add your blog here</h5>
                <hr class="style-two">
                
                <!--FORM-->
                <form id="addPostForm" action="AddPostServlet"  method="post">
                    <div class="form-group">
                    <select class="form-control" name="cid">
                        <!--getting data from database from category table and showing it in the options-->
                        <option selected disabled>---Select Category---</option>
                        <% 
                            //Created object of PostDAO nad passed connection in its constructor
                            PostDAO postd=new PostDAO(ConnectionProvider.getConnection());
                            
                            //Created an Array List and called getAllCategories function
                            //getAllCategories :- Executes a quesry to get all the rows from category table 
                            //and returns a list of category objects
                            ArrayList<Category> list=postd.getAllCategories();
                            
                            //loop around the list of categories and print the name in the place of options
                            for(Category c:list)
                            {
                        %>   
                        <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                    </div>    
                    <div class="form-group">
                        <input type="text" name="ptitle" placeholder="Enter blog title" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="pcontent" placeholder="Enter your content" style="height: 120px"></textarea>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="pcode" placeholder="Enter your program(if any)" style="height: 115px"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Select your pic</label>
                        <br>
                        <input type="file" name="pimage"/>
                        <div class="container-fluid text-center">
                        <button type="submit" class="btn btn-outline-dark">Post your Blog!!!</button>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
        
        <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
        
        <!--Adding blogs to database-->
        <!--javascript add post JS-->
        <script>
            $(document).ready(function(e){
                //Applying listen to the form 
                $("#addPostForm").on("submit", function(event){
                    //this code gets called when form is sun=bmitted
                    event.preventDefault();
                    console.log("you have submitted");
                    let form=new FormData(this);
                    
                    //now requesting to server
                    //submitting the form AddPostServlet that handles the database job
                    $.ajax({
                        url : "AddPostServlet",
                        type:'POST',
                        data:form,
                        success: function(data, textStatus, jqXHR){
                            //success..
                            console.log(data);
//                            swal("Good job!", "Your blog has been posted!", "success");
//                            response.sendRedirect("index.jsp");
                            //on succes display message using sweet alert library script has been added.
                            swal({
                                    title: "Great Job",
                                    text: "Your blog has been posted",
                                    icon:"success",
                                    type: "success"
                                }).then(function() {
                                    window.location = "blog.jsp";//profile page to be added 
                                });
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            //error....
                            console.log("Error");
                            swal("Something went wrong", "Please try again!!","error");
                        },
                        processData: false,
                        contentType:false
                    });
                });
               
            });
        </script>
                    
    </body>
</html>
