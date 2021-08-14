/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectDB;
import Entity.Category;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginControl at " + request.getContextPath() + "</h1>");

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        HttpSession ses= request.getSession();
        if (ses.getAttribute("allUser")==null) {
            cdb.getAllUser();
            ses.setAttribute("allUser", cdb.getHmUser());
        }else{
            cdb.setHmUser((HashMap<String, User>)ses.getAttribute("allUser"));
        }
        User user = cdb.getHmUser().get(username);
//        User user = cdb.getUser(username, password);
        if (user == null) {
            request.setAttribute("messageLogin", "Username not found. Please reenter and try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!(user.getPass().equals(password))) {
            request.setAttribute("messageLogin", "Incorrect username or password. Please reenter and try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ses.setAttribute("user", user);
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
