<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<body>


	<form method="POST" action="${pageContext.request.contextPath}/login"> 
	
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Welcome <span></span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">UserName</label>
			<br/>
			<input type="text" id="username"name="userName" value="${user.userName}" required pattern=.*\S.*>
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password" value="${user.password}" required pattern=.*\S.* >
			<br/>
			<button type="submit">Sign In</button>
			<br/>
			<p style="color: red;">${errorString}</p>
			<a href="#"><p class="small">Forgot your password?</p></a>
			
		</div>
	</div>
	</form>
	
</body>
</html>