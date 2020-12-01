<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class = registermenu>
	<div class=registerintro>	
		<img class=icon src="<%=request.getContextPath()%>/images/burger1.svg" >
		<div id="logo">GoodFood App</div>
		<div id="options"></div>
		<div style="clear:both;"></div>		
	</div>

	<div class="registerbox">	
			<div registerform>
				<h2 class="headline2">Create an Account</h2>
				<form class=register action="ProcessRegistration" method="post">
				<input class="fillin" type="text" placeholder="E-mail" id="email" name="email" required>
				<input class="password" type="password" placeholder="Password" id="password" name="password" required>
				<input class="password" type="password" placeholder="Confirm Password" id="confirm" name="confirm" required>
				<input class="submit" type="submit" name="submit" id="button" value="Create an Account">
				</form>
			</div>	
		<% String error = (String) (request.getSession().getAttribute("error"));%> 
		<% String registered = (String) (request.getSession().getAttribute("registered"));%>
		
		<c:if test= "${not empty error}">
		<p style="color:red;">${error}</p>
		</c:if>
 	</div>
</div>
</body>
</html>