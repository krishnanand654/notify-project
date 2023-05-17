<%-- 
    Document   : search
    Created on : May 6, 2023, 9:48:49 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="/navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body class='search-body'>
        <div class='search-ctn'>
        <%
            String subjectName = request.getParameter("search");
            
            String dbUrl = "jdbc:mysql://localhost:3306/test";
            String dbUser = "root";
            String dbPassword = "root";
            String query = "SELECT * FROM users u LEFT JOIN login l ON u.author = l.id WHERE u.subject LIKE '"+subjectName+"%' OR u.type LIKE '"+subjectName+"%';";

            try {
              // Connect to the database and execute the query
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
              Statement stmt = conn.createStatement();


              if(conn == null){
               out.println("not connected");
              }

              ResultSet rs = stmt.executeQuery(query);
              if (rs.next()) {
              do{
                    int sid = Integer.parseInt(rs.getString("u.id"));
                  String subject = rs.getString("subject");
                  String by = rs.getString("username");     
                  String date = rs.getString("date");
                  String mod = rs.getString("module");
                  String type = rs.getString("type");

                      %>
                      
                      <div class='search-card'>
                 
                  <form action="view" method="post">
                   <input type="hidden" name="id" value="<%= sid %>" />
                    <button class='arrow' type=\"submit\">  <h4><%=subject%> / Module <%=mod%> - ( <%=type%> )</h4> </button>
                     </form>
                  <div class='date-by-flex'>
                    
                      <p><%=date%></p>
                  <p><%=by%></p>
                  </div>
                  
                  
                  <p></p>
                  </div>
  
                <%
                }while (rs.next());
                }else{%>
                
                <div class='no-note-ctn' style="padding-left:520px;"><div class='no-note'><i class="fa-solid fa-face-sad-cry fa-2xl" style="color: #334a70;"></i><p>No Data</p></div></div>
                   <%
                }
                rs.close();
                stmt.close();
                conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
      </div>
    </body>
</html>
