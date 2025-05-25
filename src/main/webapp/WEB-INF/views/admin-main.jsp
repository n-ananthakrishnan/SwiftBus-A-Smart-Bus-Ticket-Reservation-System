<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Bus Schedule</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        /* Global Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            backgorund-color:black;
            color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .container {
            width: 80%;
            padding: 40px;
            background-color: rgba(29, 29, 29, 0.85);
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.4);
            position: relative;
            margin-top:400px;
        }

        h2 {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #e94560;
        }

        .top-buttons {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .add-button {
            background-color: #e94560;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(233, 69, 96, 0.4);
        }

        .add-button:hover {
            background-color: #d23347;
            transform: scale(1.05);
        }

        /* Card Grid Styling */
        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: #333;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            flex: 0 0 48%;
            max-width: 48%;
            padding: 20px;
            margin-bottom: 20px;
            text-align: left;
            position: relative;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            font-weight: bold;
            font-size: 1.6em;
            color: #fff;
            margin-bottom: 15px;
        }

        .card-body {
            margin-bottom: 15px;
        }

        .card-body p {
            margin: 8px 0;
            font-size: 1em;
            color: #d1d1d1;
        }

        /* Action Buttons Styling */
        .action-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        .update-button,
        .delete-button {
            flex: 1;
            padding: 12px;
            font-size: 1em;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .update-button {
            background-color: #ffbb33;
            margin-right: 10px;
            box-shadow: 0 4px 8px rgba(255, 187, 51, 0.3);
        }

        .delete-button {
            background-color: #e94560;
            box-shadow: 0 4px 8px rgba(233, 69, 96, 0.3);
        }

        .update-button:hover {
            background-color: #f7a500;
            transform: scale(1.05);
        }

        .delete-button:hover {
            background-color: #d23347;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                flex: 0 0 100%;
                max-width: 100%;
            }

            .top-buttons {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Admin - Manage Bus Schedule</h2>

        <div class="top-buttons">
            <!-- Button to add a new bus -->
            <button class="add-button" onclick="window.location.href='new'">Add New Bus</button>
        </div>

        <!-- Display buses in a grid format with 2 cards per row -->
        <div class="card-grid">
            <c:forEach var="bus" items="${buses}">
                <div class="card">
                    <div class="card-header">${bus.name}</div>
                    <div class="card-body">
                        <p><strong>Pickup Location:</strong> ${bus.pickupLocation}</p>
                        <p><strong>Drop Location:</strong> ${bus.dropLocation}</p>
                        <p><strong>Date of Trip:</strong> ${bus.tripDate}</p>
                        <p><strong>Time of Trip:</strong> ${bus.tripTime}</p>
                        <p><strong>Available Seats:</strong> ${bus.avlseats}</p>
                    </div>
                    <div class="action-buttons">
                        <!-- Button to update bus -->
                        <button class="update-button" onclick="window.location.href='edit/${bus.id}'">Update</button>
                        <!-- Button to delete bus with confirmation -->
                        <button class="delete-button" onclick="confirmDelete(${bus.id})">Delete</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        // JavaScript function to confirm deletion of a bus
        function confirmDelete(busId) {
            if (confirm("Are you sure you want to delete this bus?")) {
                window.location.href = 'delete/' + busId;
            }
        }
    </script>
</body>
</html>
