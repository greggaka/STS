<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h1>Dashboard</h1>
		<a href="/users/new">Create User</a>
		<a href="/donations/new">Create Donation</a>
		
		<table class="table table-dark">
		    <thead>
		        <tr>
		            <th scope="col">Donation Name</th>
		            <th scope="col">Quantity</th>
		            <th scope="col">Donor</th>
		            <th scope="col">Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allDonations}" var="donation">
		        <tr>
		            <td><c:out value="${donation.donationName}" /></td>
		            <td>${donation.quantity }</td>
		            <td><c:out value="${donation.donor.userName}" /></td>
		            <td>
		            	<a href="/donations/edit/${donation.id}" class="btn btn-outline-warning btn-success">Edit</a>
		            </td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		<h1>All Users</h1>
		<table class="table table-dark">
		    <thead>
		        <tr>
		            <th scope="col">userName</th>
		            <th scope="col">Email</th>
		            <th scope="col">How many donations</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allUsers}" var="user">
		        <tr>
		            <td><a href="/users/view/${user.id}"> <c:out value="${user.userName}" /></a></td>
		            <td><c:out value="${user.email }"/></td>
		            <td><c:out value="${user.donation.size()}" /></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </body>
</html>