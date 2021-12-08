<%-- 
    Document   : store
    Created on : Aug 13, 2021, 11:43:17 AM
    Author     : Phúc
--%>

<%@page import="java.util.List"%>
<%@page import="phuchlh.car.CarDTO"%>
<%@page import="phuchlh.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <!-- CSS only -->
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->
        <title>STORE</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("USER");
            if (loginUser == null) {
        %>
        <h4>Car Dealer, welcome Guest</h4>
        <h4> If you don't have an account, register <a href="insert.jsp">here</a> or login <a href="login.html">here</a></h4>
        <%
        } else {
        %>
        <h4>Car Dealer, welcome <%= loginUser.getFullname()%></h4>
        <form action="MainController">
            <input type="submit" value="Logout" name="btAction" />
            <input type="submit" value="View cart" name="btAction" />
        </form>
        <%
            }
        %>
        <h3>List car below</h3>
        <%
            List<CarDTO> listCar = (List<CarDTO>) session.getAttribute("LISTCAR");
            if ((listCar != null) && (!listCar.isEmpty())) {
                System.out.println("store " + listCar.size());
        %>
        <table border="1" style="width: 100%; text-align: center;">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Add</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    String carStatus;
                    for (CarDTO car : listCar) {
                        carStatus = car.getStatus().equals("active") ? "<span>&#10004;</span>" : "<span>&#10006;</span>";
                %>
            <form action="MainController">
                <tr <% if (count % 2 == 0)
                    %> class="even" <%
                        else %> class="odd"<%
                    %>
                    >
                    <td> <%= ++count%> </td>
                    <td><%= car.getProductID()%></td>
                    <td><%= car.getProductName()%></td>
                    <td><%= car.getCategoryID()%></td>
                    <td><img src="<%= car.getImage()%>" alt="" height=100px width=auto></img></td>
                    <td><%= car.getQuantity()%></td>
                    <td><%= car.getPrice()%></td>
                    <td><%= carStatus%></td>
                    <td>
                        <%
                            if (car.getQuantity() <= 0) {
                        %>
                        <p>Out of stock</p>
                        <%
                        } else {
                        %>
                        <input type="submit" value="Add to cart" name="btAction" />
                        <input type="hidden" name="txtCarID" value="<%= car.getProductID()%>" />
                        <input type="hidden" name="txtProductName" value="<%= car.getProductName()%>" />
                        <input type="hidden" name="txtPrice" value="<%= car.getPrice()%>" />
                        <%
                            }
                        %>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
        }
    %>

</body>
</html>
