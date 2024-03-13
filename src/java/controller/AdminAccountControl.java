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
import java.util.List;
import model.Account;
import model.RoleAccount;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminAccountControl", urlPatterns = {"/maccount"})
public class AdminAccountControl extends HttpServlet {

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
            out.println("<title>Servlet MAccountControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MAccountControl at " + request.getContextPath() + "</h1>");
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
        UserDAO udao = new UserDAO();
        List<Account> listAcc = udao.getAllAccount();
        if (listAcc != null && !listAcc.isEmpty()) {
            request.setAttribute("listAcc", listAcc);
        } else {
            request.setAttribute("mess", "Không tồn tại user nào!!!");
        }
        request.getRequestDispatcher("admin/mngaccount.jsp").forward(request, response);
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
        UserDAO udao = new UserDAO();
        String txtSearch = request.getParameter("valueSearch");
        if (txtSearch == null || txtSearch.trim().isEmpty()) {
            request.setAttribute("erroradmin", "Xin hãy nhập tên cần tìm kiếm.");
        } else {
            List<Account> listacc = udao.searchAccountByUserName(txtSearch);
            if(listacc != null && !listacc.isEmpty()){
                request.setAttribute("searchValue", txtSearch);
                request.setAttribute("listAcc", listacc);
                
            } else {
                 request.setAttribute("searchValue", txtSearch);
                 request.setAttribute("erroradmin", "Không tìm thấy tài khoản.");
            }
        }
        request.getRequestDispatcher("admin/mngaccount.jsp").forward(request, response);

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
