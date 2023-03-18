<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional //EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/css/style.css"/>
        <script src="/webjars/jquery/jquery.min.js"></script>
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
		<h1>Register</h1>
		
		<p><form:errors path="user.*"/></p>
		
		<form:form method="POST" action="/registration" modelAttribute="user">
		
			<p>
				<form:label path="username">Username: </form:label>
				<form:input path="username"/>
			</p>
			<p>
				<form:label path="email">Email: </form:label>
				<form:input path="email"/>
			</p>
			<p>
				<form:label path="password">Password: </form:label>
				<form:input path="password"/>
			</p>
			<p>
				<form:label path="confirmPassword">Confirm Password: </form:label>
				<form:input path="confirmPassword"/>
			</p>
			<input type="submit" value="Register"/>
		</form:form>
    </body>
</html>