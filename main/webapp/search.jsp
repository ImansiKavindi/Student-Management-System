<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Student</title>
    <style>
        body {
          font-family: sans-serif;
         background-image: url('images/search.jpg');
         background-size: cover;
          
        }

        h1 {
          text-align: center;
          font-size: 2em;
          margin-bottom: 30px;
          margin-top: 60px;
        }

        form {
          display: flex;
          justify-content: center;
          align-items: center;
          margin: 0 auto;
          width: 50%;
        }

        form input[type="text"] {
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 10px;
          margin-right: 10px;
          width :50%;
        }

        form input[type="submit"] {
          padding: 10px 20px;
          background-color: #4CAF50; /* Green */
          color: white;
          border: none;
          border-radius: 8px;
          cursor: pointer;
        }

        form input[type="submit"]:hover {
          background-color: #3e8e41; /* Darker green */
        }

        .error-message {
          color: red;
          text-align: center;
          margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Search Students</h1>
    <form action="searchServlet" method="post">
      
        <input type="text" name="studentId" placeholder="Enter Student ID">
        <br>
        <input type="submit" value="Search">
    </form>
    <%-- Error Messages --%>
    <c:if test="${param.error == 'notfound'}">
                               <p>No student found with the specified ID.</p>
    </c:if>
    <c:if test="${param.error == 'db'}">
        <p>An error occurred while processing your request. Please try again later.</p>
    </c:if>
</body>
</html>
