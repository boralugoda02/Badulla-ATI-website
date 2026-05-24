<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = DBConnection.getConnection();

String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){

    String courseName = request.getParameter("course_name");
    String duration = request.getParameter("duration");
    String fee = request.getParameter("fee");
    String description = request.getParameter("description");

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO courses(course_name,duration,fee,description) VALUES(?,?,?,?)"
    );

    ps.setString(1, courseName);
    ps.setString(2, duration);
    ps.setString(3, fee);
    ps.setString(4, description);

    int rows = ps.executeUpdate();

    if(rows > 0){
        message = "Course Added Successfully!";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Courses</title>

    <style>

        body{
            font-family:Arial;
            background:#f5f5f5;
            padding:20px;
        }

        form{
            background:white;
            padding:20px;
            border-radius:10px;
            width:500px;
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
            border-radius:5px;
            cursor:pointer;
        }

        table{
            width:100%;
            background:white;
            border-collapse:collapse;
        }

        table th, table td{
            border:1px solid #ddd;
            padding:10px;
        }

        table th{
            background:#007bff;
            color:white;
        }

        .delete-btn{
            background:red;
            color:white;
            padding:5px 10px;
            text-decoration:none;
            border-radius:5px;
        }

    </style>
</head>

<body>

<h1>Manage Courses</h1>

<p style="color:green;"><%= message %></p>

<form method="post">

    <input type="text"
           name="course_name"
           placeholder="Course Name"
           required>

    <input type="text"
           name="duration"
           placeholder="Duration"
           required>

    <input type="text"
           name="fee"
           placeholder="Course Fee"
           required>

    <textarea name="description"
              placeholder="Course Description"
              required></textarea>

    <button type="submit">Add Course</button>

</form>

<h2>Course List</h2>

<table>

<tr>
    <th>ID</th>
    <th>Course Name</th>
    <th>Duration</th>
    <th>Fee</th>
    <th>Description</th>
    <th>Action</th>
</tr>

<%

PreparedStatement ps2 = conn.prepareStatement(
    "SELECT * FROM courses ORDER BY id DESC"
);

ResultSet rs = ps2.executeQuery();

while(rs.next()){

%>

<tr>

    <td><%= rs.getInt("id") %></td>

    <td><%= rs.getString("course_name") %></td>

    <td><%= rs.getString("duration") %></td>

    <td><%= rs.getString("fee") %></td>

    <td><%= rs.getString("description") %></td>

    <td>

        <a class="delete-btn"
           href="deleteCourse.jsp?id=<%= rs.getInt("id") %>">

           Delete

        </a>

    </td>

</tr>

<%
}
%>

</table>

</body>
</html>