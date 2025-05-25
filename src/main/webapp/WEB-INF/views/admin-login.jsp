<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styling */
        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            width: 100vw;
            background-color: #111;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .background {
            width: 400px;
            padding: 40px;
            background-color: #1e1e1e;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
            position: relative;
        }

        /* Decorative Elements */
        .background::before, .background::after {
            content: '';
            position: absolute;
            border-radius: 15px;
            background: linear-gradient(45deg, transparent, rgba(255, 0, 0, 0.2), transparent);
        }

        .background::before {
            top: -2px;
            left: -2px;
            right: 50%;
            bottom: -2px;
            z-index: 0;
        }

        .background::after {
            top: -2px;
            right: -2px;
            left: 50%;
            bottom: -2px;
            z-index: 0;
        }

        .form-content {
            position: relative;
            z-index: 1;
        }

        h3 {
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #ff4c4c;
        }

        /* Input Styling */
        label {
            display: block;
            font-weight: 500;
            margin-top: 20px;
            color: #eaeaea;
            font-size: 0.9em;
        }

        input {
            width: 100%;
            height: 45px;
            margin-top: 10px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #333;
            background-color: #2a2a2a;
            color: #eaeaea;
            font-size: 1em;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #ff4c4c;
            outline: none;
        }

        input::placeholder {
            color: #999;
            font-size: 0.9em;
        }

        /* Button Styling */
        button {
            width: 100%;
            height: 50px;
            margin-top: 30px;
            background-color: #ff4c4c;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #d63333;
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }

        /* Error Message Styling */
        .error {
            position: relative;
            z-index: 10;
            background-color: rgba(255, 0, 0, 0.2);
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid rgba(255, 0, 0, 0.4);
            color: #ff4d4d;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
            margin-bottom: 15px;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 15px rgba(255, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<div class="background">
    <div class="form-content">
        <h3>Admin Login</h3>
        <form action="${pageContext.request.contextPath}/student/adminAuthenticate" method="post">
            <label for="email">Email-ID</label>
            <input type="text" placeholder="Email" id="email" name="email" required>

            <label for="password">Password</label>
            <input type="password" placeholder="Password" id="password" name="password" required>

            <button type="submit">Log In</button>
        </form>
    </div>
    <c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>
    
</div>


</body>
</html>
