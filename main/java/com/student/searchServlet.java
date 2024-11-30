package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStudent = request.getParameter("studentId");

        // Database Connection
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "it22109576");

            String sql = "SELECT * FROM student WHERE idStudent = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, idStudent);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Student found, create Student object with retrieved data
                student student = new student();
                student.setIdStudent(rs.getInt("idStudent"));
                student.setNameStudent(rs.getString("nameStudent"));
                student.setAddressStudent(rs.getString("addressStudent"));
                student.setDOB_Student(rs.getString("DOB_Student"));
                student.setContactNoStudent(rs.getString("contactNoStudent"));
                student.setGenderStudent(rs.getString("genderStudent"));

                // Set student as an attribute in request
                request.setAttribute("student", student);

                // Forward the request to searchResult.jsp
                request.getRequestDispatcher("searchResult.jsp").forward(request, response);
            } else {
                // No student found with the specified ID
                response.sendRedirect("search.jsp?error=notfound");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle database errors
            response.sendRedirect("search.jsp?error=db");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
