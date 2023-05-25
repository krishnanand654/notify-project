<%-- 
    Document   : sidebar
    Created on : Apr 7, 2023, 1:55:04 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css"/>
           <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
           
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script>
    window.addEventListener('DOMContentLoaded', function() {
      var navbarItems = document.querySelectorAll('.sidebar li');

      // Retrieve the active item from localStorage
      var activeItem = localStorage.getItem('activeNavItem');

      // Set the initial active item
      if (activeItem) {
        setActiveItem(activeItem);
      }

      // Add event listeners to navbar items
      navbarItems.forEach(function(item) {
        item.addEventListener('click', function() {
          var itemId = item.getAttribute('id');
          setActiveItem(itemId);
        });
      });

      // Set the active item and store it in localStorage
      function setActiveItem(itemId) {
        // Remove 'active' class from all navbar items
        navbarItems.forEach(function(navItem) {
          navItem.classList.remove('active');
        });

        // Add 'active' class to the selected navbar item
        var selectedNavItem = document.getElementById(itemId);
        selectedNavItem.classList.add('active');

        // Store the active item in localStorage
        localStorage.setItem('activeNavItem', itemId);
      }
    });
  </script>
  
    </head>
    <body>
        <div class="sidebar">
            
            
            
        <ul class="sidebar-list">
            
             <% if(session.getAttribute("username") != null) { 
            
            String username = (String) session.getAttribute("username");
            String usernameSubstring = username.substring(0,1);
            String logocap = usernameSubstring.toUpperCase();
            String usercap = username.substring(0, 1).toUpperCase() + username.substring(1);
            %>
             
            <div>
           
           
            
           
            
            <div class="search-box">
               <form action='search.jsp' method='POST'>
                    <input type='text' name="search" class='search' placeholder='Search' required  autocomplete="off"/>
                    <Button class='btn search-btn'type='submit' name='operation' value='search'/><i class="fa-solid fa-magnifying-glass" style="color:#73797f;"></i></Button>
               </form>
           </div>
          </div>
            <li id="navItem1"  ><a href="home.jsp"><i class="fa-solid fa-house icons" style="color: #8F9195;"></i>Home</a></li>
            <li id="navItem2"><a href="profile" ><i class="fa-solid fa-user icons" style="color: #8F9195;"></i>Profile</a></li>
<!--            <li id="navItem3"><a href="profile" ><i class="fa-solid fa-book icons" style="color: #8F9195;"></i>Works</a></li>-->
            
            
            
               
            
        </ul>
            
            <div class="new">
              <div class="dropdown">
                <button class="btn btn-new" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa-solid fa-plus icons-new" style="color: white;"></i>  <span style="font-weight: 500; color:white;">New</span>
                </button>
           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
           <div>
            <a  style="color: white" onclick="showForm()" ><i class="fa-solid fa-plus icons-new" style="color: white;"></i>New Note</a></div>
            <div>
            <a  style="color: white" onclick="showForm2()" ><i class="fa-solid fa-plus icons-new" style="color: white"></i>New Post</a>
            </div>
            <div>
            <a  style="color: white" onclick="showForm3()" ><i class="fa-solid fa-plus icons-new" style="color: white"></i>New Request</a>
            </div>
               <div>
            <a  style="color: white" onclick="showForm4()" ><i class="fa-solid fa-plus icons-new" style="color: white"></i>New Subject</a>
            </div>
                </div>
                
</div>
        </div>

            
        </div>
             <% }else{ %>
            <p>please login</p>
            <%}%>
    </body>
    
    <script >
        function showForm() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="upload.jsp"></iframe>';
                document.body.appendChild(popup);
            }
            
        function showForm2() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="post.html"></iframe>';
                document.body.appendChild(popup);
            }
        function showForm3() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="request.html"></iframe>';
                document.body.appendChild(popup);
            }
        function showForm4() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="subject.html"></iframe>';
                document.body.appendChild(popup);
            }
       
            
        </script>
</html>
