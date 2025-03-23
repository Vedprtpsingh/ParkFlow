<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Add Vehicle</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
<h1>Add New Vehicle</h1>
<form action="/parkflow/addVehicle" method="post">
    <label for="vehicleDriverName">Driver Name:</label>
    <input type="text" id="vehicleDriverName" name="vehicleDriverName" required><br>
    
    <label for="licensePlate">License Plate:</label>
    <input type="text" id="licensePlate" name="licensePlate" required><br>
    
    <label for="vehicleType">Vehicle Type (CAR/BIKE):</label>
    <input type="text" id="vehicleType" name="vehicleType" required><br>
    
    <input type="submit" value="Add Vehicle">
</form>

<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<a href="/parkflow">Back to Menu</a>
</body>
</html>