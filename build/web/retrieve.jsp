<%-- 
    Document   : retrieve
    Created on : May 7, 2023, 11:21:20 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="/navbar.jsp" %>
<%@ include file="dbconnection.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    .modal {
        display:none;
        
        
        position: fixed;
        border-radius:0;
        z-index: 9999;
        left: 0;
        top: 0;
        padding-top:60px;
        padding-left: 80%;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }
    
    .modal-content {
        
        background-color: #0D1117;
       color:white;
        height: 91vh;
        padding: 20px;
       
         border-left: 1px solid rgb(48, 54, 61);
       border-radius:0px;
        max-width: 500px;
    }
</style>
        <script>
function showView(id) {
    var modal = document.getElementById('myModal');
    var modalFrame = document.getElementById('modalFrame');
    var closeButton = document.getElementsByClassName('close')[0];

    modal.style.display = 'block';
    modalFrame.src = 'view.jsp?id=' + id;

    closeButton.onclick = function() {
        modal.style.display = 'none';
        modalFrame.src = '';
    }
}

window.onclick = function(event) {
    var modal = document.getElementById('myModal');
    if (event.target == modal) {
        modal.style.display = 'none';
        modalFrame.src = '';
    }
}
</script>
    </head>
    <body class='view-body'>
       <%
         String type = request.getParameter("type");
        String sub = request.getParameter("subject");
        String mod = request.getParameter("module");
        
        try
        {
           Connection con=conn;
          
            PreparedStatement ps ;
            if(type!=null && sub!=null){
            ps = con.prepareStatement ("select * from users u, login l where u.author = l.id and type='"+type+"'and subject='"+sub+"'");
               
            }else if(sub==null & mod==null){
             ps = con.prepareStatement ("select * from users u, login l where u.author = l.id and type='"+type+"'");
               
            }else{
                 ps = con.prepareStatement ("select * from users u, login l where u.author = l.id and type='"+type+"' and subject='"+sub+"' and module='"+mod+"'");
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
               <h2><%= rs.getString("subject").substring(0, 1).toUpperCase() + rs.getString("subject").substring(1) %></h2>
               <%
                if(rs.getString("desc").length()>20){
                %>               
                <p > <%=rs.getString("desc").substring(0,20)%>...</p>
                <%}else{
                    %>
                     <p > <%=rs.getString("desc")%>...</p>
                    <%
                    }
                %>
                   </div>
               
               <div class='btn-ctn'>
                   <a href= "download?id=<%= rs.getInt(1) %>" ><i class="fa-solid fa-eye" style='color:white;'></i></a>
                    <a href= "download?id=<%= rs.getInt(1) %>&operation=download"><i class="fa-solid fa-cloud-arrow-down" style='color:white;' ></i></a>
<!--                    <form action="view.jsp" method="post">
                        <input type="hidden" name="id" value="<%=rs.getInt(1)%>"/>
                        <button class='arrow'  type="submit"><div><i class="fa-solid fa-circle-info"style='color:white;'></i> </div></button>
                </form>-->
                    <form action="view.jsp" method="post" onsubmit="event.preventDefault(); showView('<%=rs.getInt(1)%>');">
    <input type="hidden" name="id" value="<%=rs.getInt(1)%>"/>
    <button class="arrow" type="submit">
        <div><i class="fa-solid fa-circle-info" style="color:white;"></i></div>
    </button>
</form>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" style="cursor:pointer;">&times;</span>
        <iframe id="modalFrame" src="" width="100%" height="400px"></iframe>
    </div>
</div>
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
                
        }   
 }else{
               out.print("");
           }
}catch ( SQLException e2)
        {
            e2.printStackTrace ();
        }
        finally
        {
            out.close ();
        }%>
    </body>
   
</html>
