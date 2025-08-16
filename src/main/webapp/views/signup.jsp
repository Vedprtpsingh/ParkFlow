<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | ParkFlow - Smart Parking Management</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../modern-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .signup-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }
        .signup-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            max-width: 500px;
            width: 100%;
        }
        .signup-header {
            background: var(--gradient-secondary);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
        }
        .signup-body { padding: 2.5rem; }
        .password-strength {
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            margin-top: 0.5rem;
            overflow: hidden;
        }
        .password-strength-fill {
            height: 100%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <div class="signup-container">
        <div class="signup-card animate-fade-in">
            <div class="signup-header">
                <i class="fas fa-user-plus floating" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                <h2 style="margin: 0; font-size: 2rem; font-weight: 700;">Join ParkFlow</h2>
                <p style="margin: 0.5rem 0 0; opacity: 0.9;">Create your account and start parking smarter</p>
            </div>
            <div class="signup-body">
            
                <c:if test="${not empty error}">
                    <div class="alert-modern alert-danger animate-fade-in">
                        <i class="fas fa-exclamation-triangle alert-icon"></i>
                        <div class="alert-content">
                            <h4>Error</h4>
                            <p>${error}</p>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty success}">
                    <div class="alert-modern alert-success animate-fade-in">
                        <i class="fas fa-check-circle alert-icon"></i>
                        <div class="alert-content">
                            <h4>Success</h4>
                            <p>${success}</p>
                        </div>
                    </div>
                </c:if>
            
                <div class="tabs-modern" style="margin-bottom: 2rem;">
                    <button class="tab-modern" onclick="location.href='login'">Login</button>
                    <button class="tab-modern active">Sign Up</button>
                </div>
                
                <div class="social-auth" style="margin-bottom: 2rem;">
                    <a href="<c:url value='/oauth2/authorization/google' />" class="social-btn hover-lift">
                        <i class="fab fa-google" style="color: #DB4437;"></i>
                        <span>Continue with Google</span>
                    </a>
                    <a href="<c:url value='/oauth2/authorization/facebook' />" class="social-btn hover-lift" style="background: #1877f2; color: white;">
                        <i class="fab fa-facebook-f"></i>
                        <span>Continue with Facebook</span>
                    </a>
                </div>
                
                <div class="divider" style="margin: 2rem 0;">
                    <span style="background: rgba(255,255,255,0.9); padding: 0 1rem; color: #666;">or create account with email</span>
                </div>
            
                <form action="/parkflow/signupForm" method="post" id="signupForm" style="display: flex; flex-direction: column; gap: 1.5rem;">
                    <input type="hidden" name="role" value="customer" />
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="input-group">
                                <i class="fas fa-user" style="color: var(--secondary);"></i>
                                <input type="text" name="firstName" placeholder="First Name" required style="background: rgba(255,255,255,0.8);">
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="input-group">
                                <i class="fas fa-user" style="color: var(--secondary);"></i>
                                <input type="text" name="lastName" placeholder="Last Name" required style="background: rgba(255,255,255,0.8);">
                            </div>
                        </div>
                    </div>
                    
                    <div class="input-group">
                        <i class="fas fa-envelope" style="color: var(--secondary);"></i>
                        <input type="email" name="email" id="email" placeholder="Enter your email address" required style="background: rgba(255,255,255,0.8);">
                    </div>
                    
                    <div class="input-group">
                        <i class="fas fa-lock" style="color: var(--secondary);"></i>
                        <input type="password" name="password" id="password" placeholder="Create a strong password" required style="background: rgba(255,255,255,0.8);">
                        <div class="password-strength">
                            <div class="password-strength-fill" id="passwordStrength"></div>
                        </div>
                        <small id="passwordHelp" style="color: #666; font-size: 0.8rem; margin-top: 0.5rem;">Password strength: <span id="strengthText">Weak</span></small>
                    </div>
                    
                    <div class="input-group">
                        <i class="fas fa-lock" style="color: var(--secondary);"></i>
                        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm your password" required style="background: rgba(255,255,255,0.8);">
                    </div>
                    
                    <div class="form-row" style="align-items: flex-start;">
                        <label style="display: flex; align-items: flex-start; gap: 0.75rem; font-size: 0.9rem; line-height: 1.4;">
                            <input type="checkbox" name="terms" required style="width: auto; margin: 0.2rem 0 0 0;">
                            <span>I agree to the <a href="/terms" style="color: var(--secondary); font-weight: 500;">Terms of Service</a> and <a href="/privacy" style="color: var(--secondary); font-weight: 500;">Privacy Policy</a></span>
                        </label>
                    </div>
                    
                    <button type="submit" class="btn btn-block" style="background: var(--gradient-secondary); padding: 1rem; font-size: 1.1rem; font-weight: 600;">
                        <i class="fas fa-user-plus"></i> Create ParkFlow Account
                    </button>
                </form>
            
                <div class="text-center" style="margin-top: 2rem; padding-top: 2rem; border-top: 1px solid rgba(0,0,0,0.1);">
                    <p style="margin-bottom: 1rem; color: #666;">
                        Already have an account? <a href="login" style="color: var(--secondary); font-weight: 600; text-decoration: none;">Sign in here</a>
                    </p>
                    <p style="margin: 0;">
                        <a href="businessSignup" style="color: var(--primary); font-weight: 500; text-decoration: none; display: inline-flex; align-items: center; gap: 0.5rem;">
                            <i class="fas fa-building"></i> Business Registration
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script>
        // Navigation toggle
        document.getElementById('navToggle')?.addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
        
        // Input focus effects
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
            });
        });
        
        // Initialize animations
        setTimeout(() => {
            document.querySelector('.signup-card').style.opacity = '1';
            document.querySelector('.signup-card').style.transform = 'translateY(0)';
        }, 100);
        
        // Enhanced form validation
        document.getElementById('signupForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const email = document.getElementById('email').value;
            let isValid = true;
            
            // Remove previous error states
            document.querySelectorAll('input').forEach(input => {
                input.style.borderColor = '';
                input.style.boxShadow = '';
            });
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                e.preventDefault();
                document.getElementById('email').style.borderColor = 'var(--danger)';
                showMessage('Please enter a valid email address', 'error');
                isValid = false;
            }
            
            // Password strength validation
            if (password.length < 8) {
                e.preventDefault();
                document.getElementById('password').style.borderColor = 'var(--danger)';
                showMessage('Password must be at least 8 characters long', 'error');
                isValid = false;
            }
            
            // Password match validation
            if (password !== confirmPassword) {
                e.preventDefault();
                document.getElementById('confirmPassword').style.borderColor = 'var(--danger)';
                showMessage('Passwords do not match', 'error');
                isValid = false;
            }
            
            if (isValid) {
                const submitBtn = this.querySelector('button[type="submit"]');
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creating Account...';
                submitBtn.disabled = true;
            }
            
            return isValid;
        });
        
        // Password strength indicator
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('passwordStrength');
            const strengthText = document.getElementById('strengthText');
            
            let strength = 0;
            let text = 'Weak';
            let color = '#f56565';
            
            if (password.length >= 8) strength += 25;
            if (/[a-z]/.test(password)) strength += 25;
            if (/[A-Z]/.test(password)) strength += 25;
            if (/[0-9]/.test(password)) strength += 25;
            
            if (strength >= 75) {
                text = 'Strong';
                color = '#48bb78';
            } else if (strength >= 50) {
                text = 'Medium';
                color = '#ed8936';
            }
            
            strengthBar.style.width = strength + '%';
            strengthBar.style.backgroundColor = color;
            strengthText.textContent = text;
            strengthText.style.color = color;
        });
        
        // Real-time password match validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (confirmPassword && password !== confirmPassword) {
                this.style.borderColor = 'var(--danger)';
            } else {
                this.style.borderColor = 'var(--success)';
            }
        });
        
        // Show message function
        function showMessage(text, type) {
            const existingMessages = document.querySelectorAll('.temp-message');
            existingMessages.forEach(msg => msg.remove());
            
            const message = document.createElement('div');
            message.className = `alert-modern alert-${type} temp-message animate-fade-in`;
            let icon = 'info-circle';
            if (type === 'error') icon = 'exclamation-triangle';
            if (type === 'success') icon = 'check-circle';
            
            message.innerHTML = `
                <i class="fas fa-${icon} alert-icon"></i>
                <div class="alert-content">
                    <p>${text}</p>
                </div>
            `;
            
            const form = document.getElementById('signupForm');
            form.parentNode.insertBefore(message, form);
            
            setTimeout(() => message.remove(), 5000);
        }
    </script>
</body>
</html>