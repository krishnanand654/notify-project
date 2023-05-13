<%-- 
    Document   : module
    Created on : May 5, 2023, 12:00:48 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@  include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body class='mod-win'>
        <% 
               String type = request.getParameter("type");
               String sub = request.getParameter("subject");
               
        %>
        <div class='mod-con'>
         <div class='card module-card'>
         
                <form action="retrieve.jsp" method="post">
                    <input type="hidden" name="type" value="<%=type%>" />
                    <input type="hidden" name="subject" value="<%=sub%>" />
                    <input type="hidden" name="module" value="1" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2>Module 1</h2></div></button>
                 </form>   
        </div>
        <div class='card module-card'>
         
                <form action="retrieve.jsp" method="post">
                    <input type="hidden" name="type" value="<%=type%>" />
                    <input type="hidden" name="subject" value="<%=sub%>" />
                    <input type="hidden" name="module" value="2" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2>Module 2</h2></div></button>
                 </form>   
        </div>
        <div class='card module-card'>
         
                <form action="retrieve.jsp" method="post">
                    <input type="hidden" name="type" value="<%=type%>" />
                    <input type="hidden" name="subject" value="<%=sub%>" />
                    <input type="hidden" name="module" value="3" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2>Module 3</h2></div></button>
                 </form>   
        </div>   
        <div class='card module-card'>
         
                <form action="retrieve.jsp" method="post">
                    <input type="hidden" name="type" value="<%=type%>" />
                    <input type="hidden" name="subject" value="<%=sub%>" />
                    <input type="hidden" name="module" value="4" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2>Module 4</h2></div></button>
                 </form>   
        </div>
        <div class='card module-card'>
         
                <form action="retrieve.jsp" method="post">
                    <input type="hidden" name="type" value="<%=type%>" />
                    <input type="hidden" name="subject" value="<%=sub%>" />
                    <input type="hidden" name="module" value="5" />
                    <button class='arrow' type="submit"><div> <p><i class="fa-solid fa-folder fa-2xl" style="color:#1776FF;" ></i><p>
                            <h2>Module 5</h2></div></button>
                 </form>   
        </div>
   </div>
    </body>
</html>
