<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | ParkFlow - Smart Parking Management</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            position: relative;
        }
        .login-header {
            background: var(--gradient-primary);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
        }
        .login-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23ffffff" opacity="0.2"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
        }
        .login-body {
            padding: 2.5rem;
            position: relative;
        }
        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
        }
        .forgot-link {
            color: var(--primary);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
        }
        .forgot-link:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <!-- Topbar -->
        <!-- Top Bar -->
        <%@ include file="topbar.jsp" %>
        <%@ include file="navbar.jsp" %>

    <div class="login-container">
        <div class="login-card animate-fade-in">
            <div class="login-header">
                <i class="fas fa-parking floating" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                <h2 style="margin: 0; font-size: 2rem; font-weight: 700;">Welcome Back</h2>
                <p style="margin: 0.5rem 0 0; opacity: 0.9;">Sign in to your ParkFlow account</p>
            </div>
            <div class="login-body">
            
                <c:if test="${not empty error}">
                    <div class="message message-error animate-fade-in">
                        <i class="fas fa-exclamation-triangle"></i> ${error}
                    </div>
                </c:if>
                
                <c:if test="${not empty success}">
                    <div class="message message-success animate-fade-in">
                        <i class="fas fa-check-circle"></i> ${success}
                    </div>
                </c:if>
                
                <c:if test="${not empty param.logout}">
                    <div class="message message-info animate-fade-in">
                        <i class="fas fa-info-circle"></i> You have been successfully logged out.
                    </div>
                </c:if>
            
                <div class="auth-tabs" style="margin-bottom: 2rem;">
                    <div class="auth-tab active" style="background: var(--gradient-primary); color: white; border-radius: var(--radius);">Login</div>
                    <div class="auth-tab" onclick="location.href='signup'" style="cursor: pointer; transition: var(--transition);">Sign Up</div>
                </div>
            
                <div class="social-auth" style="margin-bottom: 2rem;">
                    <a href="<c:url value='/oauth2/authorization/google' />" class="social-btn" style="background: #fff; border: 2px solid #e0e0e0; transition: var(--transition);">
                        <i class="fab fa-google" style="color: #DB4437;"></i>
                        <span style="color: #333;">Continue with Google</span>
                    </a>
                    <a href="<c:url value='/oauth2/authorization/facebook' />" class="social-btn" style="background: #1877f2; color: white; transition: var(--transition);">
                        <i class="fab fa-facebook-f"></i>
                        <span>Continue with Facebook</span>
                    </a>
                </div>
            
                <div class="divider" style="margin: 2rem 0;">
                    <span style="background: rgba(255,255,255,0.9); padding: 0 1rem; color: #666;">or sign in with email</span>
                </div>
                
                <form action="/parkflow/customerLoginForm" method="post" id="loginForm" style="display: flex; flex-direction: column; gap: 1.5rem;">
                    <div class="input-group">
                        <i class="fas fa-envelope" style="color: var(--primary);"></i>
                        <input type="email" name="email" id="email" placeholder="Enter your email address" required style="background: rgba(255,255,255,0.8);">
                    </div>
                    
                    <div class="input-group">
                        <i class="fas fa-lock" style="color: var(--primary);"></i>
                        <input type="password" name="password" id="password" placeholder="Enter your password" required style="background: rgba(255,255,255,0.8);">
                    </div>
                    
                    <div class="form-row" style="align-items: center; justify-content: space-between;">
                        <label class="checkbox-container">
                            <input type="checkbox" name="remember-me" style="width: auto; margin-right: 0.5rem;">
                            <span>Remember me</span>
                        </label>
                        <a href="forgotpassword" class="forgot-link">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-block" style="background: var(--gradient-primary); padding: 1rem; font-size: 1.1rem; font-weight: 600;">
                        <i class="fas fa-sign-in-alt"></i> Sign In to ParkFlow
                    </button>
                </form>
            
                <div class="text-center" style="margin-top: 2rem; padding-top: 2rem; border-top: 1px solid rgba(0,0,0,0.1);">
                    <p style="margin-bottom: 1rem; color: #666;">
                        Don't have an account? <a href="signup" style="color: var(--primary); font-weight: 600; text-decoration: none;">Create one now</a>
                    </p>
                    <p style="margin: 0;">
                        <a href="businessLogin" style="color: var(--secondary); font-weight: 500; text-decoration: none; display: inline-flex; align-items: center; gap: 0.5rem;">
                            <i class="fas fa-building"></i> Business Login
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
        
        // Enhanced form validation with better UX
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const email = document.getElementById('email');
            const password = document.getElementById('password');
            let isValid = true;
            
            // Remove previous error states
            [email, password].forEach(input => {
                input.style.borderColor = '';
                input.style.boxShadow = '';
            });
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email.value)) {
                e.preventDefault();
                email.style.borderColor = 'var(--danger)';
                email.style.boxShadow = '0 0 0 3px rgba(245, 101, 101, 0.1)';
                email.focus();
                showMessage('Please enter a valid email address', 'error');
                isValid = false;
            }
            
            // Password validation
            if (password.value.trim() === '') {
                e.preventDefault();
                password.style.borderColor = 'var(--danger)';
                password.style.boxShadow = '0 0 0 3px rgba(245, 101, 101, 0.1)';
                if (isValid) password.focus();
                showMessage('Please enter your password', 'error');
                isValid = false;
            }
            
            if (isValid) {
                // Show loading state
                const submitBtn = this.querySelector('button[type="submit"]');
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Signing in...';
                submitBtn.disabled = true;
            }
            
            return isValid;
        });
        
        // Show message function
        function showMessage(text, type) {
            // Remove existing messages
            const existingMessages = document.querySelectorAll('.temp-message');
            existingMessages.forEach(msg => msg.remove());
            
            const message = document.createElement('div');
            message.className = `message message-${type} temp-message animate-fade-in`;
            let icon = 'info-circle';
            if (type === 'error') icon = 'exclamation-triangle';
            message.innerHTML = `<i class="fas fa-${icon}"></i> ${text}`;
            
            const form = document.getElementById('loginForm');
            form.parentNode.insertBefore(message, form);
            
            // Auto remove after 5 seconds
            setTimeout(() => {
                message.remove();
            }, 5000);
        }
        
        // Input focus effects
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
            });
        });
        
        // Social button hover effects
        document.querySelectorAll('.social-btn').forEach(btn => {
            btn.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
                this.style.boxShadow = 'var(--shadow-lg)';
            });
            
            btn.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = '';
            });
        });
        
        // Initialize animations
        setTimeout(() => {
            document.querySelector('.login-card').style.opacity = '1';
            document.querySelector('.login-card').style.transform = 'translateY(0)';
        }, 100);
    </script>
</body>
</html>