<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bus</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f5f5f5;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        form {
            display: inline-block;
            text-align: left;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width:500px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Edit Bus</h2>
    <form action="${pageContext.request.contextPath}/student/update/${bus.id}" method="post">
        <input type="hidden" name="id" value="${bus.id}" />

        <label for="name">Bus Name:</label>
        <input type="text" id="name" name="name" value="${bus.name}" required>

        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" value="${bus.pickupLocation}" required>

        <label for="dropLocation">Drop Location:</label>
        <input type="text" id="dropLocation" name="dropLocation" value="${bus.dropLocation}" required>

        <label for="tripDate">Date of Trip:</label>
        <input type="date" id="tripDate" name="tripDate" value="${bus.tripDate}" required>

        <label for="tripTime">Time of Trip:</label>
        <input type="time" id="tripTime" name="tripTime" value="${bus.tripTime}" required>

        <label for="avlseats">Available Seats:</label>
        <input type="number" id="avlseats" name="avlseats" value="${bus.avlseats}" required>

        <button type="submit">Update Bus</button>
    </form>
</body>
</html>
