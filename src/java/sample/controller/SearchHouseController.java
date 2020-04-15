
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
import sample.daos.CitiesDAO;
import sample.daos.HouseDAO;
import sample.dtos.CitiesDTO;
import sample.dtos.HouseDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class SearchHouseController extends HttpServlet {

    private final String SUCCESS = "admin.jsp";
    private final String ERROR = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //String keyword=request.getParameter("Keyword");
            String title = request.getParameter("titleSearch");
            String state = request.getParameter("stateSearch");
            if (title == null) {
                title = "";
            } else{
                title=title.trim();
            }
            if (state == null) {
                state = "";
            }
            HouseDAO dao = new HouseDAO();
            List<HouseDTO> list = dao.searchByTitleAndState(title, state);
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            request.setAttribute("LISTHOUSE", list);
            List<CitiesDTO> listCities;
            CitiesDAO citiesDAO = new CitiesDAO();
            listCities = citiesDAO.getListCity();
            request.setAttribute("LIST_CITIES", listCities);
            if (user.getRoleID().equalsIgnoreCase("admin")) {
                request.setAttribute("CURRPAGE", "house");
                url = SUCCESS;
            }
            request.setAttribute("titleSearch", title);
            request.setAttribute("stateSearch", state);
        } catch (Exception e) {
            log("Error at SearchHouseController: " + e.toString());
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
