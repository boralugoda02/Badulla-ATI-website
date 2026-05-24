<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gallery - ATI Badulla</title>
    
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

       
        .gallery-card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            background: #ffffff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.06);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .gallery-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.15) !important;
        }

        
        .gallery-img-wrapper {
            overflow: hidden;
            height: 220px;
            background-color: #eaeaea;
        }

        .gallery-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .gallery-card:hover img {
            transform: scale(1.08); 
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
            <a class="nav-link" href="about.jsp">About Us</a>
            <a class="nav-link" href="courses.jsp">Courses</a>
            <a class="nav-link active" href="gallery.jsp">Gallery</a>
            <a class="nav-link" href="contact.jsp">Contact</a>
        </div>
    </div>
</div>
</nav>

<div class="container my-5">
    <div class="glass-panel">
        
        <h1 class="text-dark fw-bold mb-2 text-center">Campus Gallery</h1>
        <p class="text-muted text-center mb-5 fs-5">Beautiful moments and events at Advanced Technological Institute, Badulla.</p>
        
        <div class="row g-4">
            
            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/badulla-006.png" alt="ATI Badulla">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">ATI Badulla Campus Main View</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/img1.jpeg" alt="ATI Badulla Event">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">Academic Events & Activities</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/img2.jpeg" alt="ATI Badulla Event">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">Student Life at ATI</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/img3.jpeg" alt="ATI Badulla Event">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">Technological Lab Sessions</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/img4.jpeg" alt="ATI Badulla Event">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">Blood Doneted</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card gallery-card h-100">
                    <div class="gallery-img-wrapper">
                        <img src="<%= request.getContextPath() %>/images/img5.jpeg" alt="ATI Badulla Event">
                    </div>
                    <div class="card-body p-3 bg-white text-center">
                        <p class="card-text text-dark fw-semibold mb-0 small">Special Guest Blood Donetion</p>
                    </div>
                </div>
            </div>

        </div> </div>
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
                    <li class="mb-2"><a href="gallery.jsp">📸 Gallery</a></li>
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