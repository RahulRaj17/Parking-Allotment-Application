package parking.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import parking.mail.*;
import parking.model.Login;
import parking.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao = new LoginDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.print(username);
        System.out.println(password);
        Login loginBean = new Login();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
        	if ((username.equals("parkingdoneeasy@gmail.com"))&& (password.equals("test"))){
        		RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            	rd.forward(request, response);
        	}
        else if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
                session.setAttribute("username",username);
                int otpvalue=0;
                Random rand=new Random();
                otpvalue=rand.nextInt(9999);
                if (otpvalue<1000) {
                	otpvalue+=1000;
                }
                if (Sendotp.sendmail(username, otpvalue)) {
                	session.setAttribute("otpvalue", otpvalue);
                	session.setAttribute("attempt",1);
                	RequestDispatcher rd = request.getRequestDispatcher("otp.jsp");
                	rd.forward(request, response);
                }
                else {
                	session.removeAttribute("username");
                	session.invalidate();
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            	rd.forward(request, response);}
                //response.sendRedirect("booking.jsp");
            } else {
            	response.sendRedirect("error.jsp?err=Email and Password are incorrect");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}






