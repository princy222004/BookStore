<%-- 
    Document   : AdminHomeJsp
    Created on : 07-Dec-2023, 6:47:00 pm
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
    <center><h1>Admin Home Page</h1><br><br><br>
    <%
      String str=(String)session.getAttribute("uname");
      if(str!=null)
      {
    %>
    <a href="AddBook.jsp">Add Book</a><br><br><br><br>
    <a href="UserDetails.jsp">User Details</a><br><br><br><br>
    <a href="BookManagement.jsp">Book Management</a><br><br><br><br>
    <a href="AdminLogout">LogOut</a>
    <%
        }
    else{
       out.print("Admin you login first");
       response.sendRedirect("index.html");
        }
    %>
    </center>
    </body>
</html>
