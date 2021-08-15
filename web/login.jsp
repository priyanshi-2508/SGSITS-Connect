<%@page import="com.sgsits.connect.entities.Message"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- css file -->
    <!--<link rel="stylesheet" type="text/css" href="login.css">-->
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
</head>
<body>
    <!-- navbar -->
    <!--<header>-->
<!--        <nav class="navbar navbar-expand navbar-light navbar1">
            <a href="index.jsp" class="navbar-brand ml-3">Sgsits<span style="color: black">Connect</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarMenu">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a href="#" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link">Blogs</a>
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
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Sign Up</a>
                    </li>
                    </ul>
            </div>
        </nav>
    </header>-->
<%@include file="normalnavbar.jsp" %>
    
    <div class="login">
        <div class="login-box">
            <h1 style="text-align: center; font-size: 46px;">Login</h1>
            <% 
                Message m=(Message)session.getAttribute("msg");
                if(m!=null)
                {
            %>
            
            <div class="alert <%= m.getCssClass()  %>" role="alert">
                                 <%= m.getContent() %>
            </div>
            
            <%
                                session.removeAttribute("msg");
                            }
             %>
            
            <form style="margin-top: 15px;" action="Login" method="POST">
                <p>Email</p>
                <input class="special" type="email" name="email" required="" placeholder="Enter Email">
                <p>Password</p>
                <input class="special" type="password" name="password" required="" placeholder="Enter Password">
                <input class="submit" type="submit"  value="Login">
            </form>
        </div>
    </div>

</body>
</html>
