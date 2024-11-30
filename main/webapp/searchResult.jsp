<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.student.student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <title>Student Profile</title>
    <style>
    
    
     body {
          font-family: sans-serif;
         background-image: url('images/stu.jpg');
         background-size: cover;
         
    
        }
    
        .profile {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            margin: 20px auto;
            max-width: 400px;
            background-color:rgba(262, 260, 268, 0.150);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left:460px;
            top:100%;
        }
        .profile-item {
            margin-bottom: 15px;
        }
        .profile-label {
            font-weight: bold;
            color: #fff;
        }
        .profile-value {
            color: #fff;
        }
        .profile-header {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #fff;
        }
        
           .my-image {
            text-align: center; /* Center the image horizontally */
            margin-bottom: 10px;  /* Add some space below the image */
        }
        .my-image img {
            width: 120px;  /* Set the image width to 100 pixels */
            height: 120px;   /* Maintain aspect ratio based on width */
        }
        
        
    </style>
</head>
<body>
 <a href="home.jsp" style="color: #fff; font-size: 20px; text-decoration: none;">
    <i class="fas fa-th-large" style="font-size: 24px; color: #ffff;"></i>
    Dashboard
</a>
 
    <div class="profile">
        <div class="profile-header">Student Profile</div>
        <div class ="my-image">
        <img src="images/student.png" alt="student icon" >
        </div>
        <c:if test="${not empty student}">
            <div class="profile-item">
            
                <span class="profile-label">ID :</span>
                <span class="profile-value">${student.idStudent}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Name :</span>
                <span class="profile-value">${student.nameStudent}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Address :</span>
                <span class="profile-value">${student.addressStudent}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">DOB :</span>
                <span class="profile-value">${student.DOB_Student}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Contact Number :</span>
                <span class="profile-value">${student.contactNoStudent}</span>
            </div>
            <div class="profile-item">
                <span class="profile-label">Gender :</span>
                <span class="profile-value">${student.genderStudent}</span>
            </div>
        </c:if>
    </div>
</body>
</html>
