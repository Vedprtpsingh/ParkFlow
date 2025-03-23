<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Park Vehicle</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
<h1>Park Vehicle</h1>
<form action="/parkflow/parkVehicle" method="post">
    <label for="licensePlate">License Plate:</label>
    <input type="text" id="licensePlate" name="licensePlate" required><br>
    
    <label for="slotId">Select Slot:</label>
    <select id="slotId" name="slotId" required>
        <c:forEach var="slot" items="${availableSlots}">
            <option value="${slot.id}">${slot.slotNumber} (${slot.slotType})</option>
        </c:forEach>
    </select><br>
    
    <input type="submit" value="Park Vehicle">
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