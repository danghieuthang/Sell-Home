/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.HouseDAO;
import sample.daos.House_OrderDAO;
import sample.daos.OrdersDAO;
import sample.dtos.HouseDTO;
import sample.dtos.House_OrderDTO;
import sample.dtos.OrderDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class CheckOutController extends HttpServlet {

    private final String SUCCESS = "view_order.jsp";
    private final String ERROR = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            if (user == null) {
                url = ERROR;
            } else {
                List<HouseDTO> listHouse = (List<HouseDTO>) session.getAttribute("LISTHOUSEORDER");
                float total = (float) session.getAttribute("TOTALPRICE");
                boolean check = true;
                HouseDAO houseDAO = new HouseDAO();
                for (HouseDTO houseDTO : listHouse) {
                    if (!(houseDAO.getHouseByHouseID(houseDTO.getHouseID()).isState())) {
                        check = false;
                    }
                }
                if (!check) {
                    request.setAttribute("MESSAGEBUY", "House not already for sell!");
                } else {
                    OrdersDAO ordersDAO = new OrdersDAO();
                    OrderDTO orderDTO = new OrderDTO();
                    orderDTO.setOrderID("O" + (ordersDAO.sizeOfOrder() + 1));
                    orderDTO.setUserID(user.getUserID());
                    orderDTO.setTotal(total);
                    Calendar cal = Calendar.getInstance();
                    orderDTO.setTime(cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR));
                    if (!ordersDAO.insertOrder(orderDTO)) {
                        request.setAttribute("MESSAGGEBUY", "Some error occurred when buy!");
                    } else {
                        House_OrderDAO house_OrderDAO = new House_OrderDAO();
                        for (HouseDTO houseDTO : listHouse) {
                            House_OrderDTO house_OrderDTO = new House_OrderDTO(orderDTO.getOrderID(), houseDTO.getHouseID());
                            house_OrderDAO.insert(house_OrderDTO);
                            houseDAO.buyHouseByHouseID(houseDTO.getHouseID());
                        }
                        request.setAttribute("MESSAGEBUY", "Buy Success!");
                        session.setAttribute("LISTHOUSEORDER", null);
                    }

                }
            }
        } catch (Exception e) {
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
