
<%@page import="com.sgsits.connect.entities.User"%>
<%
    
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-desktop"></i>Sgsits-(onnect</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                
                <li class="nav-item active">
			<a href="index.jsp" class="nav-link">Home</a>
		</li>
		<li class="nav-item ">
			<a href="blog.jsp" class="nav-link">Blogs</a>
		</li>
				
		<li class="nav-item ">
			<a href="question.jsp" class="nav-link">Q&A</a>
		</li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">Account</a>
                </li>
              </ul>   
                <ul class="navbar-nav mr-right">
          
                <li class="nav-item active">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                </li>
                <li class="nav-item active">
                 <a class="nav-link" href="Logout"> Logout</a>
                 </li>
                 </ul>
                
                
             
            </div>
</nav>
        </header>
<!--        <header>
		<nav class="navbar navbar-expand navbar-light">
                    <a href="index.jsp" class="navbar-brand ml-3">Sgsits<span style="color: black">Connect</span></a>
			 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
             </button>
             
    <div class="collapse navbar-collapse" id="navbarMenu">
	<ul class="navbar-nav">
		<li class="nav-item ">
			<a href="index.jsp" class="nav-link">Home</a>
		</li>
		<li class="nav-item ">
                    <a href="blog.jsp" class="nav-link">Blogs</a>
		</li>
				<li class="nav-item ">
			<a href="#" class="nav-link">Source</a>
		</li>
		<li class="nav-item ">
			<a href="#" class="nav-link">Q&A</a>
		</li>
        <li class="nav-item">
            <a class="nav-link" href="#">Account</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Contact Us</a>
        </li>
        </ul>
        
        <ul style="margin-left: 50%" class="navbar-nav mr-right">
          
            <li class="nav-item active">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
          
          <li class="nav-item active">
          <a class="nav-link" href="Logout"> Logout</a>
          </li>
          </ul>
	</nav>
    </header>-->
                
     <!--Profile display-->
    
     <!-- Button trigger modal -->

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!--      <script>
            $(document).ready(function(){
               
               let editStatus = false;
               
                    $('#edit-profile-button').click(function(){
                        
                        if(editStatus === false)
                        {
                        $("#profile-detail").hide();
                        
                        $("#profile-edit").show();
                        editStatus =true;
                        $(this).text("Save changes");
                        }else
                        {
                            $("#profile-detail").show();
                        
                        $("#profile-edit").hide();
                        editStatus =false;
                        $(this).text("Edit-details");
                        
                        }
                        
                    });
            
            });
            
        </script>-->
    </body>
</html>
