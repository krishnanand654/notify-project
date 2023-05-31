import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
@MultipartConfig
public class TestServlet extends HttpServlet {
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
         Date currentDate = new Date();
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         String formattedDate = dateFormat.format(currentDate);
        
        
        String url = "jdbc:mysql://localhost/test"; // replace "mydatabase" with your actual database name
        String user = "root"; // replace "root" with your actual database username
        String password = "root"; // replace "password" with your actual database password
        
        
      // replace "email" with the name of your input field
      
      
        String what = request.getParameter("what");
        String rdesc = request.getParameter("rdesc");
        
        String subname = request.getParameter("subname");
        String stype = request.getParameter("stype");
      
        String sub = request.getParameter("subject");
        String des = request.getParameter("desc");
        String type = request.getParameter("type");
        String mod = request.getParameter("mod");
        
        
        String phead = request.getParameter("phead");
        String plink = request.getParameter("plink");
        if("".equals(plink)){
            plink="null";
        }
        String pdesc = request.getParameter("pdesc");
       
           
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        String username = (String) session.getAttribute("username");
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String operation = request.getParameter("operation");
            if (operation == null) {
                out.println("null");
            }else if (operation.equals("insert")) {
                 Part filePart = request.getPart("file");
                    String fileName = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();

            String sql = "INSERT INTO users (`name`, `content`, `author`, `subject`, `desc`, `date`,`type`,`module` ) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, fileName);
                    statement.setBlob(2, fileContent);
                    statement.setString(3, userid);
                    statement.setString(4, sub);
                    statement.setString(5, des);
                    statement.setString(6, formattedDate);
                    statement.setString(7, type);
                    statement.setString(8, mod);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                          RequestDispatcher successbox = request.getRequestDispatcher("test.html");
                        successbox.include(request, response);
                   
//                        out.println("Data inserted successfully!");
//                       
//                        out.println("<button onclick=\"window.parent.document.querySelector('.popup').remove()\">Close</button>");
                        
                    }   }
            conn.close();
            }else if (operation.equals("insertpost")) {
               

                
                 
            String sql = "INSERT INTO posts (`headline`,`links`, `pdesc`, `currdate`,`by`) VALUES (?,?, ?, ?,?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, phead);
                    statement.setString(2, plink);
                    statement.setString(3, pdesc);
                    statement.setString(4, formattedDate);
                    statement.setString(5, userid);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        
                         RequestDispatcher successbox = request.getRequestDispatcher("test.html");
                        successbox.include(request, response);
                   
                        
//                        out.println("Data inserted successfully!");
//                       
//                        out.println("<button onclick=\"window.parent.document.querySelector('.popup').remove()\">Close</button>");
                        
                    }   }
            conn.close();
            }else if(operation.equals("request")){
                
                
                 
            String sql = "INSERT INTO requests (`requestfor`,`rdesc`, `currdate`,`requestby`) VALUES (?,?,?,?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, what);
                    statement.setString(2, rdesc );
                    statement.setString(3, formattedDate);
                    statement.setString(4, userid);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        
                          RequestDispatcher successbox = request.getRequestDispatcher("test.html");
                        successbox.include(request, response);
                        
//                        
//                        out.println("Requested successfully!");
                        
                        session.setAttribute("recordAdded", true);
                        
//                        out.println("<button onclick=\"window.parent.location.reload(); window.close();\">Close</button>");

                      

                         }   }
            conn.close();
            }else if(operation.equals("subjectinsert")){
             String sql = "SELECT stype FROM subjects WHERE subname = ? and stype=?";
try (PreparedStatement checkStatement = conn.prepareStatement(sql)) {
    checkStatement.setString(1, subname);
    checkStatement.setString(2, stype);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
        String existingType = resultSet.getString("stype");
        if (existingType.equals(stype)) {
            // Subject name and type already exist in the database, show error message
            response.sendRedirect("error.html");
        } else {
            // Subject name exists with a different type, proceed with insertion
            if (insertSubject(conn, subname, formattedDate, userid, stype) > 0) {
                response.sendRedirect("test.html");
            } else {
                response.sendRedirect("errorInsert.html");
            }
        }
    } else {
        // Subject name doesn't exist, proceed with insertion
        if (insertSubject(conn, subname, formattedDate, userid, stype) > 0) {
            response.sendRedirect("test.html");
        } else {
            response.sendRedirect("errorInsert.html");
        }
    }
}


            conn.close();
        }else if(operation.equals("register")){
           String uname = request.getParameter("username");
String pass = request.getParameter("password");
Part filePart = request.getPart("profileImage");
InputStream fileContent = filePart.getInputStream();
byte[] imageData = fileContent.readAllBytes();

// Check if the user already exists
String checkUserQuery = "SELECT COUNT(*) FROM login WHERE username = ?";
PreparedStatement checkUserStmt = conn.prepareStatement(checkUserQuery);
checkUserStmt.setString(1, uname);
ResultSet result = checkUserStmt.executeQuery();
result.next();
int count = result.getInt(1);

if (count > 0) {
    // User already exists, handle the case accordingly (e.g., show an error message)
     response.sendRedirect("register.jsp?regmessage='user already exist'");
    
} else {
    // User does not exist, proceed with registration
    String sqlreg = "INSERT INTO login (username, password, image) VALUES (?, ?, ?)";
    PreparedStatement stmt = conn.prepareStatement(sqlreg);
    stmt.setString(1, uname);
    stmt.setString(2, pass);
    stmt.setBytes(3, imageData);
    int registered = stmt.executeUpdate();
    
    if (registered > 0) {
        RequestDispatcher successbox = request.getRequestDispatcher("index.jsp");
        successbox.include(request, response);
    }
}

            
        }else if(operation.equals("update")){
          
        String upfid = request.getParameter("upfid");       
        String upfname = request.getParameter("upfname");
        String upfdesc = request.getParameter("upfdesc");
        String upftype = request.getParameter("upftype");
        String upfsubject = request.getParameter("upfsubject");
        String upfmod = request.getParameter("upfmod");
        
        
// Use PreparedStatement and set the byte array as a parameter
String sql = "update users SET  `desc`=?, `type`=?, `subject`=?, `module`=? where `id`=?";
try (PreparedStatement statement = conn.prepareStatement(sql)) {
   
    statement.setString(1, upfdesc);
    statement.setString(2, upftype);
    statement.setString(3, upfsubject);
    statement.setString(4, upfmod);
    statement.setString(5, upfid);
    
    
    int rowsUpdated = statement.executeUpdate();
    if (rowsUpdated > 0) {
          RequestDispatcher successbox = request.getRequestDispatcher("test.html");
                        successbox.include(request, response);
                   
//        out.println("subject updated successfully!");
    }
}}
        } catch (ClassNotFoundException |   SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
  
  private int insertSubject(Connection conn, String subname, String formattedDate, String userid, String stype) {
    String insertSql = "INSERT INTO subjects (`subname`,`date`,`by`,`stype`) VALUES (?,?,?,?)";
    try (PreparedStatement insertStatement = conn.prepareStatement(insertSql)) {
        insertStatement.setString(1, subname);
        insertStatement.setString(2, formattedDate);
        insertStatement.setString(3, userid);
        insertStatement.setString(4, stype);
        return insertStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }
}

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String url = "jdbc:mysql://localhost/test"; // replace "mydatabase" with your actual database name
        String user = "root"; // replace "root" with your actual database username
        String password = "root"; // replace "password" with your actual database password
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String operation = request.getParameter("operation");
            if (operation == null) {
                out.println("null");
            }else if (operation.equals("deletenote")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "DELETE FROM users WHERE id=?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, id);
                
                
                int rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) deleted.");
                response.sendRedirect("profile.jsp?row(s) deleted.");
                          
                    }else if (operation.equals("deletepost")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "DELETE FROM posts WHERE id=?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, id);
                
                
                int rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) deleted.");
                response.sendRedirect("profile.jsp?row(s) deleted.");
                          
                    }else if (operation.equals("deleterequest")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "DELETE FROM requests WHERE id=?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, id);
                
                
                int rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) deleted.");
                response.sendRedirect("profile.jsp?row(s) deleted.");
                          
                    }
            
            conn.close();
            
        } catch (ClassNotFoundException |   SQLException e) {
            out.println("Error: " + e.getMessage());
        }
}
}
