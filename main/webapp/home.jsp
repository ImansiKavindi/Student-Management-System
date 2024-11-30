<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="home.css">
    <title>Admin panel</title>
</head>

<body>
    <div class="background"></div>
    <div class="container">
        <div class="topbar">
            <div class="logo">
                <img src="images/logo.png" alt="Logo">
            </div>
            <h1>St'  Joseph's  College - Colombo </h1>
            
        </div>
        <div class="sidebar">
            <ul>
                <li>
                    <a href="#">
                        <i class="fas fa-th-large"></i>
                        <div>Dashboard</div>
                    </a>
                </li>
                <li>
                    <a href="search.jsp" style = "text-decoration: none;">
                        <i class="fas fa-user-graduate"></i>
                        <div>Students Profiles</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chalkboard-teacher"></i>
                        <div>Time Tables</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-users"></i>
                        <div>Notices</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>
                        <div>Attendance</div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="main">
            <div class="btn-group"> 

            <button class="btn manage-attendance">
                <i class="fas fa-chart-bar"></i>
                Manage Attendance
              </button>
              
              <button class="btn manage-student">
              <a href="Studentmanagement.jsp" style = "text-decoration: none;">
                <i class="fas fa-user"></i>
                Manage Student
              </button>
              </a>
              </div>

              <div class="btn-group">
              <button class="btn manage-time-table">
                <i class="far fa-calendar-alt"></i>
                Manage Time Table
              </button>
              
              <button class="btn manage-notice">
                <i class="far fa-bell"></i>
                Manage Notice
              </button>


            </div>
            </div> 
    </div>
</body>


</html>