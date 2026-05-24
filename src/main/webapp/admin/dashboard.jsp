<%@ page import="java.sql.*" %>
<%@ page import="com.ati.badulla.DBConnection" %>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rsMessages = null;

int noticeCount = 0;
int galleryCount = 0;
int courseCount = 0;
int resultCount = 0;

try {
    conn = DBConnection.getConnection();
    if (conn != null) {
        stmt = conn.createStatement();

        
        rs1 = stmt.executeQuery("SELECT COUNT(*) FROM notices");
        if(rs1.next()) noticeCount = rs1.getInt(1);
        rs1.close();

        
        rs2 = stmt.executeQuery("SELECT COUNT(*) FROM gallery");
        if(rs2.next()) galleryCount = rs2.getInt(1);
        rs2.close();

        
        rs3 = stmt.executeQuery("SELECT COUNT(*) FROM courses");
        if(rs3.next()) courseCount = rs3.getInt(1);
        rs3.close();

        
        rs4 = stmt.executeQuery("SELECT COUNT(*) FROM results");
        if(rs4.next()) resultCount = rs4.getInt(1);
        rs4.close();

        
        rsMessages = stmt.executeQuery("SELECT * FROM contact_messages ORDER BY submitted_at DESC LIMIT 5");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard - ATI Badulla</title>
    
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
        
        
        .card-link {
            text-decoration: none;
            color: inherit;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }
        
        
        .border-notice { border-left: 5px solid #ff9800; }
        .border-gallery { border-left: 5px solid #2196f3; }
        .border-course { border-left: 5px solid #4caf50; }
        .border-result { border-left: 5px solid #e91e63; }
        
        .number {
            font-size: 32px;
            font-weight: 700;
            color: #1e293b;
            margin-top: 5px;
        }
        
        
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.02);
            margin-top: 35px;
        }
        
        .table thead {
            background-color: #f8fafc;
            color: #475569;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="sidebar-brand">ATI Badulla Admin</div>
    <div class="sidebar-menu">
        <a href="dashboard.jsp" class="active">? Dashboard</a>
        <a href="manage-notices.jsp">? Manage Notices</a>
        <a href="gallery.jsp">? Manage Gallery</a>
        <a href="manage-courses.jsp">? Manage Courses</a>
        <a href="manage-results.jsp">? Manage Results</a>
        <hr class="text-secondary my-2">
        <a href="../index.jsp" target="_blank">? View Website</a>
    </div>
</div>

<div class="main-content">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold text-dark mb-1">Admin Dashboard</h2>
            <p class="text-muted mb-0">Overview of ATI Badulla Portal management.</p>
        </div>
        <a href="../index.jsp" class="btn btn-outline-danger btn-sm fw-bold px-3 py-2">Logout</a>
    </div>
    
    <div class="row g-4">
        
        <div class="col-md-3">
            <a href="manage-notices.jsp" class="card-link">
                <div class="card stat-card border-notice">
                    <h6 class="text-uppercase text-muted fw-bold small mb-1">? Notices</h6>
                    <div class="number"><%= noticeCount %></div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="gallery.jsp" class="card-link">
                <div class="card stat-card border-gallery">
                    <h6 class="text-uppercase text-muted fw-bold small mb-1">? Gallery Items</h6>
                    <div class="number"><%= galleryCount %></div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="manage-courses.jsp" class="card-link">
                <div class="card stat-card border-course">
                    <h6 class="text-uppercase text-muted fw-bold small mb-1">? Courses</h6>
                    <div class="number"><%= courseCount %></div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="manage-results.jsp" class="card-link">
                <div class="card stat-card border-result">
                    <h6 class="text-uppercase text-muted fw-bold small mb-1">? Results Info</h6>
                    <div class="number"><%= resultCount %></div>
                </div>
            </a>
        </div>
        
    </div>
    
    <div class="table-container">
        <h4 class="fw-bold text-dark mb-4">? Recent Contact Messages</h4>
        
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead>
                    <tr>
                        <th class="py-3 px-3">ID</th>
                        <th class="py-3">Name</th>
                        <th class="py-3">Email</th>
                        <th class="py-3">Subject</th>
                        <th class="py-3">Message</th>
                        <th class="py-3">Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    if (rsMessages != null && conn != null) {
                        boolean hasData = false;
                        while (rsMessages.next()) { 
                            hasData = true;
                    %>
                        <tr>
                            <td class="fw-bold text-secondary px-3">#<%= rsMessages.getInt("id") %></td>
                            <td class="fw-semibold text-dark"><%= rsMessages.getString("name") %></td>
                            <td class="text-muted"><%= rsMessages.getString("email") %></td>
                            <td><span class="badge bg-light text-dark border"><%= rsMessages.getString("subject") %></span></td>
                            <td style="max-width: 250px;" class="text-truncate"><%= rsMessages.getString("message") %></td>
                            <td class="small text-muted"><%= rsMessages.getTimestamp("submitted_at") %></td>
                        </tr>
                    <% 
                        }
                        if (!hasData) {
                    %>
                        <tr>
                            <td colspan="6" class="text-center py-4 text-muted">No recent messages received yet.</td>
                        </tr>
                    <%
                        }
                    } else { 
                    %>
                        <tr>
                            <td colspan="6" class="text-center py-4 text-danger">Database connection or table structure missing!</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<%

try {
    if (rsMessages != null) rsMessages.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>
