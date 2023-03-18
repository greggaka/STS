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
        <title>View Faculty Member's Info</title>
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
	    	<div class="bg-light border border-dark rounded mx-auto w-50">
	    		<div class="d-flex justify-content-between">
					<div class="ms-3">
						<h1 class=''><em><c:out value="${faculty.firstName}"/> <c:out value="${faculty.lastName}"/></em></h1>
					</div>
					<div class="text-end me-2 mt-2 d-flex">
						<div class="me-2">
							<a href="/faculty/edit/${ faculty.id }" class="btn btn-warning border border-dark">Edit</a>
						</div>
						<div>
							<form action="/faculty/${faculty.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger border border-dark rounded">
							</form>
						</div>
					</div>
	    		</div>
	    		<div>
		    		<div class='row ms-1' >
		    			<div class="">
				    		<h4><strong>School: </strong>${ faculty.organization.name }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Position: </strong>${ faculty.position  }</h4>
		    			</div>
		    			<div class="">
				    		<h4><strong>Faculty ID: </strong>${ faculty.id }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Classes: </strong>${ faculty.classes }</h4>
		    			</div>
		    		</div>
		    	</div>
	    	</div>
	    	<div class="bg-light border border-dark rounded mx-auto mt-5 w-75">
		    	<div class="container col border border-2 rounded me-2 mt-2" id="faculty">
		    		<div class="py-3 text-center">
			    		<h3 class='text-center'>Add this class to this instructor's list.</h3>
		    		</div>
		    		<form:form action="/faculty/edit/${ faculty.id }" modelAttribute="faculty" method="post" class="container">
		    			<input type="hidden" name="_method" value="put" />
		    			<div class="form-group">
		    				<form:label path="classes"><strong>Class: </strong></form:label>
		    					<form:select path="classes" class="form-control" >
		    					<c:forEach items="${ allClasses }" var="classs">
		    						<form:option value="${ classs.id }">${classs.name}</form:option>
		    					</c:forEach>
		    					</form:select>
		    			</div>
		    			<div class='text-center my-3'>
				       		<input type="submit" value="Submit" class="btn btn-success">
			       		</div>
		    		</form:form>
		    		
		    	</div>
		    </div>
    	</div>
    </body>
</html>