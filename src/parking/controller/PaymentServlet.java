package parking.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
/**
 * Servlet implementation class PaymentServlet
 */
@SuppressWarnings("unused")
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        PrintWriter pw;    
        response.setContentType("text/html");    
        pw=response.getWriter();  
		
		String amount = request.getParameter("amount");
		String txnid = request.getParameter("txnid");
		String phone = request.getParameter("phone");
		String firstname = request.getParameter("firstname");
		String key = "JBZaLc";
		String salt = "GQs7yium";
		String email = request.getParameter("email");
		String udf1 =request.getParameter("udf1");
		String udf3 =request.getParameter("udf3");
		String udf4 =request.getParameter("udf4");
		String udf5 =request.getParameter("udf5");
		//System.out.println("Your payment with Payment ID is :" + txnid + "is ");
		
		 try    
	        {    
	            Class.forName("com.mysql.jdbc.Driver");    
	            String url="jdbc:mysql://localhost:3306/parking";    
	            String user="root";    
	            String password="";    
	                
	            Connection con=DriverManager.getConnection(url, user, password);    
	            String query="Insert into booking(name,phone,location_name,in_time,out_time,txnid,email,vehicle_number) values (?,?,?,?,?,?,?,?);";    
	            PreparedStatement pstmt=con.prepareStatement(query);    
	            pstmt.setString(1, firstname);    
	            pstmt.setString(2, phone);    
	            pstmt.setString(3,udf1);    
	            pstmt.setString(4, udf3);    
	            pstmt.setString(5, udf4);  
	            pstmt.setString(6, txnid);
	            pstmt.setNString(7, email);
	            pstmt.setString(8, udf5);
	           
	            int x=pstmt.executeUpdate();    
	                
	            if(x==1)    
	            {    
	            	 response.sendRedirect("payment.jsp");
	            }    
	                
	        }    
	        catch(Exception e)    
	        {    
	                e.printStackTrace();    
	        }    
	            
	            
	        pw.close();    
	    }    
		
}

