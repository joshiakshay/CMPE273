package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.loginSignUpAddress.InventoryManage;

/**
 * Servlet implementation class CheckoutServe
 */
public class CheckoutServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutServe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("reached here");
		InventoryManage im = new InventoryManage();
		int q = Integer.parseInt(request.getParameter("Quantity"));
		String quantity = request.getParameter("Quantity");
		HttpSession session5 = request.getSession(false);
		int s = Integer.parseInt((String)session5.getAttribute("ID"));
		if (im.reduceInventory(s, q) == true) {
			response.sendRedirect("http://localhost:8080/MyClientServerApplication1/Order.jsp");
			session5.setAttribute("qty", quantity);
		} else {
			String msg = "<html><body><script>alert('Requested quantity is not available');window.location = 'ShoppingCart.jsp';</script></<body></html>";
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(msg);
		}
	}
}
