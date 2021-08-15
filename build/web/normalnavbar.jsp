<%@page import="com.sgsits.connect.entities.User"%>
<!--link to css file-->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<link href="css/navbar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!--navbar code-->
 <%
 
    User user1=(User)session.getAttribute("currentUser");
    if(user1==null)
    {
  %>
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
			<a href="source.jsp" class="nav-link">Source</a>
		</li>
		<li class="nav-item ">
			<a href="question.jsp" class="nav-link">Q&A</a>
		</li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Sign Up</a>
                </li>
		<li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
              </ul>
            </div>
</nav>
<%
  }
else
{
%>
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
			<a href="source.jsp" class="nav-link">Source</a>
		</li>
		<li class="nav-item ">
			<a href="question.jsp" class="nav-link">Q&A</a>
		</li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactUs.jsp">Contact Us</a>
                </li>
                </ul>
                 <ul style="margin-left: 50%" class="navbar-nav mr-right">
          
            <li class="nav-item active">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user1.getName()%></a>
          
          <li class="nav-item active">
          <a class="nav-link" href="Logout"> Logout</a>
          </li>
          
              </ul>
            </div>
</nav>
<%
}
%>



<!--js-->
 <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
