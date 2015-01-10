package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.loginSignUpAddress.OrderDetails;

//import com.loginSignUpAddress.OrderDetails;

/**
 * Servlet implementation class OrderAddressDetails
 */
public class OrderAddressDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAddressDetails() {
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
		HttpSession session3 = request.getSession(false);
		int s = Integer.parseInt((String)session3.getAttribute("ID"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String reenteremail = request.getParameter("reenteremail");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = address1 + ", " + address2;
		String country = request.getParameter("country");
		OrderDetails od = new OrderDetails();
		od.shipmentDetails(s,fname,lname,email,reenteremail,city,province,address,country);
		if(od.confirmed == true){
			response.sendRedirect("Success.jsp");
		}
	}

}
