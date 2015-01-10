<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<%
System.out.println("---------------------sesssion in login.jsp : "+session.isNew());
String productId = null;
if(session.getAttribute("userId")!=null)
{
	productId = request.getParameter("ID");
	
	session.setAttribute("ID", productId);
	response.sendRedirect("http://localhost:8080/MyClientServerApplication1/ShoppingCart.jsp");
	//request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
}
else
{
	
		productId = request.getParameter("ID");
		System.out.println("kkkhkhkhkhhhk"+productId);
		session.setAttribute("ID", productId);
	
}

%>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	</br>
	</br>
	<div class="member-login">
		<form class="login" action="LoginCheck" method="post">
			<div class="formtitle">Member Login</div>
			<div class="input">
				<input type="text" placeholder="Email ID" name="email" required />
				<input type ="hidden" name ="ID" value =<%=productId %>>
			</div>
			<div class="input">
				<input type="password" placeholder="Password" name="password"
					required />
			</div>
			<div class="buttons">
				<input class="bluebutton" type="submit" value="Login" />
				<div class="clear"></div>
			</div>
			<div class="link">
				<p>Not a Member</p>
				<a href="Register.jsp"> Register </a>
			</div>
		</form>
	</div>
</body>
</html>