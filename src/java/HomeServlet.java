/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import jakarta.servlet.RequestDispatcher;
/**
 *
 * @author krish
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

   String dbUrl = "jdbc:mysql://localhost:3306/test";
  String dbUser = "root";
  String dbPassword = "root";
  String query = "SELECT * FROM posts";
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter out = response.getWriter ();
       try{
        Class.forName("com.mysql.jdbc.Driver");
                    try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);
                        
                      
                        // Output the YouTube video embed code for each video link
                        out.print("<html><head><link rel='stylesheet' type='text/css' href='style.css'></head><body >");
     RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
    sidebar.include(request, response);
 out.print("<div><img class='background' src='https://images.pexels.com/photos/305816/pexels-photo-305816.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'/>");  
while (rs.next()) {
     
    out.print("<div class='home-container1'>");
   
     
     out.print("<div class='home-flex'>");  
      
      String heading = rs.getString("headline");
      String desc = rs.getString("pdesc");
       
      out.println("<div><p>"+heading+"</p>");
      out.println("<p>"+desc+"</p></div>");
      
       String videoLink = rs.getString("links");
      String videoId = "";
      if (videoLink.contains("youtube.com")) {
        videoId = videoLink.substring(videoLink.indexOf("v=") + 2);
      } else if (videoLink.contains("youtu.be")) {
        videoId = videoLink.substring(videoLink.indexOf(".be/") + 4);
      }
      
     
       out.println("<div  class='myElement'><iframe width=\"380\" height=\"220\" src=\"https://www.youtube.com/embed/" + videoId + "\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></div></div></body></html>");
    
    }

// Close the database connection
rs.close();
stmt.close();   }
  } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
  }
    }

   

}
