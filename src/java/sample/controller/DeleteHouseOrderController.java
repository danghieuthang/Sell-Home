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
import sample.dtos.HouseDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class DeleteHouseOrderController extends HttpServlet {

    private final String SUCCESS = "view_order.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String houseID = request.getParameter("houseID");
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            List<HouseDTO> listHouse = (List<HouseDTO>) session.getAttribute("LISTHOUSEORDER");
            float total = 0;
            if (listHouse != null) {
                for (int i = 0; i < listHouse.size(); i++) {
                    HouseDTO dto = listHouse.get(i);
                    if (houseID.equals(dto.getHouseID())) {
                        listHouse.remove(i);
                        i--;
                    } else {
                        total += dto.getPrice();
                    }
                }

            }
            session.setAttribute("LISTHOUSEORDER", listHouse);
            session.setAttribute("TOTALPRICE", total);
        } catch (Exception e) {
        } finally {
            response.sendRedirect(SUCCESS);
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
