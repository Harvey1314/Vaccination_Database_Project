/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author trannhi
 */
public class ExistingPatientServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String URL = "/ExistingPatient.jsp", msg = "";
        try {
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String birdate = request.getParameter("birth");
            String zip = request.getParameter("zip");
            
            String Type = request.getParameter("Type");
            String Prod = request.getParameter("Prod");
            String da = request.getParameter("sdf");
            String Manu = request.getParameter("Manu");
            String Lot = request.getParameter("Lot");
            String de = request.getParameter("df");
            String waste = request.getParameter("waste");
            String Adsite = request.getParameter("Site");
            String Route = request.getParameter("Route");
            String Dose = request.getParameter("Dose");
            String Missed = request.getParameter("Missed");
            String Como = request.getParameter("Como");
            String Refvac = request.getParameter("refvac");
            String refrea = request.getParameter("refrea");
            String Vacci = request.getParameter("vacci");
            String eua = request.getParameter("eua");
            
            if (Type.trim().isEmpty()) {
                 Type = "None";
              }
              if (Prod.trim().isEmpty()) {
                  Prod = "None";
              } 
              
              if (da.trim().isEmpty()) {
                  da = "None";
              }
              if (Manu.trim().isEmpty()) {
                  Manu = "None";
              }
              if (Lot.trim().isEmpty()) {
                  Lot = "None";
              }
              if (de.trim().isEmpty()) {
                  de = "None";
              }
              if  (waste.trim().isEmpty()) {
                  waste = "None";
              }
              if (Route.trim().isEmpty()) {
                  Route = "None";
              }
              if (Vacci.trim().isEmpty()) {
                  Vacci = "None";
              }      
              if (Adsite == null) {
                  Adsite = "None";
              }
              
              if (refrea == null) {
                  refrea = "";
              }
              
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/vaccination?useSSL=false";
        String username = "root";
        String password = "nhi311201";
           
        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, username, password);
        Statement st = connection.createStatement();
        
        st.executeUpdate("INSERT INTO vaccination(VACC_DOSENUM,VACC_TYPE,VACC_CVX,VACC_LOTNUM,VACC_MANU,VACC_EXP,VACC_ADMINSITE,VACC_DATEGIVEN,VACC_DOSEWASTE,VACC_ADMINROUTE,VACC_MISSEDAPPT,VACC_COMOR,VACC_REFUSAL,VACC_REFUSREASON,VACC_VACCINATOR,VACC_EUA)values('"+Dose+"','"+Type+"','"+Prod+"','"+Lot+"','"+Manu+"','"+de+"','"+Adsite+"','"+da+"','"+waste+"','"+Route+"','"+Missed+"','"+Como+"','"+Refvac+"','"+refrea+"','"+Vacci+"','"+eua+"')");
        st.executeUpdate("INSERT INTO vacrecord(PA_LNAME,PA_FNAME,PA_BIRTHDATE,PA_ZIPCODE,VACC_DOSENUM,VACC_LOTNUM)values('"+lname+"','"+fname+"','"+birdate+"','"+zip+"','"+Dose+"','"+Lot+"')");
            
        } catch (ClassNotFoundException e) {
            msg += "JDBC Driver not found in project<br>";
        } catch (SQLException e) {
            msg += "Connection error: " + e.getMessage() + "<br>";
        } catch (Exception e) {
            msg += "Servlet error: " + e.getMessage();
        }
        msg += "Request Received";
        request.setAttribute("msg", msg);
        RequestDispatcher disp = getServletContext().getRequestDispatcher(URL);
        disp.forward(request, response);
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


