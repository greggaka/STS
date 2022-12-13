<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
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
		<h1>Create a New User</h1>
		<form:form action="/users/new" method="post" modelAttribute="user">
			<div>
				<form:label path="userName">User Name</form:label>
				<form:input path="userName" type="text" />
				<form:errors path="userName" class="text-danger"/>
			</div>
			<div>
				<form:label path="email">Email</form:label>
				<form:input path="email" type="text" />
				<form:errors path="email" class="text-danger"/>
			</div>
			<input type="submit" value="Create User" class="btn btn-primary"/>
		</form:form>
    </body>
</html>