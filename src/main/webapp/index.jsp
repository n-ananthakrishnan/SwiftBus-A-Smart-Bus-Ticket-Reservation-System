<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus Reservation System</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

/* Reset default margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: "Poppins", sans-serif;
    background-color: #121212; /* Black background */
    color: #fff;
}

/* Hero Section Styling */
.hero {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 80vh;
    text-align: center;
    padding: 0 20px;
}

.hero h2 {
    font-size: 3em;
    color: #ff4c4c;
    margin-bottom: 20px;
}

.hero p {
    font-size: 1.2em;
    max-width: 600px;
    margin-bottom: 30px;
    line-height: 1.6;
}

/* Buttons Styling */
.button-container {
    display: flex;
    gap: 20px;
}

button {
    color: #121212; /* Black text color */
    background-color: #ff4c4c; /* Red background for buttons */
    height: 50px;
    width: 200px;
    border-radius: 15px;
    border: 2px solid #ff4c4c;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: transform 0.2s, background-color 0.2s;
}

button:hover {
    transform: scale(1.05);
    background-color: #ff1a1a; /* Darker red on hover */
    color: #fff;
}

/* Footer Styling */
.footer {
    width: 100%;
    padding: 20px 0;
    text-align: center;
    background-color: #1e1e1e;
    color: #fff;
    position: absolute;
    bottom: 0;
}

.footer p {
    font-size: 0.9em;
}
</style>
</head>
<body>

<div class="hero">
    <h2>Welcome to the Bus Reservation System</h2>
    <p>Book your bus tickets with ease and comfort. Whether you are an admin managing the system or a user looking to travel, we have everything you need.</p>
    <div class="button-container">
        <button onclick="location.href='student/admin'">Admin Login</button>
        <button onclick="location.href='student/user'">User Login</button>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Bus Reservation System. All Rights Reserved.</p>
</div>

</body>
</html>
