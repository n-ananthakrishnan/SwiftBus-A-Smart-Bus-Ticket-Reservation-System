<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Buses</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #111;
            color: #eaeaea;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
        }

        h2 {
            color: #ff4c4c;
            font-size: 2em;
            margin-bottom: 30px;
        }

        /* Card Container Styling */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            width: 100%;
            max-width: 1200px;
        }

        /* Card Styling */
        .card {
            background-color: #1e1e1e;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            width: 320px;
            padding: 25px;
            transition: transform 0.3s ease;
            border: 1px solid #333;
            position: relative;
        }

        .card:hover {
            transform: translateY(-5px);
            border-color: #ff4c4c;
        }

        /* Text Styling in Cards */
        .card h3 {
            color: #ff4c4c;
            font-size: 1.4em;
            margin-bottom: 15px;
        }

        .card p {
            color: #ccc;
            margin: 8px 0;
            font-size: 0.95em;
        }

        .available-seats {
            font-weight: 600;
            color: #ff6347;
            font-size: 1em;
        }

        /* Book Button Styling */
        .book-button {
            display: inline-block;
            width: 100%;
            padding: 12px;
            background-color: #ff4c4c;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: 600;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .book-button:hover {
            background-color: #d63333;
            transform: translateY(-2px);
        }

        .book-button:active {
            transform: translateY(0);
        }

        /* No Buses Found Message */
        .no-buses {
            font-size: 1.2em;
            color: #ff4c4c;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Available Buses</h2>

   <c:if test="${not empty buses}">
    <div class="card-container">
        <c:forEach var="bus" items="${buses}">
            <div class="card">
                <h3>${bus.name}</h3>
                <p><strong>From:</strong> ${bus.pickupLocation}</p>
                <p><strong>To:</strong> ${bus.dropLocation}</p>
                <p><strong>Date:</strong> ${bus.tripDate}</p>
                <p><strong>Time:</strong> ${bus.tripTime}</p>
                <p class="available-seats"><strong>Available Seats:</strong> ${bus.avlseats}</p>
                <a href="${pageContext.request.contextPath}/student/bookTicketForm?busId=${bus.id}" class="book-button">Book Now</a>
            </div>
        </c:forEach>
    </div>
</c:if>

    <c:if test="${empty buses}">
        <p class="no-buses">No buses found for the selected route and date.</p>
    </c:if>

</body>
</html>
