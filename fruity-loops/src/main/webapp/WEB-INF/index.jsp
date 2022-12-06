<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

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
		<h1 class="text-center text-danger">Fruit Store</h1>
		<table class="container mx-auto border border-danger border-5">
			<thead>
				<tr>
					<th>Name</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fruit" items="${ fruits }">
				<tr class="border border-danger border-1 ">
					<td><c:out value="${ fruit.name }"/></td>
					<td><c:out value="${ fruit.price }"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>