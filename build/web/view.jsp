<%-- 
    Document   : view
    Created on : May 12, 2023, 11:41:12 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify</title>
        <link rel='stylesheet' href='style.css'/>
    </head>
    <body>
      <%
       int id = Integer.parseInt(request.getParameter("id"));
         try
        {
            Class.forName ("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/test", "root", "root");
            
            PreparedStatement ps =con.prepareStatement ("select * from users u, login l where u.author = l.id AND u.id="+id);
//         SELECT u.name, u.subject, u.author, l.username, u.desc, p.links, p.pdesc, p.by, p.currdate FROM users u INNER JOIN login l ON u.author = l.id LEFT JOIN posts p ON p.by = l.id ORDER BY COALESCE(p.currdate, u.currdate) DESC;
           
            String userid = (String) session.getAttribute("userid");
//            String username = (String) session.getAttribute("username");

            // Use the username to display a personalized message or perform other actions
           if(userid !=null) {
           
            
            ResultSet rs = ps.executeQuery ();

        
       
       
            while (rs.next ())
         {
      %>
      
    
      <div class='view-ctn'><div>
                             <div class='view-heading'> 
                              <h1><%= rs.getString ("subject").substring(0, 1).toUpperCase() + rs.getString ("subject").substring(1) %></h1>
                                          <p><span class='cn'>Created by : </span><%=rs.getString ("username") %></p>
                                          <p><span class='cn'>Date : </span><%=rs.getString ("date") %></p>
                             </div>
                             
                             <p class='view-desc'><%=rs.getString ("desc")%></p>
                                     
<!--                             <div class='att-ctn'>
                                 <p><i class="fa-solid fa-file" style='color:rgba(25, 23, 17, 0.6)'></i> <%= rs.getString (2)%></p>
                                        <div class='btn-ctn'>
                                            <a href= download?id="<%=rs.getInt(1)%>"><i class="fa-solid fa-eye" ></i></a>
                                            <a href= download?id="<%=rs.getInt(1)%>"&operation=download><i class="fa-solid fa-cloud-arrow-down" style='margin:0 10px 0; color:rgba(25, 23, 17, 0.6)'></i></a>
                                                     
                                        </div>
                             </div>-->
                         </div>
                             </div>               
                                            
                                            <%
                                                 }
            
       
        }else{
               out.print("");
           }}
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
</html>
