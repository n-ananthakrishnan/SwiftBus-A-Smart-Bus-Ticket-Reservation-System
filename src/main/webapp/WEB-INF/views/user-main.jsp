<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bus Reservation - User Homepage</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f7f9fc;
            margin: 0;
        }
        .container {
            width: 400px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Find a Bus</h2>
        <!-- Form to search buses -->
        <form action="${pageContext.request.contextPath}/student/searchBuses" method="get">
            <label for="fromLocation">From:</label>
            <input type="text" id="fromLocation" name="fromLocation" placeholder="Enter departure city" required>

            <label for="toLocation">To:</label>
            <input type="text" id="toLocation" name="toLocation" placeholder="Enter destination city" required>

            <label for="travelDate">Date of Travel:</label>
            <input type="date" id="travelDate" name="travelDate" required>

            <button type="submit">Check Availability</button>
        </form>	
    </div>
</body>
</html>
