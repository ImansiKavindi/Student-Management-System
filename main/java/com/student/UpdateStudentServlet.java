package com.student;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","it22109576");
            
            BufferedReader reader = request.getReader();
            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            JSONObject jsonObject = new JSONObject(jsonBuilder.toString());

            String idStudent = jsonObject.getString("idStudent");
            String nameStudent = jsonObject.getString("nameStudent");
            String addressStudent = jsonObject.getString("addressStudent");
            String dobStudent = jsonObject.getString("DOB_Student");
            String contactNoStudent = jsonObject.getString("contactNoStudent");
            String genderStudent = jsonObject.getString("genderStudent");

            String sql = "UPDATE school.student SET nameStudent=?, addressStudent=?, DOB_Student=?, contactNoStudent=?, genderStudent=? WHERE idStudent=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, nameStudent);
            pst.setString(2, addressStudent);
            pst.setString(3, dobStudent);
            pst.setString(4, contactNoStudent);
            pst.setString(5, genderStudent);
            pst.setString(6, idStudent);

            int rowCount = pst.executeUpdate();

            JSONObject jsonResponse = new JSONObject();
            if (rowCount > 0) {
                jsonResponse.put("status", "success");
            } else {
                jsonResponse.put("status", "failure");
            }
            out.print(jsonResponse.toString());

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", e.getMessage());
            out.print(jsonResponse.toString());

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
        