<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
<meta charset="UTF-8">
<title>Food Ordering Application</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<div class = "cover">
	<div class = "picture">
		<img src="<%=request.getContextPath()%>/images/cover2.jpg" height = "900vh">
	</div>
	<div class="loginmenu">
		<div class = "loginintro">
			<img class=icon src="<%=request.getContextPath()%>/images/burger1.svg" >
			<div id="logo">GoodFood App</div>
			<div id="title">Hungry? Time to order!</div>
			<div id="options"></div>
			<div style="clear:both;"></div>	
		</div>
		<div class = "loginbox">
			<div class="loginform">
				<h2 class="headline2">Log in to order</h2>
				
				<form class ="login" action="ProcessLogin" method="post">
				<input class="fillin" type="text" placeholder="E-mail" id="email" name="email" required>
				<input class="fillin" type="password" placeholder="Password" id="password" name="password" required>
				<input class="submit" type="submit" name="submit" id="button" value="Login">
				</form>
			</div> 		
			<h2 class="headline2">Don't have an Account?</h2>
			<% String exists = (String) (request.getSession().getAttribute("exists"));%> 
			<c:if test= "${exists eq 'false'}">
			<p style="color:red;">Try again!</p>
			</c:if>
	    		<p class="register_button" align="center"><a id="link" href="register.jsp">Create an account</a></p>
	    	
	    	<h3 class="headline3">Skip this step</h3>
		</div>
	</div>
	</div>
</body>
</html>