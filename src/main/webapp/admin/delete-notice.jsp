<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
String id = request.getParameter("id");

Connection conn = DBConnection.getConnection();

PreparedStatement ps = conn.prepareStatement(
    "DELETE FROM notices WHERE id=?"
);

ps.setInt(1, Integer.parseInt(id));

ps.executeUpdate();

ps.close();
conn.close();

response.sendRedirect("manage-notices.jsp");
%>