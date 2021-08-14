/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectDB;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
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
@WebServlet(name = "AddProductController", urlPatterns = {"/addProduct"})
public class AddProductController extends HttpServlet {

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
            out.println("<title>Servlet AddProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        ConnectDB cdb = new ConnectDB();
        HttpSession ses = request.getSession();
        if (ses.getAttribute("allProduct") == null) {
            cdb.getAllProduct();
            ses.setAttribute("allProduct", cdb.getHmProduct());
            ses.setAttribute("backUpIdProduct", cdb.getBackUpIdProduct());
        } else {
            cdb.setHmProduct((HashMap<String, Product>) ses.getAttribute("allProduct"));
            cdb.setBackUpIdProduct((HashSet<String>) ses.getAttribute("backUpIdProduct"));
        }
        String idProduct = request.getParameter("idProduct");            
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String imgUrl = request.getParameter("imgUrl");
        String discount = request.getParameter("discount");
        String artist = request.getParameter("artist");
        String year = request.getParameter("year");
        String detail = request.getParameter("detail");
        String cateId = request.getParameter("cateId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product product = new Product(idProduct,
                name,
                price,
                imgUrl,
                discount,
                detail,
                artist,
                year,
                cateId,
                quantity);
        if (cdb.getHmProduct().containsKey(idProduct)) {
            product.setUpdateProduct(true);
        }
        cdb.getHmProduct().put(idProduct, product);
//        cdb.insertProduct(product);
        request.setAttribute("message",
                "Create an product successfully!");
        request.getRequestDispatcher("management.jsp").forward(request, response);
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
