<%-- 
    Document   : Vaccine
    Created on : Nov 4, 2024, 10:41:20 AM
    Author     : trannhi
--%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vaccine Data Validation</title>
    </head>
    <body>
        <%
          try {
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
              String race[] = request.getParameterValues("race");
              String ethnic = request.getParameter("ethnicity");
              
              String insuholder = request.getParameter("insuholder");
              String insurer = request.getParameter("insurer");
              String idnum = request.getParameter("idnum");
              
              String pid = request.getParameter("pID");
              String aname = request.getParameter("aname");
              String azip = request.getParameter("azip");
              
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
          
              if (str2.trim().isEmpty()) {
                  str2 = "None";
              } 
              if (mname.trim().isEmpty()) {
                  mname = "None";
              }
              String ra  = "";
              for (int u = 0; u < race.length; u++) { 
                   if (u != race.length-1) {
                     ra += race[u] + ",";
                   } 
                   if (u == race.length-1) {
                      ra += race[u];
                   } 
             } 
              if (insuholder == null || insurer == null || idnum == null) {
                 insuholder = insurer = idnum = "None";
              }
              
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
           
              Class.forName("com.mysql.jdbc.Driver").newInstance(); 
              connection = DriverManager.getConnection(url, username, password);
            
            
              Statement st = connection.createStatement();

              int status = st.executeUpdate("INSERT INTO patient(PA_LNAME,PA_INITIAL,PA_FNAME,PA_BIRTHDATE,PA_STREET1,PA_STREET2,PA_CITY,PA_STATE,PA_ZIPCODE,PA_GENDER,PA_RACE,PA_ETHNIC)values('"+lname+"','"+mname+"','"+fname+"','"+birdate+"','"+str1+"','"+str2+"','"+city+"','"+state+"','"+zip+"','"+gender+"','"+ra+"','"+ethnic+"')");
              st.executeUpdate("INSERT INTO insurance(INSU_GROUPID,PA_LNAME,PA_FNAME,PA_BIRTHDATE,PA_ZIPCODE,INSU_HOLDER,INSU_INSURER)values('"+idnum+"','"+lname+"','"+fname+"','"+birdate+"','"+zip+"','"+insuholder+"','"+insurer+"')");
              st.executeUpdate("INSERT INTO visit(PA_LNAME,PA_FNAME,PA_BIRTHDATE,PA_ZIPCODE,PRO_ID,AD_NAME,AD_ZIPCODE)values('"+lname+"','"+fname+"','"+birdate+"','"+zip+"','"+pid+"','"+aname+"','"+azip+"')");
              st.executeUpdate("INSERT INTO vaccination(VACC_DOSENUM,VACC_TYPE,VACC_CVX,VACC_LOTNUM,VACC_MANU,VACC_EXP,VACC_ADMINSITE,VACC_DATEGIVEN,VACC_DOSEWASTE,VACC_ADMINROUTE,VACC_MISSEDAPPT,VACC_COMOR,VACC_REFUSAL,VACC_REFUSREASON,VACC_VACCINATOR,VACC_EUA)values('"+Dose+"','"+Type+"','"+Prod+"','"+Lot+"','"+Manu+"','"+de+"','"+Adsite+"','"+da+"','"+waste+"','"+Route+"','"+Missed+"','"+Como+"','"+Refvac+"','"+refrea+"','"+Vacci+"','"+eua+"')");
              st.executeUpdate("INSERT INTO vacrecord(PA_LNAME,PA_FNAME,PA_BIRTHDATE,PA_ZIPCODE,VACC_DOSENUM,VACC_LOTNUM)values('"+lname+"','"+fname+"','"+birdate+"','"+zip+"','"+Dose+"','"+Lot+"')");
              
              if (status != 0) {
                out.println("A new record was added!");
              }
              
              
              
        %>
        <h1>Validation Report</h1>
        <p>First name is <b><%= fname %></b>. Middle name is<b> <%= mname %></b>
            <br>Last name is <b><%= lname %></b>. Date of birth is <b><%= birdate %></b> 
            <br>Street 1 is <b><%= str1 %></b>. Street 2 is <b><%= str2 %></b>
            <br>City is <b><%= city %></b>. State is <b><%= state %></b>. Zip code is <b><%= zip %></b>
            <br>Gender is <b><%= gender%></b>. Ethnicity is <b><%= ethnic%></b>
            <br>Race(s) is/are
            <%
                for(int i=0; i < race.length; i++) { 
            %>
                  <% if (i != race.length-1) { %>
                     <b><%= race[i]%></b>, 
                  <% } %>
                  <% if (i == race.length-1) { %>
                         and <b><%= race[i] %></b>.
                  <% } %>
            <% } %>
        </p>
        
        <p>Primary insurance holder is <b><%= insuholder %></b>
            <br>Insurer is <b><%= insurer %></b>
            <br>Group/Individual ID number is <b><%= idnum %></b>
        </p>
        
        <p>Provider ID is <b><%= pid %></b>. Vaccination Site Name is <b><%= aname %></b>. 
            <br>Zip code is <b><%= azip %></b>
        </p>
        
        <p>Vaccine Type is <b><%= Type %></b>. Product is <b><%= Prod %></b>. Date Administered is <b> <%= da %></b>
            <br>Manufacturer is <b><%= Manu %></b>. Lot Number is <b><%= Lot %></b>. Expiration Date is <b><%= de %></b>
            <br># Wasted is <b><%= waste %></b>. Administration Site is <b><%= Adsite %></b>. Administration Route is <b><%= Route %></b>
            <br>Dose Number is <b><%= Dose %></b>. Missed Appointment is <b><%= Missed%></b>. Comorbidity is <b><%= Como%></b>.
            <br>Refused Vaccination is <b><%= Refvac %></b>.
            <% if (Refvac.startsWith("Y")) { %>
                Reason is <b><%= refrea %></b>.
            <% } %>
            Received EUA Fact Sheet for Recipients is <b><%= eua %></b>.
            <br>Vaccinator is <b><%= Vacci %></b>.
        </p>               
     
        <% } catch (Exception e) { %>
        <h2>Validation Failure</h2>
        <p>Process error: <b><%= e.getMessage() %></b></p>
        <% } %>
        <form action="index.html" method="post">
            <input type="submit" value="Go Back"/>
        </form>
    </body>
</html>
