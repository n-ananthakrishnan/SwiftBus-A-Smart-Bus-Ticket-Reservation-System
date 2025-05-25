<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bus List</title>
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
            background: #f4f4f4;
            padding: 20px;
            color: #333;
            font-size: 1em;
        }

        h2 {
            color: #e74c3c;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 30px;
        }

        /* Filter Input Styling */
        .filter-form {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .filter-form input {
            padding: 12px 20px;
            width: 60%;
            border-radius: 25px;
            border: 2px solid #e74c3c;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 1.1em;
            transition: box-shadow 0.3s, border-color 0.3s;
        }

        .filter-form input:focus {
            outline: none;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            border-color: #c0392b;
        }

        /* Card Grid Styling */
        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-bottom: 40px;
        }

        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            width: 30%;
            padding: 25px;
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            font-weight: 600;
            font-size: 1.6em;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #e74c3c;
            padding-bottom: 10px;
        }

        .card-body p {
            margin: 12px 0;
            font-size: 1em;
            color: #555;
        }

        .card-body p strong {
            color: #e74c3c;
        }

        /* Button Styling */
        .button1 {
            padding: 12px 25px;
            border-radius: 30px;
            background-color: #e74c3c;
            color: #fff;
            border: none;
            cursor: pointer;
            display: block;
            margin: 30px auto;
            font-size: 1.1em;
            text-align: center;
            width: 180px;
            transition: background-color 0.3s ease;
        }

        .button1:hover {
            background-color: #c0392b;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                width: 100%;
                max-width: 100%;
            }

            .filter-form input {
                width: 80%;
            }
        }

    </style>
</head>
<body>

    <h2>Bus List</h2>
    
    <!-- Filter input -->
    <div class="filter-form">
        <input type="text" id="busFilter" placeholder="Filter by bus name" onkeyup="filterBuses()">
    </div>

    <!-- Bus List Cards -->
    <div class="card-grid" id="busList">
        <c:forEach var="bus" items="${buses}">
            <div class="card" data-title="${bus.name.toLowerCase()}">
                <div class="card-header">${bus.name}</div>
                <div class="card-body">
                    <p><strong>Pickup Location:</strong> ${bus.pickupLocation}</p>
                    <p><strong>Drop Location:</strong> ${bus.dropLocation}</p>
                    <p><strong>Date of Trip:</strong> ${bus.tripDate}</p>
                    <p><strong>Time of Trip:</strong> ${bus.tripTime}</p>
                    <p><strong>Available Seats:</strong> ${bus.avlseats}</p>
                </div>
            </div>
        </c:forEach>
    </div>

    <button onclick="location.href='/springjpahiber/student/adminLog'" class="button1">Return</button>

    <script>
        function filterBuses() {
            const filter = document.getElementById("busFilter").value.toLowerCase();
            const cards = document.querySelectorAll(".card");

            cards.forEach((card) => {
                const title = card.getAttribute("data-title");
                card.style.display = title.includes(filter) ? "block" : "none";
            });
        }
    </script>

</body>
</html>
	