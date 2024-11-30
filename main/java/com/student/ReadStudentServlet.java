package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/readStudent")
public class ReadStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<student> students = new ArrayList<>();

        // Establishing database connection
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "it22109576")) {
            // Query to retrieve student data
            String query = "SELECT * FROM student";
            try (PreparedStatement pst = con.prepareStatement(query);
                 ResultSet rs = pst.executeQuery()) {

                // Iterating through result set and creating Student objects
                while (rs.next()) {
                    student student = new student();
                    student.setIdStudent(rs.getInt("idStudent"));
                    student.setNameStudent(rs.getString("nameStudent"));
                    student.setAddressStudent(rs.getString("addressStudent"));
                    student.setDOB_Student(rs.getString("DOB_Student"));
                    student.setContactNoStudent(rs.getString("contactNoStudent"));
                    student.setGenderStudent(rs.getString("genderStudent"));
                    

                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error in database operation", e);
        }

        // Set students attribute and forward to JSP
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ReadStudent.jsp");
        dispatcher.forward(request, response);
    }
}
