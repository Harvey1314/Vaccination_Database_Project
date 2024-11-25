/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import business.RetrieveInfo;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author trannhi
 */
public class RetrieveDataServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String URL = "/RetrieveData.jsp", msg = "";
        RetrieveInfo re;
        try {
            
           String fname = request.getParameter("fname").trim();
           String lname = request.getParameter("lname").trim();
           String birdate = request.getParameter("birth").trim();
           String zip = request.getParameter("zip").trim();
           String Dose = request.getParameter("Dose").trim();
           String Lot = request.getParameter("Lot").trim();
           
           re = new RetrieveInfo();
           if (fname.isEmpty()) {
              msg += "First name cannot be empty";
           } else {
               re.setFirstname(fname);
           }
           
           if (lname.isEmpty()) {
              msg += "Last name cannot be empty";
           } else {
               re.setLastname(lname);
           }
           
           if (birdate.isEmpty()) {
              msg += "Date of birth cannot be empty";
           } else {
               re.setBirthdate(birdate);
           }
           
           if (zip.isEmpty()) {
              msg += "Zip code cannot be empty";
           } else {
               re.setZipcode(zip);
           }
           
           if (Dose.isEmpty()) {
              msg += "Dose number cannot be empty";
           } else {
               re.setDosenumber(Dose);
           }
           
           if (Lot.isEmpty()) {
              msg += "Lot number cannot be empty";
           } else {
               re.setLotnumber(Lot);
           }
           request.getSession().setAttribute("re", re);
        
        } catch (Exception e) {
           msg += "Servlet error: " + e.getMessage();
        }
        
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


