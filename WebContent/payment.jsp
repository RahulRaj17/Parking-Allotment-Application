<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="parking.mail.Pdfgen" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>
   
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Payment Confirmation</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
		table {
			margin-left:auto;
			margin-right:auto;
			margin-top:100px;
  			font-family: arial, sans-serif;
  			width: 60%;
		}

		td, th {
  			border: 1px solid #dddddd;
  			text-align: center;
  			padding: 8px;
		}

		tr:nth-child(even) {
  			background-color: #dddddd;
		}
</style>
</head>
</head>
<body>

	<%
		Connection con;
		PreparedStatement pst;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/parking", "root", "");

	
      
	    pst = con.prepareStatement("select * from booking order by booking_id desc");
	    rs = pst.executeQuery();
		String txnid = null;
		String location = null;
		String name = null;
		String phone = null;
		String in_time = null;
		String out_time = null;
		String email = null;
		
	    while(rs.next()){
	    	txnid = rs.getString("txnid");
	    	location = rs.getString("location_name");
	    	name = rs.getString("name");
	    	phone = rs.getString("phone");
	    	in_time = rs.getString("in_time");
	    	out_time = rs.getString("out_time");
	    	email = rs.getString("email");
	    	String arr [] = new String[]{txnid,location,name,email};
	    	Pdfgen.sendMain(arr);
	    	break;
	    }
			
	%>
	
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
    
    <h1>Order Summary:</h1>
<table border="5">
  <tr>
    <td>TXN-ID</td>
    <td><%= txnid %></td>

  </tr>
  <tr>
    <td>First Name:</td>
    <td><%= name %></td>
  </tr>
  <tr>
    <td>Phone:</td>
    <td><%= phone %></td>

  </tr>
  <tr>
    <td>Location Name:</td>
    <td><%= location %></td>
  </tr>
  <tr>
    <td>IN-Time</td>
    <td><%= in_time %></td>
  </tr>
    <tr>
    <td>OUT-Time</td>
    <td><%= out_time %></td>
  </tr>
</table>


</body>
</html>
