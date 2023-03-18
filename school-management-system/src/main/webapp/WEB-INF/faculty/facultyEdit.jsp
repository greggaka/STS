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
        <title>Edit Faculty Member Info</title>
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
					<h2>Edit Faculty Member Information</h2>
				</div>
			
				<form:form action = "/faculty/edit/${ faculty.id }" modelAttribute="faculty" method="post" class="container">
					<input type="hidden" name="_method" value="put" />
					<div class="form-group">
			            <form:label path="firstName"><strong>First Name: </strong></form:label>
			            <form:input type="text" path="firstName" class='form-control'/>
			            <br>
			            <form:errors path="firstName" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="lastName"><strong>Last Name: </strong></form:label>
			            <form:input type="text" path="lastName" class='form-control'/>
			            <br>
			            <form:errors path="lastName" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="email"><strong>Email: </strong></form:label>
			            <form:input type="email" path="email" class='form-control'/>
			            <br>
			            <form:errors path="email" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="position"><strong>Position: </strong></form:label>
			            <form:select path="position" class='form-control'>
			            	<form:option value="Teacher"/>
			            	<form:option value="Administrator"/>
			            	<form:option value="Counselor"/>
			            	<form:option value="Teachers Assistant"/>
			            	<form:option value="Other"/>
			            </form:select>
			            <br>
			            <form:errors path="position" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="organization"><strong>School: </strong></form:label>
				            <form:select path="organization" class='form-control'>
			            	<c:forEach items="${ allSchools }" var="school">
				            	<form:option type="Long" value="${school.id}">${school.name}</form:option>
			            	</c:forEach>
				            </form:select>
			            <br>
			            <form:errors path="organization" class="text-danger" />
		       		</div>
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
			<div class="bg-light border border-dark rounded w-75 mx-auto mt-5 mb-5">
		    	<div class="container col border border-2 rounded me-2 mt-2" id="faculty">
		    		<div class="py-3 text-center">
			    		<h3 class='text-center'>All Faculty Members in System</h3>
		    		</div>
		    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">First Name</th>
					            <th scope="col">Last Name</th>
					            <th scope="col">Position</th>
					            <th scope="col">School</th>
					            <th scope="col">Action</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${allFaculty}" var="faculty">
					        <tr>
					            <td>
					            	<a href="/faculty/${faculty.id}" class="text-decoration-none link-dark">
					            		<c:out value="${faculty.id }" />
					            	</a>
					            </td>
					            <td>
					            	<a href="/faculty/${faculty.id}" class="text-decoration-none link-dark">
					            		<c:out value="${faculty.firstName }" />
					            	</a>
					            </td>
					            <td>
					            	<a href="/faculty/${faculty.id}" class="text-decoration-none link-dark">
					            		<c:out value="${faculty.lastName }" />
					            	</a>
					            </td>
					            <td>
					            	<a href="/faculty/${faculty.id}" class="text-decoration-none link-dark">
					            		<c:out value="${faculty.position }" />
					            	</a>
					            </td>
					            <td>
					            	<a href="/faculty/${faculty.id}" class="text-decoration-none link-dark">
					            		<c:out value="${faculty.organization.name }" />
					            	</a>
					            </td>
					             <td>
				            	<a href="/faculty/${faculty.id}" class="text-decoration-none btn btn-success">View</a>
				            </td>
					        </tr>
					        </c:forEach>
					    </tbody>
					</table>
		    	</div>
		    </div>
		</div>
    </body>
</html>