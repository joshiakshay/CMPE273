package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.loginSignUpAddress.LoginValidate;

/**
 * Servlet implementation class LoginCheck
 */
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		HttpSession session=request.getSession();
		session.setAttribute("userId", email);
		LoginValidate val = new LoginValidate();
		val.validate(email,pass);
		if(val.authorized == true){
			System.out.println("--------------productid in logincheck: "+request.getParameter("ID"));
			request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
			session.setAttribute("id",session.getId());
			//response.sendRedirect("http://localhost:8080/MyClientServerApplication1/ShoppingCart.jsp");
		}
		else
		{
			String msg = "<html><body><script>alert('Wrong ID or Password');window.location = 'login.jsp';</script></<body></html>";
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(msg);
		}
	}

}
