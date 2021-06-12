<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null){
		response.sendRedirect("booking.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
    <link rel="stylesheet" href="./css/booking.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Booking</title>
    <style>
    	
		@media (max-width: 768px) {
		body{
			background:#333;
		}
		#map{
			width:300px;
			height:200px;
		}
		footer{
			display:none;
		}
		.boxes > div {
			margin:30px auto;
		}
		h1{
			display:none;
		}
		.button_1{
			position:absolute;
			right:30px;
			top:5px;
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
            <!--Implement Sign out-->
            <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
            <ul>
            	<li class="current"><button type="submit" class="button_1 out">Sign Out</button>
            </ul>
            </form>
        </nav>
     </div>
    </header>

    <section id="showcase">
      <div id="map"></div>
    </section>

	<form action="<%= request.getContextPath() %>/WaitingServlet" method="POST" name="waiting">
    <div class="boxes">
    		<%
				Connection con;
				PreparedStatement pst,pst1;
				ResultSet rs,rs1;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/parking", "root", "");      
	    		pst = con.prepareStatement("select * from location ");
	    		rs = pst.executeQuery();
	    		String location_name = null;
				String capacity = null;
				String rate = null;
	            pst1 = con.prepareStatement("SELECT location_name,COUNT(location_name) as cnt from booking GROUP by(location_name) order by location_name");
	            rs1 = pst1.executeQuery();
	            Map<String,Integer> map = new HashMap();
	            while(rs1.next()){
	            	int x = Integer.parseInt(rs1.getString("cnt"));
	            	String y = rs1.getString("location_name");
	            	if(!map.containsKey(y)){
	            		map.put(y,x);
	            	}else{
	            		int c = map.get(y);
	            		map.put(y,x+c);
	            	}
	            }
	            
	    while(rs.next()){
	    	location_name = rs.getString("location_name");
	    	capacity = rs.getString("capacity");
	    	int z = 0;
	    	if(map.containsKey(location_name)){
	    		z = Integer.parseInt(capacity) - map.get(location_name);
	    	}else{
	    		z = Integer.parseInt(capacity);
	    	}
	    	rate = rs.getString("rate");
	
		%>
			<div>
			<p>Location: <%= location_name %></p>
			<p>Capacity : <%= z %></p>
			<p>Rate : <%= rate %></p>
			
<!-- 			<input type="hidden" name="button_1"> onclick="{document.waiting.button_1.value=this.value}"  -->
    		<a href="checkout.jsp"><button type="submit" class="btn btn-primary" value="<%= location_name %>" name="button_1">Register</button></a>
			</div>
			
			<%} %>
   </div>
   </form>

    <footer>
      <p>Park-IN &copy; 2020</p>
    </footer>
    <script>
    
    var map = L.map("map").setView([13.0521, 80.2307], 13);

    L.tileLayer(
      "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=zeGhyu8dTdefiL17BBy1",
      {
        attribution:
          '<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>',
      }
    ).addTo(map);
    
    <%
    	pst = con.prepareStatement("select * from location ");
		rs = pst.executeQuery();
		int i = 0;
		while(rs.next()){
			Double lat = Double.parseDouble(rs.getString("lat"));
			Double lon = Double.parseDouble(rs.getString("lon"));
			String name = rs.getString("location_name");
			i++;
		
    %>

var coordinates = {
    Latitude: {
      '0': <%= lat %>,
    },
    Longitude: {
      '0': <%= lon %>,
    },
  };
  		
  for (let i = 0; i < Object.keys(coordinates.Latitude).length; i += 1) {
    var marker = L.marker([
      coordinates.Latitude[i.toString()],
      coordinates.Longitude[i.toString()],
    ]);
    marker.myData = { id: coordinates.Latitude[i.toString()] };
    marker.addTo(map);
    marker.bindPopup("<b><%= name %></b>");
  }
  
  <%
		}
	%>
    </script>
</body>
</html>