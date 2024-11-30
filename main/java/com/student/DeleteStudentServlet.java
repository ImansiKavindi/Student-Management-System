package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "it22109576");
            pst = con.prepareStatement("delete from student where idStudent = ?");
            pst.setString(1, id);

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                response.sendRedirect("success.jsp"); // Redirect to student management page after deletion
            } else {
                // Handle deletion failure
            	 response.sendRedirect("unsuccess.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle errors
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
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
