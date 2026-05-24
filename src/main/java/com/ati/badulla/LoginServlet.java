
package com.ati.badulla;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.security.*;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        String encryptedPassword = sha256(password);
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, encryptedPassword);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", username);
                session.setMaxInactiveInterval(30 * 60); // 30 minutes
                response.sendRedirect("admin/dashboard.jsp");
                } else {
                // Login අසාර්ථකයි
                request.setAttribute("error", "Username හෝ Password වැරදිය!");
                request.getRequestDispatcher("admin/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    
    
    
    private String sha256(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            return input;
        }
    }
}

