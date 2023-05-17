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
                <form action="LoginServlet" method="post">
                    <img class='logo' src="file/logo.svg"  />
                    <div class="form-group">
                        
                      <label class="form-label" for="form2Example1">Username</label>
                        <input type="text" id="form2Example1" name="username" class="form-control" />
                    </div>
                    
                    <div class="form-group">
                         <label class="form-label" for="form2Example2">Password</label>
                           <input type="password" id="form2Example2"   name="password" class="form-control" />
    
                    </div>
                    <input type="submit" name="operation" class="btn btn-dark login-btn " value="login"/>
                    <a href="register.html" class="btn btn-dark login-btn " />Join Now</a>
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
                 <div>
                <img class='login-img' src="file/Frame2.svg"/>
            </div>
                
            </div>
           
        </div>
        </div>
    </body>
   
</html>


<!--  
  
  <form class="test" action="LoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username">
            <br>
            <label>Password:</label>
            <input type="password" name="password">
            <br>
            <input type="submit" value="Login">
        </form>
        <p><%= request.getParameter("message")  %></p>-->


<!--

<div class="container">
<form action="LoginServlet" method="post">
   Email input 
  <div class="form-outline ">
      
    
  </div>

   Password input 
  <div class="form-outline">
     
  </div>

   2 column grid layout for inline styling 
  <div class="row ">
    <div class="col d-flex justify-content-center">
       Checkbox 
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
        <label class="form-check-label" for="form2Example31"> Remember me </label>
      </div>
    </div>

    <div class="col">
       Simple link 
      <a href="#!">Forgot password?</a>
    </div>
  </div>
  
  
  

   Submit button 
  <input type="submit" class="btn btn-primary btn-block " value="Login"/>
  <p><%= request.getParameter("message")  %></p>
   Register buttons 
  <div class="text-center">
    <p>Not a member? <a href="#!">Register</a></p>
    
  </div>
</form>
  
        </div>  
  <div class='container2'>
      <img style='width:auto; height: 80vh;'src="file/Frame2.svg" />
  </div>-->
