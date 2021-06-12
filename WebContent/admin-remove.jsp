<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Park-IN | Admin</title>
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
            <li ><a href="./admin-addpark.jsp">Add Parking</a></li>
            <li class="current"><a href="#">Remove Parking</a></li>
            <li><a href="./admin.jsp">Admin-Home</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <section id="main" class="full">
      <div class="container">
        <div class="heading">
          <h1>Remove Parking</h1>
        </div>
        <form id="survey-form" action="<%= request.getContextPath() %>/LocationRemoveServlet" method="post">
          <div class="form-control">
            <label for="location_name" id="location-name-label">Location Name</label>
            <input
              type="text"
              id="location_name"
              name="location_name"
              placeholder="Enter the Location name to be removed"
              required
            />
          </div>
          <button type="submit" class="button_1">Delete Item</button>
        </form>
      </div>
    </section>
  </body>
</html>
