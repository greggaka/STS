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
        <title>Dashboard</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h2 class="text-success">Hello, <c:out value="${loggedInUser.userName }" />. Here are some name suggestions...</h2>
			<a href="/users/logout" class="mt-auto">Logout</a>    	
    	</div>
    	
    	<table class="table container">
		    <thead>
		        <tr>
		            <th scope="col">Baby Name</th>
		            <th scope="col">Gender</th>
		            <th scope="col">Origin</th>
		            <th scope="col">Contributed by</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allNames}" var="name">
		        <tr>
		            <td><a href="/names/${name.id }"><c:out value="${name.bname }" /></a></td>
		            <td><c:out value="${name.gender }" /></td>
		            <td><c:out value="${name.origin }" /></td>
		            <td><c:out value="${name.contributor.userName }" /></td>  	
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		<div class="container d-flex justify-content-between">
    		<a href="/names/new" class="btn btn-success">+ New Name</a>
    	</div>
		
	</body>
</html>