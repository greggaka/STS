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
		<h1>User Details</h1>
		<h3>User Name: <c:out value="${user.userName }" /></h3>
		<h3>Email: <c:out value="${user.email }" /></h3>
		<h3>All this users donations</h3>
		<table class="table table-dark">
		    <thead>
		        <tr>
		            <th scope="col">Donation Name</th>
		            <th scope="col">Quantity</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${user.donation}" var="donation">
		        <tr>
		            <td><c:out value="${donation.donationName}" /></td>
		            <td>${donation.quantity }</td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </body>
</html>