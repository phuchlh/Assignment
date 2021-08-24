<%-- 
    Document   : insert
    Created on : Aug 17, 2021, 9:31:50 PM
    Author     : Phúc
--%>

<%@page import="phuchlh.user.UserErrorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE</title>
    </head>
    <body>
        <%
            UserErrorDTO errorUser = (UserErrorDTO) request.getAttribute("ERROR_USER");
            if (errorUser == null) {
                errorUser = new UserErrorDTO();
            }
        %>
        <h4>Please input all fields below</h4>
        <form action="MainController" method="POST">
            User ID:    <input type="text" name="txtUserID" value="" required=""/>
            <%= errorUser.getUserIDError()%></br>
            Password:   <input type="password" name="txtPassword" value="" required=""/></br>
            Confirm     <input type="password" name="txtConfirm" value="" required=""/>
            <%= errorUser.getConfirmError() %></br>
            Full Name:  <input type="text" name="txtFullName" value="" required=""/>
            <%= errorUser.getFullnameError()%></br>
            Address:    <input type="text" name="txtAddress" value="" required=""/>
            <%= errorUser.getAddressError()%></br>
            <input type="submit" value="Create" name="btAction" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
