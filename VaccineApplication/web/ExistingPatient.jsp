<%-- 
    Document   : ExistingPatient
    Created on : Nov 4, 2024, 2:51:31 PM
    Author     : trannhi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>Existing Patient</title>
        <style>
            .topnav {
               overflow: hidden;
               background-color: #333;
            }

            .topnav a {
                float: right;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .topnav a.active {
                background-color: #04AA6D;
                color: white;
            }
            .exist {
                overflow: hidden;
            }
            form.exist label {
                width:200px;
                padding-right:10px;
                float: left;
                color: black;
                text-align: center;
                display: inline-block;
            }
            form.exist input {
                float: left;
                color: black;
                text-align: center;
                font-size: 17px;
                display: block;
                border: 2px solid #2a93c7;
                padding: 14px 10px;
                display: inline-block;
            }
            form.exist input[type = "submit"] {
                margin-left: 70px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/vaccination?useSSL=false"
         user = "root"  password = "nhi311201"/>
        <header>
            <h1>Adding A New Record for Existing Patients</h1> 
            <div class="topnav">
                <a href="login.jsp">Log Out</a>
                <a href="RetrieveData.jsp">Retrieve Data</a>
                <a class="active" href="ExistingPatient.jsp">Existing Patient</a>
                <a href="index.html">New Patient</a>
                <a href="MainInfo.jsp">Main Page</a>
            </div>   
        </header>
        <form class="exist" action="ExistingPatient" method="post">
            <div>
                <label for="lname">Last Name*:</label>
                <input type="text" name="lname" id="lname" required="required">
            </div>
            <div>
                <label for="fname">First Name*:</label>
                <input type="text" name="fname" id="fname" required="required">
            </div>
            <div>
                <label for="birth">Date of Birth*:</label>
                <input type="date" name="birth" id="birth" required="required">
            </div>
            <div>
                <label for="zip">Zip Code*:</label>
                <input type="text" name="zip" id="zip" placeholder="nnnnn-(nnnn)" required />
            </div>
            <div id="button">
                <input type="submit" id="submit" value="Submit">
            </div>
      </form>
      <br>
      ${msg}
      
        <%  String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String birdate = request.getParameter("birth"); 
            String zip = request.getParameter("zip");
            if (fname != null && lname != null && birdate != null && zip != null) {
        %>
        <sql:query dataSource = "${snapshot}" var = "result">
         SELECT patient.*, insurance.INSU_GROUPID, insurance.INSU_HOLDER, insurance.INSU_INSURER,
         adsite.AD_NAME, adsite.AD_STREET1, adsite.AD_STREET2, adsite.AD_CITY, adsite.AD_STATE, adsite.AD_ZIPCODE,
         provider.PRO_ID, provider.PRO_LNAME, provider.PRO_INITIAL, provider.PRO_FNAME, 
         provider.PRO_STREET1, provider.PRO_STREET2, provider.PRO_CITY, provider.PRO_STATE, provider.PRO_ZIPCODE
         from patient, insurance, adsite, visit, provider
         WHERE patient.PA_LNAME = '<%= lname %>'
         AND patient.PA_FNAME = '<%= fname %>'
         AND patient.PA_BIRTHDATE = '<%= birdate %>'
         AND patient.PA_ZIPCODE = '<%= zip %>'
         AND insurance.PA_LNAME = '<%= lname %>'
         AND insurance.PA_FNAME = '<%= fname %>'
         AND insurance.PA_BIRTHDATE = '<%= birdate %>'
         AND insurance.PA_ZIPCODE = '<%= zip %>'
         AND visit.PA_LNAME = '<%= lname %>'
         AND visit.PA_FNAME = '<%= fname %>'
         AND visit.PA_ZIPCODE = '<%= zip %>'
         AND visit.PA_BIRTHDATE = '<%= birdate %>'
         AND adsite.AD_NAME = visit.AD_NAME
         AND adsite.AD_ZIPCODE = visit.AD_ZIPCODE
         AND provider.PRO_ID = visit.PRO_ID;
      </sql:query>
      <%
        }
      %>
      <form id="patient" action="ExistingPatient" method="post">
            <fieldset id="Info1">
            <legend>1st Form:</legend>
            <h3 id='paInfo'>Patient Information</h3>
            <div>
                <label for="fname">First Name*:</label>
                <input type="text" name="fname" id="fname" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_FNAME}"/>" required="required"
                       </c:forEach> > 
            </div>
            <div>
                <label for="mname"> Middle Name:</label>
               
                <input type="text" name="mname" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_INITIAL}"/>" id="mname"
                       </c:forEach>>
            </div>
            <div>
                <label for="lname">Last Name*:</label>
                <input type="text" name="lname" id="lname" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_LNAME}"/>" required="required"
                       </c:forEach>>
            </div>
            <div>
                <label for="birth">Date of Birth*:</label>
                
                <input type="date" name="birth" id="birth"
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_BIRTHDATE}"/>" required="required"
                       </c:forEach>>
            </div>
            <div>
                <label for="street1">Street 1*:</label>
                
                <input type="text" name="street1" id="street1" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_STREET1}"/>" required="required"
                       </c:forEach>/>
            </div>
            <div>
                <label for="street2">Street 2:</label>
                
                <input type="text" name="street2" id="street2" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_STREET2}"/>" 
                       </c:forEach>/>
            </div>
            <div>
                <label for="city">City*:</label>
                
                <input type="text" name="city" id="city" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_CITY}"/>" required="required" 
                       </c:forEach>/>
            </div>
            <div>
                <label for="state">State*:</label>
                <input type="text" name="state" id="state" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_STATE}"/>" required="required" 
                       </c:forEach>/>
            </div>
            <div>
                <label for="zip">Zip Code*:</label>
                
                <input type="text" name="zip" id="zip" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_ZIPCODE}"/>" placeholder="nnnnn-(nnnn)" pattern="^\s*?\d{5}(?:[-\s]\d{4})?\s*?$" required
                       </c:forEach>/>
            </div>
            <div>
                <label>Gender*:</label>
                
                <input type="text"  name="gender" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_GENDER}"/>" required
                       </c:forEach>>
            </div>
            <div id="sectionForm">
                <label>Race*</label><br>
                
                <input type="text" name="race" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_RACE}"/>" required
                       </c:forEach>>  
            </div>
            <div>
                <label>Ethnicity* </label><br>
                
                <input type="text" name="ethnicity" 
                       <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pA_ETHNIC}"/>" required
                        </c:forEach>>    
            </div>
            </fieldset>
            <fieldset id="Info2">
                <legend>2nd Form:</legend>
                <h3 id='insurance'>Insurance Information</h3>
                <div>
                    <label for="insuholder">Primary Insurance holder:</label>
                    <input type="text" name="insuholder" id="insuholder" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.iNSU_HOLDER}"/>"
                       </c:forEach> />
                    <br>
                    <label for="insurer">Insurer:</label>
                    <input type="text" name="insurer" id="insurer" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.iNSU_INSURER}"/>"
                           </c:forEach>  />
                    <br>
                    <label for="idnum">Group/Individual ID number:</label>
                    <input type="text" name="idnum" id="idnum" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.iNSU_GROUPID}"/>"
                           </c:forEach> />
                </div>
                <h3 id='site'>Administration Information:</h3>
                    <div>
                    <label for="aname">The Administration Name*:</label>
                    <input type="text" name="aname" id="aname"
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_NAME}"/>"
                       </c:forEach>
                           required="required" />
                    </div>
                    <div>
                    <label for="astreet1">Street 1*:</label>
                    <input type="text" name="astreet1" id="astreet1"
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_STREET1}"/>"
                       </c:forEach>
                           required="required" />
                    </div>
                    <div>
                        <label for="astreet2">Street 2:</label>
                        <input type="text" name="astreet2" id="astreet2" 
                               <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_STREET2}"/>"
                       </c:forEach>  />
                    </div>
                    <div>
                        <label for="acity">City*:</label>
                        <input type="text" name="acity" id="acity" 
                               <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_CITY}"/>"
                       </c:forEach>
                               required="required"  />
                    </div>
                    <div>
                    <label for="astate">State*:</label>
                    <input name="astate" id="astate" <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_STATE}"/>"
                       </c:forEach> required="required">
                    </div>
                    <div>
                        <label for="azip">Zip Code*:</label>
                        <input type="text" name="azip" id="azip" placeholder="nnnnn(-nnnn)" 
                               <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.aD_ZIPCODE}"/>"
                       </c:forEach>
                               required />
                    </div>
                <h3 id='provider'>Provider Information:</h3>
                    <div>
                    <label for="pID">Provider ID*:</label>
                    <input type="number" name="pID" id="pID" placeholder="0XXXXX"
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_ID}"/>"
                       </c:forEach>
                           required="required">
                    </div>
                    <div>
                    <label for="pfname">First Name*:</label>
                    <input type="text" name="pfname" id="pfname" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_FNAME}"/>"
                       </c:forEach>
                           required="required">
                    </div>
                    <div>
                        <label for="pmname">Middle Name:</label>
                        <input type="text" name="pmname" id="pmname"
                               <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_INITIAL}"/>"
                       </c:forEach> >
                    </div>
                    <div>
                    <label for="plname">Last Name*:</label>
                    <input type="text" name="plname" id="plname" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_LNAME}"/>"
                       </c:forEach>
                           required="required">
                    </div>
                    <div>
                    <label for="pstreet1">Street 1*:</label>
                    <input type="text" name="pstreet1" id="pstreet1" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_STREET1}"/>"
                       </c:forEach>
                           required="required" />
                    </div>
                    <div>
                    <label for="pstreet2">Street 2:</label>
                    <input type="text" name="pstreet2" id="pstreet2" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_STREET2}"/>"
                       </c:forEach> />
                    </div>
                    <div>
                    <label for="pcity">City*:</label>
                    <input type="text" name="pcity" id="pcity" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_CITY}"/>"
                       </c:forEach>
                           required="required" />
                    </div>
                    <div>
                    <label for="pstate">State*:</label>
                    <input name="pstate" id="pstate" <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_STATE}"/>"
                       </c:forEach> required="required">
                    </div>
                    <div>
                    <label for="pzip">Zip Code*:</label>
                    <input type="text" name="pzip" id="pzip" placeholder="nnnnn(-nnnn)" 
                           <c:forEach var = "row" items = "${result.rows}">
                       value="<c:out value = "${row.pRO_ZIPCODE}"/>"
                       </c:forEach>
                           required="required"  />
                    </div>
            </fieldset>
            <fieldset id="Info3">
                <legend>3rd Form:</legend>
                <h3 id='vaccine'>Vaccination Information</h3>
                <div>
                    <label for="Type">Vaccine Type:</label>
                    <input type="text" name="Type" id="Type">
                    <script>
                        document.getElementById('Type').value = "COVID-19";
                    </script>
                </div>
                <div>
                    <label for="Prod">CVX code:</label>
                    <input type="number" name="Prod" id="Prod" placeholder="2XX">
                </div>
                <div>
                    <label for="Manu">Manufacturer:</label>
                    <select name="Manu" id="Manu">
                        <option value="">N/A</option>
                        <option value="Pfizer">Pfizer</option>
                        <option value="Moderna">Moderna</option>
                        <option value="Johnson & Johnson">Johnson & Johnson</option>
                    </select>
                </div>
                <div>
                    <label for="Lot">Lot Number*:</label>
                    <input type="text" name="Lot" id="Lot" placeholder="AA0000" value="AA0000" pattern="[A-Za-z]{2}[0-9]{4}" required>
                    <script>
                        var lot = document.getElementById('Lot');
                        lot.oninvalid = function(event) {
                            event.target.setCustomValidity('Please enter a correct format of the lot number. e.g: HM1234 or hm1234');
                        };
                        lot.oninput = function(event) {
                            event.target.setCustomValidity('');
                        };
                    </script> 
                </div>                
                <div>
                  <label for="df">Expiration Date:</label>
                  <input type="date" name="df" id="df">
                </div>                
                <div>
                    <label>Dose Number*:</label>
                    <input type="radio" name="Dose" value="1st Dose" required>1st Dose
                    <input type="radio" name="Dose" value="2nd Dose" required>2nd Dose
                    <input type="radio" name="Dose" value="3rd Dose" required>3rd Dose  
                </div>
                <div>
                    <label>Administration Site:</label>
                    <input type="radio" name="Site" value="Left Arm" >Left Arm
                    <input type="radio" name="Site" value="Right Arm">Right Arm<br>
                    <label>(Lower Extremity)</label>
                    <input type="radio" name="Site" value="Left(Lower Extremity)" >Left
                    <input type="radio" name="Site" value="Right(Lower Extremity)">Right<br>
                </div>                
                <div>
                    <label for="sdf">Date Administered:</label>
                    <input type="date" name="sdf" id="sdf">
                    <script>
                        Date.prototype.toCurrentDate = (function() {
                            var cts = new Date(this);
                            cts.setMinutes(this.getMinutes() - this.getTimezoneOffset());
                            return cts.toJSON().slice(0,10);
                        });
                        document.getElementById('sdf').value = new Date().toCurrentDate();
                    </script>
                </div>  
                <div>
                    <label for="waste">Number of Dose Wasted:</label>
                    <input type="number" name="waste" id="waste">
                </div>
                <div>
                    <label for="Route">Administration Route:</label>
                    <input type="text" name="Route" id="Route">
                    <script>
                        document.getElementById('Route').value = "C28161 (Intramuscular)";
                    </script>
                </div>                
                <div>
                    <label>Missed Appointment*:</label>
                    <input type="radio"  name="Missed" value="Yes" required>Yes
                    <input type="radio"  name="Missed" value="No" required>No
                </div>                
                <div>
                    <label>Comorbidity*:</label>
                    <input type="radio"  name="Como" value="Yes" required>Yes
                    <input type="radio"  name="Como" value="No" required>No
                </div>                
                <div>
                    <label>Refused Vaccination*:</label><br>
                    <input type="radio" name="refvac" value="No" onChange="selected()" checked required>NO<br>
                    <input type="radio" name="refvac" value="Yes" onChange="selected()" required>YES
                    <input type="text" name="refrea" id="refrea" placeholder="Reason:" disabled><br>
                    <script>
                        function selected() {
                            var result = document.querySelector('input[name="refvac"]:checked').value;
                            if (result === "Yes") {
                                document.getElementById("refrea").removeAttribute('disabled');
                            } else {
                            document.getElementById("refrea").setAttribute('disabled', true);
                            }
                        }
                    </script>
                </div>
                <div>
                    <label for="vacci">Vaccinator:</label>
                    <input type="text" name="vacci" id="vacci">
                </div>                
                <div>
                    <label>Received EUA Fact Sheet for Recipients*:</label>
                    <input type="radio"  name="eua" value="Yes" required>Yes
                    <input type="radio"  name="eua" value="No" required>No
                </div>
                <div>
                    <label>Report an Adverse Event to VAERS:</label>
                    <a href="https://vaers.hhs.gov/esub/index.jsp" target="_blank" title="Report Adverse Reactions to VAERS">Click here to report</a>
                </div>
            </fieldset>
            <div id="buttons">
                <input type="submit" id="submit" value="Submit">
                <input type="reset" value="Reset">  
            </div>
      </form>
    </body>
</html>

