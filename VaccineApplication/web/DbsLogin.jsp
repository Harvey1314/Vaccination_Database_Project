<%-- 
    Document   : DbsLogin
    Created on : Nov 4, 2024, 10:31:11?AM
    Author     : trannhi
--%>

<%@ page import= "java.sql.*" %> 
<% 
    String action = request.getParameter("action");
    if (action.equals("Login")) {
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vacdbslogin?useSSL=false", "root", "nhi311201");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from record where username ='"+username+"' and passwrd='"+ pwd +"'");
            if (rs.next()){
                response.sendRedirect("MainInfo.jsp");
            }
            else {
                out.println("Incorrect username/password.");
            }
            
        }
        catch (Exception e){
            out.println(e);
        }
    }

%>
