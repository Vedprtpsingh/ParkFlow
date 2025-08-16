<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }
    </style>
</head>
<body>
    <!-- Top Bar -->

    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero section -->
        <div class="hero animate-fade-in">
            <div class="hero-content">
                <h2 class="gradient-text">Smart Parking Revolution</h2>
                <p>Transform your parking experience with AI-powered management, real-time monitoring, and seamless automation</p>
                <div class="mt-3" style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                    <a href="/parkflow/signup" class="btn btn-lg floating">Get Started <i class="fas fa-rocket"></i></a>
                    <a href="#features" class="btn btn-outline btn-lg" style="background: rgba(255,255,255,0.2); border-color: white; color: white;">Learn More <i class="fas fa-play"></i></a>
                </div>
            </div>
        </div>
        
        <!-- Features -->
        <div id="features" class="animate-fade-in">
            <h1 class="gradient-text text-center">Next-Gen Parking Solutions</h1>
            <p class="text-center" style="font-size: 1.2rem; color: #666; max-width: 600px; margin: 0 auto 3rem;">Experience the future of parking management with our comprehensive suite of intelligent features</p>
        </div>
        <!-- System Overview -->
        <div class="features-grid animate-fade-in">
            <div class="feature-card glass-card">
                <i class="fas fa-eye" style="color: var(--primary); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>Real-Time Monitoring</h3>
                <p>Live tracking of parking space availability with instant updates and smart notifications</p>
            </div>
            <div class="feature-card glass-card">
                <i class="fas fa-car" style="color: var(--secondary); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>Smart Vehicle Management</h3>
                <p>Automated vehicle registration, license plate recognition, and seamless entry/exit control</p>
            </div>
            <div class="feature-card glass-card">
                <i class="fas fa-robot" style="color: var(--accent); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>AI-Powered Assignment</h3>
                <p>Intelligent parking slot allocation using machine learning algorithms for optimal space utilization</p>
            </div>
            <div class="feature-card glass-card">
                <i class="fas fa-chart-bar" style="color: var(--info); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>Advanced Analytics</h3>
                <p>Comprehensive reporting dashboard with insights, trends, and performance metrics</p>
            </div>
            <div class="feature-card glass-card">
                <i class="fas fa-mobile-alt" style="color: var(--warning); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>Mobile Integration</h3>
                <p>User-friendly mobile app for booking, payments, and real-time parking space finder</p>
            </div>
            <div class="feature-card glass-card">
                <i class="fas fa-shield-alt" style="color: var(--danger); font-size: 3rem; margin-bottom: 1rem;"></i>
                <h3>Secure & Reliable</h3>
                <p>Enterprise-grade security with encrypted transactions and 99.9% uptime guarantee</p>
            </div>
        </div>
        
        <!-- Stats Section -->
        <div class="stats-grid animate-fade-in mt-4">
            <div class="stat-card glass-card">
                <i class="fas fa-building" style="color: var(--primary);"></i>
                <h3>Facilities Managed</h3>
                <p class="animate-pulse">500+</p>
            </div>
            <div class="stat-card glass-card">
                <i class="fas fa-car" style="color: var(--secondary);"></i>
                <h3>Vehicles Processed</h3>
                <p class="animate-pulse">1M+</p>
            </div>
            <div class="stat-card glass-card">
                <i class="fas fa-clock" style="color: var(--accent);"></i>
                <h3>Time Saved</h3>
                <p class="animate-pulse">50%</p>
            </div>
            <div class="stat-card glass-card">
                <i class="fas fa-smile" style="color: var(--warning);"></i>
                <h3>Customer Satisfaction</h3>
                <p class="animate-pulse">98%</p>
            </div>
        </div>
        
        <!-- About Section Preview -->
        <div class="about-section mt-4 animate-fade-in">
            <h2 class="text-center mb-3 gradient-text">Why Choose ParkFlow?</h2>
            <div class="about-grid">
                <div class="about-card glass-card">
                    <i class="fas fa-bullseye floating" style="color: var(--primary); font-size: 3.5rem;"></i>
                    <h3>Our Mission</h3>
                    <p>Revolutionizing urban mobility through intelligent parking solutions that reduce congestion and enhance city life</p>
                </div>
                <div class="about-card glass-card">
                    <i class="fas fa-rocket floating" style="color: var(--secondary); font-size: 3.5rem;"></i>
                    <h3>Our Vision</h3>
                    <p>Creating a world where finding parking is effortless, sustainable, and contributes to smarter cities</p>
                </div>
                <div class="about-card glass-card">
                    <i class="fas fa-users floating" style="color: var(--accent); font-size: 3.5rem;"></i>
                    <h3>Our Team</h3>
                    <p>Expert engineers and designers passionate about solving real-world problems with cutting-edge technology</p>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="about" class="btn btn-secondary btn-lg">Discover Our Story <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        
        <!-- Testimonials -->
        <div class="card glass-card mt-4 animate-fade-in">
            <h2 class="card-title gradient-text text-center">Success Stories</h2>
            <div class="features-grid">
                <div class="card glass-card" style="border-left: 4px solid var(--primary);">
                    <div class="p-2">
                        <div style="display: flex; margin-bottom: 1rem;">
                            <i class="fas fa-quote-left" style="color: var(--primary); font-size: 1.5rem;"></i>
                        </div>
                        <p style="font-style: italic; font-size: 1.1rem; line-height: 1.6;">"ParkFlow transformed our operations completely. 40% reduction in admin work and our customers love the seamless experience!"</p>
                        <div class="mt-3" style="display: flex; align-items: center; gap: 15px;">
                            <img src="image/p1.png" alt="John" style="width: 60px; height: 60px; border-radius: 50%; object-fit: cover; border: 3px solid var(--primary);">
                            <div>
                                <h4 style="margin: 0; color: var(--primary);">John Martinez</h4>
                                <p style="margin: 0; color: #666; font-weight: 500;">Parking Manager</p>
                                <p style="margin: 0; color: #888; font-size: 0.9rem;">Fort City Central Mall</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card glass-card" style="border-left: 4px solid var(--secondary);">
                    <div class="p-2">
                        <div style="display: flex; margin-bottom: 1rem;">
                            <i class="fas fa-quote-left" style="color: var(--secondary); font-size: 1.5rem;"></i>
                        </div>
                        <p style="font-style: italic; font-size: 1.1rem; line-height: 1.6;">"Real-time analytics gave us insights we never had before. 25% revenue increase in just 6 months!"</p>
                        <div class="mt-3" style="display: flex; align-items: center; gap: 15px;">
                            <img src="image/p2.jpeg" alt="Dev" style="width: 60px; height: 60px; border-radius: 50%; object-fit: cover; border: 3px solid var(--secondary);">
                            <div>
                                <h4 style="margin: 0; color: var(--secondary);">Dev Sharma</h4>
                                <p style="margin: 0; color: #666; font-weight: 500;">Operations Director</p>
                                <p style="margin: 0; color: #888; font-size: 0.9rem;">Grand Hotel & Suites</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Call to Action -->
        <div class="card glass-card mt-4 animate-fade-in" style="background: var(--gradient-primary); color: white; text-align: center; position: relative; overflow: hidden;">
            <div class="p-4" style="position: relative; z-index: 2;">
                <i class="fas fa-rocket floating" style="font-size: 4rem; margin-bottom: 1rem; opacity: 0.9;"></i>
                <h2 style="color: white; font-size: 2.5rem; margin-bottom: 1rem;">Ready to Transform Your Parking?</h2>
                <p style="font-size: 1.2rem; margin-bottom: 2rem; opacity: 0.95;">Join 500+ facilities worldwide using ParkFlow to revolutionize their parking operations</p>
                <div class="mt-3" style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                    <a href="signup" class="btn btn-lg" style="background-color: white; color: var(--primary); box-shadow: var(--shadow-lg);">Start Free Trial <i class="fas fa-arrow-right"></i></a>
                    <a href="contact" class="btn btn-outline btn-lg" style="color: white; border-color: white; background: rgba(255,255,255,0.1);">Schedule Demo <i class="fas fa-calendar"></i></a>
                </div>
                <div class="mt-3" style="display: flex; align-items: center; justify-content: center; gap: 2rem; flex-wrap: wrap; opacity: 0.8;">
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-check-circle"></i>
                        <span>30-day free trial</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-check-circle"></i>
                        <span>No setup fees</span>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-check-circle"></i>
                        <span>24/7 support</span>
                    </div>
                </div>
            </div>
            <div style="position: absolute; top: -50%; right: -50%; width: 200%; height: 200%; background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%); z-index: 1;"></div>
        </div>
    </div>
    
<!-- Footer -->
<%@ include file="footer.jsp" %>


    <!-- JavaScript -->
    <script>
        // Toggle mobile navigation
        document.getElementById('navToggle')?.addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
        
        // Close navigation when clicking outside
        document.addEventListener('click', function(event) {
            const navLinks = document.getElementById('navLinks');
            const navToggle = document.getElementById('navToggle');
            
            if (navLinks && navToggle && !navLinks.contains(event.target) && !navToggle.contains(event.target) && navLinks.classList.contains('show')) {
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
        
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
        
        // Intersection Observer for animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);
        
        // Observe all animated elements
        document.querySelectorAll('.animate-fade-in').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
            observer.observe(el);
        });
        
        // Counter animation for stats
        function animateCounter(element, target) {
            let current = 0;
            const increment = target / 100;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                element.textContent = Math.floor(current) + (target >= 1000000 ? 'M+' : target >= 1000 ? 'K+' : target >= 100 ? '%' : '+');
            }, 20);
        }
        
        // Animate counters when they come into view
        const statObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counter = entry.target.querySelector('p');
                    const text = counter.textContent;
                    let target = parseInt(text.replace(/[^0-9]/g, ''));
                    
                    if (text.includes('M+')) target = target * 1000000;
                    else if (text.includes('K+')) target = target * 1000;
                    else if (text.includes('%')) target = target;
                    
                    animateCounter(counter, target);
                    statObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });
        
        document.querySelectorAll('.stat-card').forEach(card => {
            statObserver.observe(card);
        });
    </script>
</body>
</html>