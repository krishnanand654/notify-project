<%-- 
    Document   : dbconnection
    Created on : May 17, 2023, 7:27:34 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Define your database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root";

    Connection conn = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish the connection
        conn = DriverManager.getConnection(dbURL, username, password);
        
        // Set the connection as a shared variable for other pages
        application.setAttribute("dbConnection", conn);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

