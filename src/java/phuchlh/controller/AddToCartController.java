/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.ir.BreakNode;
import phuchlh.cart.CartDAO;
import phuchlh.cart.CartDTO;

/**
 *
 * @author Phúc
 */
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "error.html";
    private static final String SUCCESS = "store.jsp";
    private static final String LOGIN_GUEST = "login.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            String carID = request.getParameter("txtCarID");
            String carName = request.getParameter("txtProductName");
            String price = request.getParameter("txtPrice");
            int quantity = 1;
            String statusCart = "active";
            HttpSession session = request.getSession();
            List<CartDTO> cart = (List<CartDTO>) session.getAttribute("CART");
            String userNow = (String) session.getAttribute("NOW");
            if (userNow == null) {
                url = LOGIN_GUEST;
                return;
            } else {
                if (cart == null) {
                    cart = new ArrayList<>();
                }
                CartDAO dao = new CartDAO();
                boolean checkInsert = dao.addUserIDToOrder(userNow);
                if (checkInsert) {
                    int orderID = dao.checkOrderIDByUserID();
                    boolean checkAdd = dao.addToCart(orderID, carID, price, quantity, statusCart, userNow, carName);
                    if (checkAdd) {
                        url = SUCCESS;
                    }
                } else {
                    url = ERROR;
                }
            }
        } catch (Exception e) {
            log("Have error at add to cart controller" + e.toString());
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
