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
import java.util.HashMap;
import java.util.HashSet;
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
@WebServlet(name = "AddUserController", urlPatterns = {"/addUser"})
public class AddUserController extends HttpServlet {

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
            out.println("<title>Servlet AddUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserController at " + request.getContextPath() + "</h1>");
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
    private void putHm(HttpServletRequest request, HttpServletResponse response, String userId, String pass) {
        String name = request.getParameter("name");
        boolean gender = request.getParameter("gender").equals("male");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        int userRoll = Integer.parseInt(request.getParameter("userRoll"));
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        String answer = request.getParameter("answer");
        if (userRoll == 0) {
            questionId = 0;
            answer = null;
        }
        User user = new User(userId, pass, name, gender, dob, address, email, phoneNumber, userRoll, questionId, answer);
        if (cdb.getHmUser().containsKey(userId)) {
            user.setUpdate(true);
        }
        cdb.getHmUser().put(userId, user);
    }
    ConnectDB cdb;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        cdb = new ConnectDB();
        HttpSession ses = request.getSession();
        String type = request.getParameter("type");
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
            if (cdb.getHmUser().get(userId) != null && !(type.equals("1") || type.equals("2") || type.equals("3") || type.equals("4"))) {
                request.setAttribute("messageAddUser",
                        "This username is already taken. Please try again.");
                request.getRequestDispatcher("adduser.jsp").forward(request, response);
            }
            if (type.equals("3")) {
                User userr = cdb.getHmUser().get(userId);
                String oldPass = request.getParameter("oldPass");
                String pass = request.getParameter("newPass");
                String rePass = request.getParameter("rePass");
                if (!cdb.getHmUser().get(userId).getPass().equals(oldPass)) {
                    request.setAttribute("messageAddUser",
                            "Old password is wrong. Please try again");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                }
                if (!(rePass.equals(pass))) {
                    request.setAttribute("messageAddUser",
                            "Password and Repassword must be the same.");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                }
                String name = userr.getName();
                boolean gender = userr.isGender();
                String dob = userr.getDob();
                String address = userr.getAddress();
                String email = userr.getEmail();
                String phoneNumber = userr.getPhoneNumber();
                int userRoll = userr.getUserRole();
                int questionId = userr.getQuestionId();
                String answer = userr.getAnswer();
                if (userRoll == 0) {
                    questionId = 0;
                    answer = null;
                }
                User user = new User(userId, pass, name, gender, dob, address, email, phoneNumber, userRoll, questionId, answer);
                if (cdb.getHmUser().containsKey(userId)) {
                    user.setUpdate(true);
                }
                cdb.getHmUser().put(userId, user);
            } else if (type.equals("4")) {
                String user = request.getParameter("user");
                User userChange = cdb.getHmUser().get(user);
                int questionId = Integer.parseInt(request.getParameter("questionId"));
                String answer = request.getParameter("answer");
                String newpass = request.getParameter("newpass");
                String repass = request.getParameter("repass");
                if (cdb.getHmUser().get(user) == null) {
                    request.setAttribute("messageLogin",
                            "Username not found. Please try again");
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                }
                int qid = cdb.getHmUser().get(user).getQuestionId();
                String a = cdb.getHmUser().get(user).getAnswer();
                if (qid != questionId && !(a.equalsIgnoreCase(answer))) {
                    request.setAttribute("messageLogin",
                            "Security question or answer is wrong. Please try again.");
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                }
                if (!newpass.equals(repass)) {
                    request.setAttribute("messageLogin",
                            "Password and Repassword must be the same.");
                    request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
                }
                String Name = userChange.getName();
                boolean Gender = userChange.isGender();
                String Dob = userChange.getDob();
                String Address = userChange.getAddress();
                String Email = userChange.getEmail();
                String PhoneNumber = userChange.getPhoneNumber();
                int UserRoll = userChange.getUserRole();
                int QuestionId = userChange.getQuestionId();
                String Answer = userChange.getAnswer();
                if (UserRoll == 0) {
                    QuestionId = 0;
                    Answer = null;
                }
                if (cdb.getHmUser().containsKey(user)) {
                    userChange.setUpdate(true);
                }
                User u = new User(user, newpass, Name, Gender, Dob, Address, Email, PhoneNumber, UserRoll, QuestionId, Answer);
                cdb.getHmUser().put(user, u);
            } else if (type.equals("2")) {
                String pass = request.getParameter("pass");
                putHm(request, response, userId, pass);
            } else {
                String pass = request.getParameter("pass");
                String repass = request.getParameter("repass");
                if (!(repass.equals(pass))) {
                    request.setAttribute("messageAddUser",
                            "Password and Repassword must be the same.");
                    request.getRequestDispatcher("adduser.jsp").forward(request, response);
                }
                putHm(request, response, userId, pass);
            }
            if (type.equals("1")) {
                request.setAttribute("message",
                        "Edit an account successfully!");
                request.getRequestDispatcher("management.jsp").forward(request, response);
            }
            if (type.equals("2")) {
                request.setAttribute("message",
                        "Edit account information successfully!");
                request.getRequestDispatcher("settingUser.jsp").forward(request, response);
            }
            if (type.equals("3")) {
                request.setAttribute("message",
                        "Change password successfully!");
                request.getRequestDispatcher("settingUser.jsp").forward(request, response);
            }
            if (type.equals("4")) {
                request.setAttribute("messageLogin",
                        "Change password successfully.");
                request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
            }
            request.setAttribute("message",
                    "Create an account successfully!");
            request.getRequestDispatcher("management.jsp").forward(request, response);
            
        } catch (IOException | NumberFormatException | ServletException e) {
            System.out.println("loi " + e.getMessage());
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
