<%@page import="com.JongoConnection.Product"%>
<%@page import="com.JongoConnection.ConnectingJongo"%>
<%@page import="java.sql.*"%>
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
<div style="width: 1580px;">
	<img align="right" src="ecom.jpg" />
</div>
<br>
<br>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	try {
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/loginschema", "root", "1234");
		String s = (String) session.getAttribute("userId");
		System.out.println(s);
		HttpSession session2 = request.getSession(false);
		String query = "Select ProductID, OrderID from orderdetails where Email ='"
				+ s + "';";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			String a = rs.getString(1);
			System.out.println(a);
			Product p = null;
			ConnectingJongo cj = new ConnectingJongo();
			p = cj.jongoConnect(Integer.parseInt(a));
			if (p != null) {
%>
<body>
	<div class="breadcrumb"
		style="width: 1500px; float: left; margin-top: 20px; margin-left: 20px;">
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
							<td><b>OrderID : </b> <%=rs.getInt(2)%></td>
						</tr>
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
						<tr>
							<td>
								<form class="CancelOrder" action="CancelOrder" method="post">
									<input type="hidden" name="OrderID" value="<%=rs.getInt(2)%>">
									<input type="hidden" name="OPID" value="<%=p.getProductID()%>">
									<input type="submit" id="BtnChkout" value="Cancel Order"
										style="float: right;">
								</form>
							</td>
						</tr>
					</tbody>
					<%
						session.setAttribute("opid", p.getProductID());
									} else if (p.getType().equals("Suits")) {
					%>
					<tbody class="table">
						<tr>
						<tr>
							<td><b>OrderID : </b> <%=rs.getInt(2)%></td>
						</tr>
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
						<tr>
							<td>
								<form class="CancelOrder" action="CancelOrder" method="post">
									<input type="hidden" name="OrderID" value="<%=rs.getInt(2)%>">
									<input type="hidden" name="OPID" value="<%=p.getProductID()%>">
									<input type="submit" id="BtnChkout" value="Cancel Order"
										style="float: right;">
								</form>
							</td>
						</tr>
					</tbody>
					<%
						session.setAttribute("opid", p.getProductID());
									} else {
					%>
					<tbody class="table">
						<tr>
						<tr>
							<td><b>OrderID : </b> <%=rs.getInt(2)%></td>
						</tr>
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
						<tr>
							<td>
								<form class="CancelOrder" action="CancelOrder" method="post">
									<input type="hidden" name="OrderID" value="<%=rs.getInt(2)%>">
									<input type="hidden" name="OPID" value="<%=p.getProductID()%>">
									<input type="submit" id="BtnChkout" value="Cancel Order"
										style="float: right;">
								</form>
							</td>
						</tr>
					</tbody>
					<%
						session.setAttribute("opid", p.getProductID());
									}
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</table>
			</div>
		</div>

	</div>
</body>
</html>
