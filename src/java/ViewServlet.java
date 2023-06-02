


import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;


public class ViewServlet extends HttpServlet
{
   
    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int id = Integer.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter ();
        
        out.print("<html><head><link rel='stylesheet' type='text/css' href='style.css'></head><body class='split'>");
        
        response.setContentType ("text/html");
        RequestDispatcher navbar = request.getRequestDispatcher("navbar.jsp");
         
        navbar.include(request, response);
        
  
     
        
        try
        {
            Class.forName ("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/test", "root", "root");
            
            PreparedStatement ps =con.prepareStatement ("select * from users u, login l where u.author = l.id AND u.id="+id);
//         SELECT u.name, u.subject, u.author, l.username, u.desc, p.links, p.pdesc, p.by, p.currdate FROM users u INNER JOIN login l ON u.author = l.id LEFT JOIN posts p ON p.by = l.id ORDER BY COALESCE(p.currdate, u.currdate) DESC;
            HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
//            String username = (String) session.getAttribute("username");

            // Use the username to display a personalized message or perform other actions
           if(userid !=null) {
            out.println("<div class='home-container'>");
            
            ResultSet rs = ps.executeQuery ();

        
       
       
            while (rs.next ())
         {
             
             out.print ( 
                     "<div class='view-ctn'><p class='path'><a href='retrieve-files'>My Notes &gt; </a> "  +  rs.getString ("subject").substring(0, 1).toUpperCase() + rs.getString ("subject").substring(1) + "</p><div>"
                             + "<div class='view-heading'> "
                                + "<h1>"  +  rs.getString ("subject").substring(0, 1).toUpperCase() + rs.getString ("subject").substring(1) + "</h1>"
                                          + "<p><span class='cn'>Created by : </span>" +  rs.getString ("username") + "</p>"
                                          + "<p><span class='cn'>Date : </span>" +  rs.getString ("date") + "</p>"
                             + "</div>"
                             
                             + "<p class='desc'>" +  rs.getString ("desc") + "</p>"
                                     
                             + "<div class='att-ctn'>"
                                     + "<p><i class=\"fa-solid fa-file\" style='color:white'></i> "+  rs.getString (2) + "</p>"
                                        + "<div class='btn-ctn'>"
                                                     + "<a href= download?id="+ rs.getInt(1)  +"><i class=\"fa-solid fa-eye\" style='color:white'></i></a>"
                                                     +"<a href= download?id="+ rs.getInt(1)  +"&operation=download><i class=\"fa-solid fa-cloud-arrow-down\" style='margin:0 10px 0; color:white'></i></a>"
                                                     
                                        + "</div>"
                                + "</div></div>");
                                                                    
         }
            
       
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