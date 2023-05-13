<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
       <div class="navbar-container">
           <div>
               
                 <% if(session.getAttribute("username") != null) { 
            
            String navname = (String) session.getAttribute("username");
            String navnameSubstring = navname.substring(0,1);
            String navlogocap = navnameSubstring.toUpperCase();
            String navcap = navname.substring(0, 1).toUpperCase() + navname.substring(1);
            %>
             
            <div>
            <p class="sidebar-item"><span class="profile-logo"><%= navlogocap%></span><%= navcap%>'s Notify</p>
           <%}%>
            
            </div>
               
               
           </div>
          
  <div class='mag-ctn'>
              <div class='top-links'>
                    <a class='head-list' href="folder.jsp">Notes</a>
                     <form action="retrieve.jsp" method="post">
                        <input type="hidden" name="type" value="assignment" />
                       <button class='head-list' type="submit">Assignment</button>
                     </form>
                    <a class='head-list' href="requestbar.jsp">Requests</a>
                </div>
                 
              
              </div>
           
           <div>
               <form action="LoginServlet" method="post">
                 <button name="operation" value="logout" type="submit" class='btn'><i class="fa-solid fa-power-off" style="color: #669eff;"></i></button>

                </form>

           </div>
</div>
<%          RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
            sidebar.include(request, response);
%>


    </body>
</html>
