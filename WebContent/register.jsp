<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css">
<meta charset="UTF-8">
<title>GoodFood App</title>
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
				<input class="fillin" type="text" placeholder="Name" id="name" name="name" required>
				<input class="fillin" type="text" placeholder="Last name" id="lastname" name="lastname" required>
				<input class="fillin" type="text" placeholder="Phone number" id="phonenumber" name="phonenumber" required>
				<select style="padding: .65rem; margin-bottom: 1.25rem; border-radius: 15px;" id="province" name="province">
					<option value="none">Choose your province</option>
					<option value="Dolnośląskie">Dolnośląskie</option>
					<option value="Kujawsko-Pomorskie">Kujawsko-Pomorskie</option>
					<option value="Lubelskie">Lubelskie</option>
					<option value="Lubuskie">Lubuskie</option>
					<option value="Łódzkie">Łódzkie</option>
					<option value="Małopolskie">Małopolskie</option>
					<option value="Mazowieckie">Mazowieckie</option>
					<option value="Opolskie">Opolskie</option>
					<option value="Podkarpackie">Podkarpackie</option>
					<option value="Podlaskie">Podlaskie</option>
					<option value="Pomorskie">Pomorskie</option>
					<option value="Śląskie">Śląskie</option>
					<option value="Świętokrzyskie">Świętokrzyskie</option>
					<option value="Warmińsko-Mazurskie">Warmińsko-Mazurskie</option>
					<option value="Wielkopolskie">Wielkopolskie</option>
					<option value="Zachodniopomorskie">Zachodniopomorskie</option>
				</select>
				<input class="fillin" type="text" placeholder="Country" id="country" name="country" required>
				<input class="fillin" type="text" placeholder="City" id="city" name="city" required>
				<input class="fillin" type="text" placeholder="Zip Code" id="zipcode" name="zipcode" required>
				<div style="padding-bottom: 1rem;">
					<input style="cursor: pointer;" class="submit" type="submit" name="submit" id="button" value="Create an Account">
					<div class="backToLogin" align="center"><a style="text-decoration: none;" href="index.jsp">Back to login</a></div>
				</div>
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