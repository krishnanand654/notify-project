///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */


import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import java.net.*;

@WebServlet("/retrieve-files")
public class RetrieveFilesServlet extends HttpServlet
{
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
      
        
        PrintWriter out = response.getWriter ();
        out.print("<html><head><link rel='stylesheet' type='text/css' href='style.css'></head><body style='background:#010409;'class='split'>");
        
        response.setContentType ("text/html");
        RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
        sidebar.include(request, response);
         RequestDispatcher navbar = request.getRequestDispatcher("navbar.jsp");
        navbar.include(request, response);
        
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
            
//         SELECT u.name, u.subject, u.author, l.username, u.desc, p.links, p.pdesc, p.by, p.currdate FROM users u INNER JOIN login l ON u.author = l.id LEFT JOIN posts p ON p.by = l.id ORDER BY COALESCE(p.currdate, u.currdate) DESC;
            HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
//            String username = (String) session.getAttribute("username");

            // Use the username to display a personalized message or perform other actions
           if(userid !=null) {
            out.println("<div class='home-container3'>");
            
            ResultSet rs = ps.executeQuery ();
            
            
               if (rs.next()) {
    do {
        out.print("<div class='card-flex-as'>"
                + "<div class='card-as' style='background:none;border:none'> "
                + "<div class='card-con'>"
                
                +"<h2>" + rs.getString("subject").substring(0, 1).toUpperCase() + rs.getString("subject").substring(1) + "</h2>"
               
                + "<div class='btn-ctn'>"
                                                     + "<a href= download?id="+ rs.getInt(1)  +"><i class=\"fa-solid fa-eye\" ></i></a>"
                                                     +"<a href= download?id="+ rs.getInt(1)  +"&operation=download><i class=\"fa-solid fa-cloud-arrow-down\" '></i></a>"
                                                      + "<form action=\"view\" method=\"post\">\n"
                + "    <input type=\"hidden\" name=\"id\" value=\"" + rs.getInt(1) + "\" />\n"
                + "    <button class='arrow' type=\"submit\"><div><i class=\"fa-solid fa-circle-info\"></i> </div></button>"
                + "</form>"
                                        + "</div>"
                + "</div>"
                + "</div>");
    } while (rs.next());
} else {
    out.print("<div class='no-note-ctn'><div class='no-note'><i class=\"fa-solid fa-face-sad-cry fa-2xl\" style=\"color: #334a70;\"></i><p>No notes</p></div></div>");
}   
               out.print("</div>");
       
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
    }
}