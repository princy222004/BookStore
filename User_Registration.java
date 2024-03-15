/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserPanel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author shyam
 */
public class User_Registration extends HttpServlet {

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
            out.println("<title>Servlet User_Registration</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet User_Registration at " + request.getContextPath() + "</h1>");
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
        PrintWriter pt=response.getWriter();
        response.setContentType("text/html");
        String custname=request.getParameter("cust_name");
        String custadd=request.getParameter("cust_add");
        long mobile=Long.parseLong(request.getParameter("cust_mob"));
        String email=request.getParameter("cust_email");
        String user=request.getParameter("cust_user");
        String pass=request.getParameter("cust_pass");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
            PreparedStatement pst=con.prepareStatement("select * from ulogin where username=?");
            pst.setString(1, user);
            ResultSet rs=pst.executeQuery();
            if(rs.isBeforeFirst()){
                pt.print("<font color=red>****User Available</font>");
                RequestDispatcher rd=request.getRequestDispatcher("Signup.html");
                rd.include(request, response);
            }
            else{
                PreparedStatement ps=con.prepareStatement("insert into ulogin values(?,?,?,?,?,?)");
                ps.setString(1,custname);
                ps.setString(2,custadd);
                ps.setLong(3,mobile);
                ps.setString(4,email);
                ps.setString(5,user);
                ps.setString(6,pass);
                int i=ps.executeUpdate();
                if(i>0){
                    JOptionPane.showMessageDialog(null, "Your data is inserted");
                    response.sendRedirect("userlogin.jsp");
                }
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
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
