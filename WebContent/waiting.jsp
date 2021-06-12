<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Waiting</title>
    <link rel="stylesheet" href="./css/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body onload="submitPayuForm();">
	<header>
      <div class="container">
        <div id="branding">
          <h1><span class="highlight">Park</span>-IN</h1>
        </div>
        <nav>
          <ul>
            <li class="current"><a href="booking.jsp">Booking</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="heading">
      <h1>Waiting List Details : </h1>
    </div>

    <section id="main" class="short">
      <div class="container">
        <form action="<%= request.getContextPath() %>/CheckServlet" method="post">
        <div class="form-control">
        	<label for="name" id="name-label">Name</label>
            <input name="name" id="name" type="text" required/>
        </div>
        <div class="form-control">
        	<label for="email" id="email-label">Email</label>
            <input name="email" id="email" type="email" required/>
        </div>
        <div class="form-control">
        	<label for="phone" id="phone">Phone</label>
            <input name="phone" type="number" required/>
        </div>
        
        <div class="form-control">
        	<label for="vehicle-number" id="vehicle-number">Vehicle Number:</label>
            <input name="vehicle_number" type="text" required/>
        </div>
        
        <div class="form-control">
        	<label for="location" id="location">Location</label>
            <input type="text" name="location" autocomplete="on" required/>
        </div>
          
        <div class="form-control">
        	<label for="in_time" id="in_time" >IN-Time</label>
            <input type="datetime-local" name="in_time" id="in-time" required/>
        </div>
          
        <div class="form-control">
       	    <label for="out_time" id="out_time">OUT-TIME</label>
            <input type="datetime-local" name="out_time" id="out-time" required/>
        </div>
        <button type="submit" value="Submit" class="button_1">Submit</button>
        </form>
      </div>
    </section>
    <script>
    function myFunction(){
    	var d = new Date().getDate();
    	var h = new Date().getHours();
    	var in_date = new Date($('#in-time').val()).getDate();
    	var in_hours = new Date($('#in-time').val()).getHours();
    	if(in_date - d === 0 && in_hours - h < 2){
    	  alert("Booking should be done before 2 hours");
    	}
    }
    </script>
</body>
</html>
