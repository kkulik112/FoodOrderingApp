<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<h3>Create account</h3>
<form action="ProcessRegistration" method="post">
<input type="text" placeholder="E-mail" id="email" name="email" required>
<input type="password" placeholder="Password" id="password" name="password" required>
<input type="submit" name="submit" id="button" value="Create Account">
</form>
<% String error = (String) (request.getSession().getAttribute("error"));%> 
<% String registered = (String) (request.getSession().getAttribute("registered"));%>
<c:if test= "${registered eq 'false'}">
<p style="color:red;">This user already exists!</p>
</c:if>
</body>
</html>