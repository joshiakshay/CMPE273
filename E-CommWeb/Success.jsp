<!DOCTYPE HTML>
<%@page import="com.JongoConnection.ConnectingJongo"%>
<%@page import="com.JongoConnection.Product"%>
<%@page import="com.mysql.jdbc.Connection"%>
<html>
<head>
<title>Order Confirmation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<%
	String s = (String) session.getAttribute("ID");
	System.out.println("product id in session: " + s);
	HttpSession session4 = request.getSession(false);
	Product p = null;
	if (session4 != null) {
		ConnectingJongo cj1 = new ConnectingJongo();
		p = cj1.jongoConnect(Integer.parseInt(s));
	} else {
		response.sendRedirect("http://localhost:8080/MyClientServerApplication1/Login.jsp");
	}
	if (p != null) {
%>
<body>
	<%
		if (p.getType().equals("Tablets")) {
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="sign_up">
		<form class="sign" action="MyOrders" method="post">
			<div class="formtitle">Order Details</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product ID" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.get_id()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getName()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Make:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getMake()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Model:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getModel()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Color:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getColor()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Price:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="$<%=p.getPrice()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<!--<div class="section">
				<div class="input-sign details">
					<input type="text" value="Quantity:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=session.getAttribute("quantity")%>" />
				</div>
				<div class="clear"></div>
			</div> -->
		</form>
		<form class="MyOrders" action="MyOrders" method="post" style="float: right;">
				<input type="submit" id="BtnMyOrders" value="My Orders">
		</form>
	</div>
	<%
		} else if (p.getType().equals("Cleats")) {
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="sign_up">
		<form class="sign" action="MyOrders" method="post">
			<div class="formtitle">Order Details</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product ID" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.get_id()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getName()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Brand:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getBrand()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Style:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getStyle()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Color:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getColor()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Price:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="$<%=p.getPrice()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<!--  <div class="section">
				<div class="input-sign details">
					<input type="text" value="Quantity:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=session.getAttribute("quantity")%>" />
				</div>
				<div class="clear"></div>
			</div> -->
		</form>
		<form class="MyOrders" action="MyOrders" method="post" style="float: right;">
				<input type="submit" id="BtnMyOrders" value="My Orders">
		</form>
	</div>
	<%
		} else if (p.getType().equals("Suits")) {
	%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="sign_up">
		<form class="sign" action="MyOrders" method="post">
			<div class="formtitle">Order Details</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product ID" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.get_id()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Product:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getName()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Make:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getBrand()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Model:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getItemCode()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Color:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=p.getColor()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="section">
				<div class="input-sign details">
					<input type="text" value="Price:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="$<%=p.getPrice()%>" />
				</div>
				<div class="clear"></div>
			</div>
			<!--<div class="section">
				<div class="input-sign details">
					<input type="text" value="Quantity:" />
				</div>
				<div class="input-sign details">
					<input type="text" value="<%=session.getAttribute("quantity")%>" />
				</div>
				<div class="clear"></div>
			</div>-->
		</form>
		<form class="MyOrders" action="MyOrders" method="post" style="float: right;">
				<input type="submit" id="BtnMyOrders" value="My Orders">
		</form>
	</div>
	<%
		}
		}
	%>
</body>
</html>