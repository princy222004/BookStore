<%-- 
    Document   : BookInfo.jsp
    Created on : 11-Dec-2023, 10:25:02 am
    Author     : shyam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .Link{border-style: double;border-radius: 5px;text-decoration: none}
            .img{width: 7%}
            td{padding: 5px}
        </style>
    </head>
    <body>
    <center>
        <h1>Book Information</h1>
        <p align="right">
            <%
            String str=(String)session.getAttribute("uname");
           
            %>
        <h1 align="right"><a href="Order.jsp"><img src="./img/cart.jpg"class="img"></a></h1>
        </p>
        <table border="1">
            <tr>
                <th>Book Id</th>
                <th>Book Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
            <%
            try
            {  
             Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from addbook");
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
              String BId=rs.getString(1);
              String Bname=rs.getString(2);
              String aname=rs.getString(3);
              String price=rs.getString(4);
              String quant=rs.getString(5);
              %>
              <tr>
                  <td><%=BId%></td>
                  <td><%=Bname%></td>
                  <td><%=aname%></td>
                  <td><%=price%></td>
                  <td><%=quant%></td>
                  <td><a class="Link" href=AddtoCart.jsp?id=<%=BId%>>Add to cart</a></td>
              </tr>
            <%
            }
            }
            catch(Exception ex){
            
            }
            %>
        </table>
        <br>Go to user home page so Click!<a href="UserHomePage.jsp">here</a>
    </center>
    </body>
</html>
