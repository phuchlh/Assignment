/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuchlh.user.UserDAO;
import phuchlh.user.UserDTO;
import phuchlh.user.UserErrorDTO;

/**
 *
 * @author Phúc
 */
public class CreateController extends HttpServlet {

    private static final String ERROR = "insert.jsp";
    private static final String SUCCESS = "login.html";
    private static final String USER = "US";
    private static final String ACTIVE = "active";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserErrorDTO errorUser = new UserErrorDTO();
        try {
            String userID = request.getParameter("txtUserID").trim();
            String fullname = request.getParameter("txtFullName").trim();
            String password = request.getParameter("txtPassword").trim();
            String confirmPass = request.getParameter("txtConfirm").trim();
            String address = request.getParameter("txtAddress").trim();
            String roleID = USER;
            String status = ACTIVE;

            boolean check = true;
            if (userID.length() < 3 || userID.length() > 10) {
                check = false;
                errorUser.setUserIDError("user id must be in [3,10]");
            }
            if (fullname.length() < 5 || fullname.length() > 50) {
                check = false;
                errorUser.setFullnameError("fullname must be in [5,50]");
            }
            if (address.length() < 0 || address.length() > 25) {
                check = false;
                errorUser.setAddressError("address must be in [0,25]");
            }
            if (!password.equals(confirmPass)) {
                check = false;
                errorUser.setConfirmError("password and confirm pass does not match");
            }

            if(check){
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, password, fullname, address, roleID, status);
                boolean checkInsert = dao.insertUser(user);
                if(checkInsert){
                    url = SUCCESS;
                }
            }else{
                request.setAttribute("ERROR_USER", errorUser);
            }
        } catch (Exception e) {
            if(e.toString().contains("duplicate")){
                errorUser.setUserIDError("Duplicate user id, try again");
                request.setAttribute("ERROR_USER", errorUser);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
