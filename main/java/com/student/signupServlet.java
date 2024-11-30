package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	
        String idAdmin = request.getParameter("id");
        String nameAdmin = request.getParameter("pass");

        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "it22109576");
            PreparedStatement pst = con.prepareStatement("select * from admin where idAdmin =? and nameAdmin = ? ");
            pst.setString(1, idAdmin);
            pst.setString(2, nameAdmin);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("pass", rs.getString("nameAdmin"));
                dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
                
            } else {
                request.setAttribute("status", "failed"); // error message
                dispatcher = request.getRequestDispatcher("home.jsp"); // Uncomment this line to handle failed login on signup.jsp
                dispatcher.forward(request, response);
             }
            
           

            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
