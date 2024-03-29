/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProcessControl", urlPatterns = {"/process"})
public class ProcessControl extends HttpServlet {

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
            out.println("<title>Servlet ProcessControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessControl at " + request.getContextPath() + "</h1>");
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
        ProductDAO pdao = new ProductDAO();
        List<Product> listP = pdao.getAllProduct();
        Cookie[] arr = request.getCookies();
        HttpSession session = request.getSession();
        String txt = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        String id_r = request.getParameter("id");
        String[] ids = txt.split("/");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if(!s[0].equals(id_r)){
                if(out.isEmpty()){
                    out = ids[i];
                } else {
                    txt += "/" + ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(2 * 60 * 60);
            response.addCookie(c);
        }
        Cart cart = new Cart(out, listP);
        request.setAttribute("cart",cart);
        request.getRequestDispatcher("Views/cartitem.jsp").forward(request, response);
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
        ProductDAO pdao = new ProductDAO();
        List<Product> listP = pdao.getAllProduct();
        Cookie[] arr = request.getCookies();
        HttpSession session = request.getSession();
        String txt = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        Cart cart = new Cart(txt, listP);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num = 0;
        try {
            id = Integer.parseInt(id_raw);
            Product p = pdao.getProductByID(id_raw);
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);
            if (num == -1 && cart.getQuantityByID(id) <= 1) {
                cart.removeItem(id);
            } else {
                if (num == 1 && cart.getQuantityByID(id) >= numStore) {
                    num = 0;
                }
                float price = p.getPrice();
                Item t = new Item(p, num, price);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }

        List<Item> items = cart.getItems();
        txt = "";
        if (!items.isEmpty()) {
            txt = items.get(0).getProduct().getId() + ":"
                    + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt += "/" + items.get(i).getProduct().getId()
                        + ":" + items.get(i).getQuantity();
            }

        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 60 * 60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Views/cartitem.jsp").forward(request, response);
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
