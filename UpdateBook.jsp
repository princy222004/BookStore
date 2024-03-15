<%-- 
    Document   : UpdateBook
    Created on : 08-Dec-2023, 6:41:29 pm
    Author     : shyam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Book Record</h1>
        <%
         String id=request.getParameter("id");
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from addbook where BookId=?");
            pst.setString(1, id);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
               %>
               <form action="UpdateBook" method="post">
                   <input type="hidden" name="id" value="<%out.print(id);%>">
                   <table>
                       <tr>
                           <td><label>Book Name</label></td>
                           <td><input type="text" name="bname" value="<%=rs.getString(2)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Author Name</label></td>
                           <td><input type="text" name="aname" value="<%=rs.getString(3)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Price</label></td>
                           <td><input type="text" name="price" value="<%=rs.getString(4)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Quantity</label></td>
                           <td><input type="text" name="quant" value="<%=rs.getString(5)%>"></td>
                       </tr>
                       <tr>
                           <td><input type="submit" value="Update Book"></td>
                           <td><input type="reset" value="Clear"></td>
                       </tr>
                   </table>
               </form>
        <%
            }
         }
         catch(Exception ex){
         
            }
        %>
    </body>
</html>
