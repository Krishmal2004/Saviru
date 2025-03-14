<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Real Estate Agent Finder</title>
    <%@ include file="header.jsp" %>
</head>
<body>
    <div id="particles-js"></div>
    <div class="current-time">
        <i class="fas fa-clock me-2"></i>
        <span id="current-time">2025-03-14 14:33:21</span>
    </div>

    <div class="container content-wrapper">
        <div class="row min-vh-100 align-items-center justify-content-center">
            <div class="col-md-5">
                <div class="card card-hover bg-white bg-opacity-95 rounded-4 shadow-lg p-4" 
                     data-aos="fade-up" 
                     data-aos-duration="1000">
                    
                    <div class="text-center mb-4">
                        <i class="fas fa-home fa-3x text-primary floating mb-3"></i>
                        <h3 class="animate__animated animate__fadeInDown">Welcome Back</h3>
                        <p class="text-muted animate__animated animate__fadeIn animate__delay-1s">
                            Login to your Real Estate Portal
                        </p>
                    </div>

                    <form action="login" method="post" class="animate__animated animate__fadeInUp animate__delay-1s">
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>
                        
                        <div class="mb-4 input-group-hover">
                            <div class="input-group">
                                <span class="input-group-text bg-light">
                                    <i class="fas fa-envelope text-primary"></i>
                                </span>
                                <input type="text" 
                                       name="username"
                                       class="form-control form-control-lg" 
                                       placeholder="Username"
                                       required>
                            </div>
                        </div>

                        <div class="mb-4 input-group-hover">
                            <div class="input-group">
                                <span class="input-group-text bg-light">
                                    <i class="fas fa-lock text-primary"></i>
                                </span>
                                <input type="password" 
                                       name="password"
                                       class="form-control form-control-lg" 
                                       placeholder="Password"
                                       required>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="remember" name="remember">
                                <label class="form-check-label" for="remember">Remember me</label>
                            </div>
                            <a href="#" class="text-primary text-decoration-none hover-effect">
                                Forgot password?
                            </a>
                        </div>

                        <button type="submit" 
                                class="btn btn-primary w-100 btn-lg mb-4 animate__animated animate__pulse animate__infinite">
                            <i class="fas fa-sign-in-alt me-2"></i>Login
                        </button>

                        <div class="text-center">
                            <p class="text-muted mb-3">Or continue with</p>
                            <div class="mb-4">
                                <a href="#" class="btn btn-outline-primary mx-2 animate__animated animate__bounceIn animate__delay-2s">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#" class="btn btn-outline-danger mx-2 animate__animated animate__bounceIn animate__delay-2s">
                                    <i class="fab fa-google"></i>
                                </a>
                                <a href="#" class="btn btn-outline-dark mx-2 animate__animated animate__bounceIn animate__delay-2s">
                                    <i class="fab fa-apple"></i>
                                </a>
                            </div>
                            <p class="mb-0">
                                Don't have an account? 
                                <a href="register.jsp" class="text-primary hover-effect">Register</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        // Initialize AOS
        AOS.init();

        // Initialize Particles.js
        particlesJS("particles-js", {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#ffffff" },
                shape: {
                    type: "circle",
                    stroke: { width: 0, color: "#000000" },
                },
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
                },
                modes: {
                    repulse: { distance: 100, duration: 0.4 },
                    push: { particles_nb: 4 }
                }
            },
            retina_detect: true
        });

        // Update current time
        function updateTime() {
            const timeElement = document.getElementById('current-time');
            const now = new Date();
            const formattedTime = now.getUTCFullYear() + '-' + 
                                String(now.getUTCMonth() + 1).padStart(2, '0') + '-' + 
                                String(now.getUTCDate()).padStart(2, '0') + ' ' + 
                                String(now.getUTCHours()).padStart(2, '0') + ':' + 
                                String(now.getUTCMinutes()).padStart(2, '0') + ':' + 
                                String(now.getUTCSeconds()).padStart(2, '0');
            timeElement.textContent = formattedTime;
        }

        setInterval(updateTime, 1000);

        // Add hover effects
        document.querySelectorAll('.hover-effect').forEach(element => {
            element.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.05)';
                this.style.transition = 'all 0.3s ease';
            });
            
            element.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
        });

        // Add input animation
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('animate__animated', 'animate__pulse');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('animate__animated', 'animate__pulse');
            });
        });
    </script>
</body>
</html>