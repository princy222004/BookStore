<%-- 
    Document   : BookManagement
    Created on : 08-Dec-2023, 6:23:43 pm
    Author     : shyam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String str=(String)session.getAttribute("uname");
         out.print("Welcome "+str);
         if(str!=null){
         %>
    <center><h1>Book Management</h1>
    <table border="1">
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action1</th>
            <th>Action2</th>
        </tr>
        <%
             try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from addbook");
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
            String BId=rs.getString(1);
            String Bname=rs.getString(2);
            String Aname=rs.getString(3);
            String price=rs.getString(4);
            String quantity=rs.getString(5);
            %>
            <tr>
                <td><%=BId%></td>
                <td><%=Bname%></td>
                <td><%=Aname%></td>
                <td><%=price%></td>
                <td><%=quantity%></td>
                <td><a href=DeleteBook?id=<%=BId%>>Delete</a></td>
                <td><a href=UpdateBook.jsp?id=<%=BId%>>Update</td>
            </tr>
        <%
            }
            }
            catch(Exception ex){
            
            }
            }
else{
  out.print("Admin you login first");
response.sendRedirect("index.html");
}
        %>
        </table>
        </center>
    </body>
</html>
