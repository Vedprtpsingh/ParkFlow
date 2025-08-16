<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle | ParkFlow - Smart Parking Management</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../modern-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .form-container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
        }
        .form-header {
            background: var(--gradient-secondary);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
        }
        .form-body { padding: 2.5rem; }
        .vehicle-type-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 1rem;
            margin: 1rem 0;
        }
        .vehicle-type-option {
            background: rgba(255, 255, 255, 0.8);
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: var(--radius-lg);
            padding: 1.5rem 1rem;
            text-align: center;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
        }
        .vehicle-type-option:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow);
        }
        .vehicle-type-option.selected {
            border-color: var(--secondary);
            background: rgba(72, 187, 120, 0.1);
        }
        .vehicle-type-option i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: var(--secondary);
        }
        .color-picker {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(60px, 1fr));
            gap: 0.75rem;
            margin: 1rem 0;
        }
        .color-option {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 3px solid transparent;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
        }
        .color-option:hover {
            transform: scale(1.1);
            box-shadow: var(--shadow);
        }
        .color-option.selected {
            border-color: var(--dark);
            transform: scale(1.15);
        }
        .color-option::after {
            content: '\2713';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
            opacity: 0;
            transition: var(--transition);
        }
        .color-option.selected::after {
            opacity: 1;
        }
    </style>
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <div class="form-container">
        <div class="form-card animate-fade-in">
            <div class="form-header">
                <i class="fas fa-plus-circle floating" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                <h2 style="margin: 0; font-size: 2rem; font-weight: 700;">Add New Vehicle</h2>
                <p style="margin: 0.5rem 0 0; opacity: 0.9;">Register your vehicle for smart parking</p>
            </div>
            <div class="form-body">
                <c:if test="${not empty success}">
                    <div class="alert-modern alert-success animate-fade-in">
                        <i class="fas fa-check-circle alert-icon"></i>
                        <div class="alert-content">
                            <h4>Success!</h4>
                            <p>${success}</p>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert-modern alert-danger animate-fade-in">
                        <i class="fas fa-exclamation-triangle alert-icon"></i>
                        <div class="alert-content">
                            <h4>Error</h4>
                            <p>${error}</p>
                        </div>
                    </div>
                </c:if>

                <form action="<c:url value='/parkflow/addVehicle' />" method="post" id="vehicleForm" style="display: flex; flex-direction: column; gap: 2rem;">
                    <div>
                        <label style="font-weight: 600; margin-bottom: 0.5rem; display: block;">Vehicle Type *</label>
                        <div class="vehicle-type-grid">
                            <div class="vehicle-type-option" data-type="Car">
                                <i class="fas fa-car"></i>
                                <div style="font-weight: 600;">Car</div>
                            </div>
                            <div class="vehicle-type-option" data-type="Motorcycle">
                                <i class="fas fa-motorcycle"></i>
                                <div style="font-weight: 600;">Bike</div>
                            </div>
                            <div class="vehicle-type-option" data-type="SUV">
                                <i class="fas fa-truck"></i>
                                <div style="font-weight: 600;">SUV</div>
                            </div>
                            <div class="vehicle-type-option" data-type="Truck">
                                <i class="fas fa-truck-moving"></i>
                                <div style="font-weight: 600;">Truck</div>
                            </div>
                        </div>
                        <input type="hidden" id="vehicleType" name="vehicleType" required>
                    </div>

                    <div class="input-group">
                        <i class="fas fa-id-card" style="color: var(--secondary);"></i>
                        <input type="text" id="licensePlate" name="licensePlate" placeholder="Enter license plate (e.g., KA-01-AB-1234)" required style="background: rgba(255,255,255,0.8); text-transform: uppercase;">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-car-side" style="color: var(--secondary);"></i>
                        <input type="text" id="model" name="model" placeholder="Vehicle model (e.g., Honda City, Royal Enfield)" required style="background: rgba(255,255,255,0.8);">
                    </div>

                    <div>
                        <label style="font-weight: 600; margin-bottom: 0.5rem; display: block;">Vehicle Color</label>
                        <div class="color-picker">
                            <div class="color-option" data-color="White" style="background: #ffffff; border: 2px solid #ddd;"></div>
                            <div class="color-option" data-color="Black" style="background: #000000;"></div>
                            <div class="color-option" data-color="Silver" style="background: #c0c0c0;"></div>
                            <div class="color-option" data-color="Red" style="background: #dc3545;"></div>
                            <div class="color-option" data-color="Blue" style="background: #007bff;"></div>
                            <div class="color-option" data-color="Green" style="background: #28a745;"></div>
                            <div class="color-option" data-color="Yellow" style="background: #ffc107;"></div>
                            <div class="color-option" data-color="Orange" style="background: #fd7e14;"></div>
                        </div>
                        <input type="hidden" id="color" name="color">
                        <input type="text" id="customColor" placeholder="Or enter custom color" style="width: 100%; padding: 0.75rem; border: 2px solid rgba(0,0,0,0.1); border-radius: var(--radius); margin-top: 1rem; background: rgba(255,255,255,0.8);">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-user" style="color: var(--secondary);"></i>
                        <input type="text" id="ownerName" name="ownerName" placeholder="Owner name (optional)" style="background: rgba(255,255,255,0.8);">
                    </div>

                    <div class="input-group">
                        <i class="fas fa-phone" style="color: var(--secondary);"></i>
                        <input type="tel" id="contactNumber" name="contactNumber" placeholder="Contact number (optional)" style="background: rgba(255,255,255,0.8);">
                    </div>

                    <button type="submit" class="btn btn-block" style="background: var(--gradient-secondary); padding: 1rem; font-size: 1.1rem; font-weight: 600;">
                        <i class="fas fa-plus-circle"></i> Register Vehicle
                    </button>
                </form>

                <div class="text-center" style="margin-top: 2rem; padding-top: 2rem; border-top: 1px solid rgba(0,0,0,0.1);">
                    <a href="<c:url value='/parkflow' />" class="btn btn-outline" style="color: var(--secondary); border-color: var(--secondary);">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // Vehicle type selection
        document.querySelectorAll('.vehicle-type-option').forEach(option => {
            option.addEventListener('click', function() {
                document.querySelectorAll('.vehicle-type-option').forEach(opt => opt.classList.remove('selected'));
                this.classList.add('selected');
                document.getElementById('vehicleType').value = this.dataset.type;
            });
        });

        // Color selection
        document.querySelectorAll('.color-option').forEach(option => {
            option.addEventListener('click', function() {
                document.querySelectorAll('.color-option').forEach(opt => opt.classList.remove('selected'));
                this.classList.add('selected');
                document.getElementById('color').value = this.dataset.color;
                document.getElementById('customColor').value = '';
            });
        });

        // Custom color input
        document.getElementById('customColor').addEventListener('input', function() {
            if (this.value) {
                document.querySelectorAll('.color-option').forEach(opt => opt.classList.remove('selected'));
                document.getElementById('color').value = this.value;
            }
        });

        // License plate formatting
        document.getElementById('licensePlate').addEventListener('input', function() {
            this.value = this.value.toUpperCase().replace(/[^A-Z0-9-]/g, '');
        });

        // Form validation
        document.getElementById('vehicleForm').addEventListener('submit', function(e) {
            const vehicleType = document.getElementById('vehicleType').value;
            const licensePlate = document.getElementById('licensePlate').value;
            const model = document.getElementById('model').value;
            
            if (!vehicleType) {
                e.preventDefault();
                showMessage('Please select a vehicle type', 'error');
                return;
            }
            
            if (licensePlate.length < 6) {
                e.preventDefault();
                showMessage('Please enter a valid license plate', 'error');
                return;
            }
            
            const submitBtn = this.querySelector('button[type="submit"]');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Registering Vehicle...';
            submitBtn.disabled = true;
        });

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
            
            const form = document.getElementById('vehicleForm');
            form.parentNode.insertBefore(message, form);
            
            setTimeout(() => message.remove(), 5000);
        }

        // Navigation toggle
        document.getElementById('navToggle')?.addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
    </script>
</body>
</html>
