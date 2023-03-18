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
        <title>Edit Student Info</title>
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
					<h2>Edit Student's Information</h2>
	    		</div>
			
				<form:form action = "/students/edit/${ student.id }" modelAttribute="student" method="post" class="container">
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
			            <form:label path="grade"><strong>Grade: </strong></form:label>
			            <form:select path="grade" class='form-control'>
			            	<form:option value="K"/>
			            	<form:option value="1"/>
			            	<form:option value="2"/>
			            	<form:option value="3"/>
			            	<form:option value="4"/>
			            	<form:option value="5"/>
			            	<form:option value="6"/>
			            	<form:option value="7"/>
			            	<form:option value="8"/>
			            	<form:option value="9"/>
			            	<form:option value="10"/>
			            	<form:option value="11"/>
			            	<form:option value="12"/>
			            	<form:option value="Freshman"/>
			            	<form:option value="Sophomore"/>
			            	<form:option value="Junior"/>
			            	<form:option value="Senior"/>
			            	<form:option value="other"/>
			            </form:select>
			            <br>
			            <form:errors path="grade" class="text-danger" />
			        </div>
			        <div class="form-group">
			            <form:label path="pupil"><strong>School: </strong></form:label>
			            <form:select path="pupil" class='form-control'>
			            	<c:forEach items="${ allSchools }" var="school">
			            		<form:option value="${school.id}" >${school.name}</form:option>	            	
			            	</c:forEach>
			            </form:select>
			            <br>
			            <form:errors path="pupil" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="email"><strong>Email: </strong></form:label>
			            <form:input type="email" path="email" class='form-control'/>
			            <br>
			            <form:errors path="email" class="text-danger" />
		       		</div>
		       		<div class='text-center mb-3'>
			       		<input type="submit" value="Submit" class="btn btn-success">
		       		</div>
				</form:form>
			</div>
			<div class="bg-light border border-dark rounded mx-auto mt-5 w-75 mb-5" id="students">
	    		<div class="py-3 text-center">
		    		<h3 class='text-center'>All Students in the System</h3>
	    		</div>
	    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
				    <thead>
				        <tr>
				            <th scope="col">ID</th>
				            <th scope="col">First Name</th>
				            <th scope="col">Last Name</th>
				            <th scope="col">School</th>
				            <th scope="col">Grade</th>
				            <th scope="col">Action</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${allStudents}" var="student">
				        <tr>
				            <td>
				            	<a href="/students/${student.id}" class="text-decoration-none link-dark">
				            		<c:out value="${student.id }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/students/${student.id}" class="text-decoration-none link-dark">
				            		<c:out value="${student.firstName }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/students/${student.id}" class="text-decoration-none link-dark">
				            		<c:out value="${student.lastName }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/students/${student.id}" class="text-decoration-none link-dark">
				            		<c:out value="${student.pupil.name }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/students/${student.id}" class="text-decoration-none link-dark">
				            		<c:out value="${student.grade }" />
				            	</a>
				            </td>
				            <td>
		            	<a href="/students/${student.id}" class="text-decoration-none btn btn-success">View</a>
		            </td>
				        </tr>
				        </c:forEach>
				    </tbody>
				</table>
	    	</div> 
		</div>
    </body>
</html>