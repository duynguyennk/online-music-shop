/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectDB;
import Entity.Order;
import Entity.OrderDetail;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author drako
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/addToCart"})
public class AddToCartController extends HttpServlet {

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
            out.println("<title>Servlet AddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        ConnectDB cdb = new ConnectDB();
        cdb.getAllProduct();
        int quantity = 1;
        int id;
        if (request.getParameter("productId") != null) {
            id = Integer.parseInt((request.getParameter("productId")));
            Product product = cdb.getHmProduct().get(id + "");
            System.out.println(product.getQuantity());
            if (product != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession ses = request.getSession();
                if (ses.getAttribute("order") == null) {
                    Order order = new Order();
                    HashMap<Integer, OrderDetail> hmItems = new HashMap<>();
                    OrderDetail item = new OrderDetail();
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setPrice(product.getPrice());
                    hmItems.put(id, item);
                    order.setItems(hmItems);
                    ses.setAttribute("order", order);
                } else {
                    Order order = (Order) ses.getAttribute("order");
                    HashMap<Integer, OrderDetail> hmItems = order.getItems();
                    boolean check = false;
                    for (Map.Entry<Integer, OrderDetail> entry : hmItems.entrySet()) {
                        Integer key = entry.getKey();
                        OrderDetail value = entry.getValue();
                        if (value.getProduct().getId().equals(product.getId())) {
                            if (value.getQuantity() + quantity > product.getQuantity()) {
                                request.getRequestDispatcher("home").forward(request, response);
                            } else {
                                value.setQuantity(value.getQuantity() + quantity);
                                check = true;
                            }
                        }
                    }
                    if (!check) {
                        OrderDetail item = new OrderDetail();
                        item.setQuantity(quantity);
                        item.setProduct(product);
                        item.setPrice(product.getPrice());
                        hmItems.put(id, item);
                    }
                    ses.setAttribute("order", order);

                }
            }
            response.sendRedirect("home");
        } else {
            response.sendRedirect("home");
        }
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
