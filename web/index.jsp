<%@page import="com.sgsits.connect.entities.User"%>
<!DOCTYPE html>
<html>
<head>
	<title>Study Portal</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- BootStrap Link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!--Our stylesheet link -->
 	<!--<link rel="stylesheet" type="text/css" href="studyportal.css">-->
        <!--<link href="css/signup.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<!-- Body Tag -->
<body>
    <%
        User user=(User)session.getAttribute("currentUser");
        if(user==null)
        { 
    %>
    <!--      <header>
		<nav class="navbar navbar-expand navbar-light">
			<a href="studyportal.html" class="navbar-brand ml-3">Sgsits<span style="color: black">Connect</span></a>
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
        <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login</a>
        </li>
		<li class="nav-item">
            <a class="nav-link" href="signup.jsp">Sign Up</a>
        </li>
        </ul>

		</nav>
	</header>  -->
    <%@include file="normalnavbar.jsp"%>
    <%
        }
        else
        {
    %>
<!--        <header>
		<nav class="navbar navbar-expand navbar-light">
			<a href="studyportal.html" class="navbar-brand ml-3">Sgsits<span style="color: black">Connect</span></a>
			 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
             </button>
             
    <div class="collapse navbar-collapse" id="navbarMenu">
	<ul class="navbar-nav">
		<li class="nav-item ">
			<a href="index.jsp" class="nav-link">Home</a>
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
        </ul>
        
        <ul style="margin-left: 43%" class="navbar-nav mr-right">
          
            <li class="nav-item active">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
          
          <li class="nav-item active">
          <a class="nav-link" href="Logout"> Logout</a>
          </li>

	</nav>
    </header>-->
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
    <%
        }
    %>
<!--
	<header>
		<nav class="navbar navbar-expand navbar-light">
			<a href="studyportal.html" class="navbar-brand ml-3">Sgsits<span style="color: black">Connect</span></a>
			 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
             </button>
             
    <div class="collapse navbar-collapse" id="navbarMenu">
	<ul class="navbar-nav">
		<li class="nav-item ">
			<a href="index.jsp" class="nav-link">Home</a>
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

		</nav>
	</header>-->

	<main>
		<div class="container-fluid p-0">
			<div class="site-content">
				<div class="d-flex justify-content-center">
					<div class="d-flex flex-column"><!-- put all the content in new row -->
						<h1 class="site-title">
							Study Portal
						</h1>
						<p class="site-desc">
							If you have thoughts on what your studies this portal will help you answer your questions.
						</p>
						
					</div>

				</div>
			</div>
		</div>	
		</main>
<!-- Section 1 -->
		<div class="section-1">
			<div class="container text-center">
				<h1 class="heading-1"></h1>
				<h2 class="heading-2">The ultimate site to answer all your questions.

</h2>

				<p class="para-1">From your doubts regarding career to the notes that will help you during your exams we got it all covered<p>

				<div class="row justify-content-center text-center">
					<!-- Scaling during size interchange of screen -->
					<div class="col-md-4">
						<div class="card" >
							<img src="https://images.pexels.com/photos/1591056/pexels-photo-1591056.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt=" Career Blogs" class="card-img-top">
							<div class="card-body">
								<h4 class="card-title">
									Career Blogs
								</h4>
								<p class="card-text">
									tell me something to write you guys
								</p>
								<button type="button" class="btn btn-outline-dark btn-sm">Blogs</button>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" >
							<img src="https://images.pexels.com/photos/236111/pexels-photo-236111.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Notes" class="card-img-top">
							<div class="card-body">
								<h4 class="card-title">
									Notes
								</h4>
								<p class="card-text">
									tell me something to write you guys
								</p>
								<button type="button" class="btn btn-outline-dark btn-sm">Notes</button>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" >
							<img src="https://images.pexels.com/photos/5428830/pexels-photo-5428830.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Q & A" class="card-img-top">
							<div class="card-body">
								<h4 class="card-title">
									Q & A
								</h4>
								<p class="card-text">
									tell me something to write you guys
								</p>
								<button type="button" class="btn btn-outline-dark btn-sm">Ask?</button>
							</div>
						</div>
					</div>

				</div>
<hr class="style13">

			</div>
		</div>			
	</div>

<!-- Section 2 -->
<!-- <div class="section-2">
	<div class="container-fluid text-center">
		<div class="d-flex justify-content-center">
			<div class="d-flex flex-column">
				<h1 class="heading-1">
					We are Still to Decide
				</h1>
				<p class="para">
					Gonna add some information
				</p>
			</div>
		</div>
	</div>
</div> -->

<!-- section 2 -->
<div class="blogs">
	<div class="blogs-img">
		<img style="height: 250px;" src="https://images.pexels.com/photos/261662/pexels-photo-261662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500">
	</div>
	<div class="blogs-text">
		<h3 style="font-size: 28px; font-weight: 100;">Blogs</h3>

		<p style="font-size: 20px; font-weight: 100; padding-top: 1%;">
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur molestiae dolor exercitationem, dolorum quos tempora architecto sequi labore nisi odit, cumque eveniet perferendis reiciendis sapiente incidunt. Repellendus voluptate est sit.
		</p>
	</div>
</div>
<div class="notes">
	
	<div class="notes-text">
		<h3 style="font-size: 28px; font-weight: 100;">Notes</h3>

		<p style="font-size: 20px; font-weight: 100; padding-top: 1%;">
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur molestiae dolor exercitationem, dolorum quos tempora architecto sequi labore nisi odit, cumque eveniet perferendis reiciendis sapiente incidunt. Repellendus voluptate est sit.
		</p>
	</div>
	<div class="notes-img">
		<img style="height: 250px;" src="https://images.pexels.com/photos/5905522/pexels-photo-5905522.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940">
	</div>
</div>
<div class="qa">
	<div class="qa-img">
		<img style="height: 250px;" src="https://images.pexels.com/photos/208494/pexels-photo-208494.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500">
	</div>
	<div class="qa-text">
		<h3 style="font-size: 28px; font-weight: 100;">Questions and Answers</h3>

		<p style="font-size: 20px; font-weight: 100; padding-top: 1%;">
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur molestiae dolor exercitationem, dolorum quos tempora architecto sequi labore nisi odit, cumque eveniet perferendis reiciendis sapiente incidunt. Repellendus voluptate est sit.
		</p>
	</div>
</div>


</body>
</html>