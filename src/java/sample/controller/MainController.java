/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duong
 */
public class MainController extends HttpServlet {
    
//    user
    private static final String LOGIN_PAGE = "login.html";
    private static final String LOGIN = "SIGN IN";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String CREATE = "SIGN UP";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    // product
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String RE_SHOPPING = "ShoppingNow";
    private static final String SHOPPING_NOW = "Shoppingnow";
    private static final String BUY_MORE = "BUY MORE";
    private static final String ADD = "ADD TO CART";
    private static final String HOME = "HOME";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String VIEWCART = "CART";
    private static final String VIEWCART_PAGE = "cart.jsp";
    private static final String CHECKOUT = "CHECK OUT";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    private static final String PAYMENT = "Payment";
    private static final String PAYMENT_CONTROLLER = "PaymentController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (VIEWCART.equals(action)) {
                url = VIEWCART_PAGE;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (SHOPPING_NOW.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (RE_SHOPPING.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (BUY_MORE.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (PAYMENT.equals(action)) {
                url = PAYMENT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
