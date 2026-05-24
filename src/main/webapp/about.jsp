<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>About Us - ATI Badulla</title>
    
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

        .vision-mission-box {
            background: #ffffff;
            border-left: 5px solid #0d1b52;
            padding: 15px;
            border-radius: 0 12px 12px 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
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
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link active" href="about.jsp">About Us</a>
            <a class="nav-link" href="courses.jsp">Courses</a>
            <a class="nav-link" href="admin/gallery.jsp">Gallery</a>
            <a class="nav-link" href="contact.jsp">Contact</a>
        </div>
    </div>
</div>
</nav>

<div class="container my-5">
    <div class="glass-panel">
        
        <h1 class="text-dark fw-bold mb-4 border-bottom pb-2">About ATI Badulla</h1>
        
        <div class="row g-5 align-items-center">
            <div class="col-md-8">
                <p class="text-muted fs-5" style="text-align: justify; line-height: 1.8;">
                    ATI Badulla is a leading educational institute providing higher national diploma and certificate courses. 
                    Operating under SLIATE, we are dedicated to expanding higher education opportunities and producing highly 
                    skilled professionals for national development.
                </p>
                
                <div class="row mt-4 g-3">
                    <div class="col-md-6">
                        <div class="vision-mission-box">
                            <h5 class="fw-bold text-dark">🎯 Our Vision</h5>
                            <p class="text-muted small mb-0">To become the center of excellence in technological education.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="vision-mission-box">
                            <h5 class="fw-bold text-dark">🚀 Our Mission</h5>
                            <p class="text-muted small mb-0">To create excellent professionals to drive socioeconomic development.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <div class="p-2 bg-white rounded shadow-sm">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA5HyBAPabU-wWCXiJc_MA86Bwpnbb-olorQ&s" 
                         class="img-fluid rounded w-100" 
                         alt="ATI Badulla Image" 
                         style="max-height: 250px; object-fit: cover;">
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
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>