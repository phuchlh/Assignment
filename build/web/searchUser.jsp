<%-- 
    Document   : searchUser
    Created on : Aug 12, 2021, 3:46:07 AM
    Author     : Phúc
--%>

<%@page import="java.util.List"%>
<%@page import="phuchlh.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN</title>
    </head>
    <body>
        <h1>Search user</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }
        %>
        <h3>Welcome admin: <%= loginUser.getFullname()%></h3>
        <form action="MainController">
            <input type="submit" value="Logout" name="btAction" />
        </form>

        <form action="MainController">
            Search: <input type="text" name="txtSearch" value="<%= search%>" />
            <input type="submit" value="Search" name="btAction" />
        </form>
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if ((listUser != null) && (!listUser.isEmpty())) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>User ID</th>
                    <th>Password</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Role ID</th>
                    <th>Status</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (UserDTO user : listUser) {
                        String urlRewriting = "MainController"
                                + "?btAction=Delete"
                                + "&pk="+user.getUserID()
                                + "&lastSearchValue="+ search;
                        
                %>
                <tr>
                    <td><%= ++count%></td>
                    <td>
                        <input type="text" name="txtUserHidden" value="<%= user.getUserID() %>" />
                    </td>
                    <td><%= user.getPassword()%></td>
                    <td><%= user.getFullname()%></td>
                    <td><%= user.getAddress()%></td>
                    <td><%= user.getRoleID()%></td>
                    <td><%= user.getStatus()%></td>
                    <td>
                        <form action="MainController">
                            <input type="submit" value="Delete" name="btAction" />
                            <input type="hidden" name="txtUserDelete" value="<%= user.getUserID() %>" />
                        </form>
                    </td>
                </tr>
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
