<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.modelFirstName}">
        <footer>
            <div class="footer-container">
                <div class="footer-grid">
                    <div class="footer-col">
                        <h3><i class="fas fa-parking"></i> ParkFlow</h3>
                        <p>Revolutionizing urban mobility through intelligent parking solutions. Experience the future of parking management with cutting-edge IoT technology and seamless automation.</p>
                        <div class="social-links mt-3">
                            <a href="https://facebook.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://twitter.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-twitter"></i></a>
                            <a href="https://linkedin.com/company/parkflow" target="_blank" class="hover-lift"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://instagram.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-instagram"></i></a>
                            <a href="https://github.com/vedprtpsingh/ParkFlow" target="_blank" class="hover-lift"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-link"></i> Quick Access</h3>
                        <ul class="footer-links">
                            <li><a href="/parkflow" class="hover-lift"><i class="fas fa-home"></i> Dashboard</a></li>
                            <li><a href="./addVehicle" class="hover-lift"><i class="fas fa-plus-circle"></i> Add Vehicle</a></li>
                            <li><a href="./parkVehicle" class="hover-lift"><i class="fas fa-parking"></i> Park Vehicle</a></li>
                            <li><a href="./viewParkedVehicles" class="hover-lift"><i class="fas fa-car"></i> My Vehicles</a></li>
                            <li><a href="./parkflowmap" class="hover-lift"><i class="fas fa-map-marked-alt"></i> Parking Map</a></li>
                            <li><a href="./viewBookings" class="hover-lift"><i class="fas fa-calendar-check"></i> My Bookings</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-cogs"></i> Smart Features</h3>
                        <ul class="footer-links">
                            <li><a href="./services#iot" class="hover-lift"><i class="fas fa-microchip"></i> IoT Integration</a></li>
                            <li><a href="./services#realtime" class="hover-lift"><i class="fas fa-eye"></i> Real-time Monitoring</a></li>
                            <li><a href="./services#analytics" class="hover-lift"><i class="fas fa-chart-bar"></i> Advanced Analytics</a></li>
                            <li><a href="./services#mobile" class="hover-lift"><i class="fas fa-mobile-alt"></i> Mobile App</a></li>
                            <li><a href="./services#automation" class="hover-lift"><i class="fas fa-robot"></i> Smart Automation</a></li>
                            <li><a href="./services#security" class="hover-lift"><i class="fas fa-shield-alt"></i> Security Features</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-headset"></i> Support Center</h3>
                        <ul class="footer-contact">
                            <li class="hover-lift">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>AKGEC Campus, Ghaziabad<br>Uttar Pradesh, India - 201009</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-phone"></i>
                                <span>+91 123 456 7890</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-envelope"></i>
                                <span>support@parkflow.com</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-clock"></i>
                                <span>24/7 Customer Support</span>
                            </li>
                        </ul>
                        <div class="mt-3">
                            <a href="./contact" class="btn btn-sm" style="background: var(--gradient-primary); color: white; padding: 0.5rem 1rem; border-radius: var(--radius); text-decoration: none; display: inline-flex; align-items: center; gap: 0.5rem;">
                                <i class="fas fa-comments"></i> Get Help
                            </a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom" style="border-top: 1px solid rgba(255, 255, 255, 0.1); padding-top: 2rem; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                    <p style="margin: 0;">&copy; 2025 ParkFlow. All rights reserved. | Made with ❤️ by Team ParkFlow</p>
                    <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                        <a href="/privacy" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Privacy Policy</a>
                        <a href="/terms" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Terms of Service</a>
                        <a href="/cookies" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Cookie Policy</a>
                    </div>
                </div>
            </div>
        </footer>
    </c:when>
    <c:otherwise>
        <footer>
            <div class="footer-container">
                <div class="footer-grid">
                    <div class="footer-col">
                        <h3><i class="fas fa-parking"></i> ParkFlow</h3>
                        <p>Smart parking management system revolutionizing urban mobility. Join thousands of users experiencing seamless parking solutions.</p>
                        <div class="social-links mt-3">
                            <a href="https://facebook.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://twitter.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-twitter"></i></a>
                            <a href="https://linkedin.com/company/parkflow" target="_blank" class="hover-lift"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://instagram.com/parkflow" target="_blank" class="hover-lift"><i class="fab fa-instagram"></i></a>
                            <a href="https://github.com/vedprtpsingh/ParkFlow" target="_blank" class="hover-lift"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-info-circle"></i> Explore</h3>
                        <ul class="footer-links">
                            <li><a href="/parkflow" class="hover-lift"><i class="fas fa-home"></i> Home</a></li>
                            <li><a href="/parkflow/about" class="hover-lift"><i class="fas fa-building"></i> About Us</a></li>
                            <li><a href="/parkflow/services" class="hover-lift"><i class="fas fa-concierge-bell"></i> Services</a></li>
                            <li><a href="/parkflow/contact" class="hover-lift"><i class="fas fa-envelope"></i> Contact</a></li>
                            <li><a href="/parkflow/map" class="hover-lift"><i class="fas fa-map-marked-alt"></i> Find Parking</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-rocket"></i> Get Started</h3>
                        <ul class="footer-links">
                            <li><a href="/parkflow/signup" class="hover-lift"><i class="fas fa-user-plus"></i> Create Account</a></li>
                            <li><a href="/parkflow/login" class="hover-lift"><i class="fas fa-sign-in-alt"></i> Sign In</a></li>
                            <li><a href="/parkflow/businessSignup" class="hover-lift"><i class="fas fa-building"></i> Business Registration</a></li>
                            <li><a href="#demo" class="hover-lift"><i class="fas fa-play-circle"></i> Watch Demo</a></li>
                            <li><a href="#pricing" class="hover-lift"><i class="fas fa-tags"></i> Pricing Plans</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3><i class="fas fa-headset"></i> Contact Info</h3>
                        <ul class="footer-contact">
                            <li class="hover-lift">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>AKGEC Campus, Ghaziabad<br>Uttar Pradesh, India - 201009</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-phone"></i>
                                <span>+91 123 456 7890</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-envelope"></i>
                                <span>hello@parkflow.com</span>
                            </li>
                            <li class="hover-lift">
                                <i class="fas fa-clock"></i>
                                <span>24/7 Available</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom" style="border-top: 1px solid rgba(255, 255, 255, 0.1); padding-top: 2rem; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                    <p style="margin: 0;">&copy; 2025 ParkFlow. All rights reserved. | Crafted with ❤️ by Team ParkFlow</p>
                    <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                        <a href="/privacy" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Privacy</a>
                        <a href="/terms" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Terms</a>
                        <a href="/cookies" style="color: #ddd; text-decoration: none; font-size: 0.9rem;">Cookies</a>
                    </div>
                </div>
            </div>
        </footer>
    </c:otherwise>
</c:choose>
