/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender_String = request.getParameter("gender");
        boolean gender = false;
        if (gender_String.equalsIgnoreCase("male")) {
            gender = true; // Male
        } else if (gender_String.equalsIgnoreCase("female")) {
            gender = false; // Female
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("repassword");

        if (!re_password.equals(password)) {
            request.setAttribute("registerError", "Mật khẩu nhập lại không khớp.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            DAO dao = new DAO();
            Account a = dao.checkAccountExist(username);
            if (a == null) { //register
                dao.register(username, password, firstname, lastname, gender, email, address, phonenumber);
                dao.insertToAccount(username, password);
                request.setAttribute("success", "Đăng ký thành công.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else { // back to login.jsp
                request.setAttribute("failure", "Đăng ký không thành công. Vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
