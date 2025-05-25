<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Ticket Booking</title>
    <style>
        /* Basic reset and styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="number"],
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        input[type="number"]:focus,
        input[type="text"]:focus,
        input[type="date"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .beverage-checkbox {
            margin: 10px 0;
        }

        .beverage-checkbox input {
            margin-right: 10px;
        }

        .beverage-checkbox label {
            font-size: 14px;
            color: #444;
        }

        .total-amount {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
            color: #4CAF50;
        }

        button {
            width: 100%;
            padding: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #388e3c;
        }

        .note {
            font-size: 14px;
            text-align: center;
            color: #888;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 24px;
            }

            button {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <!-- Search Form -->
<div class="container">
    <h2>Search Available Buses</h2>
    <form id="searchForm" action="${pageContext.request.contextPath}/student/searchBuses" method="get">
        <label for="fromLocation">From Location:</label>
        <input type="text" id="fromLocation" name="fromLocation" placeholder="Enter Starting Point" required />

        <label for="toLocation">To Location:</label>
        <input type="text" id="toLocation" name="toLocation" placeholder="Enter Destination" required />

        <label for="travelDate">Travel Date:</label>
        <input type="date" id="travelDate" name="travelDate" required pattern="\d{4}-\d{2}-\d{2}" />


        <button type="submit">Search Buses</button>
    </form>
</div>
    
</body>
</html>
