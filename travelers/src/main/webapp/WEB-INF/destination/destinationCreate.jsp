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
		<h1>Add a Destination</h1>
		<form:form action = "/destinations/create" modelAttribute="destination" method="post">
			<form:input type="hidden" value="${user_id}" path="traveler" />
			<div class="form-group">
	            <form:label path="destinationName">Destination Name</form:label>
	            <form:input type="text" path="destinationName" />
	            <form:errors path="destinationName" class="text-danger" />
       		</div>
       		<div class="form-group">
	            <form:label path="wouldRecommend">Would Recommend</form:label>
	            <form:checkbox path="wouldRecommend" value="true" />
       		</div>
       		<input type="submit" value="Submit" class="btn btn-primary">
		</form:form>
    </body>
</html>