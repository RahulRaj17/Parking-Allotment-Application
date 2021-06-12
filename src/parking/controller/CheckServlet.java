package parking.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parking.dao.WaitingDao;
import parking.model.Waiting;

@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WaitingDao waitingDao = new WaitingDao();
    public CheckServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String location_name = request.getParameter("location");
        String vehicle_number = request.getParameter("vehicle_number");
        String in_time = request.getParameter("in_time");
        String out_time = request.getParameter("out_time");

        Waiting waiting = new Waiting();
        waiting.setName(name);
        waiting.setEmail(email);
        waiting.setPhone(phone);
        waiting.setLocationName(location_name);
        waiting.setInTime(in_time);
        waiting.setOutTime(out_time);
        waiting.setVehicleNumber(vehicle_number);

        try {
            int result = waitingDao.insertWaiting(waiting);
            if(result == 1) {
            	PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your booking has been added to waiting list successfully.');");
                out.println("setTimeout(function(){\r\n" + 
                		"            window.location.href = 'booking.jsp';\r\n" + 
                		"         }, 3000);");
                out.println("</script>");
            }
            else {
            	response.sendRedirect("error.jsp?err=Something went wrong. Please try later");
            }
        } catch (Exception e) {
        	
        }
	}
}