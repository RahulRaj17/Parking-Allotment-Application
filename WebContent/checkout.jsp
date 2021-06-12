<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="java.security.*" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
	if(session.getAttribute("username")==null){
		response.sendRedirect("booking.jsp");
	}
%>

<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="Rv8hbVGS";
	String salt="83hUQpECH1";
	String action1 ="";
	String base_url="https://sandboxsecure.payu.in";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");

	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Checkout</title>
    <link rel="stylesheet" href="./css/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    var hash='<%= hash %>';
    function submitPayuForm() {
    	
    	if (hash == '')
    		return;

          var payuForm = document.forms.payuForm;
          payuForm.submit();
        }
    </script>
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
      <h1>Enter Details : </h1>
    </div>

    <section id="main" class="short">
      <div class="container">
        <form action="<%= action1 %>" method="post" name="payuForm">
		<input type="hidden" name="key" value="<%= merchant_key %>" />
      	<input type="hidden" name="hash" value="<%= hash %>"/>
      	<input type="hidden" name="txnid" value="<%= txnid %>" />
      	<input type="hidden" name="udf2" value="<%= txnid %>" />
	  	<input type="hidden" name="service_provider" value="payu_paisa" />
		<input type="hidden" id="amount" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount")%>"/>
		<input type="hidden" name="productinfo" value="<%= "Parking Ticket" %>" />
		<input type="hidden" name="surl" value="<%= "http://localhost:8080/ParkingAllotmentFinal/PaymentServlet" %>"/>
		<input type="hidden" name="furl" value="<%= "http://localhost:8080/ParkingAllotmentFinal/error.jsp" %>" />
        <div class="form-control">
        	<label for="name" id="name-label">Name</label>
            <input name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" required />
        </div>
        <div class="form-control">
        	<label for="email" id="email-label">Email</label>
            <input name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" required/>
        </div>
        <div class="form-control">
        	<label for="phone" id="phone">Phone</label>
            <input name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" min="10" max="12" required/>
        </div>
        
        <div class="form-control">
        	<label for="udf4" id="location">Parking Location</label>
            <input type="text" name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" autocomplete="on" required/>
        </div>
        
        <div class="form-control">
       	    <label for="udf5" id="vehicle_number">VEHICLE-NUMBER</label>
            <input type="text" name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" required/>
        </div>
          
        <div class="form-control">
        	<label for="udf1" id="in_time">IN-Time</label>
            <input type="datetime-local" name="udf3" id="in-time" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" min="2020-08-01T06:00" max="2020-08-30T00:00" onchange="myFunction()" required/>
        </div>
          
        <div class="form-control">
       	    <label for="udf3" id="out_time">OUT-TIME</label>
            <input type="datetime-local" name="udf4" id="out-time" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" min="" onchange="calc()" required/>
        </div>

          <% if(empty(hash)){ %>
            <button type="submit" value="Submit" class="button_1">Submit</button>
          <% } %>
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
    	var value =document.getElementById("in-time").value;
    	document.getElementById("out-time").min=value;
    }
    function calc(){
    	var i_date = new Date($('#in-time').val()).getDate();
    	var o_date = new Date($('#out-time').val()).getDate();
    	var diff_date = (o_date - i_date) * 24;
    	var i_hours = new Date($('#in-time').val()).getHours();
    	var o_hours = new Date($('#out-time').val()).getHours();
    	diff_date += o_hours - i_hours;
    	diff_date *=50;
    	document.getElementById('amount').value = diff_date;
    	alert("Amount Payable : " + document.getElementById('amount').value);
    }
   </script>
</body>
</html>
