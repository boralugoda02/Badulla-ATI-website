<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = DBConnection.getConnection();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Notices</title>

    <style>
        body{
            font-family: Arial;
            background:#f5f5f5;
            padding:30px;
        }

        h1{
            color:#333;
        }

        form{
            background:white;
            padding:20px;
            width:400px;
            border-radius:10px;
            margin-bottom:30px;
        }

        input, textarea{
            width:100%;
            padding:10px;
            margin-top:10px;
            margin-bottom:15px;
        }

        button{
            background:#007bff;
            color:white;
            border:none;
            padding:10px 20px;
            cursor:pointer;
        }

        table{
            width:100%;
            background:white;
            border-collapse:collapse;
        }

        table th, table td{
            border:1px solid #ddd;
            padding:12px;
        }

        table th{
            background:#007bff;
            color:white;
        }

        a{
            text-decoration:none;
            color:red;
        }
    </style>
</head>

<body>

<h1>Manage Notices</h1>

<!-- ADD NOTICE FORM -->

<form method="post">

    <input type="text" name="title" placeholder="Notice Title" required>

    <textarea name="content" placeholder="Notice Content" required></textarea>

    <button type="submit" name="addNotice">Add Notice</button>

</form>

<%

if(request.getParameter("addNotice") != null){

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO notices(title, content) VALUES(?,?)"
    );

    ps.setString(1, title);
    ps.setString(2, content);

    ps.executeUpdate();

    out.println("<p style='color:green;'>Notice Added Successfully!</p>");
}

%>

<!-- SHOW NOTICES -->

<table>

<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Content</th>
    <th>Action</th>
</tr>

<%

Statement st = conn.createStatement();

ResultSet rs = st.executeQuery("SELECT * FROM notices ORDER BY id DESC");

while(rs.next()){

%>

<tr>

    <td><%= rs.getInt("id") %></td>

    <td><%= rs.getString("title") %></td>

    <td><%= rs.getString("content") %></td>

    <td>

<a href="delete-notice.jsp?id=<%= rs.getInt("id") %>"
   onclick="return confirm('Are you sure to delete this notice?')">

<button style="
background:#dc3545;
color:white;
border:none;
padding:8px 15px;
border-radius:5px;
cursor:pointer;
">

Delete

</button>

</a>

</td>

</tr>

<%
}
%>

</table>

</body>
</html>