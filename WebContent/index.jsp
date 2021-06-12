<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <title>Park-IN | Welcome</title>
    <link rel="stylesheet" href="./css/style.css" />
    <style>
    #showcase{
    	  background: url("");
    	  }
   	#showcase h1 {
  		font-size: 80px;
		}
	#showcase p {
  		font-size: 30px;
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
        <h1>Park-IN</h1>
        <p>
          Your one stop solution to hassle-free Parking!
        </p>
      </div>
    </section>

    <section id="boxes">
      <div class="container">
        <div class="box">
          <h3><i class="fas fa-parking fa-2x"></i></h3>
          <p>
            Access safe, reliable parking at economical rates and maximum security
          </p>
        </div>
        <div class="box">
          <h3><i class="fa fa-car fa-2x"></i></h3>
          <p>
            Spacious parking spot for any size car at fixed hourly rates
          </p>
        </div>
        <div class="box">
          <h3><i class="fa fa-motorcycle fa-2x"></i></h3>
          <p>
            Largest bike parking facility in the city with individual parking slots at affordable rates
          </p>
        </div>
      </div>
    </section>

    <footer>
      <p>Park-IN &copy; 2020</p>
    </footer>
</body>
</html>
