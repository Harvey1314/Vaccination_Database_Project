/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import business.RetrieveInfo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author trannhi
 */
public class UpdateDataServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String msg = "", URL="/RetrieveData.jsp";
    try {
        RetrieveInfo re  = (RetrieveInfo) request.getSession().getAttribute("re");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String birdate = request.getParameter("birth");
        String str1 = request.getParameter("street1");
        String str2 = request.getParameter("street2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String gender = request.getParameter("gender");
        String race = request.getParameter("race");
        String ethnic = request.getParameter("ethnicity");
        
        String insuholder = request.getParameter("insuholder");
        String insurer = request.getParameter("insurer");
        String idnum = request.getParameter("idnum");
        
        String aname = request.getParameter("aname");
        String azip = request.getParameter("azip");
        
        String pid = request.getParameter("pID");
        String pfname = request.getParameter("pfname");
        String pmname = request.getParameter("pmname");
        String plname = request.getParameter("plname");
        String pstr1 = request.getParameter("pstreet1");
        String pstr2 = request.getParameter("pstreet2");
        String pcity = request.getParameter("pcity");
        String pstate = request.getParameter("pstate");
        String pzip = request.getParameter("pzip");
        
        
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/vaccination?useSSL=false";
        String username = "root";
        String password = "nhi311201";
           
        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, username, password);
        String sql = "UPDATE patient, insurance, adsite, visit, provider SET " +
                " patient.PA_LNAME = '" +lname+ "', " +
                " patient.PA_FNAME = '" +fname+ "', " +
                " patient.PA_INITIAL = '" +mname+ "', " +
                " patient.PA_BIRTHDATE = '" +birdate+ "', " +
                " patient.PA_STREET1 = '" +str1+ "', " +
                " patient.PA_STREET2 = '" +str2+ "', " +
                " patient.PA_CITY = '" +city+ "', " +
                " patient.PA_STATE = '" +state+ "', " +
                " patient.PA_ZIPCODE = '" +zip+ "', " +
                " patient.PA_GENDER = '" +gender+ "', " +
                " patient.PA_RACE = '" +race+ "', " +
                " patient.PA_ETHNIC = '" +ethnic+ "', " +
                " insurance.INSU_GROUPID = '"+idnum+"', " +
                " insurance.INSU_HOLDER = '"+insuholder+"', " +
                " insurance.INSU_INSURER = '"+insurer+"', " +
                " insurance.PA_LNAME = '" +lname+ "', " +
                " insurance.PA_FNAME = '" +fname+ "', " +
                " insurance.PA_BIRTHDATE = '" +birdate+ "', " +
                " insurance.PA_ZIPCODE = '" +zip+ "', " +
                " adsite.AD_NAME = '"+aname+"', " +
                " adsite.AD_ZIPCODE = '"+azip+"', " +
                " provider.PRO_ID = '"+pid+"', " +
                " provider.PRO_LNAME = '"+plname+"', " +
                " provider.PRO_FNAME = '"+pfname+"', " +
                " provider.PRO_INITIAL = '"+pmname+"', " +
                " provider.PRO_STREET1 = '"+pstr1+"', " +
                " provider.PRO_STREET2 = '"+pstr2+"', " +
                " provider.PRO_CITY = '"+pcity+"', " +
                " provider.PRO_STATE = '"+pstate+"', " +
                " provider.PRO_ZIPCODE = '"+pzip+"', " +
                " visit.PA_LNAME = '" +lname+ "', " +
                " visit.PA_FNAME = '" +fname+ "', " +
                " visit.PA_BIRTHDATE = '" +birdate+ "', " +
                " visit.PA_ZIPCODE = '" +zip+ "', " +
                " visit.PRO_ID = '" +pid+ "', " +
                " visit.AD_NAME = '" +aname+ "', " +
                " visit.AD_ZIPCODE = '" +azip+ "' " +
                " WHERE patient.PA_LNAME = '"+ re.getLastname() +"'" +
                " AND patient.PA_FNAME = '"+ re.getFirstname() +"'" +
                " AND patient.PA_BIRTHDATE = '"+ re.getBirthdate() +"'" +
                " AND patient.PA_ZIPCODE = '"+ re.getZipcode() +"'" +
                " AND insurance.PA_LNAME = '"+ re.getLastname() +"'" +
                " AND insurance.PA_FNAME = '"+ re.getFirstname() +"'" +
                " AND insurance.PA_BIRTHDATE = '"+ re.getBirthdate() +"'" +
                " AND insurance.PA_ZIPCODE = '"+ re.getZipcode() +"'" +
                " AND visit.PA_LNAME = '"+ re.getLastname() +"'" +
                " AND visit.PA_FNAME = '"+ re.getFirstname() +"'" +
                " AND visit.PA_ZIPCODE = '"+ re.getZipcode() +"'" +
                " AND visit.PA_BIRTHDATE = '"+ re.getBirthdate() +"'" +
                " AND adsite.AD_NAME = '"+ aname +"'" +
                " AND adsite.AD_ZIPCODE = '"+ azip +"'" +
                " AND provider.PRO_ID = '"+ pid +"'";
        PreparedStatement ps = connection.prepareStatement(sql); 
        int rc = ps.executeUpdate();
        
        String vsql = "UPDATE vacrecord, patient, vaccination SET " +
                      " vacrecord.PA_LNAME = '" +lname+ "', " +
                      " vacrecord.PA_FNAME = '" +fname+ "', " +
                      " vacrecord.PA_BIRTHDATE = '" +birdate+ "', " +
                      " vacrecord.PA_ZIPCODE = '" +zip+ "' " +
                      " WHERE patient.PA_LNAME = '"+ re.getLastname() +"'" +
                      " AND vacrecord.PA_LNAME = '"+ re.getLastname() +"'" +
                      " AND patient.PA_FNAME = '"+ re.getFirstname() +"'" +
                      " AND vacrecord.PA_FNAME = '"+ re.getFirstname() +"'" +
                      " AND patient.PA_ZIPCODE =  '"+ re.getZipcode() +"'" +
                      " AND vacrecord.PA_ZIPCODE =  '"+ re.getZipcode() +"'" +
                      " AND patient.PA_BIRTHDATE = '"+ re.getBirthdate() +"'" +
                      " AND vacrecord.PA_BIRTHDATE = '"+ re.getBirthdate() +"'" +
                      " AND vacrecord.VACC_DOSENUM = '"+ re.getDosenumber() +"'" +
                      " AND vaccination.VACC_DOSENUM = '"+ re.getDosenumber() +"'" +
                      " AND vacrecord.VACC_LOTNUM = '"+ re.getLotnumber() +"'" +
                      " AND vaccination.VACC_LOTNUM= '"+ re.getLotnumber() +"'";
        PreparedStatement vps = connection.prepareStatement(vsql);
        int vac = vps.executeUpdate();
        if (rc == 0 && vac == 0) {
            msg += "Record updated.<br>";
        } else if (rc >=1) {
            msg += "Record updated.<br>";
        }
    } catch (ClassNotFoundException e) {
            msg += "JDBC Driver not found in project<br>";
    } catch (SQLException e) {
            msg += "Connection error: " + e.getMessage() + "<br>";
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

