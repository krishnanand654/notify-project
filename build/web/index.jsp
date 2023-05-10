<%-- 
    Document   : index
    Created on : Apr 12, 2023, 10:49:43 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
            RequestDispatcher sidebar = request.getRequestDispatcher("login.jsp");
            sidebar.include(request, response);
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
