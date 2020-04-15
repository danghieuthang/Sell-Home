/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.UserDAO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class CreateUserController extends HttpServlet {

    private final String ADMINSUCCESS = "SearchUserController";
    private final String USERSUCCESS = "index.jsp";
    private final String ERROR = "create_user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            boolean check = true;
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");
            UserDAO dao = new UserDAO();
            if (userID.isEmpty()) {
                request.setAttribute("USERID_ERROR", "User ID must be required!");
                check = false;
            } else if (dao.checkExists(userID)) {
                request.setAttribute("USERID_ERROR", "User ID was exists!");
                check = false;
            }
            if (userName.isEmpty()) {
                request.setAttribute("USERNAME_ERROR", "User Name must be required!");
                check = false;
            }
            if (email.isEmpty()) {
                request.setAttribute("EMAIL_ERROR", "Email must be required!");
                check = false;
            } else if (!email.matches("^[a-z][a-z0-9_\\.]{2,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$")) {
                request.setAttribute("EMAIL_ERROR", "Email format like example@email.ex!");
                check = false;
            }
            if (phone.isEmpty()) {
                request.setAttribute("PHONE_ERROR", "Phone must be required!");
                check = false;
            } else if (!phone.matches("^[0-9]{3,12}$")) {
                request.setAttribute("PHONE_ERROR", "Phone must consist of 3 to 12 numbers!");
                check = false;
            }
            if (password.isEmpty()) {
                request.setAttribute("PASSWORD_ERROR", "Password must be required!");
                check = false;
            } else if (!rePassword.equals(password)) {
                request.setAttribute("REPASSWORD_ERROR", "RePassword not same password!");
                check = false;
            }
            UserDTO dto = new UserDTO(userID, password, userName, email, phone, address, role);
            if (check) {
                if (dao.insertUser(dto)) {
                    request.setAttribute("SEARCHNAME_VALUE", "");
                    request.setAttribute("MESSAGE", "Insert new user success");
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("USER");
                    if (user != null && user.getRoleID().equalsIgnoreCase("admin")) {
                        url = ADMINSUCCESS;
                    } else {
                        session.setAttribute("USER", dto);
                        url = USERSUCCESS;
                    }

                } else {
                    request.setAttribute("MESSAGE", "Insert Fail!");
                    request.setAttribute("USER", dto);
                }
            } else {
                request.setAttribute("USER", dto);
            }

        } catch (Exception e) {
            log("Error at CreateUserController: " + e.toString());
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
