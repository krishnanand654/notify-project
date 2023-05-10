<%-- 
    Document   : vedio
    Created on : Apr 10, 2023, 12:48:44 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

 <html>
    
          <head>
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
              <link rel="stylesheet" href="style.css"/>
          </head>
          <body >
              
              
                
                 
<%
  String dbUrl = "jdbc:mysql://localhost:3306/test";
  String dbUser = "root";
  String dbPassword = "root";
  String query1 = "SELECT * FROM requests r, login l where r.requestby = l.id order by currdate asc LIMIT 4 ;";
  
  
   

  try {
    // Connect to the database and execute the query
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query1);
    if(conn == null){
     out.println("not connected");
    }
    
    // Output the YouTube video embed code for each video link
     
      
     
    while (rs.next()) {
    String heading = rs.getString("requestfor");
     String desc = rs.getString("rdesc");     
     String date = rs.getString("currdate");
     String by = rs.getString("username");

     
     
   
      %>
     
    <div class='req-box-ctn-win'>
    <div class='req-box-ctn'>
    
        
    
            <div class="head-desc">
                <div class='point-flex'>
               <h2><%=heading%></h2>
                </div>
                <div class='sub'>
            <p>On : <%=date%> </p>
            <p>By : <%=by%> </p>
            </div>
                
     
           <p><%=desc%> </p>
           

            </div>
            
    
    
            
   
        <%
    }
%>
</div>  
</div>
<%
    // Close the database connection
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
    
    
</body>
</html>




