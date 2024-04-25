/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Customers;
import model.Item;
import model.Orders;
import model.Products;

/**
 *
 * @author Admin
 */
public class CheckoutController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        DAO dao = new DAO();
        
        dao.insertToCustomer(firstname, lastname, email, address, phone_number);
        
        List<Products> listP = dao.getAllProducts();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if(o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listP);
        List<Item> ListI = cart.getItems();
        dao.insertToCustomer(firstname, lastname, email, address, phone_number);
        Customers cus = dao.getCustomerNewest();
        dao.insertToOrder(cus.getCustomer_id(), cart.getTotalMoney());
        Orders order = dao.getOrderNewest();
        for (Item i : ListI) {
            dao.insertOrderDetail(String.valueOf(order.getOrder_id()), 
                    String.valueOf(i.getProduct().getProduct_id()), 
                    String.valueOf(i.getSize()), 
                    String.valueOf(i.getQuantity()), 
                    i.getPrice());
            dao.updateProductSizeAfterOrder(String.valueOf(i.getProduct().getProduct_id()), 
                    String.valueOf(i.getSize()),
                    String.valueOf(i.getQuantity()));
        }
        
        Cookie c = new Cookie("cart", "");
        c.setMaxAge(0);
        response.addCookie(c);
        request.setAttribute("mess", "Đặt hàng thành công");
        request.getRequestDispatcher("myCart.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
