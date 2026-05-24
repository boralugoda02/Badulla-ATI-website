<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%

String id = request.getParameter("id");

Connection conn = DBConnection.getConnection();

PreparedStatement ps = conn.prepareStatement(
    "DELETE FROM results WHERE id=?"
);

ps.setInt(1, Integer.parseInt(id));

ps.executeUpdate();

response.sendRedirect("manage-results.jsp");

%>