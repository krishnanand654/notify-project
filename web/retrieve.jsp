<%-- 
    Document   : retrieve
    Created on : May 7, 2023, 11:21:20 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="/navbar.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class='view-body'>
       <%
         String type = request.getParameter("type");
        String sub = request.getParameter("subject");
        String mod = request.getParameter("module");
        
        try
        {
            Class.forName ("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/test", "root", "root");
            PreparedStatement ps ;
            if(sub != null){
                ps = con.prepareStatement ("select * from users u, login l where u.author = l.id and type='"+type+"' and subject='"+sub+"' and module='"+mod+"'");
            }else{
                ps = con.prepareStatement ("select * from users u, login l where u.author = l.id and type='"+type+"'");
            }
              
            
            String userid = (String) session.getAttribute("userid");
          
            
            if(userid !=null) {
             
              ResultSet rs = ps.executeQuery ();
                
              %>
              <div class='view-window'>
              <%
              
                 if (rs.next()) {
            do {
       %>
       <div class=''>
       <div class='view-container' >
               <div class='view-card'>
                   <div>
                <h2> <%=rs.getString("subject")%></h2>
                <p > <%=rs.getString("desc")%></p>
                   </div>
               
               <div class='btn-ctn'>
                   <a href= "download?id=<%= rs.getInt(1) %>" ><i class="fa-solid fa-eye" style='color:white;'></i></a>
                    <a href= "download?id=<%= rs.getInt(1) %>&operation=download"><i class="fa-solid fa-cloud-arrow-down" style='color:white;' ></i></a>
                    <form action="view" method="post">
                        <input type="hidden" name="id" value="<%=rs.getInt(1)%>"/>
                        <button class='arrow'  type="submit"><div><i class="fa-solid fa-circle-info"style='color:white;'></i> </div></button>
                </form>
                </div>
                </div>
                </div>
       </div>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       <%
       } while (rs.next());
        } else {
       %></div>
<div class='no-note-ctn'><div class='no-note'><i class="fa-solid fa-face-sad-cry fa-2xl" style="color: #334a70;"></i><p>No notes</p></div></div>
            <%
                 RequestDispatcher viewbar = request.getRequestDispatcher("viewbar.jsp");
                    viewbar.include(request, response);
        }   
 }else{
               out.print("");
           }
}catch (ClassNotFoundException | SQLException e2)
        {
            e2.printStackTrace ();
        }
        finally
        {
            out.close ();
        }%>
    </body>
   
</html>
