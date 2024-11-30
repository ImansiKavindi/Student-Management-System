<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="raad.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        
        
    <title>Student Management</title>
    <style>
        /* Hide input fields by default */
        .edit-input {
            display: none;
        }
    </style>
</head>
<body>
    <h1>Student Management</h1>
    <a href="home.jsp" style="color: #fff; font-size: 20px; text-decoration: none;">
    <i class="fas fa-th-large" style="font-size: 24px; color: #ffff;"></i>
    Dashboard
</a>
     
    <hr>

    <h2>Student List</h2>
    <c:choose>
        <c:when test="${not empty students}">
            <table border="1">
                <tr class="table-header">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Contact Number</th>
                    <th>Gender</th>
                    <th>Options</th>
                    <th>Options</th>
                </tr>
                <c:forEach items="${students}" var="student">
                    <tr id="row-${student.idStudent}">
                        <td>${student.idStudent}</td>
                        <td>
                            <span class="display-value">${student.nameStudent}</span>
                            <input type="text" class="edit-input" name="name" value="${student.nameStudent}" readonly>
                        </td>
                        <td>
                            <span class="display-value">${student.addressStudent}</span>
                            <input type="text" class="edit-input" name="address" value="${student.addressStudent}" readonly>
                        </td>
                        <td>
                            <span class="display-value">${student.DOB_Student}</span>
                            <input type="text" class="edit-input" name="dob" value="${student.DOB_Student}" readonly>
                        </td>
                        <td>
                            <span class="display-value">${student.contactNoStudent}</span>
                            <input type="text" class="edit-input" name="contactNo" value="${student.contactNoStudent}" readonly>
                        </td>
                        <td>
                            <span class="display-value">${student.genderStudent}</span>
                            <input type="text" class="edit-input" name="gender" value="${student.genderStudent}" readonly>
                        </td>
                        <td>
                            <button class="edit-button" onclick="editRow(${student.idStudent})">Edit</button>
                            <button class="save-button" onclick="saveEdit(${student.idStudent})" style="display: none;">Save</button>
                        </td>
                        <td>
                            <form action="deleteStudent" method="post" onsubmit="return confirm('Are you sure you want to delete this student?')">
                                <input type="hidden" name="id" value="${student.idStudent}">
                                <input type="submit" value="Delete">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p>No students found.</p>
        </c:otherwise>
    </c:choose>

    <script>
        function editRow(idStudent) {
            var row = document.getElementById("row-" + idStudent);
            var displayValues = row.querySelectorAll(".display-value");
            var editInputs = row.querySelectorAll(".edit-input");
            var saveButton = row.querySelector(".save-button");
            var editButton = row.querySelector(".edit-button");

            for (var i = 0; i < displayValues.length; i++) {
                displayValues[i].style.display = "none";
                editInputs[i].style.display = "inline";
                editInputs[i].readOnly = false;
            }

            saveButton.style.display = "inline";
            editButton.style.display = "none";
        }

        function saveEdit(idStudent) {
            var row = document.getElementById("row-" + idStudent);
            var editInputs = row.querySelectorAll(".edit-input");
            var saveButton = row.querySelector(".save-button");
            var editButton = row.querySelector(".edit-button");

            var data = {};
            data["idStudent"] = idStudent;

            editInputs.forEach(function(input) {
                data[input.name] = input.value;
                input.readOnly = true;
            });

            var jsonData = JSON.stringify(data);
            
            fetch("/updateStudent", {
                method: "POST",
                body: jsonData,
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    alert("Failed to save student details");
                } else {
                    alert("Student details saved successfully.");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Student details saved successfully.");
            });

            saveButton.style.display = "none";
            editButton.style.display = "inline";
        }
            
            
           
    </script>
</body>
</html>