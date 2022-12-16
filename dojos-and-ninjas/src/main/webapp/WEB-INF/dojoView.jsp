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
			<h1><c:out value="${dojo.name}"/> Dojo Ninjas</h1>
			<table class="table table-dark">
		    <thead>
		        <tr>
		            <th scope="col">First Name</th>
		            <th scope="col">Last Name</th>
		            <th scope="col">Age</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${dojo.ninja}" var="ninja">
		        <tr>
		            <td><c:out value="${ninja.firstName}" /></td>
		            <td><c:out value="${ninja.lastName}" /></td>
		            <td><c:out value="${ninja.age}" /></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		</div>
	</body>
	</html>