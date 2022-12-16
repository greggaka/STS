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
			<h1>New Dojo</h1>
		    <form:form action="/dojos/new" method="post" modelAttribute="dojo">
		        <div class="form-group">
		            <form:label path="name">Name: </form:label>
		            <form:input type="text" path="name" class="form-control" />
		            <form:errors path="name" class="text-danger" />
		        </div>
		        <input type="submit" value="Create" class="btn btn-primary">
		    </form:form>
    	</div>
    </body>
</html>