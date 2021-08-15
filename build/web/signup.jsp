<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <!-- BootStrap Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- our css -->
    <link href="css/signup.css" rel="stylesheet" type="text/css"/>
    <!--<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">-->
    
</head>
<body>
    <%@include file="normalnavbar.jsp" %>
    <main>
        <div class="signup">
            <div class="signup-box">
                <h1  style="text-align: center;">Welcome</h1>
                <form  id="reg-form" action="Register" method="POST">
                    <p>Name</p>
                    <input class="special" type="text" name="user_name" placeholder="Enter your name">
                    <p>Email</p>
                    <input class="special" type="text" name="user_email" placeholder="Enter your email">
                    <p>Mobile no</p>
                    <input class="special" type="text" name="user_mobile" placeholder="Enter your Mobile No.">
                    <p>Password</p>
                    <input class="special" type="password" name="user_password" placeholder="Enter your password">
                    <div class="container" id="loader">
                        <span class="fa fa-refresh fa-3x fa-spin"></span>
                    </div>
                    <input id="submit-btn" class="submit" type="Submit" value="Submit">
                </form>
            </div>
        </div>
    </main>
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>-->
    <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>-->
    <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>-->
    <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
            $(document).ready(function(){
                console.log("loaded..");
                
             $("#reg-form").on('submit',function(event){
                event.preventDefault(); 
                let form = new FormData(this);
                
                $("#submit-btn").hide();
                $("#loader").show();
                
                 //send to reg servlet
                 $.ajax({
                     url:"Register",
                     type: 'POST',
                     data: form ,
                     success: function (data, textStatus, jqXHR){
                         console.log(data);
                         $("#submit-btn").show();
                         $("#loader").hide();
                         swal("Registered Sucessfully..!! We are redirecting to login page..").then((value) => {
                                        window.location = "login.jsp";
                            });
                     },
                   error: function (jqXHR, textStatus, errorThrown){
                     console.log(jqXHR); 
                      $("#submit-btn").show();
                      $("#loader").hide();
                      swal(" Something went wrong..try again..!");   
                   },
                   
                   processData : false,
                   contentType: false
                 });
                 
                 
             }); 
             
            });
        </script>
</body>
</html>
