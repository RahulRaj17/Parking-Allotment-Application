<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null ){
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | OTP</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
    	#showcase{
    		height:60vh;
    	}
    	
    	input {
 			border: 1px solid #777;
  			border-radius: 2px;
  			font-family: inherit;
  			padding: 10px;
  			display: block;
  			width: 90%;
  			font-weight: bold;
  			font-size: 20px;
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
            <li class="current"><a href="index.jsp">Home</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="login.jsp">Sign In</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <section id="showcase">
      <div class="container">
        <h1>Enter OTP</h1>
        <form action="<%= request.getContextPath() %>/OtpServlet" method="post">
        	<input type="password" name="password" placeholder="Enter OTP" required><br />
        	<button style="width:50%"type="submit" class="button_1" value="Login">Login</button>
        </form>
      </div>
    </section>
</body>
</html>
