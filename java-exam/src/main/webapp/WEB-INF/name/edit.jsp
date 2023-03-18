<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/css/style.css"/>
        <script src="/webjars/jquery/jquery.min.js"></script>
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <title>Edit Name</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1>Change <c:out value="${name.bname }"/></h1>    	
    	</div>
    	<form:form action = "/names/edit/${name.id}" modelAttribute="name" method="post" class="container">
    		<input type="hidden" name="_method" value="put" />
			<form:input type="hidden" path="contributor" />
			<div class="form-group mb-3">
	            <form:label path="bname">New Name: </form:label>
	            <form:input type="text" path="bname" />
	            <br>
	            <form:errors path="bname" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="gender">Typical Gender</form:label>
	            <form:select path="gender" >
	            	<form:option value="Male"/>
	            	<form:option value="Female"/>
	            	<form:option value="Neutral"/>
	            </form:select>
	            <br>
	            <form:errors path="gender" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="origin">Origin: </form:label>
	            <form:input type="text" path="origin" />
	            <br>
	            <form:errors path="origin" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="meaning">Meaning: </form:label>
	            <form:input type="text" path="meaning" />
	            <form:errors path="meaning" class="text-danger" />
       		</div>
       		<div class="mb-4"> 	
	       		<a href="/" class="btn btn-secondary">Cancel</a>
	       		<input type="submit" value="Submit" class="btn btn-primary">       		
       		</div>
			</form:form>
			<div class="container">
	       		<form action="/names/delete/${name.id }" method="post">
					    <input type="hidden" value="delete" name="_method" />
					    <input type="submit" value="Delete" class="btn btn-danger me-5" />
				</form> 			
			</div>
    </body>
</html>