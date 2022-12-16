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
			<h1>New Ninja</h1>
		    <form:form action="/ninjas/new" method="post" modelAttribute="ninja">
		        <div class="form-group">
		            <form:label path="dojo">Dojo</form:label>
		            <form:select path="dojo">
		            	<c:forEach var="dojo" items="${allDojos}">
						<form:option value="${dojo.id}">
							<c:out value="${dojo.name}"/>
						</form:option>
					</c:forEach>
		            </form:select>
		        </div>
		        <div class="form-group">
		            <form:label path="firstName">First Name</form:label>
		            <form:input type="text" path="firstName" class="form-control" />
		        </div>
		        <div class="form-group">
		            <form:label path="lastName">Last Name</form:label>
		            <form:input type="text" path="lastName" class="form-control" />
		        </div>
		        <div class="form-group">
		            <form:label path="age">Age</form:label>
		            <form:input type="number" path="age" class="form-control" />
		        </div>
		        <input type="submit" value="Create" class="btn btn-primary">
		    </form:form>
		</div>
    </body>
</html>