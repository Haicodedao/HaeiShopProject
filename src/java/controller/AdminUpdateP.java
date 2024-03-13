/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name="AdminUpdateP", urlPatterns={"/updatep"})
public class AdminUpdateP extends HttpServlet {
   
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
        String pid_r = request.getParameter("id");
        String describe = request.getParameter("describe");
        String title = request.getParameter("name");
        String price_r = request.getParameter("price");
        String img = request.getParameter("image");
        String caid_r = request.getParameter("category");
        String accid_r = request.getParameter("manager");
        String quantity_r = request.getParameter("quantity");
        int pid, accid, caid, quantity;
        float price;
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cadao = new CategoryDAO();
        UserDAO udao = new UserDAO();
        try {
            accid = Integer.parseInt(accid_r);
            caid = Integer.parseInt(caid_r);
            price = Float.parseFloat(price_r);
            Account acc = udao.getAccountByID(accid);
            Category cate = cadao.getCategoryByID(caid);
            quantity = Integer.parseInt(quantity_r);
            Product p = new Product(describe, title, price, img, acc, cate, quantity);
            pdao.UpdateProduct(p, pid_r);
            request.setAttribute("mess", "Thay đổi thông tin sản phẩm thành công.");
            request.getRequestDispatcher("managerproduct").forward(request, response);
        } catch (Exception e) {
        }
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
