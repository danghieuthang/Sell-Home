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

/**
 *
 * @author dhtha
 */
public class MainController extends HttpServlet {

    private static final String SUCESS = "admin.jsp";
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGINPAGE = "login.jsp";
    private static final String DELETE = "DeleteController";
    private static final String UPDATE = "update.jsp";
    private static final String SEARCHUSER = "SearchUserController";
    private static final String SEARCHHOUSE = "SearchHouseController";
    private static final String DELETEUSER = "DeleteUserController";
    private static final String CREATEUSER = "create_user.jsp";
    private static final String CREATE_USER = "CreateUserController";
    private static final String CREATEHOUSE = "create_house.jsp";
    private static final String CREATE_HOUSE = "CreateHouseController";
    private static final String UPDATEUSER = "update_user.jsp";
    private static final String UPDATE_USER = "UpdateUserController";
    private static final String UPDATEHOUSE = "update_house.jsp";
    private static final String UPDATE_HOUSE = "UpdateHouseController";
    private static final String DELETEHOUSE = "DeleteHouseController";
    private static final String GETDATA = "CreateDataController";
    private static final String HOME = "index.jsp";
    private static final String CONTACT = "contact.jsp";
    private static final String ABOUTUS = "about_us.jsp";
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCH = "SearchController";
    private static final String REGISTRATER = "create_user.jsp";
    private static final String VIEWSIGNLEHOUSE = "ViewSignleHouseController";
    private static final String VIEWORDER = "view_order.jsp";
    private static final String BUYHOUSE = "BuyHouseController";
    private static final String CHECKOUT = "CheckOutController";
    private static final String DELETEHOUSEORDER = "DeleteHouseOrderController";
    private static final String HISTORY = "HistoryController";
    private static final String USERPROFILE = "user_profile.jsp";
    private static final String UPDATEPROFILE = "UpdateProfileController";
    private static final String GETPASSWORD = "ForgotPasswordController";
    private static final String FORGOTPASSWORD="forgot_password.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "Login":
                    url = LOGIN;
                    break;
                case "Login Page":
                    url = LOGINPAGE;
                    break;
                case "ManagerUser":
                    url = SEARCHUSER;
                    break;
                case "ManagerHouse":
                    url = SEARCHHOUSE;
                    break;
                case "Search User":
                    url = SEARCHUSER;
                    break;
                case "Delete User":
                    url = DELETEUSER;
                    break;
                case "Create User":
                    url = CREATEUSER;
                    break;
                case "Create House":
                    url = CREATEHOUSE;
                    break;
                case "Create_House":
                    url = CREATE_HOUSE;
                    break;
                case "Search House":
                    url = SEARCHHOUSE;
                    break;
                case "Create_User":
                    url = CREATE_USER;
                    break;
                case "Update User":
                    url = UPDATEUSER;
                    break;
                case "Update this user":
                    url = UPDATE_USER;
                    break;
                case "Update House":
                    url = UPDATE_HOUSE;
                    break;
                case "Update this house":
                    url = UPDATE_HOUSE;
                    break;
                case "Delete House":
                    url = DELETEHOUSE;
                    break;
                case "Get Data":
                    url = GETDATA;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Home":
                    url = HOME;
                    break;
                case "Search":
                    url = SEARCH;
                    break;
                case "Register":
                    url = REGISTRATER;
                    break;
                case "View Signle House":
                    url = VIEWSIGNLEHOUSE;
                    break;
                case "User Profile":
                    url = USERPROFILE;
                    break;
                case "Update Profile":
                    url = UPDATEPROFILE;
                    break;
                case "View Order":
                    url = VIEWORDER;
                    break;
                case "Buy House":
                    url = BUYHOUSE;
                    break;
                case "Check out":
                    url = CHECKOUT;
                case "Delete House In Order":
                    url = DELETEHOUSEORDER;
                    break;
                case "Checkout":
                    url = CHECKOUT;
                    break;
                case "History":
                    url = HISTORY;
                    break;
                case "Contact":
                    url = CONTACT;
                    break;
                case "About Us":
                    url = ABOUTUS;
                    break;
                case "Forgot Password":
                    url=FORGOTPASSWORD;
                    break;
                case "Get Password":
                    url = GETPASSWORD;
                    break;
                default:
                    url = HOME;
                    break;
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
