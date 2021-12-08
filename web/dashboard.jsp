<%-- 
    Document   : dashboard
    Created on : Oct 29, 2021, 5:15:59 PM
    Author     : Phuc
--%>

<%@page import="phuchlh.car.CarDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Manage Car</title>
    </head>
    <body>
        <h1>Add, edit, delete car, only for admin</h1>
        <%
            List<CarDTO> listCar = (List<CarDTO>) session.getAttribute("LISTCAR");
            if ((listCar != null) && (!listCar.isEmpty())) {
        %>
        <table border="1" class="table-data">
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
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    String carStatus;
                    for (CarDTO car : listCar) {
                        carStatus = car.getStatus().equals("active") ? "<span>&#10004;</span>" : "<span>&#10006;</span>";
                %>
            <form action="MainController" method="POST">
                <tr <% if (count % 2 == 0) {
                    %> class="even" <%
                    } else %> class="odd" <%
                    %>
                    >
                    <td><%= ++count  %></td>
                    <td><%= car.getProductID()%></td>
                    <td><input type="text" name="txtProductName" value="<%= car.getProductName()%>" /> </td>
                    <td><%= car.getCategoryID()%> </td>
                    <td>
                        <img src="<%= car.getImage()%>" alt="" height=100px width=auto></img></br>
                        <input type="text" name="txtImageEdited" value="" style="margin-top: 12px"/>
                    </td>
                    <td><input type="text" name="txtQuantity" value="<%= car.getQuantity()%>" /></td>
                    <td><input type="text" name="txtPrice" value="<%= car.getPrice()%>" /></td>
                    <td><%= carStatus%></td>
                    <td>
                        <input type="submit" value="Update car" name="btAction" />
                        <input type="hidden" name="txtImageOriginal" value="<%= car.getImage()%>" />
                        <input type="hidden" name="txtProductIDHidden" value="<%= car.getProductID()%>" />
                        <input type="hidden" name="txtCategoryIDHidden" value="<%= car.getCategoryID()%>" />
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
