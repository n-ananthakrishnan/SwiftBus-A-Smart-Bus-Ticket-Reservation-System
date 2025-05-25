<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
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
            background-color: #111;
            color: #eaeaea;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Styling */
        .login-container {
            width: 400px;
            padding: 40px;
            background-color: #1e1e1e;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
            position: relative;
        }

        /* Decorative Elements */
        .login-container::before, .login-container::after {
            content: '';
            position: absolute;
            border-radius: 15px;
            background: linear-gradient(45deg, transparent, rgba(255, 0, 0, 0.2), transparent);
        }

        .login-container::before {
            top: -2px;
            left: -2px;
            right: 50%;
            bottom: -2px;
            z-index: 0;
        }

        .login-container::after {
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

        /* Link Styling */
        

        /* Animation */
        .login-container {
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="form-content">
            <h3>User Login</h3>
            <form action="${pageContext.request.contextPath}/student/userLog" method="post">
                <label for="email">Email-ID</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>

                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password" required>

                <button type="submit">Log In</button>
            </form>
            
        </div>
    </div>
</body>
</html>
