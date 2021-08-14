/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ConnectDB;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
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
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {

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
            out.println("<title>Servlet SignUpController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpController at " + request.getContextPath() + "</h1>");
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
        if (ses.getAttribute("allUser") == null || ses.getAttribute("backUpId") == null) {
            cdb.getAllUser();
            ses.setAttribute("allUser", cdb.getHmUser());
            ses.setAttribute("backUpId", cdb.getBackUpId());
        } else {
            cdb.setHmUser((HashMap<String, User>) ses.getAttribute("allUser"));
            cdb.setBackUpId((HashSet<String>) ses.getAttribute("backUpId"));
        }
        try {
            String userId = request.getParameter("user");
            if (cdb.getHmUser().get(userId) != null) {
                request.setAttribute("messageSignUp",
                        "This username is already taken. Please try again.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            String pass = request.getParameter("pass");
            String repass = request.getParameter("repass");
            if (!(repass.equals(pass))) {
                request.setAttribute("messageSignUp",
                        "Password and Repassword must be the same.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            String name = request.getParameter("name");
            boolean gender = request.getParameter("gender").equals("male");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            int questionId = Integer.parseInt(request.getParameter("questionId"));
            String answer = request.getParameter("answer");
            User account = new User(userId,
                    pass,
                    name,
                    gender,
                    dob,
                    address,
                    email,
                    phoneNumber, 
                    1,
                    questionId,
                    answer);
            cdb.getHmUser().put(userId, account);
            request.setAttribute("messageSignUp",
                    "Create an account successfully!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (Exception e) {
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
