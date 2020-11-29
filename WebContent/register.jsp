<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h2 class="headline2">Create account</h2>
		<form action="ProcessRegistration" method="post">
		<input class="fillin" type="text" placeholder="E-mail" id="email" name="email" required>
		<input class="password" type="password" placeholder="Password" id="password" name="password" required>
		<input class="password" type="password" placeholder="Confirm Password" id="confirm" name="confirm" required>
		<input class="submit" type="submit" name="submit" id="button" value="Create Account">
	</form>

<% String error = (String) (request.getSession().getAttribute("error"));%> 
<% String registered = (String) (request.getSession().getAttribute("registered"));%>

<c:if test= "${not empty error}">
<p style="color:red;">${error}</p>
</c:if>

</div>
</body>
</html>