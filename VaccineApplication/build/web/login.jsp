<%-- 
    Document   : login
    Created on : Nov 4, 2024, 10:28:51 AM
    Author     : trannhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="loginvalidate.js"></script>
        <style>
            /* Base Styling */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #004e92;
                font-family: Arial, sans-serif;
            }

            /* Form Container Styling */
            .form {
                background-color: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 100%;
                max-width: 400px;
            }

            /* Heading Styling */
            .form h1 {
                color: #004e92;
                margin: 0 0 20px;
                font-size: 1.8em;
            }

            /* Input Field Styling */
            .form input[type="text"],
            .form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                font-size: 1em;
                border: 2px solid #2a93c7;
                border-radius: 5px;
                outline: none;
                transition: all 0.3s ease;
            }

            .form input[type="text"]:focus,
            .form input[type="password"]:focus {
                border-color: #32e010;
                box-shadow: 0 0 5px rgba(50, 224, 16, 0.5);
            }

            /* Submit Button Styling */
            .form input[type="submit"] {
                width: 100%;
                padding: 12px;
                margin-top: 20px;
                font-size: 1em;
                font-weight: bold;
                color: white;
                background-color: #4caf50;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .form input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <form class="form" action="DbsLogin.jsp" method="post">
            <h1>Vaccination Portal</h1>
            <h1>Please Login</h1>
            <input type="text" name="username" placeholder="Username" id="username" required>
            <input type="password" name="password" placeholder="Password" id="password" required>
            <input type="submit" name="action" value="Login">
        </form>
    </body>
</html>
