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
		<h1><c:out value="${loggedInUser.userName }" />'s  Dashboard</h1>
		<a href="/users/logout">Logout</a>
		
		<table class="table">
		    <thead>
		        <tr>
		            <th scope="col">Destination Name</th>
		            <th scope="col">Traveler</th>
		            <th scope="col">Would Recommend</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allDestinations}" var="destination">
		        <tr>
		            <td><a href="/destinations/view/${destination.id }"><c:out value="${destination.destinationName }" /></a></td>
		            <td><c:out value="${destination.traveler.userName }" /></td>
		            <td><c:out value="${destination.wouldRecommend }" /></td>
		            <td>
		            	<a href="/destinations/edit/${destination.id}" class="btn btn-outline-dark btn-light">Edit</a>
		            	<form action="/destinations/delete/${destination.id }" method="post">
		            		<input type="hidden" value="delete" name="_method" />
		            		<input type="submit" value="delete destination" class="btn btn-danger" />
		            	</form>
		            </td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </body>
</html>