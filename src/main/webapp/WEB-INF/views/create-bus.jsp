<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Bus</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
        	background-color:black;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container Styling */
        .container {
            width: 100%;
            max-width: 500px;
            padding: 30px;
            background-color: #222222;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            margin-top:250px;
        }

        h1 {
            font-size: 2em;
            color: #e74c3c;
            margin-bottom: 25px;
        }

        /* Label Styling */
        label {
            display: block;
            font-size: 1em;
            color: #ecf0f1;
            text-align: left;
            margin: 12px 0 5px;
        }

        /* Input Field Styling */
        input[type="text"],
        input[type="date"],
        input[type="time"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #e74c3c;
            background-color: #34495e;
            color: #ecf0f1;
            font-size: 1.1em;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus,
        input[type="number"]:focus {
            border: 1px solid #c0392b;
            outline: none;
        }

        /* Button Styling */
        button {
            margin-top: 20px;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            background-color: #e74c3c;
            color: #ffffff;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c0392b;
        }

        /* Link to View Bus List */
        .view-link {
            display: block;
            margin-top: 20px;
            color: #e74c3c;
            text-decoration: none;
            font-size: 1em;
            transition: color 0.3s ease;
        }

        .view-link:hover {
            color: #c0392b;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Bus</h1>
       <form action="${pageContext.request.contextPath}/student/save" method="post">
            <label for="name">Bus Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="pickupLocation">Pickup Location:</label>
            <input type="text" name="pickupLocation" id="pickupLocation" required>

            <label for="dropLocation">Drop Location:</label>
            <input type="text" name="dropLocation" id="dropLocation" required>

            <label for="tripDate">Date of Trip:</label>
            <input type="date" name="tripDate" id="tripDate" required>

            <label for="tripTime">Time of Trip:</label>
            <input type="time" name="tripTime" id="tripTime" required>
            
            <label for="avlseats">Available Seats:</label>
            <input type="number" name="avlseats" id="avlseats" required>
            
            <button type="submit">Add Bus</button>
        </form>
        <a href="list" class="view-link">View Bus List</a>
    </div>
</body>
</html>
