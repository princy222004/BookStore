<%-- 
    Document   : UserHomePage
    Created on : 07-Dec-2023, 6:32:35 pm
    Author     : shyam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{background-image: url("./img/th.jpg");background-repeat: no-repeat;background-size: cover}
            h1{color: brown}
            a{text-decoration: none;padding: 10px;border-style: outset;border-spacing: 20px;border-width: 2px;border-color: chocolate;border-radius: 5px}
        </style>
    </head>
    <body>
    <center><h1>Home Page</h1></center>
    <p align="right">
        <%
         String str=(String)session.getAttribute("uname");
         out.print("Welcome"+str);
         if(str!=null){
        %>
    </p>
    <center>
        <header>
            <a href="BookInfo.jsp">Book Details</a>
            <a href="Order.jsp">Add to Cart</a>
            <a href="UserProfile.jsp">Profile</a>
            <a href="AdminLogout">Logout</a>
        </header>
    </center>
    <%
        }
else{
       out.print("Login First");
       response.sendRedirect("userlogin.jsp");
}
    %>
    </body>
</html>
