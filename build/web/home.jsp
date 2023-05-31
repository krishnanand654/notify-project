<%-- 
    Document   : vedio
    Created on : Apr 10, 2023, 12:48:44 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,java.time.format.DateTimeFormatter,java.time.LocalDate" %>
<%@ include file="dbconnection.jsp" %>
<%@ include file="/navbar.jsp" %>


           
<%
 
  String query = "SELECT * FROM posts p, login l where p.by = l.id order by p.id desc;";
 
  String uid = (String) session.getAttribute("userid");

   

  try {
    // Connect to the database and execute the query
   
    
    Statement stmt = conn.createStatement();
    
   
    if(conn == null){
     out.println("not connected");
    }
    String sqlimg = "SELECT image FROM login WHERE id ="+uid;
    PreparedStatement stmt2;
    stmt2 = conn.prepareStatement(sqlimg);
   

    // Execute the query
    ResultSet rsimg = stmt2.executeQuery();
%>
     




 <html>
    
          <head>
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
               <link rel="stylesheet" href="style.css"/>
                <style>
    /* Define the animation */
    @keyframes fade-in {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    /* Apply the animation to the body element */
    body {
      animation: fade-in 0.8s ease-in;
    }
  </style>
 
               <script>
                function toggleInputField() {
                  var inputContainer = document.getElementById('inputContainer');
                  var isHidden = inputContainer.classList.contains('hidden');

                  if (isHidden) {
                    inputContainer.classList.remove('hidden');
                  } else {
                    inputContainer.classList.add('hidden');
                  }
                }
              </script>
          </head>
          <body class="main" >
              

          <div class="a">
            <div class="b">
               <div class="uploadfrm">
                   
               <form action ="TestServlet" method="POST" enctype="multipart/form-data">
              
                  <div class='top-upload'>
                      <div class='dp-box-flex'>
                          
                          
                          <%
    // Check if a result was found
    if (rsimg.next()) {
        // Retrieve the image data
        byte[] imageData = rsimg.getBytes("image");

        // Set the image data as the source of the <img> tag
        String base64Image = Base64.getEncoder().encodeToString(imageData);

         out.println("<img class='dp' src=\"data:image/*;base64," + base64Image + "\">");
    }
%>
                    <textarea class='desc-area' type="text" name="pdesc" required placeholder="Share your knowledge.."/></textarea>
                      </div>
                    <div class="link-area">
                      <label for="file-input">
                          <button id="showButton" type="button" class='btn link-btn' onclick="toggleInputField()"><i class="fa-sharp fa-solid fa-link" style='color:#A8A8A8; position:relative; top:2px;'"></i></button>
                      </label>
                        <div id="inputContainer" class="hidden">
                      <input class='desc-area2' type="text" name="plink" placeholder="Share links.."/>
                        </div>
                    </div>
                    <button class='btn btn-send' type="submit" name="operation" value="insertpost"/>Post</button>

                  </div>
              </form>
            </div>


            <div class='mag-ctn'>
              <div class='top-line'>
                 
                </div>
                  <% 
                        if (session.getAttribute("recordAdded") != null) { %>
                         
                        <div class="alert alert-success" role="alert">
                          New request available
                        </div>
                        <% session.removeAttribute("recordAdded"); %>
                      <% }%>
                         
              
              
              </div>
<div class="test-flex">
          <div class="test-flex-ctn">

              <%
    
    // Output the YouTube video embed code for each video link
//  
//RequestDispatcher navbar = request.getRequestDispatcher("reqhome.jsp");
//navbar.include(request, response);



     ResultSet rs = stmt.executeQuery(query);

   
    while (rs.next()) {
  
       String heading = rs.getString("headline");
     String desc = rs.getString("pdesc");     
     String date = rs.getString("currdate");
     String by = rs.getString("username");
     String auth = rs.getString("by");

     
       String dateStr = rs.getString("currdate");
    java.time.format.DateTimeFormatter formatter1 = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");
    java.time.format.DateTimeFormatter formatter2 = java.time.format.DateTimeFormatter.ofPattern("yyyy-MMM-dd");
    LocalDate date2 = LocalDate.parse(dateStr, formatter1);
    String formattedDate = formatter2.format(date2);

    
    String sqlimg2 = "SELECT image FROM login WHERE id ="+auth;
    PreparedStatement stmt3;
    stmt3 = conn.prepareStatement(sqlimg2);
   

    // Execute the query
    ResultSet rsimg2 = stmt3.executeQuery();

   



     
       String videoLink = rs.getString("links");
       
      String videoId = "";
      if (videoLink.contains("youtube.com")) {
        videoId = videoLink.substring(videoLink.indexOf("v=") + 2);
      } else if (videoLink.contains("youtu.be")) {
        videoId = videoLink.substring(videoLink.indexOf(".be/") + 4);
      }
      
      String BySubstring = by.substring(0,1);
            String byCap = BySubstring.toUpperCase();
           
            String usercap = by.substring(0, 1).toUpperCase() + by.substring(1);
            
      %>

      
              <div class='home-container1'>
        
                
                      <div>
                           <div class='line2'></div>
     <%                       if (rsimg2.next()) {
        // Retrieve the image data
        byte[] imageData = rsimg2.getBytes("image");

        // Set the image data as the source of the <img> tag
        String base64Image = Base64.getEncoder().encodeToString(imageData);

         out.println("<p ><span class='profile-logo2'><img class='dp' src=\"data:image/*;base64," + base64Image + "\"></span>"+usercap+"<span class='date'>"+ formattedDate+"</span></p>");
    }%>
                         
                            
                      </div>
                          <%if(videoId != "" ){%>
                          <div class="home-flex3">
                               <%}else{%> 
                             <div class="home-flex-text">
                              
                                <%}%> 
                                
                                
                                <% if(videoId != ""){%>
                                   <p class='post-desc'><%=desc%><br><br><span class='post-link'><%=videoLink%></span></p>
                                    <%}else{%>
                                    <p class='post-desc'><%=desc%>  </p>
                                    <%}%>
                                
                               
                                
                          
                                      <%if(videoId == "" ){%>
                                    <div class='myElement'>
                           
                                      <iframe style='display:none' width="280" height="200" src="https://www.youtube.com/embed/<%= videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                    <%}else{%>
                                    <div class='myElement'>
                                      
                                    <iframe width="380" height="200" src="https://www.youtube.com/embed/<%= videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                  </div>
                              <%}%>
                                  </div>
                          <div class='line3'></div>
                      </div>
                          
                       
             



               <%
              }
              String query1 = "SELECT * FROM requests r, login l where r.requestby = l.id order by r.id desc LIMIT 4 ;";
                ResultSet rs1 = stmt.executeQuery(query1);
                    

          %>
            </div>
          <div>
              <div>
            <div class='req-box'>
                <h5 class='req-caption'>Requests</h5>
                <%
                    if(rs1.next()){
                      do{
    String reqheading = rs1.getString("requestfor");
     String reqdesc = rs1.getString("rdesc");     
     String reqdate = rs1.getString("currdate");
     String reqby = rs1.getString("username");


                %>
              
    <div class='req-box-ctn'>
    
        
        
            <div class="head-desc">
                <div class='point-flex'>
                        <p class='req-by'><%=reqby%> </p>
                        <p class='req-head'><%=reqheading%></p>
                </div>
               
            <p class='req-date'><%=reqdate%> </p>
           
            </div>
            
           
            </div>
           <%}while (rs1.next());
}else{
%>
<p class='req-head req-no-data'>No requests</p>
<%
}
           %>
           <p class='see-more-link'>
               <a class='see-more-link' href="requestbar.jsp">see more</a></p>
          </div>
              </div>
<!--           <div>
               <div class='req-box'>
                   <p>Notify Team</p>
                   <a href='#'>About us</a>
               </div>
           </div>-->
          </div>
            </div>
          <%
              // Close the database connection
              rs.close();
              stmt.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }

        
          %>
          </div>

        </div> 
          
<!--          <div class='footer'>
              <div class='footer-flex'>
                  <img src='file/bw.png'/>
                  <div>
                      <p>Copyright © 2023 owned by <b>Team 7</b></p>
                  </div>
              </div>
              
          </div>
              -->
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

       
</html>
