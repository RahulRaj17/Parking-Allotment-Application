package parking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parking.model.Location;
import parking.dao.LocationDao;

/**
 * Servlet implementation class LocationServlet
 */
@WebServlet("/LocationServlet")
public class LocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LocationDao locationDao = new LocationDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocationServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location_name = request.getParameter("location_name");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String capacity = request.getParameter("capacity");
        String rate = request.getParameter("rate");

        
        Location location = new Location();
        location.setLocationName(location_name);
        location.setLatitude(latitude);
        location.setLongitude(longitude);
        location.setCapacity(capacity);
        location.setRate(rate);

        try {
            locationDao.insertLocation(location);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin.jsp");
	}

}
