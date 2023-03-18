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
        <title>Add a Name</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1>Add a Name!</h1>    	
    	</div>
    	<form:form action = "/names/new" modelAttribute="name" method="post" class="container">
			<form:input type="hidden" value="${user_id}" path="contributor" />
			<div class="form-group mb-3">
	            <form:label path="bname">New Name: </form:label>
	            <form:input type="text" path="bname" />
	            <br>
	            <form:errors path="bname" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="gender">Typical Gender</form:label>
	            <form:select path="gender" >
	            	<form:option value="Male"/>
	            	<form:option value="Female"/>
	            	<form:option value="Neutral"/>
	            </form:select>
	            <br>
	            <form:errors path="gender" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="origin">Origin: </form:label>
	            <form:input type="text" path="origin" />
	            <br>
	            <form:errors path="origin" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="meaning">Meaning: </form:label>
	            <form:input type="text" path="meaning" />
	            <form:errors path="meaning" class="text-danger" />
       		</div>
       		<a href="/" class="btn btn-secondary">Cancel</a>
       		<input type="submit" value="Submit" class="btn btn-primary">
		</form:form>
    </body>
</html>