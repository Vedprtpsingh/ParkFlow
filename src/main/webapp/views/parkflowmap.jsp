<!DOCTYPE html>
<html>
<head>
    <title>Parkflow Map</title>
    <style>
        #map {
            height: 600px;
            width: 100%;
        }
        .location-controls {
            margin: 10px 0;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        button {
            cursor: pointer;
            padding: 10px 15px;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            background-color: #4285f4;
            color: white;
            transition: background-color 0.3s ease;
        }
        button:disabled {
            background-color: #a0a0a0;
            cursor: not-allowed;
        }
        button:hover:not(:disabled) {
            background-color: #3367d6;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFM7P5fK-NZVJBgn02LZO4vek-kf6aKxY&callback=initMap" async defer></script>
    <script>
        let map;
        let userMarker;
        let accuracyCircle;
        let watchId = null;

        function initMap() {
            const defaultCenter = { lat: 0, lng: 0 };
            map = new google.maps.Map(document.getElementById('map'), {
                center: defaultCenter,
                zoom: 13
            });
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    position => {
                        const userPos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        accuracyCircle = new google.maps.Circle({
                            map: map,
                            center: userPos,
                            radius: position.coords.accuracy,
                            fillColor: '#4285F4',
                            fillOpacity: 0.15,
                            strokeColor: '#4285F4',
                            strokeOpacity: 0.5,
                            strokeWeight: 1
                        });
                        userMarker = new google.maps.Marker({
                            position: userPos,
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
                            zIndex: 1
                        });
                        map.setCenter(userPos);
                    },
                    error => {
                        console.error('Error getting user location:', error);
                    },
                    {
                        enableHighAccuracy: true,
                        timeout: 10000,
                        maximumAge: 0
                    }
                );
            }

            fetch('/parkflow/locations')
                .then(response => response.json())
                .then(data => {
                    data.forEach(slot => {
                        console.log('Slot data:', slot);
                        const position = { lat: slot.latitude, lng: slot.longitude };
                        const marker = new google.maps.Marker({
                            position: position,
                            map: map,
                            title: `Slot ID: ${slot.id}, Number of Slots: ${slot.numberOfSlots}`,
                            label: {
                                text: slot.numberOfSlots.toString(),
                                color: "white",
                                fontSize: "14px",
                                fontWeight: "bold"
                            },
                            icon: {
                                url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png',
                                scaledSize: new google.maps.Size(40, 40)
                            }
                        });
                        const infoWindow = new google.maps.InfoWindow({
                            content: `<div style="font-size:16px;"><strong>Slot ID:</strong> ${slot.id}<br/><strong>Number of Slots:</strong> ${slot.numberOfSlots}</div>`
                        });
                        marker.addListener('click', () => {
                            infoWindow.open(map, marker);
                        });
                    });
                })
                .catch(error => {
                    console.error('Error fetching parking slots:', error);
                });

            // Location control buttons event listeners
            document.getElementById('centerOnUser').addEventListener('click', () => {
                if (userMarker) {
                    map.setCenter(userMarker.getPosition());
                    map.setZoom(15);
                } else {
                    alert('User location not available.');
                }
            });

            document.getElementById('startTracking').addEventListener('click', () => {
                if (navigator.geolocation && !watchId) {
                    watchId = navigator.geolocation.watchPosition(
                        position => {
                            const userPos = {
                                lat: position.coords.latitude,
                                lng: position.coords.longitude
                            };
                            if (userMarker) {
                                userMarker.setPosition(userPos);
                            } else {
                                userMarker = new google.maps.Marker({
                                    position: userPos,
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
                                    zIndex: 1
                                });
                            }
                            if (accuracyCircle) {
                                accuracyCircle.setCenter(userPos);
                                accuracyCircle.setRadius(position.coords.accuracy);
                            }
                            map.setCenter(userPos);
                            document.getElementById('locationStatus').textContent = 'Live tracking enabled.';
                            document.getElementById('startTracking').disabled = true;
                            document.getElementById('stopTracking').disabled = false;
                        },
                        error => {
                            console.error('Error watching position:', error);
                            document.getElementById('locationStatus').textContent = 'Error watching position.';
                        },
                        {
                            enableHighAccuracy: true,
                            timeout: 10000,
                            maximumAge: 0
                        }
                    );
                }
            });

            document.getElementById('stopTracking').addEventListener('click', () => {
                if (watchId) {
                    navigator.geolocation.clearWatch(watchId);
                    watchId = null;
                    document.getElementById('locationStatus').textContent = 'Live tracking stopped.';
                    document.getElementById('startTracking').disabled = false;
                    document.getElementById('stopTracking').disabled = true;
                }
            });

            document.getElementById('useMyLocation').addEventListener('click', () => {
                if (userMarker) {
                    const pos = userMarker.getPosition();
                    alert(`Using location: ${pos.lat().toFixed(6)}, ${pos.lng().toFixed(6)}`);
                } else {
                    alert('User location not available.');
                }
            });
        }
    </script>
</head>
<body>
    <h1>Parkflow Map</h1>
    <div id="locationStatus" aria-live="polite" style="margin-bottom: 10px;"></div>
    <div id="map"></div>
</body>
</html>
