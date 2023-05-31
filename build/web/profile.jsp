<%-- 
    Document   : profile
    Created on : May 31, 2023, 2:27:41 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ include file="dbconnection.jsp" %>
<%@ include file="/navbar.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify</title>
    </head>
    <body>
         <html>
               <head>
                   <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\"></head>
               <body class='profile-body'>
       <%
       
         try
        {
           
            String userid = (String) session.getAttribute("userid");
            String usern= (String) session.getAttribute("username");
             String sqlimg = "SELECT image FROM login WHERE id ="+userid;
                PreparedStatement stmt2;
                stmt2 = conn.prepareStatement(sqlimg);


                // Execute the query
                ResultSet rsimg = stmt2.executeQuery();
                 if (rsimg.next()) {
        // Retrieve the image data
        byte[] imageData = rsimg.getBytes("image");

        // Set the image data as the source of the <img> tag
        String base64Image = Base64.getEncoder().encodeToString(imageData);

         out.println("<div class='profile-card'><img class='prof-dp' src=\"data:image/*;base64," + base64Image + "\">"
         + "<h2>"+usern.substring(0, 1).toUpperCase() + usern.substring(1)+"</h2></div>");
    }
           
            PreparedStatement ps =conn.prepareStatement ("select * from users u, login l where u.author=l.id and l.id="+userid);
         %>
          
          <%
           if(userid !=null) {
                %>
                
            <div class='home-container'>"
             
            <h3 style='padding:10px 0 20px; color:white;'>Notes</h3><table style='margin:-50px 0 0;' class='table table-dark' width=50% border=1>
           <%

            ResultSet rs = ps.executeQuery ();
%>
            /* Printing column names */
            </br></br>
           
            <tr>
           
           <th>file</th>
                    <th>Subject</th>
                    <th style='text-align:center;' colspan='8'>Action</th>
                          
                          

         
           </tr>
<%
          
            while (rs.next ())
         {
            %>
            
            <tr><td><%=  rs.getString (2) %></td><td><%=  rs.getString (5) %></td><td><td><a href= "download?id=<%=rs.getInt(1)%>"><i class="fa-solid fa-eye" style='color:white'></i></a></td></td><td><td><a href= "download?id=<%=rs.getInt(1)%>&operation=download"><i class="fa-solid fa-cloud-arrow-down" style='margin:0 10px 0; color:white'></i></a></td><td><a href= "delete?id=<%= rs.getInt(1)%>&operation=deletenote"><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></a></td>
                     <td><form action='edit.jsp' method='post'>
                        <input type='hidden' name='id' value='"+rs.getInt(1)+"' />
                        <input type='hidden' name='operation' value='edit' />
                       <button class='btn btn-edit' type='submit'><i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i></button></form></td></tr>
         <%
         }
        %>
            </table>
            <%
            
            PreparedStatement ps1 =conn.prepareStatement ("select * from posts p, login l where p.by=l.id and l.id="+userid);
            %>
            
            <h3 style='margin:40px 0 20px;color:white;'>Posts</h3><div class='tab-ctn'>
                <table class='table table-dark table-post .table-responsive-sm'  border=1>
           
<%
            ResultSet rs1 = ps1.executeQuery ();

            %>
            </br></br>
           
            <tr>
           
            <th>feed</th>
                    <th>links</th>
                    <th style='text-align:center;' colspan='8'>Action</th>
                          
                          

         
           </tr>
            
<%
            while (rs1.next ())
         {
         %>
         <tr><td><%=rs1.getString (4).substring(0,10) %>... </td><td><%= rs1.getString(3) %></td><td><td colspan='2'><a href= "delete?id=<%= rs1.getInt(1)%>&operation=deletepost"><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></a></td>
                    </tr>
                     <%
         }
           %>
          </table></div>
          
          
           <%
            
            PreparedStatement ps2 =conn.prepareStatement ("select * from requests r, login l where r.requestby=l.id and l.id="+userid);
            
            %>
            
            <h3 style='margin:40px 0 20px;color:white;'>Requests</h3>
            <div class='tab-ctn'>
                <table class='table table-dark table-post .table-responsive-sm'  border=1>
           
<%
            ResultSet rs2 = ps2.executeQuery ();

            %>
            </br></br>
           
            <tr>
           
            <th>Requested for</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th style='text-align:center;' colspan='8'>Action</th>
                          
                          

         
           </tr>
            
<%
            while (rs2.next ())
         {
         %>
         <tr><td><%=rs2.getString ("requestfor") %></td><td><%= rs2.getString("rdesc").substring(0,5) %>....</td><td><%= rs2.getString("currdate") %></td><td><td colspan='2'><a href= "delete?id=<%= rs2.getInt("id")%>&operation=deleterequest"><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></a></td>
                    </tr>
                     <%
         }
           %>
          </table></div>
           

            <%
           }
           %>
           </body></html>
            
            
           <%
        }catch (SQLException e2)
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
