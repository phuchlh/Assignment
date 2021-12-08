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

/**
 *
 * @author Phúc
 */
public class MainController extends HttpServlet {
    
    private static final String ERROR = "error.html";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    private static final String SHOPPING_CONTROLLER = "ShoppingController";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String CAR_DASHBOARD_CONTROLLER = "CarDashboardController";
    private static final String UPDATE_CAR_CONTROLLER = "UpdateCarController";
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
        String action = request.getParameter("btAction");
        try{
            if("".equals(action)) {
                
            }else if("LOGIN".equals(action)) {
                url = LOGIN_CONTROLLER;
            }else if("Logout".equals(action)) {
                url = LOGOUT_CONTROLLER;
            }else if("Search".equals(action)) {
                url = SEARCH_CONTROLLER;
            }else if("Delete".equals(action)) {
                url = DELETE_CONTROLLER;
            }else if("Update".equals(action)) {
                url = UPDATE_CONTROLLER;
            }else if("Create".equals(action)) {
                url = CREATE_CONTROLLER;
            }else if("Add to cart".equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            }else if("View cart".equals(action)) {
                url = VIEW_CART_CONTROLLER;
            }else if("Checkout".equals(action)) {
                url = CHECKOUT_CONTROLLER;
            }else if("Shopping".equals(action)) {
                url = SHOPPING_CONTROLLER;
            }else if("Remove".equals(action)) {
                url = REMOVE_CONTROLLER;
            }else if("Car Dashboard".equals(action)){
                url = CAR_DASHBOARD_CONTROLLER;
            }else if("Update car".equals(action)){
                url = UPDATE_CAR_CONTROLLER;
            }
        }finally{
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
