<%-- 
    Document   : AddtoCart
    Created on : 12-Dec-2023, 2:26:51 pm
    Author     : shyam
--%>

<%@page import="java.util.ArrayList"%>
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
        <%
        String id=request.getParameter("id");
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
           PreparedStatement pst=con.prepareStatement("select * from addbook where BookId=?");
           pst.setString(1,id);
           ResultSet rs=pst.executeQuery();
           if(rs.next()){
           Integer kk=(Integer)session.getAttribute("count");
           int k=1;
           if(kk==null){
           session.setAttribute("count", new Integer(1));
            }
            else{
            k=kk;
            k=k+1;
            session.setAttribute("count", new Integer(k));
            }
            ArrayList al=new ArrayList();
            al.add(rs.getString(1));
            al.add(rs.getString(2));
            al.add(rs.getString(3));
            al.add(rs.getString(4));
            al.add(rs.getString(5));
            session.setAttribute(""+k, al);
            response.sendRedirect("BookInfo.jsp");
            }
        }
        catch(Exception ex){
            
        }
        %>
    </body>
</html>
