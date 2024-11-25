<%-- 
    Document   : MainInfo
    Created on : Nov 4, 2024, 10:31:58 AM
    Author     : trannhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="login.css" />
        <title>Welcome Page</title>
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
        </style>
    </head>
    <body>
        <header>
            <h1>COVID-19 Vaccination Tracking Application</h1>
            <div class="topnav">
                <a href="login.jsp">Log Out</a>
                <a href="RetrieveData.jsp">Retrieve Data</a>
                <a href="ExistingPatient.jsp">Existing Patient</a>
                <a href="index.html">New Patient</a>
                <a class="active" href="MainInfo.jsp">Main Page</a>
            </div>            
        </header>
        <br>
        ${msg}
        <form id="patient" action="MainInfo" method="post">
        <fieldset id="Info2">
                <legend>Account Information:</legend>
                <h3 id='site'>Administration Information:</h3>
                    <div>
                    <label for="aname">The Administration Name*:</label>
                    <input type="text" name="aname" id="aname" oninvalid="InvalidAN(this);" oninput="InvalidAN(this);" required="required" />
                    <script>
                    function InvalidAN(an) {
                        if (an.value === '') {
                            an.setCustomValidity('Administration Name cannot be empty');
                        } else {
                            an.setCustomValidity('');
                        }
                        return true;
                    }
                    </script>
                    </div>
                    <div>
                    <label for="astreet1">Street 1*:</label>
                    <input type="text" name="astreet1" id="astreet1" oninvalid="InvalidS1(this);" oninput="InvalidS1(this);" required="required" />
                    <script>
                    function InvalidS1(s1) {
                        if (s1.value === '') {
                            s1.setCustomValidity('Street 1 cannot be empty');
                        } else {
                            s1.setCustomValidity('');
                        }
                        return true;
                    }
                    </script>
                    </div>
                    <div>
                        <label for="astreet2">Street 2:</label>
                        <input type="text" name="astreet2" id="astreet2" />
                    </div>
                    <div>
                        <label for="acity">City*:</label>
                        <input type="text" name="acity" id="acity" oninvalid="InvalidCT(this);" oninput="InvalidCT(this);" required="required"  />
                        <script>
                        function InvalidCT(ct) {
                            if (ct.value === '') {
                                ct.setCustomValidity('City cannot be empty');
                            } else {
                                ct.setCustomValidity('');
                            }
                            return true;
                        }
                        </script>
                    </div>
                    <div>
                    <label for="astate">State*:</label>
                    <select name="astate" id="astate" oninvalid="InvalidState(this);" oninput="InvalidState(this);" required="required">
                        <option value="AL">AL</option>
                        <option value="AK">AK</option>
                        <option value="AR">AR</option>	
                        <option value="AZ">AZ</option>
                        <option value="CA">CA</option>
                        <option value="CO">CO</option>
                        <option value="CT">CT</option>
                        <option value="DC">DC</option>
                        <option value="DE">DE</option>
                        <option value="FL">FL</option>
                        <option value="GA">GA</option>
                        <option value="HI">HI</option>
                        <option value="IA">IA</option>	
                        <option value="ID">ID</option>
                        <option value="IL">IL</option>
                        <option value="IN">IN</option>
                        <option value="KS">KS</option>
                        <option value="KY">KY</option>
                        <option value="LA">LA</option>
                        <option value="MA">MA</option>
                        <option value="MD">MD</option>
                        <option value="ME">ME</option>
                        <option value="MI">MI</option>
                        <option value="MN">MN</option>
                        <option value="MO" selected>MO</option>	
                        <option value="MS">MS</option>
                        <option value="MT">MT</option>
                        <option value="NC">NC</option>	
                        <option value="NE">NE</option>
                        <option value="NH">NH</option>
                        <option value="NJ">NJ</option>
                        <option value="NM">NM</option>			
                        <option value="NV">NV</option>
                        <option value="NY">NY</option>
                        <option value="ND">ND</option>
                        <option value="OH">OH</option>
                        <option value="OK">OK</option>
                        <option value="OR">OR</option>
                        <option value="PA">PA</option>
                        <option value="RI">RI</option>
                        <option value="SC">SC</option>
                        <option value="SD">SD</option>
                        <option value="TN">TN</option>
                        <option value="TX">TX</option>
                        <option value="UT">UT</option>
                        <option value="VT">VT</option>
                        <option value="VA">VA</option>
                        <option value="WA">WA</option>
                        <option value="WI">WI</option>	
                        <option value="WV">WV</option>
                        <option value="WY">WY</option>
                    </select>
                    <script>
                        function InvalidState(state) {
                            if (state.value === '') {
                                state.setCustomValidity('State cannot be empty');
                            } else {
                                state.setCustomValidity('');
                            }
                            return true;
                        }
                   </script>
                    </div>
                    <div>
                        <label for="azip">Zip Code*:</label>
                        <input type="text" name="azip" id="azip" placeholder="nnnnn(-nnnn)" pattern="^\s*?\d{5}(?:[-\s]\d{4})?\s*?$" 
                               required />
                        <script>
                        var azip = document.getElementById('azip');
                        azip.oninvalid = function(event) {
                            event.target.setCustomValidity('Please enter a correct zip code. e.g: 63456 or 63456-2389');
                        };
                        azip.oninput = function(event) {
                            event.target.setCustomValidity('');
                        };
                        </script> 
                    </div>
                <h3 id='provider'>Provider Information:</h3>
                    <div>
                    <label for="pID">Provider ID*:</label>
                    <input type="number" name="pID" id="pID" placeholder="0XXXXX" oninvalid="InvalidPrID(this);" oninput="InvalidPrID(this);" 
                           required="required">
                    <script>
                        function InvalidPrID(prid) {
                            if (!prid.value.startsWith('0')) {
                                prid.setCustomValidity('Provider ID must start with 0');
                            } else if (prid.value === '') {
                                prid.setCustomValidity('Provider ID cannot be empty');
                            } else if (prid.value.length !== 6) {
                                prid.setCustomValidity('Provider ID must be 6 characters.');
                            } else {
                                prid.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                    <label for="pfname">First Name*:</label>
                    <input type="text" name="pfname" id="pfname" oninvalid="InvalidFN(this);" oninput="InvalidFN(this);" required="required">
                    <script>
                        function InvalidFN(fn) {
                            if (fn.value === '') {
                                fn.setCustomValidity('First Name cannot be empty');
                            } else {
                                fn.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                        <label for="pmname">Initial:</label>
                        <input type="text" name="pmname" id="pmname">
                    </div>
                    <div>
                    <label for="plname">Last Name*:</label>
                    <input type="text" name="plname" id="plname" oninvalid="InvalidLN(this);" oninput="InvalidLN(this);" required="required">
                    <script>
                        function InvalidLN(ln) {
                            if (ln.value === '') {
                                ln.setCustomValidity('Last Name cannot be empty');
                            } else {
                                ln.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                    <label>Does the provider have the same address?</label>
                    <input type="radio"  name="autoAdd" value="Yes" onChange="addselect()">Yes
                    <input type="radio"  name="autoAdd" value="No" onChange="addselect()" checked>No
                    <br>
                    <script>
                        function addselect() {
                         var addse = document.querySelector('input[name="autoAdd"]:checked').value;
                         if (addse === "Yes") {
                            document.getElementById("pstreet1").value = document.getElementById("astreet1").value;
                            document.getElementById("pstreet2").value = document.getElementById("astreet2").value;
                            document.getElementById("pcity").value = document.getElementById("acity").value;
                            document.getElementById("pstate").value = document.getElementById("astate").value;
                            document.getElementById("pzip").value = document.getElementById("azip").value;
                         } else {
                            document.getElementById("pstreet1").value = "";
                            document.getElementById("pstreet2").value = "";
                            document.getElementById("pcity").value = "";
                            document.getElementById("pstate").value = "";
                            document.getElementById("pzip").value = "";
                         }
                       }
                    </script>
                    </div>
                    <div>
                    <label for="pstreet1">Street 1*:</label>
                    <input type="text" name="pstreet1" id="pstreet1" oninvalid="InvalidS1(this);" oninput="InvalidS1(this);" required="required" />
                    <script>
                        function InvalidS1(s1) {
                            if (s1.value === '') {
                                s1.setCustomValidity('Street 1 cannot be empty');
                            } else {
                                s1.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                    <label for="pstreet2">Street 2:</label>
                    <input type="text" name="pstreet2" id="pstreet2" />
                    </div>
                    <div>
                    <label for="pcity">City*:</label>
                    <input type="text" name="pcity" id="pcity" oninvalid="InvalidCT(this);" oninput="InvalidCT(this);" 
                     required="required" />
                    <script>
                        function InvalidCT(ct) {
                            if (ct.value === '') {
                                ct.setCustomValidity('City cannot be empty');
                            } else {
                                ct.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                    <label for="pstate">State*:</label>
                    <select name="pstate" id="pstate" oninvalid="InvalidState(this);" oninput="InvalidState(this);" required="required">
                        <option value="AL">AL</option>
                        <option value="AK">AK</option>
                        <option value="AR">AR</option>	
                        <option value="AZ">AZ</option>
                        <option value="CA">CA</option>
                        <option value="CO">CO</option>
                        <option value="CT">CT</option>
                        <option value="DC">DC</option>
                        <option value="DE">DE</option>
                        <option value="FL">FL</option>
                        <option value="GA">GA</option>
                        <option value="HI">HI</option>
                        <option value="IA">IA</option>	
                        <option value="ID">ID</option>
                        <option value="IL">IL</option>
                        <option value="IN">IN</option>
                        <option value="KS">KS</option>
                        <option value="KY">KY</option>
                        <option value="LA">LA</option>
                        <option value="MA">MA</option>
                        <option value="MD">MD</option>
                        <option value="ME">ME</option>
                        <option value="MI">MI</option>
                        <option value="MN">MN</option>
                        <option value="MO" selected>MO</option>	
                        <option value="MS">MS</option>
                        <option value="MT">MT</option>
                        <option value="NC">NC</option>	
                        <option value="NE">NE</option>
                        <option value="NH">NH</option>
                        <option value="NJ">NJ</option>
                        <option value="NM">NM</option>			
                        <option value="NV">NV</option>
                        <option value="NY">NY</option>
                        <option value="ND">ND</option>
                        <option value="OH">OH</option>
                        <option value="OK">OK</option>
                        <option value="OR">OR</option>
                        <option value="PA">PA</option>
                        <option value="RI">RI</option>
                        <option value="SC">SC</option>
                        <option value="SD">SD</option>
                        <option value="TN">TN</option>
                        <option value="TX">TX</option>
                        <option value="UT">UT</option>
                        <option value="VT">VT</option>
                        <option value="VA">VA</option>
                        <option value="WA">WA</option>
                        <option value="WI">WI</option>	
                        <option value="WV">WV</option>
                        <option value="WY">WY</option>
                    </select>
                    <script>
                        function InvalidState(state) {
                            if (state.value === '') {
                                state.setCustomValidity('State cannot be empty');
                            } else {
                                state.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
                    <div>
                    <label for="pzip">Zip Code*:</label>
                    <input type="text" name="pzip" id="pzip" placeholder="nnnnn(-nnnn)" oninvalid="InvalidZip(this);" oninput="InvalidZip(this);" required="required"  />
                    <script>
                        function InvalidZip(zip) {
                            var pattern = /\s*?\d{5}(?:[-\s]\d{4})?\s*?/;
                            if (pattern.test(zip.value) === false) {
                                zip.setCustomValidity('Please enter a correct zip code. e.g: 63456 or 63456-2389');
                            } else {
                                zip.setCustomValidity('');
                            }
                            return true;
                        }
                    </script>
                    </div>
            </fieldset>
            <div id="buttons">
                <input type="submit" id="submit" value="Submit">
                <input type="reset" value="Reset">  
            </div>
        </form>
    </body>
</html>

