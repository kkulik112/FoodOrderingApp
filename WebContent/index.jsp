<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Ordering Application</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<form action="ProcessLogin" method="post">
<input type="text" placeholder="E-mail" id="email" name="email" required>
<input type="password" placeholder="Password" id="password" name="password" required>
<input type="submit" name="submit" id="button" value="Login">
</form>
<% String exists = (String) (request.getSession().getAttribute("exists"));%> 
<c:if test= "${exists eq 'false'}">
<p style="color:red;">Try again!</p>
</c:if>
<a href="register.jsp">Create account</a>


</body>
</html>