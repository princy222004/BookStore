<%-- 
    Document   : UserProfile.jsp
    Created on : 11-Dec-2023, 1:05:04 pm
    Author     : shyam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{padding: 5px}
         </style>
            
    </head>
    <body>
    <center><h1>Profile</h1>
        <%
         String id=(String)session.getAttribute("uname");
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from ulogin where username=?");
            pst.setString(1, id);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
               %>
               <form action="Userprofile" method="post">
                   <table border="1">
                       <tr>
                           <td><label>Customer Name</label></td>
                           <td><input type="text" name="bname" value="<%=rs.getString(1)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Customer Address</label></td>
                           <td><input type="text" name="aname" value="<%=rs.getString(2)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Mobile Number</label></td>
                           <td><input type="text" name="price" value="<%=rs.getString(3)%>"></td>
                       </tr>
                       <tr>
                           <td><label>Email Address</label></td>
                           <td><input type="text" name="quant" value="<%=rs.getString(4)%>"></td>
                       </tr>
                       <tr>
                           <td>Username</td>
                           <td><input type="text" name="user" value="<%=rs.getString(5)%>"></td>
                       </tr>
                       <tr>
                           <td colspan="1"><input type="submit" value="Edit"></td>
                       </tr>
                   </table>
               </form>
        <%
            }
         }
         catch(Exception ex){
         
            }
        %>
    </center>
    </body>
</html>
