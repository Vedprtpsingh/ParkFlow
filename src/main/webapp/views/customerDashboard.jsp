<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | ParkFlow - Smart Parking Management</title>
    <link rel="stylesheet" href="/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }
        
        .dashboard-header {
            background: var(--gradient-primary);
            color: white;
            padding: 2rem;
            border-radius: var(--radius-xl);
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }
        
        .dashboard-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23ffffff" opacity="0.2"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            opacity: 0.3;
        }
        
        .dashboard-header-content {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .user-info h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.2rem;
            font-weight: 700;
            color: white;
        }
        
        .user-info p {
            margin: 0;
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        .dashboard-stats {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .stat-item {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 1rem 1.5rem;
            border-radius: var(--radius);
            text-align: center;
            min-width: 120px;
        }
        
        .stat-item h3 {
            margin: 0 0 0.5rem 0;
            font-size: 1.8rem;
            font-weight: 700;
            color: white;
        }
        
        .stat-item p {
            margin: 0;
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .notifications-card {
            background: rgba(255, 243, 205, 0.9);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 238, 186, 0.5);
            padding: 1.5rem;
            border-radius: var(--radius-lg);
            margin-bottom: 2rem;
            color: #856404;
            position: relative;
            overflow: hidden;
        }
        
        .notifications-card h2 {
            margin: 0 0 1rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.3rem;
        }
        
        .notifications-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .notifications-list li {
            background: rgba(255, 255, 255, 0.7);
            padding: 0.75rem 1rem;
            margin-bottom: 0.5rem;
            border-radius: var(--radius);
            border-left: 4px solid var(--warning);
            display: flex;
            align-items: center;
            gap: 0.75rem;
            transition: var(--transition);
        }
        
        .notifications-list li:hover {
            transform: translateX(5px);
            box-shadow: var(--shadow);
        }
        
        .quick-actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }
        
        .action-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 2rem;
            border-radius: var(--radius-lg);
            text-align: center;
            text-decoration: none;
            color: var(--dark);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }
        
        .action-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            transition: left 0.5s;
        }
        
        .action-card:hover::before {
            left: 100%;
        }
        
        .action-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: var(--shadow-xl);
            text-decoration: none;
        }
        
        .action-card i {
            font-size: 3rem;
            margin-bottom: 1rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .action-card h3 {
            margin-bottom: 0.5rem;
            font-size: 1.2rem;
            font-weight: 600;
        }
        
        .action-card p {
            color: #666;
            font-size: 0.9rem;
            margin: 0;
        }
        
        .search-container {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .search-input {
            width: 100%;
            max-width: 400px;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: var(--radius-lg);
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            transition: var(--transition);
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }
        
        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 1.1rem;
        }
        
        .activities-table {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow);
        }
        
        .activities-table table {
            margin: 0;
            box-shadow: none;
        }
        
        .activities-table th {
            background: var(--gradient-primary);
            padding: 1rem;
            font-weight: 600;
        }
        
        .activities-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .activities-table tr:hover {
            background: rgba(102, 126, 234, 0.05);
        }
        
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .status-active {
            background: rgba(72, 187, 120, 0.2);
            color: var(--success);
        }
        
        .status-completed {
            background: rgba(66, 153, 225, 0.2);
            color: var(--info);
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }
        
        .pagination button {
            background: var(--gradient-primary);
            color: white;
            border: none;
            padding: 0.75rem 1rem;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: 500;
            transition: var(--transition);
        }
        
        .pagination button:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }
        
        .pagination button:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }
        
        @media (max-width: 768px) {
            .dashboard-header-content {
                flex-direction: column;
                text-align: center;
            }
            
            .dashboard-stats {
                justify-content: center;
            }
            
            .quick-actions-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                gap: 1rem;
            }
            
            .action-card {
                padding: 1.5rem 1rem;
            }
            
            .action-card i {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Top Bar -->
    <%@ include file="topbar.jsp" %>

    <!-- Header/Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header animate-fade-in">
            <div class="dashboard-header-content">
                <div class="user-info">
                    <h1>Welcome back, <c:out value="${modelFirstName}" default="User"/>! 👋</h1>
                    <p><i class="fas fa-envelope"></i> <c:out value="${userEmail}" default="user@example.com"/> • Premium Member</p>
                </div>
                <div class="dashboard-stats">
                    <div class="stat-item">
                        <h3>5</h3>
                        <p>Active Bookings</p>
                    </div>
                    <div class="stat-item">
                        <h3>12</h3>
                        <p>Total Vehicles</p>
                    </div>
                    <div class="stat-item">
                        <h3>₹2,450</h3>
                        <p>This Month</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Notifications -->
        <div class="notifications-card animate-fade-in">
            <h2><i class="fas fa-bell"></i> Recent Notifications</h2>
            <ul class="notifications-list" id="notificationsList">
                <li>
                    <i class="fas fa-car" style="color: var(--success);"></i>
                    <span>Vehicle KA-01-AB-1234 successfully parked in slot A-15</span>
                    <small style="margin-left: auto; opacity: 0.7;">2 min ago</small>
                </li>
                <li>
                    <i class="fas fa-star" style="color: var(--warning);"></i>
                    <span>VIP slot B-05 reserved for your upcoming booking</span>
                    <small style="margin-left: auto; opacity: 0.7;">1 hour ago</small>
                </li>
                <li>
                    <i class="fas fa-sign-out-alt" style="color: var(--info);"></i>
                    <span>Vehicle MH-04-CD-5678 exited successfully at 10:00 AM</span>
                    <small style="margin-left: auto; opacity: 0.7;">3 hours ago</small>
                </li>
            </ul>
        </div>

        <!-- Quick Actions -->
        <div class="card glass-card animate-fade-in">
            <h2 class="card-title gradient-text"><i class="fas fa-bolt"></i> Quick Actions</h2>
            <div class="quick-actions-grid">
                <a href="/parkflow/addVehicle" class="action-card">
                    <i class="fas fa-plus-circle"></i>
                    <h3>Add Vehicle</h3>
                    <p>Register a new vehicle to your account</p>
                </a>
                <a href="/parkflow/parkVehicle" class="action-card">
                    <i class="fas fa-parking"></i>
                    <h3>Park Vehicle</h3>
                    <p>Find and book available parking slots</p>
                </a>
                <a href="exitVehicle" class="action-card">
                    <i class="fas fa-sign-out-alt"></i>
                    <h3>Vehicle Exit</h3>
                    <p>Process vehicle exit and payment</p>
                </a>
                <a href="/parkflow/parkflowmap" class="action-card">
                    <i class="fas fa-map-marked-alt"></i>
                    <h3>Parking Map</h3>
                    <p>View real-time parking availability</p>
                </a>
                <a href="/parkflow/viewBookings" class="action-card">
                    <i class="fas fa-calendar-check"></i>
                    <h3>My Bookings</h3>
                    <p>Manage your parking reservations</p>
                </a>
                <a href="/parkflow/payment" class="action-card">
                    <i class="fas fa-credit-card"></i>
                    <h3>Payments</h3>
                    <p>View payment history and methods</p>
                </a>
            </div>
        </div>

        <!-- Recent Activities -->
        <div class="card glass-card animate-fade-in">
            <h2 class="card-title gradient-text"><i class="fas fa-history"></i> Recent Activities</h2>
            
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchInput" class="search-input" placeholder="Search by vehicle number, type, or status..." onkeyup="filterActivities()">
            </div>
            
            <div class="activities-table">
                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                    <table id="activitiesTable">
                        <thead>
                            <tr>
                                <th><i class="fas fa-car"></i> Vehicle</th>
                                <th><i class="fas fa-tag"></i> Type</th>
                                <th><i class="fas fa-clock"></i> Entry Time</th>
                                <th><i class="fas fa-map-marker"></i> Slot</th>
                                <th><i class="fas fa-info-circle"></i> Status</th>
                                <th><i class="fas fa-cog"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${recentActivities}" var="activity">
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                                            <i class="fas fa-car" style="color: var(--primary);"></i>
                                            <strong>${activity.vehicleNumber}</strong>
                                        </div>
                                    </td>
                                    <td>
                                        <span style="background: rgba(102, 126, 234, 0.1); color: var(--primary); padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8rem;">
                                            ${activity.vehicleType}
                                        </span>
                                    </td>
                                    <td>${activity.entryTime}</td>
                                    <td>
                                        <span style="background: var(--gradient-secondary); color: white; padding: 0.25rem 0.75rem; border-radius: 12px; font-weight: 600; font-size: 0.8rem;">
                                            ${activity.slotNumber}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="status-badge ${activity.status == 'PARKED' ? 'status-active' : 'status-completed'}">
                                            <i class="fas fa-${activity.status == 'PARKED' ? 'parking' : 'check-circle'}"></i>
                                            ${activity.status}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="./vehicleDetails?id=${activity.id}" class="action-btn action-btn-view" title="View Details">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <c:if test="${activity.status == 'PARKED'}">
                                                <a href="./exitVehicle?id=${activity.id}" class="action-btn action-btn-edit" title="Process Exit">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                </a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- Sample data if no activities exist -->
                            <c:if test="${empty recentActivities}">
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                                            <i class="fas fa-car" style="color: var(--primary);"></i>
                                            <strong>KA-01-AB-1234</strong>
                                        </div>
                                    </td>
                                    <td>
                                        <span style="background: rgba(102, 126, 234, 0.1); color: var(--primary); padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8rem;">
                                            Sedan
                                        </span>
                                    </td>
                                    <td>Today, 09:30 AM</td>
                                    <td>
                                        <span style="background: var(--gradient-secondary); color: white; padding: 0.25rem 0.75rem; border-radius: 12px; font-weight: 600; font-size: 0.8rem;">
                                            A-15
                                        </span>
                                    </td>
                                    <td>
                                        <span class="status-badge status-active">
                                            <i class="fas fa-parking"></i>
                                            PARKED
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="#" class="action-btn action-btn-view" title="View Details">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="#" class="action-btn action-btn-edit" title="Process Exit">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                                            <i class="fas fa-car" style="color: var(--primary);"></i>
                                            <strong>MH-04-CD-5678</strong>
                                        </div>
                                    </td>
                                    <td>
                                        <span style="background: rgba(102, 126, 234, 0.1); color: var(--primary); padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8rem;">
                                            SUV
                                        </span>
                                    </td>
                                    <td>Yesterday, 02:15 PM</td>
                                    <td>
                                        <span style="background: var(--gradient-secondary); color: white; padding: 0.25rem 0.75rem; border-radius: 12px; font-weight: 600; font-size: 0.8rem;">
                                            B-08
                                        </span>
                                    </td>
                                    <td>
                                        <span class="status-badge status-completed">
                                            <i class="fas fa-check-circle"></i>
                                            COMPLETED
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="#" class="action-btn action-btn-view" title="View Details">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="pagination" id="paginationControls"></div>
            
            <div class="text-center mt-3">
                <a href="./allActivities" class="btn btn-secondary">
                    <i class="fas fa-list"></i> View All Activities
                </a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Page Specific CSS -->
    <style>
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
        }

        .status-active {
            background-color: rgba(46, 204, 113, 0.2);
            color: var(--success);
        }

        .status-completed {
            background-color: rgba(52, 152, 219, 0.2);
            color: var(--info);
        }

        .parking-slot {
            width: 60px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: 600;
            font-size: 0.9rem;
            border: 1px solid #ddd;
            transition: var(--transition);
        }

        .parking-slot.free {
            background-color: var(--success);
            color: white;
        }

        .parking-slot.occupied {
            background-color: var(--danger);
            color: white;
        }

        .parking-slot.reserved {
            background-color: var(--warning);
            color: white;
        }

        .parking-slot:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow);
        }
    </style>

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

            if (!navLinks.contains(event.target) && !navToggle.contains(event.target) && navLinks.classList.contains('show')) {
                navLinks.classList.remove('show');
            }
        });

        // Slot clicked function
        function slotClicked(slotId) {
            const slotElement = document.querySelector(`[data-slot="${slotId}"]`);

            if (slotElement.classList.contains('free')) {
                // Show park vehicle dialog or redirect to park vehicle page
                window.location.href = `./parkVehicle?slot=${slotId}`;
            } else if (slotElement.classList.contains('occupied')) {
                // Show vehicle details or redirect to vehicle details page
                window.location.href = `./vehicleDetails?slot=${slotId}`;
            }
        }

        // Update floor map based on selection
        function updateFloorMap() {
            const floor = document.getElementById('floorSelect').value;
            const section = document.getElementById('sectionSelect').value;

            // In a real implementation, this would make an AJAX call to get the updated data
            console.log(`Loading parking map for floor ${floor}, section ${section}`);

            // Simulate a loading state
            document.getElementById('parkingMap').innerHTML = '<div style="width: 100%; text-align: center; padding: 50px;">Loading parking map...</div>';

            // Simulate an AJAX response
            setTimeout(() => {
                let slots = '';
                for (let i = 1; i <= 24; i++) {
                    const status = Math.random() > 0.6 ? 'free' : (Math.random() > 0.5 ? 'occupied' : 'reserved');
                    slots += `<div class="parking-slot ${status}" onclick="slotClicked('${section}-${i}')" data-slot="${section}-${i}">${section}-${i}</div>`;
                }
                document.getElementById('parkingMap').innerHTML = slots;
            }, 500);
        }

        // Filter recent activities table rows based on search input
        function filterActivities() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('activitiesTable');
            const trs = table.getElementsByTagName('tr');

            for (let i = 1; i < trs.length; i++) { // skip header row
                const tds = trs[i].getElementsByTagName('td');
                let show = false;
                for (let j = 0; j < tds.length; j++) {
                    if (tds[j]) {
                        const textValue = tds[j].textContent || tds[j].innerText;
                        if (textValue.toLowerCase().indexOf(filter) > -1) {
                            show = true;
                            break;
                        }
                    }
                }
                trs[i].style.display = show ? '' : 'none';
            }
        }

        // Pagination for recent activities table
        const rowsPerPage = 5;
        let currentPage = 1;

        function paginateTable() {
            const table = document.getElementById('activitiesTable');
            const trs = table.getElementsByTagName('tr');
            const totalRows = trs.length - 1; // exclude header
            const totalPages = Math.ceil(totalRows / rowsPerPage);

            // Hide all rows except header
            for (let i = 1; i < trs.length; i++) {
                trs[i].style.display = 'none';
            }

            // Show rows for current page
            const start = (currentPage - 1) * rowsPerPage + 1;
            const end = start + rowsPerPage;
            for (let i = start; i < end && i < trs.length; i++) {
                trs[i].style.display = '';
            }

            // Render pagination buttons
            const paginationControls = document.getElementById('paginationControls');
            paginationControls.innerHTML = '';

            if (totalPages <= 1) return;

            if (currentPage > 1) {
                const prevBtn = document.createElement('button');
                prevBtn.textContent = 'Prev';
                prevBtn.onclick = () => {
                    currentPage--;
                    paginateTable();
                };
                paginationControls.appendChild(prevBtn);
            }

            for (let i = 1; i <= totalPages; i++) {
                const pageBtn = document.createElement('button');
                pageBtn.textContent = i;
                pageBtn.disabled = (i === currentPage);
                pageBtn.onclick = () => {
                    currentPage = i;
                    paginateTable();
                };
                paginationControls.appendChild(pageBtn);
            }

            if (currentPage < totalPages) {
                const nextBtn = document.createElement('button');
                nextBtn.textContent = 'Next';
                nextBtn.onclick = () => {
                    currentPage++;
                    paginateTable();
                };
                paginationControls.appendChild(nextBtn);
            }
        }

        // Initialize page
        window.onload = function() {
            paginateTable();
            initializeAnimations();
            updateDashboardStats();
        };
        
        // Initialize animations
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
        
        // Update dashboard stats with animation
        function updateDashboardStats() {
            const stats = document.querySelectorAll('.stat-item h3');
            stats.forEach((stat, index) => {
                const finalValue = stat.textContent;
                let currentValue = 0;
                const increment = parseInt(finalValue.replace(/[^0-9]/g, '')) / 50;
                
                const timer = setInterval(() => {
                    currentValue += increment;
                    if (currentValue >= parseInt(finalValue.replace(/[^0-9]/g, ''))) {
                        stat.textContent = finalValue;
                        clearInterval(timer);
                    } else {
                        stat.textContent = Math.floor(currentValue) + (finalValue.includes('₹') ? '' : '');
                    }
                }, 30);
            });
        }
        
        // Enhanced search with debouncing
        let searchTimeout;
        function filterActivities() {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(() => {
                const input = document.getElementById('searchInput');
                const filter = input.value.toLowerCase();
                const table = document.getElementById('activitiesTable');
                const trs = table.getElementsByTagName('tr');
                let visibleRows = 0;
                
                for (let i = 1; i < trs.length; i++) {
                    const tds = trs[i].getElementsByTagName('td');
                    let show = false;
                    
                    if (filter === '') {
                        show = true;
                    } else {
                        for (let j = 0; j < tds.length; j++) {
                            if (tds[j]) {
                                const textValue = tds[j].textContent || tds[j].innerText;
                                if (textValue.toLowerCase().indexOf(filter) > -1) {
                                    show = true;
                                    break;
                                }
                            }
                        }
                    }
                    
                    trs[i].style.display = show ? '' : 'none';
                    if (show) visibleRows++;
                }
                
                // Show no results message
                const noResults = document.getElementById('noResults');
                if (visibleRows === 0 && filter !== '') {
                    if (!noResults) {
                        const tr = document.createElement('tr');
                        tr.id = 'noResults';
                        tr.innerHTML = '<td colspan="6" style="text-align: center; padding: 2rem; color: #666;"><i class="fas fa-search"></i> No activities found matching your search.</td>';
                        table.querySelector('tbody').appendChild(tr);
                    }
                } else if (noResults) {
                    noResults.remove();
                }
            }, 300);
        }
    </script>
</body>
</html>
