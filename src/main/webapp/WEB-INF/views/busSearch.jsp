<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search for Available Buses</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styling */
        body {
            background-color: #111;
            color: #eaeaea;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Container Styling */
        .container {
            width: 100%;
            max-width: 600px;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #ff4c4c;
        }

        .form-container {
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.7);
            border: 1px solid #333;
        }

        /* Form Styling */
        .form-group label {
            font-weight: 500;
            color: #eaeaea;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: 1px solid #444;
            background-color: #222;
            color: #fff;
        }

        .form-control:focus {
            border-color: #ff4c4c;
            outline: none;
            box-shadow: 0 0 10px rgba(255, 76, 76, 0.5);
        }

        /* Button Styling */
        button {
            background-color: #ff4c4c;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        button:hover {
            background-color: #d63333;
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Find Available Buses</h2>
            <form action="${pageContext.request.contextPath}/student/searchBuses" method="get">
                <div class="form-group">
                    <label for="pickupLocation">From:</label>
                    <input type="text" id="pickupLocation" name="pickupLocation" class="form-control" placeholder="Enter Pickup Location" required>
                </div>
                
                <div class="form-group">
                    <label for="dropLocation">To:</label>
                    <input type="text" id="dropLocation" name="dropLocation" class="form-control" placeholder="Enter Drop Location" required>
                </div>
                
                <div class="form-group">
                    <label for="tripDate">Date:</label>
                    <input type="date" id="tripDate" name="tripDate" class="form-control" required>
                </div>
                
                <button type="submit">Search</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
