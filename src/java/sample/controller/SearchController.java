/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.CatagoriesDAO;
import sample.daos.CitiesDAO;
import sample.daos.HouseDAO;
import sample.dtos.CatagoriesDTO;
import sample.dtos.CitiesDTO;
import sample.dtos.HouseDTO;
import sample.dtos.UserDTO;

/**
 *
 * @author dhtha
 */
public class SearchController extends HttpServlet {

    private final String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            List<CitiesDTO> listCities;
            CitiesDAO citiesDAO = new CitiesDAO();
            listCities = citiesDAO.getListCity();
            List<CatagoriesDTO> listCatagories;
            CatagoriesDAO cataDao = new CatagoriesDAO();
            listCatagories = cataDao.getListCatagories();
            HttpSession session = request.getSession();
            request.setAttribute("LIST_CITIES", listCities);
            request.setAttribute("LIST_CATAGORIES", listCatagories);
            String keyword = request.getParameter("Keyword");
            String citiesID = request.getParameter("citiesID");
            String catagories = request.getParameter("catagoriesName");
            String bedroom = request.getParameter("bedroom");
            String bathroom = request.getParameter("bathroom");
            HouseDAO dao = new HouseDAO();
            List<HouseDTO> list = null;
            if (bedroom.equals("5+") && bathroom.equals("5+")) {
                list = dao.searchAllGreaterThan5(keyword, citiesID, catagories, bedroom, bathroom);
            } else if (bedroom.equals("5+")) {
                list = dao.searchBedGreaterThan5(keyword, citiesID, catagories, bedroom, bathroom);
            } else if (bathroom.equals("5+")) {
                list = dao.searchBathGreaterThan5(keyword, citiesID, catagories, bedroom, bathroom);
            } else {
                list = dao.search(keyword, citiesID, catagories, bedroom, bathroom);
            }

            String sort = (String) session.getAttribute("ORDERBY");
            if (sort == null) {
                sort = "dafault";
            }
            Comparator c;
            switch (sort) {
                case "price":
                    c = new Comparator() {
                        @Override
                        public int compare(Object t, Object t1) {
                            HouseDTO h1 = (HouseDTO) t;
                            HouseDTO h2 = (HouseDTO) t1;
                            float n = h1.getPrice() - h2.getPrice();
                            if (n > 0) {
                                return 1;
                            } else if (n == 0) {
                                return 0;
                            }
                            return -1;
                        }
                    };
                    list.sort(c);
                    break;
                case "newest":
                    c = new Comparator() {
                        @Override
                        public int compare(Object t, Object t1) {
                            HouseDTO h1 = (HouseDTO) t;
                            HouseDTO h2 = (HouseDTO) t1;
                            return h2.getTimePost().compareTo(h1.getTimePost());
                        }
                    };
                    list.sort(c);
                    break;
                case "default":

                    break;
            }
            UserDTO user = (UserDTO) session.getAttribute("USER");
            request.setAttribute("LISTHOUSE", list);
            request.setAttribute("Keyword", keyword);
            request.setAttribute("citiesID", citiesID);
            request.setAttribute("catagoriesName", catagories);
            request.setAttribute("beds", bedroom);
            request.setAttribute("baths", bathroom);
            String priceSearch = (String) request.getAttribute("priceSearch");
            request.setAttribute("MESSAGESEARCH", priceSearch);
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
