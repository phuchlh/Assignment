<%-- 
    Document   : cart
    Created on : Aug 21, 2021, 4:24:37 PM
    Author     : Phúc
--%>

<%@page import="java.util.List"%>
<%@page import="phuchlh.cart.CartDTO"%>
<%@page import="phuchlh.car.CarDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CART</title>
    </head>
    <body>
        <h1>Your selected car:</h1>
        <%
            List<CartDTO> cart = (List<CartDTO>) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    int total = 0;
                    String userID = (String) session.getAttribute("NOW");
                    for (CartDTO c : cart) {
                        total += Integer.parseInt(c.getPrice()) * c.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%= ++count%></td>
                    <td><%= c.getOrderDetailID()%></td>
                    <td><%= c.getProductID()%></td>
                    <td><%= c.getProductName()%></td>
                    <td><%= c.getQuantity()%></td>
                    <td><%= c.getPrice()%></td>
                    <td>
                        <input type="submit" value="Remove" name="btAction" />
                        <input type="hidden" name="txtUserID" value="<%= userID %>" />
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <p>Wanna add more car, click <a href="store.jsp">here</a></p>
    <h1>Total price: <%= total%>$</h1>
    <form action="MainController">
        <input type="submit" value="Checkout" name="btAction" />
        <input type="hidden" name="txtTotal" value="<%= total%>" />
    </form>
    <%
        }else{
%>
        <p>Your cart is empty, <a href="store.jsp">back to our shop</a></p>
    <%
}
    %>
    
</body>
</html>
