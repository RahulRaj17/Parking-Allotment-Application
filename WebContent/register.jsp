<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Register</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
    	label{
    		font-weight:bold;
    	}
    	@media (max-width: 768px) {
    		footer{
    			margin-top:100px;
    		}
    	}
    </style>
</head>
<body>
	<header>
      <div class="container">
        <div id="branding">
          <h1><span class="highlight">Park</span>-IN</h1>
        </div>
        <nav>
          <ul>
            <li><a href="index.jsp">Home</a></li>
            <li class="current"><a href="register.jsp">Register</a></li>
            <li><a href="login.jsp">Sign In</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="heading">
      <h1>Register</h1>
    </div>

    <section id="main" class="short">
      <div class="container">
        <form id="survey-form" action="<%= request.getContextPath() %>/CustomerServlet" method="post">
          <div class="form-control">
            <label for="name" id="name-label">Name</label>
            <input
              type="text"
              id="name"
              name = "name"
              placeholder="Enter your name"
              required
            />
          </div>

          <div class="form-control">
            <label for="email" id="email-label">Email</label>
            <input
              type="email"
              id="email"
              name = "email"
              placeholder="Enter your email"
              required
            />
          </div>

          <div class="form-control">
            <label for="password" id="password-label">Password</label>
            <input
              type="password"
              name = "password"
              id="password"
              placeholder="Enter your password"
              required
            />
          </div>

          <div class="form-control">
            <label for="mobile" id="mobile-label">Mobile</label>
            <input
              type="number"
              name = "mobile"
              id="mobile"
              placeholder="Enter your Mobile Number"
              pattern="[0-9]{10}"
              min="10"
              maxlength="12"
              required
            />
          </div>

          <button type="submit" class="button_1">Submit</button>
        </form>
      </div>
    </section>

    <footer>
      <p>Park-IN &copy; 2020</p>
    </footer>
</body>
<script>
var password=document.getElementById("password");

password.onblur=function()
{
	// Validate lowercase letters
	  var lowerCaseLetters = /[a-z]/g;
	  var numbers = /[0-9]/g;
	  var upperCaseLetters = /[A-Z]/g;


	  if(password.value.match(lowerCaseLetters)&&password.value.match(upperCaseLetters)&& password.value.match(numbers)&&password.value.length >= 8) {  
	  	
	  } 
	  else
		  {	alert("Password should contain 1 uppercase letter, 1 lowercase letter, 1 number and total length of 8 characters");}
	  

	}
</script>
</html>
