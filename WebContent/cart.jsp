<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="com.ztus.Customer" %>
     <%@ page import ="com.ztus.Cart" %>
     <%@ page import ="com.ztus.MenuItem" %>
     <%@page import="java.util.ArrayList" %>
     
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


 <% Customer currentUser = (Customer) (request.getSession().getAttribute("currentSessionCustomer"));%>
 <% Cart cart = (Cart) currentUser.getCart(); %>
 <% ArrayList<MenuItem> list = (ArrayList<MenuItem>) cart.getContent(); %>
 <% pageContext.setAttribute("list", list); %>
 
 <div class="totalPrice">
 <h2>Total: <%=cart.getTotal() %></h2>
 </div>
 
 <c:forEach items="${list}" var="item">
					<div class="menuItem" id="${item.getName()}">
						<div class="itemContainer">
						<img src="<%=request.getContextPath()%>${item.getPath()}"
							alt="${item.getName()}" height=180px width=250px
							class="itemPicture" />
						</div>
						<div class="itemName">
							<c:out value="${item.getName()}" />
						</div>
						<div class="itemPrice">
							<c:out value="${item.getPrice()}" />
						</div>
					</div>
				</c:forEach>
				
<script type="text/javascript" src='<c:url value="/js/cart.js"/>'></script>

</body>
</html>