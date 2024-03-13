/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.RoleAccount;

/**
 *
 * @author admin
 */
@WebServlet(name="AdminAddAccControl", urlPatterns={"/adminaddacc"})
public class AdminAddAccControl extends HttpServlet {
   
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
        UserDAO udao = new UserDAO();
        String fullname = request.getParameter("name");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String Roid_r = request.getParameter("roleId");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int roid;
        try {
            roid = (Roid_r != null) ? Integer.parseInt(Roid_r) : 3;
            Account acc = udao.getAccountByUser(user);
            RoleAccount roleacc = udao.getRoleAccountByID(roid);
            if(acc != null){
                request.setAttribute("erroradmin", "Tài khoản đã tồn tại.");
            } else {
                request.setAttribute("messadmin", "Thêm tài khoản thành công.");
                udao.AdminInsertUser(fullname, email, address, phone, user, pass, roleacc);
            }
            request.getRequestDispatcher("maccount").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
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
