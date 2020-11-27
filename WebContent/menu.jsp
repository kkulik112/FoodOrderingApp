<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="com.ztus.Customer" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.ztus.MenuItem" %>
<!DOCTYPE html>
<html>
<head>
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

  Welcome <%= currentUser.getEmail() %> 

  <ul>
  <c:forEach items="${menu}" var="item">
  <li><c:out value="${item.toString()}"/></li>
  </c:forEach>
  </ul>
  <form action="ProcessLogout" method="post">
  <input type="submit" class="button" id="logout" value="Sign Out">
 </form>

</body>
</html>