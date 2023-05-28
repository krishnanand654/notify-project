<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@ page import="java.sql.*, java.util.*" %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
         
           
    </head>
    
    
    


    
    
    <body >
        
        <%
  String dbUrl = "jdbc:mysql://localhost:3306/test";
  String dbUser = "root";
  String dbPassword = "root";
  String query = "SELECT * FROM subjects";
  
  
   

  try {
    // Connect to the database and execute the query
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    if(conn == null){
     out.println("not connected");
    }
    
    // Output the YouTube video embed code for each video link
     
    %>
    
    
        
         <div class='upload-container' >
        <form  action ="TestServlet" method="POST" enctype="multipart/form-data">
            <!--<input type="hidden" name="operation" value="insert">-->
            
                       
           
            
           
            
             <textarea class='desc-area' type="text" name="desc" placeholder="Share your knowledge"/></textarea>
            <div id="drop-zone">Drop files here (.pdf, .jpg, .jpeg, .docx)</div>
            <label for="file-input">
                                <i class="fa-solid fa-paperclip" style='color:#A8A8A8;'"></i>
                        </label>
            <input class='filefrm' type="file" name="file" id="file-input"/>
            
            
            <div>
                
                 <select name="subject" class='select-btn'>
                 <option>select subject</option>
                 <%
    while (rs.next()) {
    String subname = rs.getString("subname");
    %>
                <option value="<%=subname%>"><%=subname%></option>
              
                <%}%>
              </select>
               
                <select name='type' class='select-btn'>
                     <option selected >select type</option>
                    <option value="note">Note</option>
                <option value="assignment">Assignment</option>
                <option value="lab">Lab</option>
                </select>
              
              <select name='mod' class='select-btn'>
                     <option selected >select module</option>
                    <option value="1">Module 1</option>
                <option value="2">Module 2</option>
                 <option value="3">Module 3</option>
                  <option value="4">Module 4</option>
                   <option value="5">Module 5</option>
                </select>
            </div>
              <div class='btn-align'>
                   <button class='insert-btn insert-post' type="submit" name="operation"  value="insert"/>Upload</button>
            
            <button class='close-btn' onclick="window.parent.document.querySelector('.popup').remove()"><i class="fa-solid fa-circle-xmark fa-xl" style="color: #ffffff;"></i></button>
            </div>
             

        </form>
        
     
         </div>
    </body>
    <script>
                // Get the drop zone and file input elements
                
        var dropZone = document.getElementById('drop-zone');
        var fileInput = document.getElementById('file-input');

        // Add event listeners for drag and drop events
        dropZone.addEventListener('dragover', handleDragOver);
        dropZone.addEventListener('drop', handleDrop);

        // Define the handleDragOver function
        function handleDragOver(e) {
          e.preventDefault();
          dropZone.classList.add('dragover');
        }

        // Define the handleDrop function
        function handleDrop(e) {
          e.preventDefault();
          dropZone.classList.remove('dragover');
          var files = e.dataTransfer.files;
          fileInput.files = files;
        }
        

        </script>
           <%
    

    // Close the database connection
    rs.close();
    stmt.close();
    conn.close();
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
%>
</html>




