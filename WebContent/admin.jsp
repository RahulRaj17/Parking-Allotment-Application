<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
/*
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
*/
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Admin</title>
    <link rel="stylesheet" href="./css/booking.css" />
    <style>
    	.button_1{
    		position:absolute;
    		top:20px;
    	}
    	
    	h1{
    		text-align:center;
    		font-size:50px;
    	}
    	
    	#showcase{
    		border-bottom:2px solid black;
    	}
    			table {
			margin-left:auto;
			margin-right:auto;
			margin-top:100px;
			margin-bottom:100px;
  			font-family: arial, sans-serif;
  			width: 60%;
  			border-bottom:3px solid black;
		}

		td, th {
  			border: 1px solid black;
  			text-align: center;
  			padding: 25px;
  			font-weight:bold;
  			font-size:20px;
 		}

		tr:nth-child(even) {
  			background-color: #eeeee;
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
        <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
          <ul>
            <li> <a href="./admin-addpark.jsp">Add Parking</a></li>
            <li><a href="./admin-remove.jsp">Remove Parking</a></li> 
            <li><button type="submit" class="button_1 out">Sign Out</button>       
          </ul>
		</form>
        </nav>
      </div>
    </header>


	

	<div class="table">
        	<h1>Parking Information</h1>
        	<table style="border:5;">
        	<tr>
        		<td>Location</td><td>Occupied</td>
        	</tr>
        	<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/parking", "root", "");      
	    		pst = con.prepareStatement("select location_name , count(location_name) as cnt from booking GROUP BY location_name");
	    		rs = pst.executeQuery();
	    		String location_name = null;
				String capacity = null;
				
		
	    while(rs.next()){
	    	location_name = rs.getString("location_name");
	    	capacity = rs.getString("cnt");
		%>
        	
        	<tr>
        		<td><%= location_name %></td><td><%= capacity %></td>
        	</tr>
        	<%} %>
        	</table>
     </div>

  </body>
</html>
