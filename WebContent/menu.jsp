<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="com.ztus.Customer" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.ztus.MenuItem" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Menu</title>
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


 <% Customer currentUser = (Customer) (request.getSession().getAttribute("currentSessionCustomer"));%>
 <% ArrayList<MenuItem> list = (ArrayList<MenuItem>) request.getSession().getAttribute("menuItems"); %>  
 <% String name = list.get(0).getName(); %>
<%  pageContext.setAttribute("menu", list); %>

	<div class="mainContainer">
		<div class="row">
			<div class="col-xs-10 col-sm-10 col-lg-10"></div>
			<div class="col-xs-1 col-sm-1 col-lg-1 userName">
				<%=currentUser.getName()%>
			</div>
			<div class="col-xs-1 col-sm-1 col-lg-1">
				<form action="ProcessLogout" method="post">
					<input type="submit" value="Sign Out">
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-lg-2 navBar"></div>
			<div class="col-xs-8 col-sm-8 col-lg-8 menuContainer">
				<c:forEach items="${menu}" var="item">
					<div class="menuItem">

						<img src="<%=request.getContextPath()%>${item.getPath()}"
							alt="${item.getName()}" height=180px width=250px
							class="itemPicture" />

						<div class="itemName">
							<c:out value="${item.getName()}" />
						</div>
						<div class="itemPrice">
							<c:out value="${item.getPrice()}" />
						</div>
					</div>
				</c:forEach>
				<div class="modal-bg">
					<div class="modalWindow">
						<span id="itemName"><h2>Menu Item Name</h2></span>
						<button class="cartButton">Add to cart</button>
						<span class="closeButton">X</span>
					</div>
				</div>
			</div>
			<div class="col-xs-2 col-sm-2 col-lg-2"></div>
		</div>
	</div>
	
<script type="text/javascript" src='<c:url value="/js/app.js"/>'></script>

</body>
</html>