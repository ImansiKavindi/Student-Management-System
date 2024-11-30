<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UnSuccessful</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        text-align: center;
    }
    .image-container {
        width: 600px;
        height: 300px;
        margin: 0 auto;
        background-image: url('images/error.png');
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
    }
    h1 {
        font-size: 2rem;
        color: #333;
        margin-top: 0.5rem;
    }
    p {
        font-size: 1.1rem;
        color: #666;
        margin-bottom: 0;
    }
    
 
</style>
</head>
<body>
    <div class="container">
        <div class="image-container"></div>
        <h1>Deletion unsuccessful</h1>
        <p>There was a problem deleting the student.</p><br>
     
    </div>
   
</body>
</html>
