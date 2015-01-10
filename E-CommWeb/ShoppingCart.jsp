<%@page import="com.JongoConnection.Product"%>
<%@page import="com.JongoConnection.ConnectingJongo"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="http://localhost:3000/stylesheets/bootstrap.min.css">
<link rel="stylesheet"
	href="http://localhost:3000/stylesheets/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://localhost:3000/stylesheets/login.css">
</head>
<%
	Date date = new Date();
	String s = (String) session.getAttribute("ID");
	System.out.println("product id in session: " + s);
	HttpSession session2 = request.getSession(false);
	Product p = null;
	if (session2 != null) {
		ConnectingJongo cj = new ConnectingJongo();
		p = cj.jongoConnect(Integer.parseInt(s));
	} else {
		response.sendRedirect("http://localhost:8080/MyClientServerApplication1/Login.jsp");
	}
	if (p != null) {

		long timestamp = ((date).getTime() / 1000);
		System.out.println(timestamp);
		System.out.println(p.getStartDate());
		System.out.println(p.getEndDate());
%>
<body>
	<%
		if (p.getStartDate() < timestamp && timestamp < p.getEndDate()) {

				System.out.println("Hello");
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	<br>
	<br>
	<div class="breadcrumb" class="breadcrumb"
		style="width: 170px; float: left; margin-top: 20px; margin-left: 5px;">
		<div class="row">
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<table cellspacing="10">
						<tbody class="table">
							<tr>
								<td><img src="grey-blue-cart1.png" alt="image" /></td>
							</tr>
						</tbody>
					</table>
				</ul>
			</div>
		</div>
	</div>
	<div class="breadcrumb"
		style="width: 1300px; float: left; margin-top: 20px; margin-left: 20px;">
		<div class="row">

			<div class="col-md-2">
				<img src=<%="http://localhost:3000" + p.getImage()%> alt="image"
					height="200" width="200" />
			</div>
			<div class="col-md-8">
				<table>
					<%
						if (p.getType().equals("Tablets")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Make : </b> <%=p.getMake()%></td>
						</tr>
						<tr>
							<td><b>Model : </b> <%=p.getModel()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else if (p.getType().equals("Suits")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Item Code : </b> <%=p.getItemCode()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b><%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Style : </b> <%=p.getStyle()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form class="Checkout" action="CheckoutServe" method="post">
					<label for="qty">Quantity</label> <input id="qty" type="text"
						name="Quantity" required> <input type="submit"
						id="BtnChkout" value="Proceed to Checkout" style="float: right;">
				</form>
			</div>
		</div>
	</div>




	<%
		} else if (p.getStartDate() < timestamp && p.getEndDate() == 0) {

				System.out.println("Hello");
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	<br>
	<br>
	<div class="breadcrumb" class="breadcrumb"
		style="width: 170px; float: left; margin-top: 20px; margin-left: 5px;">
		<div class="row">
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<table cellspacing="10">
						<tbody class="table">
							<tr>
								<td><img src="grey-blue-cart1.png" alt="image" /></td>
							</tr>
						</tbody>
					</table>
				</ul>
			</div>
		</div>
	</div>
	<div class="breadcrumb"
		style="width: 1300px; float: left; margin-top: 20px; margin-left: 20px;">
		<div class="row">

			<div class="col-md-2">
				<img src=<%="http://localhost:3000" + p.getImage()%> alt="image"
					height="200" width="200" />
			</div>
			<div class="col-md-8">
				<table>
					<%
						if (p.getType().equals("Tablets")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Make : </b> <%=p.getMake()%></td>
						</tr>
						<tr>
							<td><b>Model : </b> <%=p.getModel()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else if (p.getType().equals("Suits")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Item Code : </b> <%=p.getItemCode()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b><%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Style : </b> <%=p.getStyle()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form class="Checkout" action="CheckoutServe" method="post">
					<label for="qty">Quantity</label> <input id="qty" type="text"
						name="Quantity" required> <input type="submit"
						id="BtnChkout" value="Proceed to Checkout" style="float: right;">
				</form>
			</div>
		</div>
	</div>
	<%
		} else {
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	<br>
	<br>
	<div class="breadcrumb" class="breadcrumb"
		style="width: 170px; float: left; margin-top: 20px; margin-left: 5px;">
		<div class="row">
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<table cellspacing="10">
						<tbody class="table">
							<tr>
								<td><img src="grey-blue-cart1.png" alt="image" /></td>
							</tr>
						</tbody>
					</table>
				</ul>
			</div>
		</div>
	</div>
	<div class="breadcrumb"
		style="width: 1300px; float: left; margin-top: 20px; margin-left: 20px;">
		<div class="row">

			<div class="col-md-2">
				<img src=<%="http://localhost:3000" + p.getImage()%> alt="image"
					height="200" width="200" />
			</div>
			<div class="col-md-8">
				<table>
					<%
						if (p.getType().equals("Tablets")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Make : </b> <%=p.getMake()%></td>
						</tr>
						<tr>
							<td><b>Model : </b> <%=p.getModel()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else if (p.getType().equals("Suits")) {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b> <%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Item Code : </b> <%=p.getItemCode()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>
					<%
						} else {
					%>
					<tbody class="table">
						<tr>
							<td><b>Name : </b><%=p.getName()%></td>
						</tr>
						<tr>
							<td><b>Brand : </b> <%=p.getBrand()%></td>
						</tr>
						<tr>
							<td><b>Style : </b> <%=p.getStyle()%></td>
						</tr>
						<tr>
							<td><b>Color : </b> <%=p.getColor()%></td>
						</tr>
						<tr>
							<td><b>Description : </b> <%=p.getDescription()%></td>
						</tr>
						<tr>
							<td><b>Price : </b> $<%=p.getPrice()%></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
					</tbody>

				</table>
				<img src="RenderedImage.png" alt="image" height="200" width="200" />

			</div>
		</div>

	</div>
	<%
		}
			}
		}
	%>


</body>


</html>
