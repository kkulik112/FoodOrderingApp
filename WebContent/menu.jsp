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
  
  <form action="ProcessLogout" method="post">
  <input type="submit" class="button" id="logout" value="Sign Out">
 </form>

</body>
</html>