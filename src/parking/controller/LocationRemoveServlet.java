package parking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LocationRemoveServlet
 */
@WebServlet("/LocationRemoveServlet")
public class LocationRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

	    String name = request.getParameter("location_name");
	    System.out.println(name);

	    
	    
	    try {
	    	Connection con;
	        PreparedStatement pst;
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost/parking","root","");
	        pst = con.prepareStatement("delete from location where location_name = ?");
	        pst.setString(1, name);
	        int result = pst.executeUpdate();
	        
	        System.out.println(result);
	        response.sendRedirect("admin.jsp");


	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
}

