/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.FlowerDAO;
import sample.shopping.FlowerDTO;
import sample.shopping.OrderDetailsDAO;
import sample.shopping.OrderDAO;

import sample.shopping.OrderDTO;
import sample.user.UserDTO;

/**
 *
 * @author duong
 */
public class PaymentController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "success.jsp";

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
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            System.out.println(userID);
            String method = request.getParameter("payment-method").toUpperCase();
            System.out.println(method);
            String Stotal = request.getParameter("totalPayment");
            System.out.println(Stotal);
            int total = Integer.parseInt(Stotal);
            
            Date date = new Date();
            Cart cart = (Cart) session.getAttribute("CHECKOUT");
            OrderDTO order = new OrderDTO(userID, date, total, method);
            OrderDAO orderDao = new OrderDAO();
            FlowerDAO flowerDao = new FlowerDAO();
            int lastInsertID = orderDao.createOrder(order);
            boolean checkInsert = false;
            boolean checkUpdateQuantity = false;
            if (lastInsertID > 0) {
                OrderDetailsDAO orderDetailsDao = new OrderDetailsDAO();
                if (cart != null) {
                    for (FlowerDTO product : cart.getCart().values()) {
                        checkInsert = orderDetailsDao.insert(product, lastInsertID);
                        checkUpdateQuantity = flowerDao.updateFlower(product);
                    }
                }
            }
            if (checkInsert && checkUpdateQuantity) {
                request.setAttribute("ORDER", order);
                session.setAttribute("CART", null);
                session.setAttribute("CHECKOUT", null);
                url = SUCCESS;
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
            log("Error at PaymentController: " + e.toString());
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
