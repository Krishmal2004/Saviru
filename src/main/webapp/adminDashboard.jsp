<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Exam Management System</title>
    <link href="assets/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <style>
        .sidebar-dark {
            background: linear-gradient(180deg, #3a0ca3 0%, #4361ee 100%);
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-link {
            border-radius: 5px;
            margin: 0 10px;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            border: none;
            border-radius: 0.5rem;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
        }

        .content-wrapper {
            background-color: #f8f9fd;
        }

        .dashboard-card-icon {
            font-size: 2rem;
            opacity: 0.3;
            position: absolute;
            right: 20px;
            top: 15px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .fade-in {
            animation: fadeIn 0.5s;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .navbar-badge {
            font-size: .6rem;
            font-weight: 300;
            padding: 2px 4px;
            position: absolute;
            right: 5px;
            top: 9px;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="index.jsp" class="nav-link">Home</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">3 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 5 new students enrolled
                        <span class="float-right text-muted text-sm">30 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> New exam results posted
                        <span class="float-right text-muted text-sm">1 day</span>
                    </a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark elevation-4">
        <!-- Brand Logo -->
        <a href="adminDashboard" class="brand-link text-center">
                <span class="brand-text font-weight-light">
                    <i class="fas fa-graduation-cap"></i>
                    Admin Portal
                </span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="./assets/images/admin-avatar.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block"><%= session.getAttribute("adminUsername") %></a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
                    <li class="nav-item">
                        <a href="adminDashboard" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="examManagement" class="nav-link">
                            <i class="nav-icon fas fa-file-alt"></i>
                            <p>Exam Management</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="userManagement" class="nav-link">
                            <i class="nav-icon fas fa-users"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="resultManagement" class="nav-link">
                            <i class="nav-icon fas fa-chart-bar"></i>
                            <p>Results</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="settings" class="nav-link">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>Settings</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Admin Dashboard</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Dashboard Statistics -->
                <div class="row fade-in">
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>${totalExams}</h3>
                                <p>Total Exams</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-file-alt"></i>
                            </div>
                            <a href="examManagement" class="small-box-footer">
                                Manage Exams <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>${registeredStudents}</h3>
                                <p>Registered Students</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <a href="userManagement" class="small-box-footer">
                                Manage Users <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>${upcomingExams}</h3>
                                <p>Upcoming Exams</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <a href="examSchedule" class="small-box-footer">
                                View Schedule <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>${resultsPublished}</h3>
                                <p>Results Published</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-chart-pie"></i>
                            </div>
                            <a href="resultManagement" class="small-box-footer">
                                View Results <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Recent Activities and Quick Actions -->
                <div class="row fade-in">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-tasks mr-1"></i>
                                    Recent Exams
                                </h3>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Exam ID</th>
                                        <th>Title</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                    List<Map<String, String>> recentExams = (List<Map<String, String>>) request.getAttribute("recentExams");
                                    if(recentExams != null) {
                                        for(Map<String, String> exam : recentExams) {
                                            String statusClass = exam.get("status").equals("Upcoming") ? "bg-warning" : "bg-success";
                                    %>
                                    <tr>
                                        <td><%= exam.get("id") %></td>
                                        <td><%= exam.get("title") %></td>
                                        <td><%= exam.get("date") %></td>
                                        <td><span class="badge <%= statusClass %>"><%= exam.get("status") %></span></td>
                                        <td>
                                            <form action="examAction" method="post" style="display:inline;">
                                                <input type="hidden" name="examId" value="<%= exam.get("id") %>">
                                                <input type="hidden" name="action" value="edit">
                                                <button type="submit" class="btn btn-sm btn-primary">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </form>
                                            <form action="examAction" method="post" style="display:inline;">
                                                <input type="hidden" name="examId" value="<%= exam.get("id") %>">
                                                <input type="hidden" name="action" value="delete">
                                                <button type="submit" class="btn btn-sm btn-danger">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <% 
                                        }
                                    } 
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-bolt mr-1"></i>
                                    Quick Actions
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2">
                                    <form action="createExam" method="get" class="mb-3">
                                        <button type="submit" class="btn btn-primary w-100">
                                            <i class="fas fa-plus mr-2"></i> Create New Exam
                                        </button>
                                    </form>
                                    
                                    <form action="addUser" method="get" class="mb-3">
                                        <button type="submit" class="btn btn-success w-100">
                                            <i class="fas fa-user-plus mr-2"></i> Add New User
                                        </button>
                                    </form>
                                    
                                    <form action="publishResults" method="get" class="mb-3">
                                        <button type="submit" class="btn btn-info w-100">
                                            <i class="fas fa-chart-line mr-2"></i> Publish Results
                                        </button>
                                    </form>
                                    
                                    <form action="systemSettings" method="get">
                                        <button type="submit" class="btn btn-secondary w-100">
                                            <i class="fas fa-cog mr-2"></i> System Settings
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <strong>Copyright &copy; 2025 Exam Management System.</strong>
        All rights reserved.
    </footer>
</div>
<!-- ./wrapper -->

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./assets/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>