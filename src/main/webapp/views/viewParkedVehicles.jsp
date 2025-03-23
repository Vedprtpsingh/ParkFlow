<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Parked Vehicles</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
<h1>Currently Parked Vehicles</h1>

<table border="1">
    <tr>
        <th>License Plate</th>
        <th>Vehicle Type</th>
        <th>Slot Number</th>
        <th>Entry Time</th>
    </tr>
    <c:forEach var="record" items="${activeRecords}">
        <tr>
            <td>${record.vehicle.licensePlate}</td>
            <td>${record.vehicle.vehicleType}</td>
            <td>${record.parkingSlot.slotNumber}</td>
            <td>${record.entryTime}</td>
        </tr>
    </c:forEach>
</table>

<a href="/parkflow">Back to Menu</a>
</body>
</html>