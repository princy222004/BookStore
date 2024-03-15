<%-- 
    Document   : AddBook
    Created on : 08-Dec-2023, 6:20:51 pm
    Author     : shyam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{text-align: center}
            .center{margin-right:auto;margin-left: auto}
            td{height: 30px;width: 40%}
        </style>
    </head>
    <body>
        <h1>Add Book</h1>
        <form action="AddBook" method="post">
            <table border="1" class="center">
                <tr>
                    <td>Enter Book Name</td>
                    <td>
                        <input type="text" name="book_name">
                    </td>
                </tr>
                <tr>
                    <td>Enter Author name</td>
                    <td><input type="text" name="author"></td>
                </tr>
                <tr>
                    <td>Enter Price</td>
                    <td><input type="text" name="price" ></td>
                </tr>
                <tr>
                    <td>Enter Quantity</td>
                    <td><input type="text" name="quant"></td>
                </tr>

                <tr>
                    <td><input type="submit" value="Submit"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
