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
public class MainInfoServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String URL = "/MainInfo.jsp", msg = "";
        try {
        String aname = request.getParameter("aname");
        String astr1 = request.getParameter("astreet1");
        String astr2 = request.getParameter("astreet2");
        String acity = request.getParameter("acity");
        String astate = request.getParameter("astate");
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
        
        if (pstr2.trim().isEmpty()) {
            pstr2 = "None";
        } 
        if (pmname.trim().isEmpty()) {
            pmname = "None"; 
        }
        if (astr2.trim().isEmpty()) {
            astr2 = "None";
        } 
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/vaccination?useSSL=false";
        String username = "root";
        String password = "nhi311201";
           
        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, username, password);
        Statement st = connection.createStatement();
        
        st.executeUpdate("INSERT INTO adsite(AD_NAME,AD_STREET1,AD_STREET2,AD_CITY,AD_STATE,AD_ZIPCODE)values('"+aname+"','"+astr1+"','"+astr2+"','"+acity+"','"+astate+"','"+azip+"')");
        st.executeUpdate("INSERT INTO provider(PRO_ID,PRO_LNAME,PRO_INITIAL,PRO_FNAME,PRO_STREET1,PRO_STREET2,PRO_CITY,PRO_STATE,PRO_ZIPCODE)values('"+pid+"','"+plname+"','"+pmname+"','"+pfname+"','"+pstr1+"','"+pstr2+"','"+pcity+"','"+pstate+"','"+pzip+"')");
        
        } catch (ClassNotFoundException e) {
            msg += "JDBC Driver not found in project<br>";
        } catch (SQLException e) {
            msg += "Connection error: " + e.getMessage() + "<br>";
        } catch (Exception e) {
            msg += "Servlet error: " + e.getMessage();
        }
        msg += "Your information was successfully recorded!";
        request.setAttribute("msg", msg);
        RequestDispatcher disp = getServletContext().getRequestDispatcher(URL);
        disp.forward(request, response);
    }

    
}

