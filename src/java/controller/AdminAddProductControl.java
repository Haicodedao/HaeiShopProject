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
@WebServlet(name = "AdminAddProductControl", urlPatterns = {"/adminaddproduct"})
public class AdminAddProductControl extends HttpServlet {

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

        String title = request.getParameter("name");
        String img_r = request.getParameter("image");
        String price_r = request.getParameter("price");
        String describe = request.getParameter("describe");
        String quantity_r = request.getParameter("quantity");
        String manager_r = request.getParameter("manager");
        String Categor_r = request.getParameter("category");
        float price;
        int quantity, managers, category;
        String img = "";
        try {
            ProductDAO prodao = new ProductDAO();
            CategoryDAO cadao = new CategoryDAO();
            UserDAO udao = new UserDAO();
            category = Integer.parseInt(Categor_r);
            managers = Integer.parseInt(manager_r);
            price = (price_r != null) ? Float.parseFloat(price_r) : 0;
            quantity = (quantity_r != null) ? Integer.parseInt(quantity_r) : 0;
            switch (category) {
                case 1:
                    img = "./asset/img/imgproducts/quanao/" + img_r;
                    break;
                case 2:
                    img = "./asset/img/imgproducts/giaydep/" + img_r;
                    break;
                case 3:
                    img = "./asset/img/imgproducts/sacdep/" + img_r;
                    break;
                case 4:
                    img = "./asset/img/imgproducts/nuochoa/" + img_r;
                    break;
            }

            Account account = udao.getAccountByID(managers);
            Category cate = cadao.getCategoryByID(category);
            prodao.InsertProduct(describe, title, img, price, account, cate, quantity);
            response.sendRedirect(request.getServletContext().getContextPath() + "/managerproduct");
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
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
