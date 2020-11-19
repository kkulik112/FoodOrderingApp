<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="com.ztus.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
</head>
<body>

 <% Customer currentUser = (Customer) (request.getSession().getAttribute("currentSessionCustomer"));%>
			
  Welcome <%= currentUser.getEmail() %> 
 

</body>
</html>