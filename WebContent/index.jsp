<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
<meta charset="UTF-8">
<title>Food Ordering Application</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

	<div id="menu">
	
	<div id="logo">Food Ordering App</div>
	<div id="options"></div>
	<div style="clear:both;"></div>	
	
	</div>

	<div class="form">
		<h2 class="headline2">Log in!</h2>
			
	<form action="ProcessLogin" method="post">
		<input class="fillin" type="text" placeholder="E-mail" id="email" name="email" required>
		<input class="fillin" type="password" placeholder="Password" id="password" name="password" required>
		<input class="submit" type="submit" name="submit" id="button" value="Login">
	</form>
	
	
		<% String exists = (String) (request.getSession().getAttribute("exists"));%> 
		<c:if test= "${exists eq 'false'}">
		<p style="color:red;">Try again!</p>
		</c:if>
    		<p class="register_button" align="center"><a href="register.jsp">Create account</a></p>

	</div>
</body>
</html>