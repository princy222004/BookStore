<%-- 
    Document   : userlogin
    Created on : 07-Dec-2023, 2:22:09 pm
    Author     : shyam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{padding-top: 30px}
            td{color: brown;font-size: 25px;text-align: center}
            td input{font-size: 25px;text-align: center}
            body{background-image: url("./img/th.jpg") ;text-align: center;background-size: cover;background-repeat: no-repeat}
            table{margin-left: auto;margin-right: auto}
            .reg{background-color: green;font-size: 15px;cursor: pointer;width: 50%}
            .regi{background-color: chocolate;font-size: 15px;cursor: pointer;width: 50%}
        </style>
    </head>
    <body>
        <form action="Userlogin" method="post"> 
            <h1>User Login Form</h1>
            <table border="1" >
                <tr>
                    <td>Enter the Username</td>
                    <td><input type="text" name="txt_user" placeholder="Enter Username"></td>
                    
                </tr>
                <tr>
                    <td>Enter the Password</td>
                    <td><input type="password" name="txt_pass" placeholder="Enter Password"></td>
                </tr>
                <tr>
                    <td><input  class="reg" type="submit" value="Login"></td>
                    <td><input class="regi" type="reset" value="Clear"></td>
                </tr>
                <tr>
                    <td colspan="2">If you are new user ?<a href="Signup.html">So Registered first</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
