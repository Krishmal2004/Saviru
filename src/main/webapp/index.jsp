<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real Estate Agent Finder - Home</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        /* Common Styles */
        :root {
            --primary-color: #0a1f44;
            --secondary-color: #1a3a6c;
            --accent-color: #4a90e2;
            --text-light: #ffffff;
            --text-dark: #333333;
        }

        body {
            font-family: 'Arial', sans-serif;
            overflow-x: hidden;
        }

        /* Header Styles */
        .navbar {
            background: rgba(10, 31, 68, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 0;
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            padding: 0.5rem 0;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--text-light) !important;
        }

        .nav-link {
            color: var(--text-light) !important;
            margin: 0 10px;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent-color);
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .user-profile {
            display: flex;
            align-items: center;
            color: var(--text-light);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            border: 2px solid var(--accent-color);
            padding: 2px;
        }

        /* Hero Section */
        .hero-section {
            height: 80vh;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            color: var(--text-light);
        }

        .floating {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        /* Footer Styles */
        .footer {
            background: var(--primary-color);
            color: var(--text-light);
            padding: 3rem 0 2rem;
        }

        .footer-heading {
            color: var(--accent-color);
            margin-bottom: 1.5rem;
        }

        .footer-link {
            color: var(--text-light);
            text-decoration: none;
            transition: all 0.3s ease;
            display: block;
            margin-bottom: 0.5rem;
        }

        .footer-link:hover {
            color: var(--accent-color);
            transform: translateX(5px);
        }

        .social-links a {
            color: var(--text-light);
            margin-right: 15px;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            color: var(--accent-color);
            transform: translateY(-5px);
        }

        /* Particles Effect */
        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        /* Current Time Display */
        .current-time {
            position: fixed;
            top: 20px;
            right: 20px;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <!-- Current Time Display -->
    <div class="current-time">
        <i class="fas fa-clock me-2"></i>
        <span id="current-time">2025-03-14 08:45:00</span>
    </div>

    <!-- Header/Navbar -->
    <!-- Header/Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand animate__animated animate__fadeInLeft" href="#">
            <i class="fas fa-home me-2"></i>
            RealEstate Finder
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto animate__animated animate__fadeInDown">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-search me-1"></i>Find Properties</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user-tie me-1"></i>Find Agents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-calendar me-1"></i>Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-info-circle me-1"></i>About Us</a>
                </li>
            </ul>
            
            <% if(session.getAttribute("user") == null) { %>
                <!-- Login/Register Buttons -->
                <div class="nav-auth-buttons animate__animated animate__fadeInRight">
                    <a href="login.jsp" class="btn btn-outline-light me-2">
                        <i class="fas fa-sign-in-alt me-1"></i>Login
                    </a>
                    <a href="register.jsp" class="btn btn-primary">
                        <i class="fas fa-user-plus me-1"></i>Register
                    </a>
                </div>
            <% } else { %>
                <!-- User Profile Dropdown -->
                <div class="user-profile animate__animated animate__fadeInRight">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" 
                           id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://ui-avatars.com/api/?name=<%= session.getAttribute("user") %>&background=random" 
                                 alt="User Avatar" 
                                 class="user-avatar">
                            <div class="user-info">
                                <small>Welcome,</small>
                                <div class="fw-bold"><%= session.getAttribute("user") %></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user me-2"></i>My Profile
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cog me-2"></i>Settings
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-history me-2"></i>History
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item text-danger" href="logout.jsp">
                                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</nav>

    <!-- Hero Section -->
    <section class="hero-section d-flex align-items-center">
        <div id="particles-js"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 hero-content" data-aos="fade-right">
                    <h1 class="display-4 fw-bold mb-4">Find Your Perfect Home</h1>
                    <p class="lead mb-4">Connect with top real estate agents and find your dream property with ease.</p>
                    <div class="d-flex gap-3">
                        <a href="#" class="btn btn-primary btn-lg animate__animated animate__pulse animate__infinite">
                            <i class="fas fa-search me-2"></i>Start Searching
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-user-tie me-2"></i>Meet Agents
                        </a>
                    </div>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <img src="https://your-image-url.com/hero-image.png" alt="Hero Image" class="img-fluid floating">
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content Section -->
    <!-- Add your main content here -->

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4" data-aos="fade-up">
                    <h4 class="footer-heading">About Us</h4>
                    <p>We connect real estate agents with potential buyers and renters, making property transactions smoother and more efficient.</p>
                    <div class="social-links mt-3">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                
                <div class="col-md-2 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <h4 class="footer-heading">Quick Links</h4>
                    <a href="#" class="footer-link">Home</a>
                    <a href="#" class="footer-link">Properties</a>
                    <a href="#" class="footer-link">Agents</a>
                    <a href="#" class="footer-link">Contact</a>
                </div>
                
                <div class="col-md-3 mb-4" data-aos="fade-up" data-aos-delay="200">
                    <h4 class="footer-heading">Contact Info</h4>
                    <a href="#" class="footer-link"><i class="fas fa-phone me-2"></i>+1 234 567 890</a>
                    <a href="#" class="footer-link"><i class="fas fa-envelope me-2"></i>contact@realestate.com</a>
                    <a href="#" class="footer-link"><i class="fas fa-map-marker-alt me-2"></i>123 Real Estate St.</a>
                </div>
                
                <div class="col-md-3 mb-4" data-aos="fade-up" data-aos-delay="300">
                    <h4 class="footer-heading">Newsletter</h4>
                    <p>Subscribe to our newsletter for updates and news.</p>
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Your email">
                        <button class="btn btn-primary"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </div>
            </div>
            
            <hr class="mt-4 mb-4">
            
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-0">&copy; 2025 Real Estate Agent Finder. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="#" class="footer-link d-inline-block mx-2">Privacy Policy</a>
                    <a href="#" class="footer-link d-inline-block mx-2">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        // Initialize AOS
        AOS.init({
            duration: 1000,
            once: true
        });

        // Initialize Particles.js
        particlesJS("particles-js", {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#ffffff" },
                shape: { type: "circle" },
                opacity: {
                    value: 0.5,
                    random: false,
                    animation: { enable: true, speed: 1, opacity_min: 0.1, sync: false }
                },
                size: {
                    value: 3,
                    random: true,
                    animation: { enable: true, speed: 40, size_min: 0.1, sync: false }
                },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#ffffff",
                    opacity: 0.4,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 6,
                    direction: "none",
                    random: false,
                    straight: false,
                    out_mode: "out",
                    bounce: false,
                }
            },
            interactivity: {
                detect_on: "canvas",
                events: {
                    onhover: { enable: true, mode: "repulse" },
                    onclick: { enable: true, mode: "push" },
                    resize: true
                }
            },
            retina_detect: true
        });

        // Navbar Scroll Effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Update current time
        function updateTime() {
            const timeElement = document.getElementById('current-time');
            const now = new Date();
            const formattedTime = now.toISOString().slice(0, 19).replace('T', ' ');
            timeElement.textContent = formattedTime;
        }
        setInterval(updateTime, 1000);

        // Add smooth scrolling to all links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>