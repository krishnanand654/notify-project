<%-- 
    Document   : edit
    Created on : Apr 19, 2023, 11:19:48 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify</title>
        <link rel="stylesheet" href='style.css'/>
    </head>
    <body>
        <div class='edit-ctn'>
        <%
            String id = request.getParameter("id");
            
            
               
            String dbUrl = "jdbc:mysql://localhost:3306/test";
            String dbUser = "root";
            String dbPassword = "root";
            String query = "select * from users u, login l where u.author=l.id and u.id="+id;
            String nquery = "SELECT * FROM subjects";
  
  
   

  try {
   RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
    sidebar.include(request, response);

    // Connect to the database and execute the query
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
   
    if(conn == null){
     out.println("not connected");
    }
    
    // Output the YouTube video embed code for each video link
     
//     RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
//    sidebar.include(request, response);
     
    while (rs.next()) {
    String name = rs.getString("name");
     String subject = rs.getString("subject");     
     String desc = rs.getString("desc");
     String type = rs.getString("type");
     String mod = rs.getString("module");
     %>
     
    <form action='TestServlet' method="POST" enctype="multipart/form-data">  
        <input type='text' hidden name='upfid' value="<%=id%>"/>
        
          
          

                <div id="drop-zone">Drop files here</div>
                       <input class='filefrm' type="file" name="file" id="file-input"/>
               
            <textarea type='text' class='desc-area' name='upfdesc' value="<%=desc%>"/><%=desc%></textarea>
            
            
            <div>
              <select name='upftype' class="select-btn">
                <option value='note'>Note</option>
                    <option value='assignment'>Assignment</option>
                    <option value='<%=type%>' selected><%=type%></option>
               </select>
               
                <select name='upfmod' class='select-btn'>
                     <option value="<%=mod%>" selected ><%=mod%></option>
                    <option value="1">Module 1</option>
                <option value="2">Module 2</option>
                 <option value="3">Module 3</option>
                  <option value="4">Module 4</option>
                   <option value="5">Module 5</option>
                </select>
    
    
             <select name="upfsubject" class='select-btn'>
             <option value="<%=subject%>" selected><%=subject%></option>
 
 
 
 <%
            }
            PreparedStatement prestmt=conn.prepareStatement(nquery);
            ResultSet nrs = prestmt.executeQuery();
%>

                <% while (nrs.next()) { %>
                <option value="<%=nrs.getString("subname")%>"><%=nrs.getString("subname")%></option>
                <% } %>
              
            </select>
                
                 
                
                
            </div>
                <input class='insert-btn' type='submit' name='operation' value='update'/>
</form>
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
        </div>
    </body>
    <script>
        var dropZone = document.getElementById('drop-zone');
        var fileInput = document.getElementById('file-input');

        // Add event listeners for drag and drop events
        dropZone.addEventListener('dragover', handleDragOver);
        dropZone.addEventListener('drop', handleDrop);
        </script>
</html>
