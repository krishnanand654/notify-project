<%-- 
    Document   : vedio
    Created on : Apr 10, 2023, 12:48:44 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="/navbar.jsp" %>
 <html>
    
          <head>
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
          </head>
          <body class="req-body" >
              
              <div class='req-ctn'>
            <div class="list-group ">     
                 
<%
  String dbUrl = "jdbc:mysql://localhost:3306/test";
  String dbUser = "root";
  String dbPassword = "root";
  String query = "SELECT * FROM requests r, login l where r.requestby = l.id order by r.id desc;";
  
  
   

  try {
    // Connect to the database and execute the query
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    if(conn == null){
     out.println("not connected");
    }
    
    
    
    // Output the YouTube video embed code for each video link
     
     
    while (rs.next()) {
    String heading = rs.getString("requestfor").substring(0, 1).toUpperCase() + rs.getString("requestfor").substring(1);
     String desc = rs.getString("rdesc");     
     String date = rs.getString("currdate");
     String by = rs.getString("username").substring(0, 1).toUpperCase() + rs.getString("username").substring(1);
     String auth = rs.getString("requestby");
     
  
    String sqlimg = "SELECT image FROM login WHERE id ="+auth;
    PreparedStatement stmt2;
    stmt2 = conn.prepareStatement(sqlimg);
   

    // Execute the query
    ResultSet rsimg = stmt2.executeQuery();
   
      %>
     
   
    
          
  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start custom-bg-color ">
    <div class="d-flex w-100 justify-content-between  ">
        <div class="req-reply">
                        <%
    // Check if a result was found
    if (rsimg.next()) {
        // Retrieve the image data
        byte[] imageData = rsimg.getBytes("image");

        // Set the image data as the source of the <img> tag
        String base64Image = Base64.getEncoder().encodeToString(imageData);

         out.println("<img class='dp' src=\"data:image/*;base64," + base64Image + "\">");
    }
%>
      <h5 class="mb-1"><%=by%></h5>
        </div>
        <small><%=date%></small>
       
     
    </div>
    <p class="mb-1"><%=desc%> </p>
   
    <small class='lang'style='padding-left:50px;'><%=heading%></small> 
<!--    <small><i class="fa-solid fa-reply"></i></small>-->
   
          </a>
            
   
    
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
    </div>
   
    
</body>
</html>




