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
        <title>Add a New School</title>
    </head>
    <body id='background'>
    	<div class='container'>
	    	<div class="d-flex justify-content-between py-4 px-4 mb-4 rounded">
	    		<div>
			    	<h2>Alpha District School Management System</h2>
			    	<a href="/" class="btn btn-primary">Back to Dashboard</a>
	    		</div>
	    		<div class="text-center">
					<h5><c:out value="${loggedInAdmin.name }" /></h5>    		
					<a href="/admin/logout" class="mt-auto btn btn-light border border-dark rounded">Logout</a>    	    		
	    		</div>
	    	</div>
	    	<div class='bg-light border border-dark rounded w-50 mx-auto' >
		    	<div class="text-center my-3">
					<h2>Add a New School</h2>
		    	</div>
				
				<form:form action = "/schools/new" modelAttribute="school" method="post" class="container">
					<div class="form-group">
			            <form:label path="name"><strong>School Name: </strong></form:label>
			            <form:input type="text" path="name" class='form-control'/>
			            <br>
			            <form:errors path="name" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="type"><strong>School Type: </strong></form:label>
			            <form:select path="type" class='form-control'>
			            	<form:option value="Elementary School"/>
			            	<form:option value="Middle School"/>
			            	<form:option value="High School"/>
			            	<form:option value="K-12 Academy"/>
			            	<form:option value="College"/>
			            	<form:option value="BootCamp"/>
			            </form:select>
			            <br>
			            <form:errors path="type" class="text-danger" />
		       		</div>
		       		<div class='text-center mb-3'>
			       		<input type="submit" value="Submit" class="btn btn-success">
		       		</div>
				</form:form>
	    	</div>
	    	<div class='bg-light mt-5 border border-dark rounded w-75 mx-auto mb-5'>
	    		<h3 class='text-center my-3'>Schools Currently in the System</h3>
	    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">School Name</th>
					            <th scope="col">Type</th>
					            <th scope="col">Action</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${allSchools}" var="school">
					        <tr>
					            <td>
					            	<a href="${school.id}" class="text-decoration-none link-dark"><c:out value="${school.id }" /></a>
					            </td>		
					            <td>
					            	<a href="${school.id}" class="text-decoration-none link-dark"><c:out value="${school.name }" /></a>
					            </td>
					            <td>
					            	<a href="${school.id}" class="text-decoration-none link-dark"><c:out value="${school.type }" /></a>
					            </td>
					            <td>
					            	<a href="${school.id}" class="text-decoration-none btn btn-success">View</a>
					            </td>
					        </tr>
					        </c:forEach>
					    </tbody>
					</table>
	    	</div>
    	</div>
    </body>
</html>