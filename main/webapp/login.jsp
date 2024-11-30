<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>
    
    <style>
  /* Body styles */
  body {
    
  font-family: 'Roboto', sans-serif;

  background-image: url('images/stu.jpg');
  background-size: cover;
  color: #eaf6f6;
 
  

  }

  /* Form styles */
  form {
    display: flex;
    flex-direction: column;
    width: 300px;
    margin: 0 auto; /* Center the form horizontally */
     /* Center the image horizontally */
  position: absolute; /* Make the image positioned absolutely */
  top: 30%; /* Position the top edge at 0 (top of its container) */
  left: 37%;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
      background-color: rgba(262, 260, 268, 0.150);
    
  }

  /* Input styles */
  input[type="text"],
  input[type="password"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-bottom: 10px;
    width: 80%; /* Make inputs fill the full width */
      background-color: rgba(262, 260, 268, 0.150);
  }

  /* Submit button styles */
  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 89%; 
  }
  
.admin-login-image {
  width: 100px; /* Adjust width as needed */
  height: 100px; /* Adjust height as needed */
  margin: 0 auto; /* Center the image horizontally */
  position: absolute; /* Make the image positioned absolutely */
  top: 10%; /* Position the top edge at 0 (top of its container) */
  left: 50%; /* Position the horizontal center at 50% */
  transform: translateX(-50%); /* Offset the image left by half its width to center horizontally */
  background-image: url('images/delete.jpg'); /* Assuming you want the "delete.jpg" image */
  background-repeat: no-repeat;
  background-size: contain;
  /*<img class="admin-login-image" src="" alt="Admin Login Icon">  */
}

  /* H1 styles (optional) */
  h1 {
    text-align: center;
    margin-bottom: 20px;
  }
  </style>

</head>
<body>
<input type ="hidden" id ="status" value="<%=  request.getAttribute("status") %>"> 
<br><br>
     <h1>Admin Login</h1>
 
    

    <form action="signupServlet" method="post">
        Admin ID <input type="text" name="id" placeholder="Enter your ID"><br>
       Password <input type="password" name="pass" placeholder="Enter your password"><br>
        <input type="submit" name="submit" value="Sign Up">
        
    </form>
    
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js">  </script>
	<link rel ="stylesheet" href ="alert/dist/sweetalert.css">
	
	<script type ="text/javascript">
	   var status = document.getElementById("status").value;
	   if(status =="failed"){
		   swal("Sorry","Username or Password is incoorrect","error");
	   }
	
	</script>
    
</body>
</html>
