<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registration Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div style="width: 1580px;">
		<img align="right" src="ecom.jpg" />
	</div>
	</br>
	</br>
	<div class="member-login">
		<form class="login" action="RegisterUser" method="post">
			<div class="formtitle">Sign Up</div>
			<div class="input">
				<input type="text" placeholder="Name" name="name" required />
			</div>
			<div class="input">
				<input type="text" placeholder="User Name" name="username" required />
			</div>
			<div class="input-sign email">
				<input type="email" placeholder="Email" name="email" required />
			</div>
			<div class="input">
				<input type="password" placeholder="Password" name="password"
					required />
			</div>
			<div class="input">
				<input type="password" placeholder="Repeat Password"
					name="repeatpassword" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Re-confirm email';}"
					required />
			</div>
			<div class="clear"></div>
			<div class="submit">
				<input class="bluebutton submitbotton" type="submit" value="Sign up" />
			</div>
		</form>
	</div>
</body>
</html>