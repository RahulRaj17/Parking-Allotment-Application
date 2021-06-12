<%@page import="java.sql.*"%>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Error</title>
    <link rel="stylesheet" href="./css/style.css" />
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
		<h1>Error</h1>
		<p><%=request.getParameter("err") %></p>
		<p>Please wait you are being redirected to Login</p>
    </section>

    <footer>
      <p>Park-IN &copy; 2020</p>
    </footer>
    <script>
         setTimeout(function(){
            window.location.href = 'login.jsp';
         }, 5000);
    </script>
</body>
</html>
