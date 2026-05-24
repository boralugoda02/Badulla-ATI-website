<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = DBConnection.getConnection();

String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){

    String student = request.getParameter("student_name");
    String subject = request.getParameter("subject");
    int marks = Integer.parseInt(request.getParameter("marks"));

    String grade = "";

    if(marks >= 75){
        grade = "A";
    }else if(marks >= 65){
        grade = "B";
    }else if(marks >= 50){
        grade = "C";
    }else{
        grade = "F";
    }

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO results(student_index,student_name,subject,marks,grade) VALUES(?,?,?,?,?)"
    );

    ps.setString(1, request.getParameter("student_index"));
    ps.setString(2, student);
    ps.setString(3, subject);
    ps.setInt(4, marks);
    ps.setString(5, grade);

    int rows = ps.executeUpdate();

    if(rows > 0){
        message = "Result Added Successfully!";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Results</title>

    <style>
        body{
            font-family:Arial;
            background:#f5f5f5;
            padding:20px;
        }

        form{
            background:white;
            padding:20px;
            width:500px;
            border-radius:10px;
            margin-bottom:30px;
        }

        input{
            width:100%;
            padding:10px;
            margin-top:10px;
            margin-bottom:15px;
        }

        button{
            background:#28a745;
            color:white;
            border:none;
            padding:10px 20px;
            border-radius:5px;
        }

        table{
            width:100%;
            background:white;
            border-collapse:collapse;
        }

        th, td{
            border:1px solid #ddd;
            padding:10px;
        }

        th{
            background:#28a745;
            color:white;
        }

        .delete{
            background:red;
            color:white;
            padding:5px 10px;
            text-decoration:none;
            border-radius:5px;
        }
    </style>
</head>

<body>

<h1>Manage Results</h1>

<p style="color:green;"><%= message %></p>

<form method="post">
    
    <input type="text"
       name="student_index"
       placeholder="Student Index"
       required>

    <input type="text"
           name="student_name"
           placeholder="Student Name"
           required>

    <input type="text"
           name="subject"
           placeholder="Subject"
           required>

    <input type="number"
           name="marks"
           placeholder="Marks"
           required>

    <button type="submit">Add Result</button>

</form>

<h2>Results List</h2>

<table>

<tr>
    <th>ID</th>
    <th>Student</th>
    <th>Subject</th>
    <th>Marks</th>
    <th>Grade</th>
    <th>Action</th>
</tr>

<%

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM results ORDER BY id DESC"
);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<tr>

    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("student_name") %></td>
    <td><%= rs.getString("subject") %></td>
    <td><%= rs.getInt("marks") %></td>
    <td><%= rs.getString("grade") %></td>

    <td>
        <a class="delete"
           href="deleteResult.jsp?id=<%= rs.getInt("id") %>">
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