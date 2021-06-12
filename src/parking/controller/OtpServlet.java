package parking.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String password = request.getParameter("password");
		int inputotp=Integer.parseInt(password);
		int otp=(int)session.getAttribute("otpvalue");
		int attempts=(int)session.getAttribute("attempt");
		PrintWriter out=response.getWriter();
		if (attempts<=3) {
			if (inputotp==otp) {
				session.removeAttribute("otpvalue");
				session.removeAttribute("attempt");
				RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
            	rd.forward(request, response);
			}
			else {
				attempts=attempts+1;
				session.setAttribute("attempt", attempts);
				out.println("<script type=\"text/javascript\">");
	            out.println("alert('OTP Incorrect ! Enter again');");
	            out.println("</script>");
	            RequestDispatcher rd=request.getRequestDispatcher("otp.jsp");  
	            rd.include(request,response);  
			}
		}
		else
		{
			session.removeAttribute("username");
			session.removeAttribute("otpvalue");
			session.removeAttribute("attempt");
			session.invalidate();
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Max attempts reached ! Login again');");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.include(request,response);  
			
		}
	}	

}
