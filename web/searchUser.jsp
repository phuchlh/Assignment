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
                    <th>Admin</th>
                    <th>Status</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    String userNow = (String) session.getAttribute("NOW");
                    System.out.println("user now - " + userNow);
                    for (UserDTO user : listUser) {
                        String urlRewriting = "MainController"
                                + "?btAction=Delete"
                                + "&deleteUser=" + user.getUserID()
                                + "&lastSearchValue=" + search;
                        boolean checkDelete = (user.getUserID()).equals(userNow);
                %>
            <form action="MainController">
                <tr>
                    <td><%= ++count%></td>
                    <td>
                        <input type="text" name="txtUserID" value="<%= user.getUserID()%>" />
                    </td>
                    <td><%= user.getPassword()%></td>
                    <td>
                        <input type="text" name="txtFullName" value="<%= user.getFullname()%>" />
                    </td>
                    <td>
                        <input type="text" name="txtAddress" value="<%= user.getAddress()%>" />
                    </td>
                    <td>
                        <input type="checkbox" name="cbRole" value="<%= user.getRoleID()%>"
                               <%
                                   if ((user.getRoleID()).equals("AD")) {
                               %>
                               checked="checked"<%
                                   }
                               %>/>
                    </td>
                    <td> <input type="text" name="txtStatus" value="<%= user.getStatus()%>" /> </td>
                    <td>
                        <%
                            if (checkDelete) {
                        %>
                        <p>Mission impossible because this user are currently available</p>
                        <%
                        } else if (user.getStatus().equals("disable")) {
                        %>
                        <p>Can not delete user</p>
                        <%
                        } else {
                        %>
                        <p><a href="<%= urlRewriting%>">Delete</a></p>
                        <input type="hidden" name="lastSearchValue" value="<%= search%>" />
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <input type="submit" value="Update" name="btAction" />
                        <input type="hidden" name="txtSearch" value="<%= search%>" />
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
