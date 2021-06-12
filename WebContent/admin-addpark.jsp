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
            <li class="current"><a href="#">Add Parking</a></li>
            <li ><a href="./admin-remove.jsp">Remove Parking</a></li>
            <li><a href="./admin.jsp">Admin-Home</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <section id="main" class="full">
      <div class="container">
        <div class="heading">
          <h1>Add Parking</h1>
        </div>
        <form id="survey-form" action="<%= request.getContextPath() %>/LocationServlet" method="post">
          <div class="form-control">
            <label for="location_name" id="location-name-label">Location Name</label>
            <input
              type="text"
              id="location_name"
              name="location_name"
              placeholder="Enter the Location name"
              required
            />
          </div>

          <div class="form-control">
            <label for="latitude" id="latitude-label"
              >Latitude</label
            >
            <input
              type="text"
              id="latitude"
              name="latitude"
              placeholder="Enter Latitude"
              required
            />
          </div>

          <div class="form-control">
            <label for="longitude" id="longitude-label">Longitude</label>
            <input
              type="text"
              id="longitude"
              name="longitude"
              placeholder="Enter Longitude"
              required
            />
          </div>
          
           <div class="form-control">
            <label for="capacity" id="capacity-label">Capacity</label>
            <input
              type="text"
              id="capacity"
              name="capacity"
              placeholder="Enter Capacity"
              value = "10"
              required
            />
          </div>
          
          <div class="form-control">
            <label for="rate" id="rate-label">Rate per hour</label>
            <input
              type="text"
              id="rate"
              name="rate"
              value = "50"
              disabled
            />
          </div>

          <button type="submit" class="button_1">Submit</button>
        </form>
      </div>
    </section>
  </body>
</html>
