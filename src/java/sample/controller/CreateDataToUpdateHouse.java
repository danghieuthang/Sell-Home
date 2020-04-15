/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.CatagoriesDAO;
import sample.daos.CitiesDAO;
import sample.dtos.CatagoriesDTO;
import sample.dtos.CitiesDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class CreateDataToUpdateHouse extends HttpServlet {

    private final String SUCCESS = "update_house.jsp";
    private final String ERROR = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            List<CitiesDTO> cities;
            CitiesDAO citiesDAO = new CitiesDAO();
            cities = citiesDAO.getListCity();
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            if (user.getRoleID().equalsIgnoreCase("admin")) {
                url = SUCCESS;
                request.setAttribute("LIST_CITIES", cities);
                request.setAttribute("CURRPAGE", "house");
              
                List<CatagoriesDTO> listCatagories;
                CatagoriesDAO cataDao = new CatagoriesDAO();
                listCatagories = cataDao.getListCatagories();
                request.setAttribute("LIST_CATAGORIES", listCatagories);
            }

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(SUCCESS).forward(request, response);
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
