<%-- 
    Document   : showBlog
    Created on : 11 Apr, 2021, 1:18:30 AM
    Author     : PRIYANSHI
--%>

<%@page import="com.sgsits.connect.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sgsits.connect.dao.Userdao"%>
<%@page import="com.sgsits.connect.entities.Post"%>
<%@page import="com.sgsits.connect.dao.PostDAO"%>
<%@page import="com.sgsits.connect.helper.ConnectionProvider"%>
<%@page import="com.sgsits.connect.entities.User"%>
<%--<%@page errorPage="error.jsp" %>--%>
<%
    
    User user =(User)session.getAttribute("currentUser");
    if(user == null)
    {
        response.sendRedirect("login.jsp");
    }
%>

<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
    PostDAO d=new PostDAO(ConnectionProvider.getConnection());
    Post p =d.getPostbyPostId(postId);
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle() %></title>
        <!--css-->
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            
            body{
/*                background: url(images/bb1.jpg);
                background-size: cover;
                background-attachment: fixed;*/
            }
            .post-title{
                font-weight: 100;
                font-size:30px;
            }
            .post-content{
                font-weight: 100;
                font-size:20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                
            }
            .post-user-info{
                font-size: 20px;
                font-weight: 200;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0" nonce="dPXHUrh7"></script>
        
    </head>
    <body>
        <%@include file="normalnavbar.jsp" %>
        
        <!--main content of body-->
                
        
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header bg-dark primary-background text-white">
                            <h4 class="post-title"><%= p.getTitle() %></h4>  
                        </div>
                                <div class="card-body">
                                    <img style="height: 50%;width: 70%" class="card-img-top my-3" src="blog_pic/<%= p.getpPic() %>" alt="Card image cap">
                                    
                                    <div class="row my-3 row-user">
                                        
                                        
                                        <div class="col-md-8">
                                            <% 
                                            Userdao ud = new Userdao(ConnectionProvider.getConnection());
                                            %>
                                            <p class="post-user-info"><a href="#!">
                                            
                                                    
                                                    admin  
                                                </a>
                                                    has posted: </p>
                                        </div>
                                        
                                         <div class="col-md-4">
                                             <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                        </div>
                                        
                                    </div>
                                        
                                    <p class="post-content"><%= p.getpContent() %></p>
                                    <br>
                                    <div class="post-code">
                                    <pre>
                                        <%= p.getpCode() %>
                                    </pre>
                                    </div>
                                </div>
                                 <div class="card-footer text-center bg-dark">
                                     
                                     <%
                                         LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                         %>
                                         
                                     
                                         <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light  btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>                    
                                   <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o yellow-color"></i><span>20</span></a>
                                </div>
                                   <div class="card-footer">
                                       <div class="fb-comments" data-href="http://localhost:8080/Sgsits_Connect_Portal/showBlog.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
                                   </div>
                    </div>
                </div>
                
          
            </div>
     
        </div>
        
    <!--end of main content-->
        
        
       <!--start of profile modal-->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile-Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>   
          
          <table class="table">
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>ID</td>
                    <td><%= user.getName() %></td>
                    
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Email</td>
                    <td><%= user.getEmail() %></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Mobile</td>
                    <td><%= user.getMobile() %></td>
                  </tr>
                </tbody>
        </table>
      </div>
      </div>
              
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <!--<button type="button" id="edit-profile-button" class="btn btn-primary">Edit details</button>-->
      </div>
    </div>
  </div>
</div>

<!--end of profile modal-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
