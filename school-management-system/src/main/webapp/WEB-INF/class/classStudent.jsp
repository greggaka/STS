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
        <title>Assign Class Instructor</title>
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
					<h2>Add Student to class: <br /> ${ classs.name }</h2>
	    		</div>
				<form:form action = "/classes/add-student/${ classs.id }" modelAttribute="classs" method="post" class="container">
					<input type="hidden" name="_method" value="put" />
					<div class="form-group">
			            <form:label path="name"><strong>Class Name: </strong></form:label>
			            <form:input type="text" path="name" class='form-control' value="${ classs.name }"/>
			            <br>
			            <form:errors path="name" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="subject"><strong>Subject: </strong></form:label>
			            <form:select path="subject" class='form-control' value="${ classs.subject }">
			            	<form:option value="Math"/>
			            	<form:option value="English"/>
			            	<form:option value="Science"/>
			            	<form:option value="Social Studies"/>
			            	<form:option value="Technology"/>
			            	<form:option value="Fine Arts"/>
			            	<form:option value="Music"/>
			            	<form:option value="Health/PE"/>
			            	<form:option value="Language"/>
			            </form:select>
			            <br>
			            <form:errors path="subject" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="period"><strong>School: </strong></form:label>
			            <form:select path="period" class='form-control'>
			            <c:forEach items="${ allSchools }" var="school">
			            	<c:if test="${ school.id == classs.period.id }">
			            		<form:option value="${ school.id }" >${ classs.period.name }</form:option>
			            	</c:if>
			            </c:forEach>   
			            </form:select>
			            <br>
			            <form:errors path="period" class="text-danger" />
		       		</div>
		    		<div class="form-group">
			            <form:label path="instructor"><strong>Instructor: </strong></form:label>
			            <form:select path="instructor" class='form-control'>
			            	<form:option value="${ classs.instructor.id }" >${ classs.instructor.firstName } ${ classs.instructor.lastName }</form:option> 
			            </form:select>
			            <br>
			            <form:errors path="instructor" class="text-danger" />
		       		</div>
		       		<div class="form-group">
			            <form:label path="student"><strong>Student: </strong></form:label>
			            <form:select path="student" class='form-control'>
			            	<c:forEach items="${ allStudents }" var="student">
			            		<c:if test="${ classs.period.id == student.pupil.id }">
			            			<form:option value="${ student.id }" >${ student.firstName } ${ student.lastName }</form:option> 
			            		</c:if>
			            	</c:forEach>  
			            </form:select>
			            <br>
			            <form:errors path="student" class="text-danger" />
		       		</div>
		       		<div class='text-center mb-3'>
				       		<input type="submit" value="Add" class="btn btn-success">
			       	</div>
				</form:form>
			</div>
			<div class='bg-light mt-5 border border-dark rounded w-75 mx-auto mb-5'>
	    		<h3 class='text-center my-3'>All Classes in the System</h3>
	    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
					    <thead>
				        <tr>
				            <th scope="col">ID</th>
				            <th scope="col">Class</th>
				            <th scope="col">Subject</th>
				            <th scope="col">School</th>
				            <th scope="col">Action</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${allClasses}" var="classs">
				        <tr>
				            <td>
				            	<a href="/classes/${classs.id}" class="text-decoration-none link-dark">
					            	<c:out value="${classs.id }" />
				            	</a>
			            	</td>
				            <td>
				            	<a href="/classes/${classs.id}" class="text-decoration-none link-dark">
				            		<c:out value="${classs.name }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/classes/${classs.id}" class="text-decoration-none link-dark">
				            		<c:out value="${classs.subject }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/classes/${classs.id}" class="text-decoration-none link-dark">
				            		<c:out value="${classs.period.name }" />
				            	</a>
				            </td>
				            <td>
				            	<a href="/classes/${classs.id}" class="text-decoration-none btn btn-success">View</a>
				            </td>
				        </tr>
					        </c:forEach>
					    </tbody>
					</table>
	    	</div>
		</div>
    </body>
</html>