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
		<table>
			<thead>
				<tr>
					<th> Donation </th>
					<th> Donor </th>
					<th> Quantity </th>
					<th> Action </th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="donation" items="${allDonations }">
					<tr>
						<td><c:out value="${ donation.donationName }" /></td>
						<td><c:out value="${ donation.donor }" /></td>
						<td>${donation.quantity}</td>
						<td>
							<form action="/donations/${donation.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
		<form:form action="/donations/process" method="post" modelAttribute="donation">
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
		    <div class="form-group">
		        <form:label path="donor">Donor</form:label>
		        <form:input type="text" path="donor" class="form-control" />
		        <form:errors path="donor" class="text-danger" />
		    </div>
		    <input type="submit" value="Submit" class="btn btn-primary">
		</form:form>
    </body>
</html>