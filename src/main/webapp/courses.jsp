<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Courses - ATI Badulla</title>
    
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

        
        .course-page-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course-page-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.15) !important;
        }

        .badge-duration {
            background-color: #e2e8f0;
            color: #475569;
            font-weight: 600;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
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
            <a class="nav-link active" href="courses.jsp">Courses</a>
            <a class="nav-link" href="admin/gallery.jsp">Gallery</a>
            <a class="nav-link" href="contact.jsp">Contact</a>
        </div>
    </div>
</div>
</nav>

<div class="container my-5">
    <div class="glass-panel">
        
        <h1 class="text-dark fw-bold mb-4 border-bottom pb-2 text-center">Our Academic Programs</h1>
        <p class="text-muted text-center mb-5 fs-5">Explore the Higher National Diploma (HND) courses offered at Advanced Technological Institute, Badulla.</p>
        
        <div class="row g-4 justify-content-center">
            
            <div class="col-md-4">
                <div class="card course-page-card h-100 p-4 shadow-sm text-center">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="fw-bold text-primary mb-3">HNDIT</h3>
                            <p class="text-muted small">Higher National Diploma in Information Technology</p>
                        </div>
                        <div class="mt-4">
                            <span class="badge-duration">⏱️ Duration: 2 Years</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card course-page-card h-100 p-4 shadow-sm text-center">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="fw-bold text-success mb-3">HNDE</h3>
                            <p class="text-muted small">Higher National Diploma in Engineering</p>
                        </div>
                        <div class="mt-4">
                            <span class="badge-duration">⏱️ Duration: 2 Years</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card course-page-card h-100 p-4 shadow-sm text-center">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="fw-bold text-warning mb-3" style="color: #d97706 !important;">HNDM</h3>
                            <p class="text-muted small">Higher National Diploma in Management</p>
                        </div>
                        <div class="mt-4">
                            <span class="badge-duration">⏱️ Duration: 3 Years</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card course-page-card h-100 p-4 shadow-sm text-center">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="fw-bold text-danger mb-3">HNDA</h3>
                            <p class="text-muted small">Higher National Diploma in Accountancy</p>
                        </div>
                        <div class="mt-4">
                            <span class="badge-duration">⏱️ Duration: 4 Years</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card course-page-card h-100 p-4 shadow-sm text-center">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="fw-bold text-info mb-3">HNDTHM</h3>
                            <p class="text-muted small">Higher National Diploma in Tourism & Hospitality Management</p>
                        </div>
                        <div class="mt-4">
                            <span class="badge-duration">⏱️ Duration: 3 Years</span>
                        </div>
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