/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuchlh.car.CarDAO;
import phuchlh.car.CarDTO;

/**
 *
 * @author Phuc
 */
public class UpdateCarController extends HttpServlet {

    private static final String SUCCESS = "dashboard.jsp";
    private static final String FAILED = "error.html";

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
        String url = FAILED;
        try {
            String categoryID = request.getParameter("txtCategoryIDHidden");
            String productID = request.getParameter("txtProductIDHidden");
            String productName = request.getParameter("txtProductName");
            String imageOriginal = request.getParameter("txtImageOriginal");
            String imageEdited = request.getParameter("txtImageEdited");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            String price = request.getParameter("txtPrice");
            String realImage;
            if (imageEdited.length() <= 0) {
                realImage = imageOriginal;
            } else {
                realImage = imageEdited;
            }
            System.out.println("original " + imageOriginal);
            System.out.println("edited " + imageEdited);
            System.out.println("real " + realImage);
            String status = quantity > 0 ? "active" : "disable";
            CarDTO car = new CarDTO(productID, productName, price, categoryID, status, realImage, quantity);
            CarDAO dao = new CarDAO();
            boolean checkUpdate = dao.editCar(car);
            if (checkUpdate) {
                List<CarDTO> listCar = dao.loadCar();
                HttpSession session = request.getSession();
                session.setAttribute("LISTCAR", listCar);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Have error at update car controller" + e.toString());
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
