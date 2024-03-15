<%-- 
    Document   : UserDetails.jsp
    Created on : 10-Dec-2023, 10:28:49 pm
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
    </head>
    <body>
    <center>
        <h1>User Details</h1>
        <table border="1">
            <tr>
                <th>Customer Name</th>
                <th>Customer Address</th> 
                <th>Customer Mobile No.</th>
                <th>Customer Email</th>
                <th>Username</th>
                <th>Action</th>
            </tr>
            <%
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from ulogin");
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
            String custname=rs.getString(1);
            String custadd=rs.getString(2);
            Long mob=rs.getLong(3);
            String email=rs.getString(4);
            String user=rs.getString(5);
            %>
            <tr>
                <td><%=custname%></td>
                <td><%=custadd%></td>
                <td><%=mob%></td>
                <td><%=email%></td>
                <td><%=user%></td>
                <td><a href=DeleteUser?id=<%=user%>>delete</td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
catch(Exception ex){

}

        %>
    </center>
    </body>
</html>
