<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

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
		<h1>Edit Destination</h1>
		<form:form action = "/destinations/edit/${destination.id }" modelAttribute="destination" method="post">
			<input type="hidden" name="_method" value="put" />
			<form:input type="hidden" path="traveler" />
			<div class="form-group">
	            <form:label path="destinationName">Destination Name</form:label>
	            <form:input type="text" path="destinationName" />
	            <br>
	            <form:errors path="destinationName" class="text-danger" />
       		</div>
       		<div class="form-group">
	            <form:label path="wouldRecommend">Would Recommend</form:label>
	            <form:checkbox path="wouldRecommend" value="true" />
       		</div>
       		<input type="submit" value="Edit" class="btn btn-primary">
		</form:form>
    </body>
</html>