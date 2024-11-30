<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="Studentmanagment.css">
     
     
    <title>Student Management</title>
 

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    

</head>
<body>
    <h1>Student Management</h1>
    <hr>
    
    <!-- Form to add a new student -->
    <h2>Add Student</h2>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    
    
    <form id="studentForm" action="addStudent" method="post">
         <input type="text" name="id" placeholder="Student ID"required><br>
         <input type="text" name="name" placeholder=" Student Name"required><br>
         <input type="text" name="add" placeholder="Student Address"required><br>
         <input type="text" name="dob" id="datepicker" placeholder="Select DOB"required><br>
         <input type="text" name="no" id="phone" placeholder="Student Contact Number" required><br>
       
         <select name="gender">
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
        
        
        <div class ="button">
        <input type="submit" name="submit" value="Add Account">
        </div>
        
    </form>
    
    
    
    <div class="button-container">
        <form action="readStudent" method="get">
            <button type="submit" class="student-accounts-btn">View Student Accounts</button>
        </form>
    </div>
    
    
    

   <script>
   
// Check if any required fields are empty
   
   $(document).ready(function() {
       // Validate the form when submitted
       $("#studentForm").submit(function(event) {
          
           var isEmpty = false;
           $(this).find("input[required], select[required]").each(function() {
               if ($(this).val().trim() === '') {
                   isEmpty = true;
                   $(this).addClass('error'); 
               } else {
                   $(this).removeClass('error');
               }
           });

           // Validate phone number
           var phone = $("#phone").val();
           if (phone.length !== 10 || isNaN(phone)) {
               event.preventDefault();
               swal("Error", "Please enter a valid 10-digit phone number", "error");
           }

           // Prevent form submission if any required field is empty
           if (isEmpty) {
               event.preventDefault();
               swal("Error", "Please fill in all required fields", "error");
           }
       });

       // Bind date picker to DOB input field
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd', // Adjust date format if needed
           showOn: "button",
           buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
           buttonImageOnly: true,
           buttonText: "Select date"
       });

       // Retrieve status using jQuery
       var status = $("#status").val();
       if (status == "success") {
           swal("Congrats", "Account created successfully", "success");
       }
   });
</script>
   
</body>
</html>
