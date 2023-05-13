

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import jakarta.servlet.http.HttpSession;



/**
 *
 * @author krish
 */
public class LoginServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   
String operation = request.getParameter("operation");

    try {
        // Connect to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

        // Prepare the SQL query to retrieve the user with the given username and password
        if(operation.equals("login")){
        String sql = "SELECT * FROM login WHERE username = ? AND password = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        

        // Execute the query and check if the user exists
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            String id = String.valueOf(result.getInt("id"));
            // If the user exists, set a session attribute and redirect to a welcome page
            HttpSession session = request.getSession();
            session.setAttribute("userid", id);
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
             
            
             response.sendRedirect("login.jsp?message=Invalid%20username%20or%20password");
            
            // If the user does not exist, show an error message
//            request.setAttribute("errorMessage", "<p>Invalid username or password<p>");
//            
//            request.getRequestDispatcher("login.jsp").forward(request, response);
    
        }
        result.close();
        statement.close(); 
        }else if(operation.equals("logout")){
                 request.getSession().invalidate();
    
    // Redirect the user to the login page or any other desired destination
                response.sendRedirect("index.jsp");
            }
       
        conn.close();
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        request.setAttribute("errorMessage", "Error: " + ex.getMessage());
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }   
}   
}
