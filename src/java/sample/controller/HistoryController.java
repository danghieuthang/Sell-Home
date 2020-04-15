/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.HouseDAO;
import sample.daos.House_OrderDAO;
import sample.daos.OrdersDAO;
import sample.dtos.House_OrderDTO;
import sample.dtos.OrderDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class HistoryController extends HttpServlet {
    
    private final String SUCCESS = "history.jsp";
    private final String ERROR = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            if (user != null) {
                url = SUCCESS;
                OrdersDAO orderDAO = new OrdersDAO();
                House_OrderDAO house_OrderDAO = new House_OrderDAO();
                HouseDAO houseDao = new HouseDAO();
                List<OrderDTO> listOrder = orderDAO.getListOrderByUserID(user.getUserID());
               
                List<House_OrderDTO> listHouse_Order = new ArrayList<>();
                for (OrderDTO orderDTO : listOrder) {
                    listHouse_Order.addAll(house_OrderDAO.getHouseOrderByOrderID(orderDTO.getOrderID()));
                }
                float total=0;
                for (House_OrderDTO house_OrderDTO : listHouse_Order) {
                    house_OrderDTO.setHouse(houseDao.getHouseByHouseID(house_OrderDTO.getHouseID()));
                    total+=house_OrderDTO.getHouse().getPrice();
                }
                session.setAttribute("LISTHISTORYORDER", listOrder);
                session.setAttribute("LISTHISTORYHOUSE", listHouse_Order);
                session.setAttribute("TotalBuy", total);
            }
            
        } catch (Exception e) {
        } finally {
            response.sendRedirect(url);
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
