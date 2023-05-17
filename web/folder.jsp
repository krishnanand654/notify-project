<%-- 
    Document   : folder
    Created on : Apr 14, 2023, 9:22:00 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="dbconnection.jsp" %>
<%@  include file="navbar.jsp" %>

<!DOCTYPE html>

<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css"/>
    </head>
     
    <body class='folder-body'>
         <div class="folder">
            <h1>Theory</h1>
             <div class="card-flex">
                 <div style="display:flex; flex-wrap:wrap">
        <% 

            String query = "select * from subjects where stype='theory'";
           
            
            try {
   

                // Connect to the database and execute the query
                Class.forName("com.mysql.jdbc.Driver");
                
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                if(conn == null){
                 out.println("not connected");
                }

                // Output the YouTube video embed code for each video link

            //     RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
            //    sidebar.include(request, response);

                while (rs.next()) {
                
                 String subject = rs.getString("subname");     
                
                 %>
     


            
            
      
           
            <div class='card'>
                
                <div class='card-content'>
                   
                    
                </div>
                <form action="module.jsp" method="post">
                    <input type="hidden" name="type" value="note" />
                    <input type="hidden" name="subject" value="<%=subject%>" />
                    
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2><%=subject%></h2></div></button>
                 </form>

               
              
           
                 
        </div>
            <!--<img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png" class="fade-in">-->
       
     
     
                    <%}
                    String lquery = "select * from subjects where stype='lab'";
                  
                    ResultSet lrs = stmt.executeQuery(lquery);
%>
 </div>
 <div>
<h1>Lab</h1>
<div style="display:flex; flex-wrap:wrap" >
<%
                      while (lrs.next()) {
                
                 String subject = lrs.getString("subname");     
                
                    %>
                    
                    <div class='card'>
                
                <div class='card-content'>
                   
                    
                </div>
                <form action="retrieve.jsp" method="get">
                    <input type="hidden" name="type" value="lab" />
                    
                     <input type="hidden" name="subject" value="<%=subject%>" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2><%=subject%> lab</h2></div></button>
                 </form>

               
              
           
                 
        </div>
                    
                    <%}%>
</div>
                    </div>
                      </div>
                     </div>
                      
                      
                      
                      
                <%
     
   
      }
        catch (ClassNotFoundException | SQLException e2)
        {
            e2.printStackTrace ();
        }
        finally
        {
            out.close ();
        }


        %>
       
    </body>
    <script>
        const image = document.querySelector('.fade-in');
image.addEventListener('load', () => {
  image.classList.add('show');
});

        </script>
</html>

