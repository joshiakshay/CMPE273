package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.loginSignUpAddress.CancellingOrder;
import com.loginSignUpAddress.InventoryManage;

/**
 * Servlet implementation class CancelOrder
 */
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelOrder() {
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
		InventoryManage im = new InventoryManage();
		CancellingOrder co = new CancellingOrder();
		int o = Integer.parseInt(request.getParameter("OrderID"));
		if(co.orderCancel(o)==true){
			int opid = Integer.parseInt(request.getParameter("OPID"));
			im.increaseInventory(opid);
			response.sendRedirect("http://localhost:3000/#/store/");
		}
		else
		{
			String msg = "<html><body><script>alert('Order is already processed');window.location = 'login.jsp';</script></<body></html>";
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(msg);
		}
	}

}
