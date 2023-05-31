<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css"/>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class='ctn'>
        <div class="main-ctn">
            <div class='form-ctn'>  
               
                  <div class="welcome-msg-ctn">
                     <h1 class="welcome-msg">Everything you need, all in one place</h1>
            </div>
                 <div>
                <img class='login-img' src="file/image.png"/>
            </div>
                <form action="LoginServlet" method="post">
                    <img class='logo' src="file/logo.svg"  />
                    <div class="form-group">
                        
                      <label class="form-label form-cp" for="form2Example1">Username</label>
                        <input type="text" id="form2Example1" name="username" required class="form-control form-input" />
                    </div>
                    
                    <div class="form-group">
                         <label class="form-label form-cp" for="form2Example2">Password</label>
                           <input type="password" id="form2Example2"  required  name="password" class="form-control form-input" />
    
                    </div>
                    <input type="submit" name="operation" class="btn btn-dark login-btn " value="login"/>
                    <a href="register.jsp" class="btn btn-dark login-btn " />Join Now</a>
                     <%if(request.getParameter("message")==null){
                     %>
                     <p></p>
                     <%
                         }else{
                     %>
                             <p class='auth-fail'><%= request.getParameter("message")  %></p>

                     <%
                         }
                      %>
                </form>
                
            </div>
           
        </div>
        </div>
    </body>
   
</html>

