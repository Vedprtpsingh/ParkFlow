<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Parking Management System</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Top Bar -->
    <div class="topbar">
        <div class="topbar-contact">
            <a href="mailto:info@parkflow.com"><i class="fas fa-envelope"></i> info@parkflow.com</a>
            <a href="tel:+1234567890"><i class="fas fa-phone"></i> +123 456 7890</a>
        </div>
        <div class="topbar-auth">
            <a href="login" class="login" name="login"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="signup" class="signup" name="signup"><i class="fas fa-user-plus"></i> Sign Up</a>
        </div>
    </div>

    <!-- Header/Navbar -->
    <nav class="navbar">
        <a href="/parkflow" class="logo">
            <img src="/image/logo.jpeg" alt="ParkFlow Logo"> ParkFlow
        </a>
        <button class="nav-toggle" id="navToggle">
            <i class="fas fa-bars"></i>
        </button>
        <ul class="nav-links" id="navLinks">
            <li><a href="/parkflow" class="active"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="./addVehicle.jsp"><i class="fas fa-plus-circle"></i> Add Vehicle</a></li>
            <li><a href="./parkVehicle.jsp"><i class="fas fa-parking"></i> Park Vehicle</a></li>
            <li><a href="./viewParkedVehicles.jsp"><i class="fas fa-car"></i> View Vehicles</a></li>
            <li class="dropdown">
                <a href="#"><i class="fas fa-info-circle"></i> About <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="./about.jsp"><i class="fas fa-building"></i> About Us</a>
                    <a href="./services.jsp"><i class="fas fa-concierge-bell"></i> Services</a>
                    <a href="./contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a>
                </div>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero section -->
        <div class="hero">
            <div class="hero-content">
                <h2>Smart Parking Management System</h2>
                <p>Efficiently manage your parking facility with our easy-to-use system</p>
                <a href="./signup.jsp" class="btn btn-lg">Get Started <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        
        <!-- Features -->
        <h1>Parking Management Solutions</h1>
        
        <div class="features-grid">
            <a href="./addVehicle.jsp" class="feature-card">
                <i class="fas fa-plus-circle"></i>
                <h3>Add Vehicle</h3>
                <p>Register a new vehicle in the system</p>
            </a>
            <a href="./parkVehicle.jsp" class="feature-card">
                <i class="fas fa-parking"></i>
                <h3>Park Vehicle</h3>
                <p>Assign a parking slot to a vehicle</p>
            </a>
            <a href="./viewParkedVehicles.jsp" class="feature-card">
                <i class="fas fa-car"></i>
                <h3>View Vehicles</h3>
                <p>See all currently parked vehicles</p>
            </a>
            <a href="./services.jsp" class="feature-card">
                <i class="fas fa-cogs"></i>
                <h3>Services</h3>
                <p>Explore our range of parking services</p>
            </a>
        </div>
        
        <!-- Stats Section -->
        <div class="stats-grid mt-4">
            <div class="stat-card">
                <i class="fas fa-car-side"></i>
                <h3>Total Spaces</h3>
                <p>120</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-car"></i>
                <h3>Occupied</h3>
                <p>42</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>Available</h3>
                <p>78</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-clock"></i>
                <h3>Avg. Stay</h3>
                <p>2.5 hrs</p>
            </div>
        </div>
        
        <!-- System Overview -->
        <div class="card mt-4">
            <h2 class="card-title">System Overview</h2>
            <p>The ParkFlow Parking Management System provides the following features:</p>
            <ul style="list-style-type: none; padding-left: 0;">
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Real-time parking space availability</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Vehicle registration and management</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Automated parking slot assignment</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Comprehensive reporting and analytics</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> User-friendly interface for operators</li>
            </ul>
        </div>
        
        <!-- About Section Preview -->
        <div class="about-section mt-4">
            <h2 class="text-center mb-3">Why Choose ParkFlow?</h2>
            <div class="about-grid">
                <div class="about-card">
                    <i class="fas fa-bullseye"></i>
                    <h3>Our Mission</h3>
                    <p>We aim to revolutionize parking management by providing smart, efficient, and user-friendly solutions that save time and reduce stress for both parking operators and vehicle owners.</p>
                </div>
                <div class="about-card">
                    <i class="fas fa-chart-line"></i>
                    <h3>Our Vision</h3>
                    <p>To become the leading provider of innovative parking solutions worldwide, transforming the way parking facilities are managed and utilized.</p>
                </div>
                <div class="about-card">
                    <i class="fas fa-users"></i>
                    <h3>Our Team</h3>
                    <p>Our team consists of experienced professionals dedicated to delivering excellence in parking management technology and customer service.</p>
                </div>
            </div>
            <div class="text-center mt-3">
                <a href="./about.jsp" class="btn btn-secondary">Learn More About Us</a>
            </div>
        </div>
        
        <!-- Testimonials -->
        <div class="card mt-4">
            <h2 class="card-title">What Our Clients Say</h2>
            <div class="features-grid">
                <div class="card">
                    <div class="p-2">
                        <p>"ParkFlow has significantly improved our parking operations. The system is intuitive and has reduced our administrative workload by 40%."</p>
                        <div class="mt-2" style="display: flex; align-items: center; gap: 10px;">
                            <img src="image/p1.png" alt="John Doe" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            <div>
                                <h4 style="margin: 0;">John</h4>
                                <p style="margin: 0; color: #777;">Parking Manager, Fort City Central Mall</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="p-2">
                        <p>"The real-time monitoring feature has been a game-changer for our facility. We can now make data-driven decisions that have improved our revenue by 25%."</p>
                        <div class="mt-2" style="display: flex; align-items: center; gap: 10px;">
                            <img src="image/p2.jpeg" alt="Jane Smith" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            <div>
                                <h4 style="margin: 0;">Dev</h4>
                                <p style="margin: 0; color: #777;">Operations Director, Grand Hotel</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Call to Action -->
        <div class="card mt-4" style="background: linear-gradient(135deg, var(--primary), var(--primary-dark)); color: white; text-align: center;">
            <div class="p-4">
                <h2 style="color: white;">Ready to Transform Your Parking Management?</h2>
                <p>Join hundreds of satisfied clients who have revolutionized their parking operations with ParkFlow.</p>
                <div class="mt-3">
                    <a href="./signup.jsp" class="btn" style="background-color: white; color: var(--primary);">Get Started</a>
                    <a href="./contact.jsp" class="btn btn-outline" style="color: white; border-color: white;">Contact Sales</a>
                </div>
            </div>
        </div>
    </div>
    



    <!-- Footer -->
<footer>
    <div class="footer-container">
        <div class="footer-grid">
            <div class="footer-col">
                <h3>ParkFlow</h3>
                <p>Smart solutions for modern parking management. Transforming the way you handle parking facilities with innovative technology.</p>
                <div class="social-links mt-3">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="footer-col">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="/parkflow"><i class="fas fa-chevron-right"></i> Home</a></li>
                    <li><a href="./about.jsp"><i class="fas fa-chevron-right"></i> About Us</a></li>
                    <li><a href="./services.jsp"><i class="fas fa-chevron-right"></i> Services</a></li>
                    <li><a href="./addVehicle.jsp"><i class="fas fa-chevron-right"></i> Add Vehicle</a></li>
                    <li><a href="./parkVehicle.jsp"><i class="fas fa-chevron-right"></i> Park Vehicle</a></li>
                    <li><a href="./viewParkedVehicles.jsp"><i class="fas fa-chevron-right"></i> View Vehicles</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h3>Our Services</h3>
                <ul class="footer-links">
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Vehicle Registration</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Parking Space Allocation</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Real-time Monitoring</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Reporting & Analytics</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Mobile Application</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h3>Contact Us</h3>
                <ul class="footer-contact">
                    <li>
                        <i class="fas fa-map-marker-alt"></i>
                        <span>123 Parking Street, Ghaziabad, India</span>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <span>+123 456 7890</span>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span>info@parkflow.com</span>
                    </li>
                    <li>
                        <i class="fas fa-clock"></i>
                        <span>Mon - Fri: 9:00 AM - 5:00 PM</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 ParkFlow. All rights reserved.</p>
        </div>
    </div>
</footer>


    <!-- JavaScript -->
    <script>
        // Toggle mobile navigation
        document.getElementById('navToggle').addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
        
        // Close navigation when clicking outside
        document.addEventListener('click', function(event) {
            const navLinks = document.getElementById('navLinks');
            const navToggle = document.getElementById('navToggle');
            
            if (!navLinks.contains(event.target) && !navToggle.contains(event.target) && navLinks.classList.contains('show')) {
                navLinks.classList.remove('show');
            }
        });
        
        // Dropdown functionality
        const dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(dropdown => {
            dropdown.addEventListener('click', function(e) {
                this.classList.toggle('active');
                e.stopPropagation();
            });
        });
        
        // Close dropdowns when clicking outside
        document.addEventListener('click', function() {
            dropdowns.forEach(dropdown => {
                dropdown.classList.remove('active');
            });
        });
    </script>
</body>
</html>