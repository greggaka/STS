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
    	<div class="text-center">    	
			<h1>Dashboard</h1>
			<a href="/dojos/new">Create Dojo</a>
			<a href="/ninjas/new">Create Ninja</a>
			
			<h1>All Dojos</h1>
	    	<c:forEach items="${allDojos}" var="dojo">
	            <a href="/dojos/${dojo.id}"> <c:out value="${dojo.name}" /></a>
	            <br>
	        </c:forEach>
	    </div>
        
        <div class="container">
        <table class="table">
		    <thead>
		        <tr>
		            <th scope="col">First Name</th>
		            <th scope="col">Last Name</th>
		            <th scope="col">Age</th>
		            <th scope="col">Dojo</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allNinjas}" var="ninja">
		        <tr>
		            <td><c:out value="${ninja.firstName}" /></td>
		            <td><c:out value="${ninja.lastName}" /></td>
		            <td><c:out value="${ninja.age}" /></td>
		            <td><c:out value="${ninja.dojo.name}" /></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
        </div>
    </body>
</html>
		
</body>
</html>