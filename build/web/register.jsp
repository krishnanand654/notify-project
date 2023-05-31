<%-- 
    Document   : register.jsp
    Created on : May 31, 2023, 3:59:15 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Notify</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
    </head>
    <body>
        <div class='ctn'>
        <div class="main-ctn">
            <div class='form-ctn'>  
                
                <form action="TestServlet" method="post" enctype="multipart/form-data" >
                    <img class='logo' src="file/logo.svg"  />
                    
                        
                    <div style="margin-left: 140px ;margin-bottom:30px;  display: flex;">
                        <label for="dp" style="margin-right: 30px "><i class="fa-solid fa-user fa-2xl" style="color:white; "></i></label>
                    <input type="file" class="form-cp" id="dp" name="profileImage"  accept="image/*">
                    </div>
                    <div class="form-group">
                        
                      <label class="form-label form-cp" for="form2Example1">Username</label>
                        <input type="text" id="form2Example1" name="username" required class="form-control form-input" />
                    </div>
                    
                    <div class="form-group ">
                         <label class="form-label form-cp" for="form2Example2">Password</label>
                           <input type="password" id="form2Example2"   name="password" required class="form-control form-input"/>
    
                    </div>
                     <%if(request.getParameter("regmessage")==null){
                     %>
                     <p></p>
                     <%
                         }else{
                     %>
                             <p class='auth-fail'><%= request.getParameter("regmessage")  %></p>

                     <%
                         }
                      %>
                    <input type="submit" class="btn btn-dark login-btn " name="operation" value="register"/>
                    <a style="margin:20px 0 0;width:200px;" href="login.jsp" class='btn btn-dark'>Login</a>
                    
                </form>
               
                 <div>
                <img class='login-img' src="file/image.png"/>
            </div>
               


                
            </div>
           
        </div>
        </div>
    </body>
</html>


