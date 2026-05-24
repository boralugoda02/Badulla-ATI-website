<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ati.badulla.DBConnection"%>

<%
String successMessage = null;
String errorMessage = null;


if ("POST".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String messageText = request.getParameter("message");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        
        conn = DBConnection.getConnection();
        
        if (conn != null) {
            String sql = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, messageText);

            int row = ps.executeUpdate();
            if (row > 0) {
                successMessage = "Your message has been sent successfully! We will contact you soon.";
            } else {
                errorMessage = "Failed to send the message. Please try again.";
            }
        } else {
            errorMessage = "Database connection failed! Check your DBConnection class.";
        }
    } catch (Exception e) {
        errorMessage = "Error occurred: " + e.getMessage();
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Us - ATI Badulla</title>
    
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
            padding: 40px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        
        .contact-detail-item {
            background: #ffffff;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.03);
            border-left: 4px solid #0d1b52;
        }

        
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #cbd5e1;
        }

        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(13, 27, 82, 0.2);
            border-color: #0d1b52;
        }

        .map-container {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        
        footer {
            background: #09133a !important;
            color: #ffffff;
            font-size: 14px;
        }

        footer a {
            color: #cbd5e1;
            text-decoration: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
<div class="container">
    <a class="navbar-brand fw-bold" href="index.jsp">ATI Badulla</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="about.jsp">About Us</a>
            <a class="nav-link" href="courses.jsp">Courses</a>
            <a class="nav-link" href="gallery.jsp">Gallery</a>
            <a class="nav-link active" href="contact.jsp">Contact</a>
        </div>
    </div>
</div>
</nav>

<div class="container my-5">
    <div class="glass-panel">
        
        <h1 class="text-dark fw-bold mb-2 text-center">Contact Us</h1>
        <p class="text-muted text-center mb-5 fs-5">We'd love to hear from you. Get in touch with us today!</p>
        
        <% if (successMessage != null) { %>
            <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                ✨ <strong>Success!</strong> <%= successMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                ⚠️ <strong>Error!</strong> <%= errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        
        <div class="row g-5">
            <div class="col-md-6">
                <h4 class="fw-bold text-dark mb-4">📩 Send Us a Message</h4>
                
                <form action="contact.jsp" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-secondary">Your Name</label>
                        <input type="text" name="name" class="form-control" placeholder="John Doe" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-secondary">Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-secondary">Subject</label>
                        <input type="text" name="subject" class="form-control" placeholder="Inquiry about HNDIT" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-semibold text-secondary">Message</label>
                        <textarea name="message" class="form-control" rows="4" placeholder="Write your message here..." required></textarea>
                    </div>
                    <button type="submit" class="btn w-100 text-white fw-bold py-3 shadow-sm" style="background-color: #0d1b52;">Submit Message</button>
                </form>
            </div>

            <div class="col-md-6">
                <h4 class="fw-bold text-dark mb-4">📍 Contact Details</h4>
                <div class="contact-detail-item">
                    <h6 class="fw-bold text-dark mb-1">🏢 Address</h6>
                    <p class="text-muted mb-0">Advanced Technological Institute, Greenland Drive, Badulla.</p>
                </div>
                <div class="contact-detail-item">
                    <h6 class="fw-bold text-dark mb-1">📞 Phone Number</h6>
                    <p class="text-muted mb-0">077 123 4555 / +94 55 222 3456</p>
                </div>
                <div class="contact-detail-item">
                    <h6 class="fw-bold text-dark mb-1">✉️ Email Address</h6>
                    <p class="text-muted mb-0">ati@badulla.com / info@atibadulla.edu.lk</p>
                </div>
                <div class="mt-4 map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.23126780365!2d81.0494435747576!3d6.982015093018861!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae4623e66bbd0bf%3A0x64cf5d134b266bb0!2sAdvanced%20Technological%20Institute%20-%20Badulla!5e0!3m2!1sen!2slk!4v1716107000000!5m2!1sen!2slk" width="100%" height="210" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>

    </div>
</div>

<footer class="py-4 mt-5 text-center text-muted small border-top bg-light">
    <p class="mb-0">&copy; <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %> ATI Badulla. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>