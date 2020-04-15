/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.daos.CatagoriesDAO;
import sample.daos.CitiesDAO;
import sample.daos.HouseDAO;
import sample.dtos.HouseDTO;

/**
 *
 * @author dhtha
 */
public class CreateHouseController extends HttpServlet {
    
    private final String SUCCESS = "SearchHouseController";
    private final String ERROR = "create_house.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String houseID = request.getParameter("houseID");
            float price = 0;
            float area = 0;
            String title = request.getParameter("title");
            String citiesID = request.getParameter("citiesID");
            String catagories = request.getParameter("catagories");
            String content = request.getParameter("content");
            int bathroom = 0;
            int bedroom = 0;
            String picture = request.getParameter("picture");
            boolean state = true;
            boolean check = true;
            HouseDAO dao = new HouseDAO();
            try {
                price = Float.parseFloat(request.getParameter("price"));
                if (price < 0) {
                    request.setAttribute("PRICE_ERROR", "Price must greater than 0!");
                    check = false;
                }
            } catch (Exception e) {
                request.setAttribute("PRICE_ERROR", "Price must be a number!");
                check = false;
            }
            
            try {
                area = Float.parseFloat(request.getParameter("area"));
                if (area < 0) {
                    request.setAttribute("AREA_ERROR", "Area must be greater than 0!");
                    check = false;
                }
            } catch (Exception e) {
                request.setAttribute("AREA_ERROR", "Area must be a number!");
                check = false;
            }
            
            try {
                bedroom = Integer.parseInt(request.getParameter("bedroom"));
                if (bedroom < 0) {
                    request.setAttribute("BEDROOM_ERROR", "Bedroom must be greater than 0");
                    check = false;
                }
            } catch (Exception e) {
                request.setAttribute("BEDROOM_ERROR", "Bedroom must be a number!");
                check = false;
            }
            
            try {
                bathroom = Integer.parseInt(request.getParameter("bathroom"));
                if (bathroom < 0) {
                    request.setAttribute("BATHROOM_ERROR", "Bathroom must be greater than 0!");
                    check = false;
                }
            } catch (Exception e) {
                request.setAttribute("BATHROOM_ERROR", "Bathroom must be a number!");
                check = false;
            }
            
            if (houseID.isEmpty()) {
                request.setAttribute("HOUSEID_ERROR", "House ID must be required!");
                check = false;
            } else if (dao.isExists(houseID)) {
                request.setAttribute("HOUSEID_ERROR", "House ID was exists!");
                check = false;
            }
            if (title.isEmpty()) {
                request.setAttribute("TITLE_ERROR", "Title must be required!");
                check = false;
            } else {
                title = title.trim();
            }
            if (content.isEmpty()) {
                request.setAttribute("CONTENT_ERROR", "Content must be required!");
                check = false;
            } else {
                content = content.trim();
            }
            CitiesDAO citiesDAO = new CitiesDAO();
            if (!citiesDAO.isExists(citiesID)) {
                request.setAttribute("CITIESID_ERROR", "City not exists!");
                check = false;
            }
            CatagoriesDAO catagoriesDAO = new CatagoriesDAO();
            if (!catagoriesDAO.isExists(catagories)) {
                request.setAttribute("CATAGORIES_ERROR", "Catagories not exists!");
            }
            File f = new File(picture);
            if (!f.isFile()) {
                request.setAttribute("PiCTURE_ERROR", "Picture not exists!");
                check = false;
            } else if (!picture.contains(".jpg") && !picture.contains(".png")) {
                request.setAttribute("PiCTURE_ERROR", "Picture only jpg or png");
                check = false;
            } else {
                int index = picture.indexOf("img\\");
                picture = picture.substring(index);
            }
            
            HouseDTO dto = new HouseDTO(houseID, price, title, area, citiesID, content, bedroom, bathroom, picture, state, catagories);
            
            if (check) {
                
                if (dao.insertHouse(dto)) {
                    request.setAttribute("MESSAGE", "Insert House - " + houseID + " Success");
                    request.setAttribute("action", "ManagerHouse");
                    url = SUCCESS;
                } else {
                    request.setAttribute("MESSAGE", "Insert House - " + houseID + " Fail!");
                    url = ERROR;
                }
            } else {
                request.setAttribute("HOUSE", dto);
               
                url = ERROR;
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
