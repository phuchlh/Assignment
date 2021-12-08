/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuchlh.car.CarDAO;
import phuchlh.car.CarDTO;
import phuchlh.google.GoogleUserDTO;
import phuchlh.google.GoogleUtils;
import phuchlh.user.UserDAO;
import phuchlh.user.UserDTO;

/**
 *
 * @author Phuc
 */
public class LoginGoogleHandler extends HttpServlet {

    private static final String SUCCESS = "store.jsp";
    private static final String FAILED = "login.html";

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
        UserDAO dao = new UserDAO();
        try {
            String code = request.getParameter("code");
            String accessToken = GoogleUtils.getToken(code); // lấy authentication token
            GoogleUserDTO dto = GoogleUtils.getUserinfor(accessToken);
            request.setAttribute("ID", dto.getId());
            request.setAttribute("NAME", dto.getName());
            request.setAttribute("AVATAR", dto.getPicture());
            request.setAttribute("EMAIL", dto.getEmail());
            UserDTO userGoogle = new UserDTO(dto.getId(), "1", dto.getName(), " ", "US", "active");
            System.out.println(userGoogle.toString());
            boolean checkDup = dao.checkDup(dto.getId());
            if (checkDup) {
//                phải set attribute tiếp
                HttpSession session = request.getSession();
                String userNow = userGoogle.getFullname();
                session.setAttribute("NOW", userNow);
                session.setAttribute("USER", userGoogle);
                CarDAO car = new CarDAO();
                List<CarDTO> carList = car.loadCar();
                if (carList != null) {
                    HttpSession sessionC = request.getSession();
                    sessionC.setAttribute("LISTCAR", carList);
                    url = SUCCESS;
                }
            } else {
                boolean checkCreate = dao.insertUser(userGoogle);
                System.out.println(checkCreate);
                if (checkCreate) {
                    UserDTO userGoogleDTO = dao.checkLogin(dto.getId(), "1", "active");
                    if (userGoogleDTO != null) {
                        HttpSession session = request.getSession();
                        String userNow = userGoogle.getFullname();
                        session.setAttribute("NOW", userNow);
                        session.setAttribute("USER", userGoogle);
                        CarDAO car = new CarDAO();
                        List<CarDTO> carList = car.loadCar();
                        if (carList != null) {
                            HttpSession sessionC = request.getSession();
                            sessionC.setAttribute("LISTCAR", carList);
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Have error at login by google controller" + e.toString());
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
