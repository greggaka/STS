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
		<form:form action="/donations/${ donation.id }" method="post" modelAttribute="donation">
			<input type="hidden" name="_method" value="put">
			<form:input type="hidden" path="donor" />
		    <div class="form-group">
		        <form:label path="donationName">Donation Name</form:label>
		        <form:input type="text" path="donationName" class="form-control" />
		        <form:errors path="donationName" class="text-danger" />
		    </div>
		    <div class="form-group">
		        <form:label path="quantity">Quantity</form:label>
		        <form:input type="number" path="quantity" class="form-control" />
		        <form:errors path="quantity" class="text-danger" />
		    </div>
		    <input type="submit" value="Submit" class="btn btn-primary">
		</form:form>
    </body>
</html>