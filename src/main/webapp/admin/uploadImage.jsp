<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload Image</title>

    <style>

        body{
            font-family: Arial;
            background:#f5f5f5;
            padding:40px;
        }

        form{
            background:white;
            padding:20px;
            width:400px;
            border-radius:10px;
        }

        input{
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

    </style>
</head>

<body>

<h1>Upload Gallery Image</h1>

<%
String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){

    try{

        String caption = request.getParameter("caption");
        out.println("POST WORKING");
        Part filePart = request.getPart("image");

        if(filePart != null){

            String fileName = filePart.getSubmittedFileName();

            String savePath = "uploads/" + fileName;

            String uploadPath = application.getRealPath("/") + "uploads";

            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            filePart.write(uploadPath + File.separator + fileName);

            Connection conn = DBConnection.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO gallery(image_path, caption) VALUES(?,?)"
            );

            ps.setString(1, savePath);
            ps.setString(2, caption);

            int rows = ps.executeUpdate();
            out.println("INSERT SUCCESS");

            if(rows > 0){
                message = "Image Uploaded Successfully!";
            }else{
                message = "Database Insert Failed!";
            }

            ps.close();
            conn.close();

        }else{

            message = "Please select image!";

        }

    }catch(Exception e){

        message = e.toString();

    }
}
%>

<p style="color:green;"><%= message %></p>

<form action="../UploadImageServlet"
      method="post"
      enctype="multipart/form-data">

    <input type="text"
           name="caption"
           placeholder="Image Caption"
           required>

    <input type="file"
           name="image"
           required>

    <button type="submit">Upload Image</button>

</form>

</body>
</html>