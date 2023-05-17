
import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;


public class ProfileServlet extends HttpServlet
{
   
    @Override
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        RequestDispatcher sidebar = request.getRequestDispatcher("navbar.jsp");
        sidebar.include(request, response);
        PrintWriter out = response.getWriter ();
     

        try
        {
            Class.forName ("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/test", "root", "root");
            
             HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
             String username = (String) session.getAttribute("username");
            PreparedStatement ps =con.prepareStatement ("select * from users u, login l where u.author=l.id and l.id="+userid);
         
            out.println("<html><head><link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\"></head><body class='profile-body'>");
            // Use the username to display a personalized message or perform other actions
           if(userid !=null) {
                
            out.println("<div class='home-container'>");
            out.print ("<table class='table table-dark' width=50% border=1>");
           

            ResultSet rs = ps.executeQuery ();

            /* Printing column names */
            out.print ("</br></br>");
           
            out.print ("<tr>");
           
            out.print ("<th>file</th>"+
                    "<th>Subject</th>"+
                    "<th style='text-align:center;' colspan='8'>Action</th>");
                          
                          

         
            out.print ("</tr>");

            /* Printing result */
            while (rs.next ())
         {
            
             out.print ( "</td><td>" +  rs.getString (2) + " </td>"+"<td>" +  rs.getString (5) + " </td><td>" +"<td><a href= download?id="+ rs.getInt(1)  +"><i class=\"fa-solid fa-eye\" style='color:white'></i></a></td>"+" </td><td>" +"<td><a href= download?id="+ rs.getInt(1)  +"&operation=download><i class=\"fa-solid fa-cloud-arrow-down\" style='margin:0 10px 0; color:white'></i></a></td>"+"<td><a href= delete?id="+ rs.getInt(1)  +"&operation=deletenote><i class=\"fa-solid fa-trash-can\" style=\"color: #ffffff;\"></i></a></td>"+
                     "<td><form action='edit.jsp' method='post'>"+
                        "<input type='hidden' name='id' value='"+rs.getInt(1)+"' />"+
                        "<input type='hidden' name='operation' value='edit' />"+
                       "<button class='btn btn-edit' type='submit'><i class=\"fa-solid fa-pen-to-square\" style=\"color: #ffffff;\"></i></button></form>"+"</td></tr>");
         }
            out.print ("</table></div>");
            
            
            PreparedStatement ps1 =con.prepareStatement ("select * from posts p, login l where p.by=l.id and l.id="+userid);
             out.print ("<div class='tab-ctn'><table class='table table-dark table-post .table-responsive-sm'  border=1>");
           

            ResultSet rs1 = ps1.executeQuery ();

            /* Printing column names */
            out.print ("</br></br>");
           
            out.print ("<tr>");
           
            out.print ("<th>feed</th>"+
                    "<th>links</th>"+
                    "<th style='text-align:center;' colspan='8'>Action</th>");
                          
                          

         
            out.print ("</tr>");

            /* Printing result */
            while (rs1.next ())
         {
             out.print ( "</td><td>" +  rs1.getString (4).substring(0,10) + "... </td>"+"<td>" +  rs1.getString (3) + " </td><td>" +"<td colspan='2'><a href= delete?id="+ rs1.getInt(1)  +"&operation=deletepost><i class=\"fa-solid fa-trash-can\" style=\"color: #ffffff;\"></i></a></td>"+
                     "</tr>");
         }
          out.print ("</table></div>");
           
            out.print("<p>"+request.getParameter("message")+"</p>"  );
          }else{
               out.print("");
           }
           
           out.println("</body></html>");
        }
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