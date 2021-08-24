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
import javax.servlet.http.HttpSession;
import phuchlh.user.UserDAO;
import phuchlh.user.UserDTO;

/**
 *
 * @author Phúc
 */
public class UpdateController extends HttpServlet {

    private static final String ERROR = "searchUser.jsp";
    private static final String SUCCESS = "SearchController";
    private static final String LOGOUT = "LogoutController";

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
        try {
            String userID = request.getParameter("txtUserID");
            String fullname = request.getParameter("txtFullName");
            String address = request.getParameter("txtAddress");
            String status = request.getParameter("txtStatus");
            String roleID = request.getParameter("cbRole");
            if (roleID != null) {
                roleID = "AD";
            } else {
                roleID = "US";
            }
            if (status.equals("active") || status.equals("disable")) {
                UserDAO dao = new UserDAO();
                UserDTO dto = new UserDTO(userID, "", fullname, address, roleID, status);
                boolean check = dao.updateUser(dto);
                if (check) {
                    HttpSession session = request.getSession();
                    UserDTO loginUser = (UserDTO) session.getAttribute("USER");
                    if (loginUser.getUserID().equals(userID)) {
                        url = LOGOUT;
                    } else {
                        url = SUCCESS;
                    }
                }
            } else {
                url = ERROR;
            }

        } catch (Exception e) {
            log("Have error at update controller" + e.toString());
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
