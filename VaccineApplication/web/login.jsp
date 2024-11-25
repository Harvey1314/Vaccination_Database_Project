<%-- 
    Document   : login
    Created on : Nov 4, 2024, 10:28:51 AM
    Author     : trannhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="login.css">
        <script src ="loginvalidate.js"></script>
        <title>Login</title>
    </head>
    <body>
        <form class="form" action="DbsLogin.jsp" method="post">
            <h1>Vaccination Portal</h1>
            <h1>Please Login</h1>
            <input type="text" name="username" placeholder="Username" id="username">
            <input type="password" name="password" placeholder="Password" id="password">
            <input type="submit" name="action" value="Login">
            </form>
        </form>
    </body>
</html>
