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
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "AddOrderController", urlPatterns = {"/addOrder"})
public class AddOrderController extends HttpServlet {

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
            out.println("<title>Servlet AddOrderController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddOrderController at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        Order order = (Order)ses.getAttribute("order");
        if (order != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            order.setBuyDate(sdf.format(new Date()));
            User buyer = (User)ses.getAttribute("user");
            float totalPrice = 0;
            for (Map.Entry<Integer, OrderDetail> entry : order.getItems().entrySet()) {
                Integer key = entry.getKey();
                OrderDetail value = entry.getValue();
                totalPrice += value.getQuantity() * value.getPrice();
                value.getProduct().setQuantity(value.getProduct().getQuantity()-value.getQuantity());
                cdb.updateProductQuantity(value.getProduct());
            }
            order.setTotalPrice(totalPrice);
            order.setCustomer(buyer);
            cdb.createOrder(order);
            ses.removeAttribute("order");
            response.sendRedirect("home");
        }else{
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
