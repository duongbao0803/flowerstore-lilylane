/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author duong
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        UserDAO dao = new UserDAO();
        String type = "right";
        try {
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            if (userID.length() < 2 || userID.length() > 20) {
                userError.setUserIDError("UserID must be 2 - 20 characters");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 40) {
                userError.setFullNameError("Full name must be 5 - 40 charaters");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("Those password dose not match");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
                boolean checkInsert = dao.insertV2(user);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Unknow error!");
                    request.setAttribute("USER_ERROR", userError);
                    request.setAttribute("TYPE", type);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
                request.setAttribute("TYPE", type);
            }
        } catch (Exception e) {
            log("Error at CreateUserController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("UserID is duplicated");
                request.setAttribute("USER_ERROR", userError);
                request.setAttribute("TYPE", type);
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
