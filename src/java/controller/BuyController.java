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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Categories;
import model.ProductImage;
import model.ProductSizes;
import model.Products;

/**
 *
 * @author Admin
 */
public class BuyController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        String product_id = request.getParameter("product_id");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        int quantityCheck = dao.getQuantityByDetail(product_id, size);

        if (quantityCheck < Integer.parseInt(quantity)) {
            session.setAttribute("messError", "Vui lòng không nhập quá số lượng sản phẩm!");

            Products p = dao.getProductByID(product_id);
            List<Categories> listC = dao.getAllCategories();
            List<ProductSizes> listPS = dao.getSizeByProductId(product_id);
            List<ProductImage> listPI = dao.getImageByProductId(product_id);

            request.setAttribute("detail", p);
            request.setAttribute("listC", listC);
            request.setAttribute("listPS", listPS);
            request.setAttribute("listPI", listPI);
            request.getRequestDispatcher("detail.jsp").forward(request, response);
        } else {
            List<Products> listP = dao.getAllProducts();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            if (txt.isEmpty()) {
                txt = product_id + ":" + size + ":" + quantity;
            } else {
                txt = txt + "/" + product_id + ":" + size + ":" + quantity;
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 60 * 24 * 60);
            response.addCookie(c);
            request.getRequestDispatcher("home").forward(request, response);
        }

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
