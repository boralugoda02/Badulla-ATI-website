<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    conn = DBConnection.getConnection();
    ps = conn.prepareStatement("SELECT * FROM gallery");
    rs = ps.executeQuery();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Gallery - ATI Badulla</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
        }
        
        
        .sidebar {
            height: 100vh;
            background: #0d1b52;
            color: white;
            position: fixed;
            top: 0; left: 0; width: 260px;
            padding-top: 20px;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-brand {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }
        
        .sidebar-menu a {
            display: block;
            padding: 12px 25px;
            color: #cbd5e1;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(255, 255, 255, 0.08);
            color: #ffffff;
            border-left: 4px solid #3b82f6;
        }
        
        
        .main-content {
            margin-left: 260px;
            padding: 40px;
        }
        
        
        .gallery-card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
            transition: transform 0.2s;
        }
        
        .gallery-card:hover {
            transform: translateY(-3px);
        }
        
        .gallery-img-container {
            height: 180px;
            background-color: #e2e8f0;
            overflow: hidden;
        }
        
        .gallery-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="sidebar-brand">ATI Badulla Admin</div>
    <div class="sidebar-menu">
        <a href="dashboard.jsp">📊 Dashboard</a>
        <a href="manage-notices.jsp">📢 Manage Notices</a>
        <a href="gallery.jsp" class="active">📸 Manage Gallery</a>
        <a href="manage-courses.jsp">📚 Manage Courses</a>
        <a href="manage-results.jsp">🎓 Manage Results</a>
        <hr class="text-secondary my-2">
        <a href="../index.jsp" target="_blank">🏠 View Website</a>
    </div>
</div>

<div class="main-content">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold text-dark mb-1">Manage Gallery</h2>
            <p class="text-muted mb-0">View or delete images stored in the database.</p>
        </div>
        <a href="uploadImage.jsp" class="btn btn-primary fw-bold">+ Add New Image</a>
    </div>
    
    <div class="row g-4">
    
    <%
    if (rs != null) {
        boolean dataFound = false;
        while(rs.next()){
            dataFound = true;
            String imagePath = rs.getString("image_path");
            
            
            if(imagePath != null && !imagePath.startsWith("http") && !imagePath.startsWith("../")) {
                imagePath = "../" + imagePath;
            }
    %>
        <div class="col-md-4 col-sm-6">
            <div class="card gallery-card">
                <div class="gallery-img-container">
                    <img src="<%= imagePath %>" alt="Gallery Image">
                </div>
                <div class="p-3">
                    <h5 class="fw-bold text-dark text-truncate fs-6 mb-3"><%= rs.getString("caption") %></h5>
                    
                    <form action="deleteImage.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this image?');">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm w-100 fw-bold">🗑️ Delete Image</button>
                    </form>
                </div>
            </div>
        </div>
    <% 
        } 
        
        if (!dataFound) {
    %>
        <div class="col-12 text-center py-5">
            <div class="alert alert-warning d-inline-block px-5 py-3 rounded-3 shadow-sm">
                ⚠️ <strong>No Images Found!</strong> Your database 'gallery' table is empty.
            </div>
        </div>
    <%
        }
    } else {
    %>
        <div class="col-12 text-center py-5">
            <div class="alert alert-danger d-inline-block px-5 py-3 rounded-3 shadow-sm">
                ❌ <strong>Error!</strong> Database connection issue or table does not exist.
            </div>
        </div>
    <% } %>
    
    </div> </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<%
try {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>