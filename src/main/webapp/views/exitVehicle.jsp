<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exit Vehicle - ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .exit-button {
            background-color: #f44336;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        .exit-button:hover {
            background-color: #d32f2f;
        }
        .exit-button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .status-message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            display: none;
        }
        .status-success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .status-error {
            background-color: #f2dede;
            color: #a94442;
        }
    </style>
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>
    
    <div class="container">
        <h1>Exit Vehicle</h1>
        <p>Click the button below to open the exit barrier</p>
        <button id="exitButton" class="exit-button" onclick="openExitBarrier()">Click Here For Exit</button>
        <div id="statusMessage" class="status-message"></div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
    <script>
        function openExitBarrier() {
            var button = document.getElementById('exitButton');
            var statusMessage = document.getElementById('statusMessage');
            
            // Disable button to prevent multiple clicks
            button.disabled = true;
            button.innerText = "Opening barrier...";
            
            // Call our Arduino controller API
            fetch('/api/arduino/toggle')
                .then(response => response.text())
                .then(data => {
                    statusMessage.style.display = 'block';
                    
                    if (data.includes("successfully")) {
                        statusMessage.className = "status-message status-success";
                        statusMessage.innerText = "Exit barrier opened successfully. Please drive safely.";
                    } else {
                        statusMessage.className = "status-message status-error";
                        statusMessage.innerText = "Error: " + data;
                        // Re-enable button in case of error
                        button.disabled = false;
                        button.innerText = "Try Again";
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    statusMessage.style.display = 'block';
                    statusMessage.className = "status-message status-error";
                    statusMessage.innerText = "Error connecting to barrier system. Please contact staff.";
                    
                    // Re-enable button in case of error
                    button.disabled = false;
                    button.innerText = "Try Again";
                })
                .finally(() => {
                    // If successful, change button text after 5 seconds (same as relay timing)
                    if (button.disabled) {
                        setTimeout(() => {
                            button.innerText = "Exit Successful";
                        }, 5000);
                    }
                });
        }
    </script>
</body>
</html>