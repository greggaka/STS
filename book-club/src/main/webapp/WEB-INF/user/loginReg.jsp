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
    	<div class="container">
			<h1 class="text-info">Book Club</h1>
			<h2 class="text-info">A place for friends to share thoughts on books</h2>
		</div>
		<div class="container">
    		<div class="row">
    			<div class="col">
    				<h1>Register</h1>	
    				<form:form action="/users/register" method="post" modelAttribute="newUser">
				        <div class="form-group">
				            <form:label path="userName">User Name</form:label>
				            <form:input type="text" path="userName" class="form-control" />
				            <form:errors path="userName" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <form:label path="email">Email</form:label>
				            <form:input type="text" path="email" class="form-control" />
				            <form:errors path="email" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <form:label path="password">Password</form:label>
				            <form:input type="password" path="password" class="form-control" />
				            <form:errors path="password" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <form:label path="confirm">Confirm Password</form:label>
				            <form:input type="password" path="confirm" class="form-control" />
				            <form:errors path="confirm" class="text-danger" />
				        </div>
				        <input type="submit" value="Submit" class="btn btn-primary">
    				</form:form>
    			</div>
    			<div class="col">
    				<h1>Login</h1>	
    				<form:form action="/users/login" method="post" modelAttribute="loginUser">
				        <div class="form-group">
				            <form:label path="email">Email</form:label>
				            <form:input type="text" path="email" class="form-control" />
				            <form:errors path="email" class="text-danger" />
				        </div>
				        <div class="form-group">
				            <form:label path="password">Password</form:label>
				            <form:input type="password" path="password" class="form-control" />
				            <form:errors path="password" class="text-danger" />
				        </div>
				        <input type="submit" value="Submit" class="btn btn-primary">
    				</form:form>
    			</div>
    		</div>
    	</div>
    </body>
</html>