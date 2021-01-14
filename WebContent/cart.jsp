<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ztus.Customer"%>
<%@ page import="com.ztus.Cart"%>
<%@ page import="com.ztus.MenuItem"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="css/cart.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<%
		Customer currentUser = (Customer) (request.getSession().getAttribute("currentSessionCustomer"));
	%>
	<%
		Cart cart = (Cart) currentUser.getCart();
	%>
	<%
		ArrayList<MenuItem> list = (ArrayList<MenuItem>) cart.getContent();
	%>
	<%
		pageContext.setAttribute("list", list);
	%>


	<div id="container">
		<div id="header">
			<p id="header-text">My Cart</p>
		</div>
		<div id="items-list">
		<hr>
			<c:forEach items="${list}" var="item">
				<div class="cart-item" id="${item.getName()}">
				<p class="item-name">
					<c:out value="${item.getName()}" />
				</p>
				<p class="item-price">
					<c:out value="${item.getPrice()}" />
				</p>

				</div>
			</c:forEach>
			<c:choose>
			<c:when test="${list.size() != '0'}">
			<hr id="bottom-hr">
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</div>

		<div id="footer">
			<div id="navigation">
				<button id="back-btn" class="cart-button">Back</button>
				<c:choose>
				<c:when test="${list.size() != '0' }">
				<button id="pay-btn" class="cart-button">Pay</button>
				</c:when>
				<c:otherwise>
				<button id="pay-btn" class="cart-button" disabled>Pay</button>
				</c:otherwise>
				</c:choose>
				
			</div>
			<p id="total-price"><%=cart.getTotal()%></p>
		</div>

	</div>
	
	
	<script type="text/javascript" src="js/cart.js"></script>


</body>
</html>