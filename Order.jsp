<%-- 
    Document   : Order
    Created on : 12-Dec-2023, 2:35:36 pm
    Author     : shyam
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Order Page</h1>
        <p align="right">
            <%
            int i=0;
            String str=(String)session.getAttribute("uname");
            out.print("Welcome "+str);
            %>
        <table border="1">
            <tr>
                <th>Book ID</th>
                <th>Book Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Total Quantity</th>
                <th>Purchase</th>
                <th>Amount</th>
                <th>Calculate</th>
            </tr>
            <%
            for(i=1;i<=(Integer)session.getAttribute("count");i++){
                ArrayList str1=(ArrayList)session.getAttribute(""+1);
                Iterator itr=str1.iterator();
                {
                 int p=0;
                 %>
                 <tr>
            <%
                while(itr.hasNext()){
                %>
                <td id="<%=i+""+p%>"><%=(String)itr.next()%></td>
                <%
                    p++;
                }
                %>
                <td><input type="text" id="qua<%=i%>" name="pur"></td><!-- comment -->
                <td><label id="total<%=i%>"></td>
                <td><input type="button" value="Calculate" onclick="qty(<%=i%>)"></td>
                </tr>
                <%
                }
            }
            %>
        </table>
            <input type="button" onclick="total(<%=i%>)" value="Total">
            <div id="tot"></div>
        </p>
    </center>
    </body>
    <script>
        function qty(k)
        {
            var price=parseInt(document.getElementById(k+"1").innerHTML);
            var qua=parseInt(document.getElementById("qua"+k));
            document.getElementById("total"+k).innerHTML=price*qua;
        }
        function total(t)
        {
            var sum=0;
            for(j=1;j<t;j++){
                sum=sum+parseInt(document.getElementById("total"+j).innerHTML);
            }
            document.getElementById("tot").innerHTML=sum;
        }
    </script>
</html>
