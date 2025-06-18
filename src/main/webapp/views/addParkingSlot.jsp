<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Parking Slot</title>
    <link rel="stylesheet" href="../style.css" />
    <script>
        // Set default position to Delhi coordinates
        const defaultPosition = { lat: 28.6139, lng: 77.2090 };
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrd-mSridrQKMbjdSb8L25Y-8luPu0vM0&callback=initMap" async defer></script>
    <style>
        #map {
            height: 400px;
            width: 100%;
            margin: 20px 0;
        }
        .location-controls {
            margin: 10px 0;
            display: flex;
            gap: 10px;
        }
        .user-position-indicator {
            background-color: #4285f4;
            border-radius: 50%;
            height: 16px;
            width: 16px;
            border: 2px solid white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }
        .accuracy-circle {
            background-color: rgba(66, 133, 244, 0.15);
            border-radius: 50%;
            border: 1px solid rgba(66, 133, 244, 0.5);
        }
        .location-status {
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .legend {
            background: white;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            margin-top: 10px;
            display: flex;
            gap: 15px;
        }
        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .blue-dot {
            width: 12px;
            height: 12px;
            background-color: #4285F4;
            border-radius: 50%;
            border: 2px solid white;
        }
        .red-pin {
            width: 12px;
            height: 12px;
            background-color: #FF0000;
            border-radius: 50%;
        }
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .message.success {
            background-color: #e6f4ea;
            color: #2e7d32;
        }
        .message.error {
            background-color: #fce8e6;
            color: #c62828;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <h2>Add Parking Slot</h2>
        <div id="messageContainer"></div>
        
        <div class="location-status" id="locationStatus">Waiting for location...</div>
        
            <form id="addParkingSlotForm" action="/parkflow/addParkingSlot" method="post">
            <div class="input-group">
                <label for="numberOfSlots">Add Number Of Slots:</label>
                <input type="text" id="numberOfSlots" name="numberOfSlots" required />
            </div>
            <div class="input-group">
                <label for="latitude">Latitude:</label>
                <input type="text" id="latitude" name="latitude" readonly required />
            </div>
            <div class="input-group">
                <label for="longitude">Longitude:</label>
                <input type="text" id="longitude" name="longitude" readonly required />
            </div>
            
            <div id="map"></div>
            
            <div class="legend">
                <div class="legend-item">
                    <div class="blue-dot"></div>
                    <span>Your Location</span>
                </div>
                <div class="legend-item">
                    <div class="red-pin"></div>
                    <span>Parking Slot (Draggable)</span>
                </div>
            </div>
            
            <div class="location-controls">
                <button type="button" id="centerOnUser">Center On My Location</button>
                <button type="button" id="startTracking">Start Live Tracking</button>
                <button type="button" id="stopTracking" disabled>Stop Tracking</button>
                <button type="button" id="useMyLocation">Use Location for Parking Slot</button>
            </div>
            
            <p><small>Drag the red pin or click on the map to set parking slot location</small></p>
            
            <button type="submit">Add Slot</button>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
    <script>
        let map;
        let parkingSlotMarker; // Draggable pin for parking slot
        let userMarker;        // User's location marker
        let accuracyCircle;
        let watchId;
        let isTracking = false;
        
        function initMap() {
            // Initialize the map with default position
            map = new google.maps.Map(document.getElementById('map'), {
                center: defaultPosition,
                zoom: 15,
                mapTypeControl: true,
                streetViewControl: false,
                fullscreenControl: true
            });
            
            // Initialize the marker for selecting parking slot position (draggable pin)
            parkingSlotMarker = new google.maps.Marker({
                position: defaultPosition,
                map: map,
                draggable: true,
                animation: google.maps.Animation.DROP,
                title: 'Drag me to set parking slot location',
                icon: {
                    url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    scaledSize: new google.maps.Size(40, 40)
                }
            });
            
            // Set initial form values
            document.getElementById('latitude').value = defaultPosition.lat.toFixed(6);
            document.getElementById('longitude').value = defaultPosition.lng.toFixed(6);
            
            // Update form values when marker is dragged
            parkingSlotMarker.addListener('dragend', function() {
                const position = parkingSlotMarker.getPosition();
                document.getElementById('latitude').value = position.lat().toFixed(6);
                document.getElementById('longitude').value = position.lng().toFixed(6);
                
                // Give visual feedback that pin has been placed
                parkingSlotMarker.setAnimation(google.maps.Animation.BOUNCE);
                setTimeout(() => {
                    parkingSlotMarker.setAnimation(null);
                }, 500);
            });
            
            // Update marker and form values when map is clicked
            map.addListener('click', function(event) {
                parkingSlotMarker.setPosition(event.latLng);
                document.getElementById('latitude').value = event.latLng.lat().toFixed(6);
                document.getElementById('longitude').value = event.latLng.lng().toFixed(6);
                
                // Give visual feedback that pin has been placed
                parkingSlotMarker.setAnimation(google.maps.Animation.BOUNCE);
                setTimeout(() => {
                    parkingSlotMarker.setAnimation(null);
                }, 500);
            });
            
            // Request one-time location
            getUserLocation();
            
            // Set up button event listeners
            document.getElementById('centerOnUser').addEventListener('click', centerOnUser);
            document.getElementById('startTracking').addEventListener('click', startLocationTracking);
            document.getElementById('stopTracking').addEventListener('click', stopLocationTracking);
            document.getElementById('useMyLocation').addEventListener('click', useMyLocationForParking);
            
            // Set up form submission handler
            // document.getElementById('addParkingSlotForm').addEventListener('submit', function(event) {
            //     event.preventDefault();
            //     submitForm();
            // });
        }
        
        function submitForm() {
            const numberOfSlots = document.getElementById('numberOfSlots').value;
            const latitude = document.getElementById('latitude').value;
            const longitude = document.getElementById('longitude').value;
            const messageContainer = document.getElementById('messageContainer');
            
            // Clear previous messages
            messageContainer.innerHTML = '';
            
            fetch('/parkflow/addParkingSlot', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'numberOfSlots=' + encodeURIComponent(numberOfSlots) + '&latitude=' + encodeURIComponent(latitude) + '&longitude=' + encodeURIComponent(longitude)
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw new Error('Failed to add parking slot');
                }
            })
            .then(() => {
                // Show success message
                const successDiv = document.createElement('div');
                successDiv.className = 'message success';
                successDiv.textContent = 'Parking slot added successfully!';
                messageContainer.appendChild(successDiv);
            })
            .catch(error => {
                // Show error message
                const errorDiv = document.createElement('div');
                errorDiv.className = 'message error';
                errorDiv.textContent = error.message;
                messageContainer.appendChild(errorDiv);
            });
        }
        
        function getUserLocation() {
            if (navigator.geolocation) {
                const locationStatus = document.getElementById('locationStatus');
                locationStatus.innerHTML = "Getting your location...";
                
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        const userPosition = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        
                        // Success - create or update user position
                        updateUserPosition(position);
                        
                        // Center map on user's position
                        map.setCenter(userPosition);
                        
                        // Show success message with accuracy
                        locationStatus.innerHTML = `Location found! Accuracy: ${position.coords.accuracy.toFixed(1)} meters`;
                        locationStatus.style.backgroundColor = "#e6f4ea";
                    },
                    function(error) {
                        // Handle error
                        handleLocationError(error);
                    },
                    { 
                        enableHighAccuracy: true,
                        timeout: 10000,
                        maximumAge: 0
                    }
                );
            } else {
                // Browser doesn't support geolocation
                handleLocationError({code: 0, message: "Your browser doesn't support geolocation"});
            }
        }
        
        function updateUserPosition(position) {
            const userPosition = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            
            // Remove previous user marker and accuracy circle if they exist
            if (userMarker) userMarker.setMap(null);
            if (accuracyCircle) accuracyCircle.setMap(null);
            
            // Create accuracy circle
            accuracyCircle = new google.maps.Circle({
                map: map,
                center: userPosition,
                radius: position.coords.accuracy,
                fillColor: '#4285F4',
                fillOpacity: 0.15,
                strokeColor: '#4285F4',
                strokeOpacity: 0.5,
                strokeWeight: 1
            });
            
            // Create user marker
            userMarker = new google.maps.Marker({
                position: userPosition,
                map: map,
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    scale: 8,
                    fillColor: '#4285F4',
                    fillOpacity: 1,
                    strokeColor: '#FFFFFF',
                    strokeWeight: 2
                },
                title: 'Your Current Location',
                zIndex: 1 // Ensure user marker appears above the parking slot marker
            });
        }
        
        function startLocationTracking() {
            if (navigator.geolocation && !isTracking) {
                const locationStatus = document.getElementById('locationStatus');
                locationStatus.innerHTML = "Live tracking started...";
                locationStatus.style.backgroundColor = "#e6f4ea";
                
                // Toggle button states
                document.getElementById('startTracking').disabled = true;
                document.getElementById('stopTracking').disabled = false;
                
                isTracking = true;
                
                // Start watching position
                watchId = navigator.geolocation.watchPosition(
                    function(position) {
                        // Update user's marker and accuracy circle
                        updateUserPosition(position);
                        
                        // Update status
                        locationStatus.innerHTML = `Live tracking active. Accuracy: ${position.coords.accuracy.toFixed(1)} meters`;
                    },
                    function(error) {
                        handleLocationError(error);
                        stopLocationTracking();
                    },
                    { 
                        enableHighAccuracy: true,
                        timeout: 10000,
                        maximumAge: 0
                    }
                );
            }
        }
        
        function stopLocationTracking() {
            if (isTracking) {
                // Clear the watch
                navigator.geolocation.clearWatch(watchId);
                
                // Toggle button states
                document.getElementById('startTracking').disabled = false;
                document.getElementById('stopTracking').disabled = true;
                
                // Update status
                const locationStatus = document.getElementById('locationStatus');
                locationStatus.innerHTML = "Live tracking stopped";
                locationStatus.style.backgroundColor = "#f5f5f5";
                
                isTracking = false;
            }
        }
        
        function centerOnUser() {
            if (userMarker) {
                map.setCenter(userMarker.getPosition());
            } else {
                getUserLocation();
            }
        }
        
        function useMyLocationForParking() {
            if (userMarker) {
                const userPosition = userMarker.getPosition();
                parkingSlotMarker.setPosition(userPosition);
                document.getElementById('latitude').value = userPosition.lat().toFixed(6);
                document.getElementById('longitude').value = userPosition.lng().toFixed(6);
                
                // Give visual feedback
                parkingSlotMarker.setAnimation(google.maps.Animation.BOUNCE);
                setTimeout(() => {
                    parkingSlotMarker.setAnimation(null);
                }, 1000);
            } else {
                alert("Your location isn't available yet. Please try again.");
                getUserLocation();
            }
        }
        
        function handleLocationError(error) {
            const locationStatus = document.getElementById('locationStatus');
            locationStatus.style.backgroundColor = "#fce8e6";
            
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    locationStatus.innerHTML = "User denied the request for geolocation.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    locationStatus.innerHTML = "Location information is unavailable.";
                    break;
                case error.TIMEOUT:
                    locationStatus.innerHTML = "The request to get user location timed out.";
                    break;
                default:
                    locationStatus.innerHTML = "An unknown error occurred getting location.";
                    break;
            }
            
            document.getElementById('latitude').value = defaultPosition.lat.toFixed(6);
            document.getElementById('longitude').value = defaultPosition.lng.toFixed(6);
        }
    </script>
</body>
</html>
