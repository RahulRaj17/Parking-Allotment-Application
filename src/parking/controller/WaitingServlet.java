package parking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WaitingServlet")
public class WaitingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WaitingServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try    
        {    
			String loc = request.getParameter("button_1");
			System.out.println(loc);
            Class.forName("com.mysql.jdbc.Driver");    
            String url="jdbc:mysql://localhost:3306/parking";    
            String user="root";    
            String password="";    
                
            Connection con=DriverManager.getConnection(url, user, password);    
            PreparedStatement pst1 = con.prepareStatement("SELECT COUNT(location_name) from booking WHERE location_name = ?");
            pst1.setString(1, loc);
            ResultSet rs = pst1.executeQuery();
            PreparedStatement pst2 = con.prepareStatement("SELECT capacity from location WHERE location_name = ?");
            pst2.setString(1, loc);
            
            int count=  0;
            int capacity= 0;
            
            while(rs.next()) {
            	count = Integer.parseInt(rs.getString(1));
            	System.out.println(count);
            }
            
            ResultSet rs2 = pst2.executeQuery();
            
            while(rs2.next()) {
            	capacity = Integer.parseInt(rs2.getString("capacity"));
            	System.out.println(capacity);
            }
      
            if(count < capacity) {
            	response.sendRedirect("checkout.jsp");
            }else {
            	response.sendRedirect("waiting.jsp");
            }
            
        }    
        catch(Exception e)    
        {    
                e.printStackTrace();    
        }                
	}

}