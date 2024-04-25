/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddController", urlPatterns = {"/add"})
public class AddController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        String price_String = request.getParameter("price");
        String image_url = request.getParameter("image_url");
        String image_url2 = request.getParameter("image_url2");
        String image_url3 = request.getParameter("image_url3");
        String image_url4 = request.getParameter("image_url4");
        String size_39 = request.getParameter("size_39");
        String size_40 = request.getParameter("size_40");
        String size_41 = request.getParameter("size_41");
        String size_42 = request.getParameter("size_42");
        String size_43 = request.getParameter("size_43");
        String quantity_39 = request.getParameter("quantity_39");
        String quantity_40 = request.getParameter("quantity_40");
        String quantity_41 = request.getParameter("quantity_41");
        String quantity_42 = request.getParameter("quantity_42");
        String quantity_43 = request.getParameter("quantity_43");
        int category_id = 0;
        switch (brand) {
            case "Adidas":
                category_id = 1;
                break;
            case "Nike":
                category_id = 2;
                break;
            case "New Balance":
                category_id = 3;
                break;
        }
        float price;
        try {
            price = Float.parseFloat(price_String);
            
            DAO dao = new DAO();
            dao.insertNewProduct(name, brand, color, price, image_url2, category_id);
            String[] arrSize = {size_39, size_40, size_41, size_42, size_43};
            String[] arrQuantity = {quantity_39, quantity_40, quantity_41, quantity_42, quantity_43};
            String[] arrImage = {image_url, image_url2, image_url3, image_url4};
            for (int i = 0; i < arrSize.length; i++) {
                if (arrSize[i] != null && arrQuantity[i] != null) {
                    dao.insertToProductSize(arrSize[i], arrQuantity[i]);
                }
            }
            for (int i = 0; i < arrImage.length; i++) {
                if (arrImage != null) {
                    dao.insertToProductImage(arrImage[i]);
                }
            }
            response.sendRedirect("manage");
        } catch (Exception e) {
            System.out.println(e);
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
