package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStudent = request.getParameter("id");
        String nameStudent = request.getParameter("name");
        String addressStudent = request.getParameter("add");
        String DOB_Student = request.getParameter("dob");
        String contactNoStudent = request.getParameter("no");
        String genderStudent = request.getParameter("gender");
        

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "it22109576");
            PreparedStatement pst = con.prepareStatement("insert into student(idStudent,nameStudent,addressStudent,DOB_Student,contactNoStudent,genderStudent)values(?,?,?,?,?,?)");
            pst.setString(1, idStudent);
            pst.setString(2, nameStudent);
            pst.setString(3, addressStudent);
            pst.setString(4, DOB_Student);
            pst.setString(5, contactNoStudent);
            pst.setString(6, genderStudent);
          

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher = request.getRequestDispatcher("Studentmanagement.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("Studentmanagement.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
