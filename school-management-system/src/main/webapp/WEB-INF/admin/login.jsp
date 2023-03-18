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
        <title>Register and Login</title>
    </head>
    <body id='background'>
    	<div class="container border border-dark bg-light mt-5 py-3 w-50">
    		<h1 class="text-center">School Management System</h1>
    		<h2 class="text-center">For Administrators</h2>
   			<div class="col w-50 mx-auto">
   				<h1 class='text-center'>Login</h1>	
   				<form:form action="/admin/login" method="post" modelAttribute="loginAdmin">
			        <div class="form-group mb-3">
			            <form:label path="email"><strong>Email</strong></form:label>
			            <form:input type="text" path="email" class="form-control" />
			            <form:errors path="email" class="text-danger" />
			        </div>
			        <div class="form-group mb-3">
			            <form:label path="password"><strong>Password</strong></form:label>
			            <form:input type="password" path="password" class="form-control" />
			            <form:errors path="password" class="text-danger" />
			        </div>
			        <div class='text-center'>
				        <input type="submit" value="Submit" class="btn btn-primary">
			        </div>
   				</form:form>
   				<div class='text-center'>
   					<a href="/admin/register">Create an account</a>
   				</div>
   			</div>
    	</div>
    </body>
</html>