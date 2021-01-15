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
					
				<form method="post" action="https://secure.payu.com/api/v2_1/orders">
    			<input type="hidden" name="continueUrl" value="http://shop.url/continue">
    			<input type="hidden" name="currencyCode" value="PLN">
    			<input type="hidden" name="customerIp" value="123.123.123.123">
    			<input type="hidden" name="description" value="Order description">
    			<input type="hidden" name="merchantPosId" value="145227">
    			<input type="hidden" name="notifyUrl" value="http://shop.url/notify">
    			<input type="hidden" name="products[0].name" value="Product 1">
    			<input type="hidden" name="products[0].quantity" value="1">
    			<input type="hidden" name="products[0].unitPrice" value="1000">
    			<input type="hidden" name="totalAmount" value="1000">
    			<input type="hidden" name="OpenPayu-Signature" value="sender=145227;algorithm=SHA-256;signature=bc94a8026d6032b5e216be112a5fb7544e66e23e68d44b4283ff495bdb3983a8">
    			<c:choose>
				<c:when test="${list.size() != '0' }">
    			<button id="pay-btn" class="cart-button" type="submit" formtarget="_blank">Proceed</button>	
				</c:when>
				<c:otherwise>
				<button id="pay-btn" class="cart-button" type="submit" formtarget="_blank" disabled>Proceed</button>
				</c:otherwise>
				</c:choose>
				</form >		
			</div>
			<p id="total-price"><%=cart.getTotal()%></p>
		</div>

	</div>
	
	<script type="text/javascript" src="js/cart.js"></script>

</body>
</html>