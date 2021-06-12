<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Sign In</title>
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
            <li><a href="index.jsp">Home</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li class="current"><a href="login.jsp">Sign In</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="heading">
      <h1>Sign-In</h1>
    </div>

    <section id="main" class="full">
      <div class="container">
        <form id="survey-form" action="<%= request.getContextPath() %>/LoginServlet" method="post">
          <div class="form-control">
            <label for="username" id="email-label" style="font-weight:bold">Email</label>
            <input
              type="email"
              id="username"
              name ="username"
              placeholder="Enter your Email"
              required
            />
          </div>

          <div class="form-control">
            <label for="password" id="password-label" style="font-weight:bold">Password</label>
            <input
              type="password"
              name="password"
              id="password"
              placeholder="Enter your password"
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
</html>

