<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | ParkFlow - Smart Parking Management</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../modern-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .about-hero {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.9), rgba(72, 187, 120, 0.9)), url('../image/imagehotel.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            text-align: center;
            padding: 8rem 2rem;
            position: relative;
            overflow: hidden;
        }
        .about-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23ffffff" opacity="0.3"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
        }
        .about-hero-content { position: relative; z-index: 2; }
        .stats-counter {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        .stat-counter {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            padding: 2rem;
            border-radius: var(--radius-lg);
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }
        .stat-counter:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-xl);
        }
        .stat-counter h3 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        .timeline {
            position: relative;
            padding: 2rem 0;
        }
        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            bottom: 0;
            width: 4px;
            background: var(--gradient-primary);
            transform: translateX(-50%);
        }
        .timeline-item {
            display: flex;
            align-items: center;
            margin-bottom: 3rem;
            position: relative;
        }
        .timeline-item:nth-child(even) {
            flex-direction: row-reverse;
        }
        .timeline-content {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            padding: 2rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow);
            width: 45%;
            position: relative;
        }
        .timeline-date {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            background: var(--gradient-primary);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            z-index: 2;
        }
        .team-member {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }
        .team-member::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            transition: left 0.5s;
        }
        .team-member:hover::before {
            left: 100%;
        }
        .team-member:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: var(--shadow-xl);
        }
        .team-member img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 1.5rem;
            border: 4px solid var(--primary);
            transition: var(--transition);
        }
        .team-member:hover img {
            transform: scale(1.1);
        }
        .tech-showcase {
            background: var(--gradient-primary);
            color: white;
            padding: 4rem 2rem;
            border-radius: var(--radius-xl);
            margin: 3rem 0;
            position: relative;
            overflow: hidden;
        }
        .tech-showcase::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        }
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        .value-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            padding: 2rem;
            border-radius: var(--radius-lg);
            text-align: center;
            border-left: 4px solid var(--primary);
            transition: var(--transition);
        }
        .value-card:hover {
            transform: translateY(-5px);
            border-left-color: var(--secondary);
        }
        .value-card i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <!-- Hero Section -->
    <div class="about-hero animate-fade-in">
        <div class="about-hero-content">
            <h1 style="font-size: 3.5rem; margin-bottom: 1rem; font-weight: 800;">About ParkFlow</h1>
            <p style="font-size: 1.3rem; max-width: 600px; margin: 0 auto 2rem; opacity: 0.95;">Revolutionizing urban mobility through intelligent parking solutions that transform cities worldwide</p>
            <div class="mt-3">
                <a href="#story" class="btn btn-lg" style="background: rgba(255,255,255,0.2); border: 2px solid white; color: white; margin-right: 1rem;">
                    <i class="fas fa-book-open"></i> Our Story
                </a>
                <a href="#team" class="btn btn-lg" style="background: white; color: var(--primary);">
                    <i class="fas fa-users"></i> Meet the Team
                </a>
            </div>
        </div>
    </div>

    <div class="container">

        <!-- Stats Counter -->
        <div class="stats-counter animate-fade-in">
            <div class="stat-counter">
                <h3 id="counter1">500</h3>
                <p style="font-weight: 600; color: var(--dark);">Facilities Managed</p>
            </div>
            <div class="stat-counter">
                <h3 id="counter2">1M</h3>
                <p style="font-weight: 600; color: var(--dark);">Vehicles Processed</p>
            </div>
            <div class="stat-counter">
                <h3 id="counter3">98</h3>
                <p style="font-weight: 600; color: var(--dark);">Customer Satisfaction</p>
            </div>
            <div class="stat-counter">
                <h3 id="counter4">24</h3>
                <p style="font-weight: 600; color: var(--dark);">Countries Served</p>
            </div>
        </div>

        <!-- Company Story -->
        <div class="card glass-card animate-fade-in" id="story">
            <h2 class="card-title gradient-text"><i class="fas fa-rocket"></i> Our Journey</h2>
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3 style="color: var(--primary); margin-bottom: 1rem;">The Beginning</h3>
                        <p>Founded by a team of passionate engineers and urban planners who recognized the growing parking crisis in modern cities. Our mission: transform parking from a problem into a seamless experience.</p>
                    </div>
                    <div class="timeline-date">2023</div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3 style="color: var(--secondary); margin-bottom: 1rem;">Innovation Breakthrough</h3>
                        <p>Developed our proprietary IoT-enabled parking management system with real-time monitoring, automated barrier control, and intelligent space allocation algorithms.</p>
                    </div>
                    <div class="timeline-date">2024</div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3 style="color: var(--accent); margin-bottom: 1rem;">Global Expansion</h3>
                        <p>Expanded operations to serve 500+ facilities worldwide, processing over 1 million vehicles and achieving 98% customer satisfaction rate across all markets.</p>
                    </div>
                    <div class="timeline-date">2025</div>
                </div>
            </div>
        </div>

        <!-- Values Section -->
        <div class="card glass-card animate-fade-in">
            <h2 class="card-title gradient-text text-center"><i class="fas fa-heart"></i> Our Core Values</h2>
            <div class="values-grid">
                <div class="value-card">
                    <i class="fas fa-bullseye"></i>
                    <h3 style="color: var(--primary); margin-bottom: 1rem;">Mission</h3>
                    <p>Revolutionize urban mobility through intelligent parking solutions that eliminate congestion, reduce emissions, and enhance quality of life in cities worldwide.</p>
                </div>
                <div class="value-card">
                    <i class="fas fa-eye"></i>
                    <h3 style="color: var(--secondary); margin-bottom: 1rem;">Vision</h3>
                    <p>Create a world where finding parking is effortless, sustainable, and contributes to building smarter, more livable cities for future generations.</p>
                </div>
                <div class="value-card">
                    <i class="fas fa-lightbulb"></i>
                    <h3 style="color: var(--accent); margin-bottom: 1rem;">Innovation</h3>
                    <p>Continuously push the boundaries of technology to deliver cutting-edge solutions that anticipate and solve tomorrow's parking challenges today.</p>
                </div>
                <div class="value-card">
                    <i class="fas fa-leaf"></i>
                    <h3 style="color: var(--success); margin-bottom: 1rem;">Sustainability</h3>
                    <p>Committed to reducing carbon footprint through optimized traffic flow, reduced search time, and promotion of eco-friendly transportation options.</p>
                </div>
            </div>
        </div>

        <!-- Team Section -->
        <div class="card glass-card animate-fade-in" id="team">
            <h2 class="card-title gradient-text text-center"><i class="fas fa-users"></i> Meet Our Visionary Team</h2>
            <p class="text-center" style="font-size: 1.1rem; color: #666; max-width: 600px; margin: 0 auto 3rem;">Passionate innovators dedicated to transforming the future of urban parking</p>
            <div class="team-grid">
                <div class="team-member">
                    <img src="../image/p1.png" alt="Ved Pratap Singh">
                    <h3 style="color: var(--primary); margin-bottom: 0.5rem;">Ved Pratap Singh</h3>
                    <p style="color: var(--secondary); font-weight: 600; margin-bottom: 1rem;">Project Lead & Full-Stack Developer</p>
                    <p style="color: #666; line-height: 1.6;">Visionary leader with expertise in Spring Boot, IoT integration, and system architecture. Passionate about creating scalable solutions for urban challenges.</p>
                    <div class="social-links mt-3">
                        <a href="https://github.com/vedprtpsingh" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://linkedin.com/in/vedprtpsingh" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <img src="../image/p2.jpeg" alt="Thakur">
                    <h3 style="color: var(--primary); margin-bottom: 0.5rem;">Thakur</h3>
                    <p style="color: var(--secondary); font-weight: 600; margin-bottom: 1rem;">Hardware Engineer & IoT Specialist</p>
                    <p style="color: #666; line-height: 1.6;">Arduino and IoT integration expert, specializing in sensor technology and automated barrier control systems for seamless parking operations.</p>
                    <div class="social-links mt-3">
                        <a href="https://github.com/thakur9044" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <img src="../image/image1.jpg" alt="Nitish Kumar">
                    <h3 style="color: var(--primary); margin-bottom: 0.5rem;">Nitish Kumar</h3>
                    <p style="color: var(--secondary); font-weight: 600; margin-bottom: 1rem;">Project Coordinator & Presenter</p>
                    <p style="color: #666; line-height: 1.6;">Strategic project management and presentation specialist, ensuring seamless coordination and effective communication of project vision.</p>
                    <div class="social-links mt-3">
                        <a href="https://github.com/nitishgithubrit" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <img src="../image/logo.jpeg" alt="Prajwal">
                    <h3 style="color: var(--primary); margin-bottom: 0.5rem;">Prajwal</h3>
                    <p style="color: var(--secondary); font-weight: 600; margin-bottom: 1rem;">UI/UX Designer & Frontend Developer</p>
                    <p style="color: #666; line-height: 1.6;">Creative designer focused on user experience and interface design, crafting intuitive and visually appealing parking management solutions.</p>
                    <div class="social-links mt-3">
                        <a href="https://github.com/prajwaltripathi12" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Technology Showcase -->
        <div class="tech-showcase animate-fade-in">
            <div style="position: relative; z-index: 2; text-align: center;">
                <h2 style="color: white; font-size: 2.5rem; margin-bottom: 1rem; font-weight: 700;">Cutting-Edge Technology Stack</h2>
                <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto 3rem;">Powered by advanced IoT sensors, machine learning algorithms, and real-time data processing</p>
                <div class="tech-grid">
                    <div class="tech-card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-microchip" style="color: white; font-size: 3rem; margin-bottom: 1rem;"></i>
                        <h3 style="color: white; margin-bottom: 1rem;">IoT Integration</h3>
                        <p style="color: rgba(255,255,255,0.9);">Arduino-powered sensors with HC-SR04 ultrasonic detection and automated barrier control systems</p>
                    </div>
                    <div class="tech-card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-brain" style="color: white; font-size: 3rem; margin-bottom: 1rem;"></i>
                        <h3 style="color: white; margin-bottom: 1rem;">Smart Analytics</h3>
                        <p style="color: rgba(255,255,255,0.9);">Machine learning algorithms for predictive parking patterns and intelligent space optimization</p>
                    </div>
                    <div class="tech-card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-cloud" style="color: white; font-size: 3rem; margin-bottom: 1rem;"></i>
                        <h3 style="color: white; margin-bottom: 1rem;">Cloud Platform</h3>
                        <p style="color: rgba(255,255,255,0.9);">Scalable Spring Boot architecture with MySQL database and real-time synchronization</p>
                    </div>
                    <div class="tech-card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-mobile-alt" style="color: white; font-size: 3rem; margin-bottom: 1rem;"></i>
                        <h3 style="color: white; margin-bottom: 1rem;">Mobile-First</h3>
                        <p style="color: rgba(255,255,255,0.9);">Responsive web application with progressive web app capabilities for seamless mobile experience</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success Stories -->
        <div class="card glass-card animate-fade-in">
            <h2 class="card-title gradient-text text-center"><i class="fas fa-star"></i> Success Stories</h2>
            <div class="testimonial-grid">
                <div class="testimonial" style="background: rgba(255,255,255,0.9); backdrop-filter: blur(20px); border-radius: var(--radius-lg); padding: 2rem; border-left: 4px solid var(--primary);">
                    <div style="display: flex; margin-bottom: 1rem;">
                        <i class="fas fa-quote-left" style="color: var(--primary); font-size: 2rem;"></i>
                    </div>
                    <p style="font-style: italic; font-size: 1.1rem; line-height: 1.6; margin-bottom: 2rem;">"ParkFlow revolutionized our operations! 75% reduction in complaints, 30% revenue increase, and our customers absolutely love the seamless experience. It's a game-changer!"</p>
                    <div class="client-info" style="display: flex; align-items: center; gap: 1rem;">
                        <img src="../image/imagehotel.jpg" alt="Sarah Williams" style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid var(--primary);">
                        <div>
                            <h4 style="margin: 0; color: var(--primary); font-weight: 600;">Sarah Williams</h4>
                            <p style="margin: 0; color: #666; font-weight: 500;">Operations Manager</p>
                            <p style="margin: 0; color: #888; font-size: 0.9rem;">Grand Plaza Hotel & Suites</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial" style="background: rgba(255,255,255,0.9); backdrop-filter: blur(20px); border-radius: var(--radius-lg); padding: 2rem; border-left: 4px solid var(--secondary);">
                    <div style="display: flex; margin-bottom: 1rem;">
                        <i class="fas fa-quote-left" style="color: var(--secondary); font-size: 2rem;"></i>
                    </div>
                    <p style="font-style: italic; font-size: 1.1rem; line-height: 1.6; margin-bottom: 2rem;">"The real-time monitoring and analytics transformed our facility management. We now have insights we never had before, leading to smarter decisions and better customer service."</p>
                    <div class="client-info" style="display: flex; align-items: center; gap: 1rem;">
                        <img src="../image/logo.jpeg" alt="Robert Chen" style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid var(--secondary);">
                        <div>
                            <h4 style="margin: 0; color: var(--secondary); font-weight: 600;">Robert Chen</h4>
                            <p style="margin: 0; color: #666; font-weight: 500;">Facility Director</p>
                            <p style="margin: 0; color: #888; font-size: 0.9rem;">Metropolitan Shopping Center</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="card glass-card animate-fade-in" style="background: var(--gradient-primary); color: white; text-align: center; position: relative; overflow: hidden;">
            <div style="position: relative; z-index: 2; padding: 2rem;">
                <i class="fas fa-handshake floating" style="font-size: 4rem; margin-bottom: 1rem; opacity: 0.9;"></i>
                <h2 style="color: white; font-size: 2.5rem; margin-bottom: 1rem; font-weight: 700;">Ready to Transform Your Parking?</h2>
                <p style="font-size: 1.2rem; margin-bottom: 2rem; opacity: 0.95; max-width: 600px; margin-left: auto; margin-right: auto;">Join the parking revolution and experience the future of smart parking management</p>
                <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                    <a href="contact" class="btn btn-lg" style="background: white; color: var(--primary); font-weight: 600;">
                        <i class="fas fa-envelope"></i> Get in Touch
                    </a>
                    <a href="signup" class="btn btn-outline btn-lg" style="color: white; border-color: white; background: rgba(255,255,255,0.1);">
                        <i class="fas fa-rocket"></i> Start Free Trial
                    </a>
                </div>
            </div>
            <div style="position: absolute; top: -50%; right: -50%; width: 200%; height: 200%; background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%); z-index: 1;"></div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script>
        // Navigation toggle
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('navToggle')?.addEventListener('click', function() {
                document.getElementById('navLinks').classList.toggle('show');
            });
            
            // Initialize animations
            initializeAnimations();
            
            // Animate counters
            animateCounters();
            
            // Smooth scrolling
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
        });
        
        function initializeAnimations() {
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
            
            document.querySelectorAll('.animate-fade-in').forEach(el => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(30px)';
                el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
                observer.observe(el);
            });
        }
        
        function animateCounters() {
            const counters = [
                { id: 'counter1', target: 500, suffix: '+' },
                { id: 'counter2', target: 1, suffix: 'M+' },
                { id: 'counter3', target: 98, suffix: '%' },
                { id: 'counter4', target: 24, suffix: '+' }
            ];
            
            const counterObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const counterId = entry.target.id;
                        const counter = counters.find(c => c.id === counterId);
                        if (counter) {
                            animateCounter(entry.target, counter.target, counter.suffix);
                            counterObserver.unobserve(entry.target);
                        }
                    }
                });
            }, { threshold: 0.5 });
            
            counters.forEach(counter => {
                const element = document.getElementById(counter.id);
                if (element) {
                    counterObserver.observe(element);
                }
            });
        }
        
        function animateCounter(element, target, suffix) {
            let current = 0;
            const increment = target / 100;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                element.textContent = Math.floor(current) + suffix;
            }, 20);
        }
    </script>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
