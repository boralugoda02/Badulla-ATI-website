<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = DBConnection.getConnection();

if(conn == null){
    out.println("Database not connected!");
    return;
}

// Visitor Count Update
PreparedStatement updateCount = conn.prepareStatement(
    "UPDATE visitor_count SET count = count + 1 WHERE id = 1"
);
updateCount.executeUpdate();
updateCount.close();

// Get Visitor Count
ResultSet countRs = conn.prepareStatement(
    "SELECT count FROM visitor_count WHERE id = 1"
).executeQuery();

countRs.next();
long visitorCount = countRs.getLong("count");
countRs.close();

// Get Carousel Images
ResultSet carouselRs = conn.prepareStatement(
    "SELECT * FROM gallery WHERE is_carousel = 1 ORDER BY upload_date DESC LIMIT 10"
).executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ATI Badulla</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background-image: url('<%= request.getContextPath() %>/images/BADULLA-BG-2-4.jpg'); 
    background-size: cover; 
    background-position: center; 
    background-attachment: fixed; 
    background-repeat: no-repeat; 
    background-color: #f4f4f4;
}

.navbar {
    background: #0d1b52 !important; 
    padding: 15px 0;
}

.glass-panel {
    background: rgba(255, 255, 255, 0.92);
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.18);
}

.course-card {
    background: #ffffff;
    border: none;
    border-radius: 12px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.course-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
}

footer {
    background: #09133a !important;
    color: #ffffff;
    font-size: 14px;
}

footer a {
    color: #cbd5e1;
    text-decoration: none;
    transition: color 0.2s ease;
}

footer a:hover {
    color: #3b82f6;
}

footer h5 {
    font-size: 16px;
    position: relative;
    padding-bottom: 8px;
}

footer h5::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 40px;
    height: 2px;
    background: #3b82f6;
}
</style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark">
<div class="container">
    <a class="navbar-brand fw-bold" href="index.jsp">ATI Badulla</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
            <a class="nav-link active" href="index.jsp">Home</a>
            <a class="nav-link" href="about.jsp">About</a>
            <a class="nav-link" href="courses.jsp">Courses</a>
            <a class="nav-link" href="admin/gallery.jsp">Gallery</a>
            <a class="nav-link" href="contact.jsp">Contact</a>
        </div>
    </div>
</div>
</nav>
<div style="background:#1a1a1a; color:#ffff00; padding:10px; font-size:15px; font-weight: 500;">
    <marquee behavior="scroll" direction="left" scrollamount="5" onmouseover="this.stop();" onmouseout="this.start();">
        <%
            try {
                
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery("SELECT title FROM notices ORDER BY id DESC");
                boolean hasNotice = false;
                while (rs1.next()) {
                    hasNotice = true;
        %>
                    📢 <%= rs1.getString("title") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
                }
                if (!hasNotice) {
        %>
                    Welcome to ATI Badulla!
        <%
                }
                rs1.close();
                st1.close();
            } catch (Exception e) {
                out.println("Notices loading error!");
            }
        %>
    </marquee>
</div>

<div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
<div class="carousel-inner">
<%
boolean first = true;
while(carouselRs.next()){
%>
    <div class="carousel-item <%= first ? "active" : "" %>">
        <img src="<%= carouselRs.getString("image_path") %>"
             class="d-block w-100"
             style="height:400px; object-fit:cover;" alt="Carousel Image">
    </div>
<%
first = false;
}
carouselRs.close();
%>
</div>
</div>

<div class="bg-light text-center py-2 border-bottom shadow-sm">
    <small class="text-secondary">👁 Website Visitors: <strong class="text-dark"><%= visitorCount %></strong></small>
</div>

<div class="container mt-5">
    <div class="glass-panel">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2 class="text-dark fw-bold mb-3">Welcome to ATI Badulla!</h2>
                <p class="text-muted fs-5">Advanced Technological Institute, Badulla. Providing high quality technological education to drive national development.</p>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow-sm p-3 border-0 bg-light">
                    <h5 class="fw-bold text-dark mb-3">Admin Portal</h5>
                    <a href="admin/login.jsp" class="btn btn-primary btn-md w-100 fw-bold">Login As Admin</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container my-5">
    <div class="glass-panel">
        <h3 class="text-dark fw-bold mb-4 border-bottom pb-2">Our Professional Courses</h3>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card course-card text-center p-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold text-primary mb-0">HNDIT</h5>
                        <small class="text-muted d-block mt-2">Information Technology</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card course-card text-center p-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold text-success mb-0">HNDE</h5>
                        <small class="text-muted d-block mt-2">English</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card course-card text-center p-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold text-danger mb-0">HNDA</h5>
                        <small class="text-muted d-block mt-2">Accountancy</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card course-card text-center p-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold text-warning mb-0">HNDM</h5>
                        <small class="text-muted d-block mt-2">Management</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card course-card text-center p-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold text-info mb-0">HNDTHM</h5>
                        <small class="text-muted d-block mt-2">Tourism & Hospitality</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-5 mt-5 shadow-lg">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <h5 class="fw-bold text-white mb-3">ATI Badulla</h5>
                <p class="text-secondary-emphasis" style="color: #94a3b8 !important;">
                    Advanced Technological Institute, Badulla.<br>
                    Providing top-tier technological education and fostering next-generation professionals.
                </p>
            </div>

            <div class="col-md-4">
                <h5 class="fw-bold text-white mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="index.jsp">🏠 Home</a></li>
                    <li class="mb-2"><a href="about.jsp">ℹ️ About Us</a></li>
                    <li class="mb-2"><a href="courses.jsp">📚 Our Courses</a></li>
                    <li class="mb-2"><a href="contact.jsp">📞 Contact Us</a></li>
                </ul>
            </div>

            <div class="col-md-4">
                <h5 class="fw-bold text-white mb-3">Contact Us</h5>
                <p class="mb-2" style="color: #94a3b8 !important;">📍 Greenland Drive, Badulla, Sri Lanka</p>
                <p class="mb-2" style="color: #94a3b8 !important;">📞 +94 55 222 3456</p>
                <p class="mb-2" style="color: #94a3b8 !important;">✉️ info@atibadulla.edu.lk</p>
            </div>
        </div>

        <hr class="my-4 border-secondary opacity-25">

        <div class="row align-items-center">
            <div class="col-md-12 text-center text-muted small">
                <p class="mb-0">&copy; <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %> ATI Badulla. All Rights Reserved.</p>
                <small class="text-secondary" style="font-size: 11px;">Designed & Developed for Academic Purposes</small>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%

if (conn != null) {
    conn.close();
}
%>