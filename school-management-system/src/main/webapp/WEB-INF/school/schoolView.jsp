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
        <title>View School</title>
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
	    	<div class="bg-light border border-dark rounded mx-auto">
	    		<div class="d-flex justify-content-between">
					<div class="ms-3">
						<h1 class=''><em><c:out value="${school.name}"/></em></h1>
					</div>
					<div class="text-end me-2 mt-2 d-flex">
						<div class="me-2">
							<a href="/schools/edit/${school.id }" class="btn btn-warning border border-dark">Edit</a>
						</div>
						<div>
							<form action="/schools/${school.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger border border-dark rounded">
							</form>
						</div>
					</div>
	    		</div>
		    	<div>
		    		<div class='row ms-1' >
		    			<div class="">
				    		<h4><strong>School ID: </strong>${ school.id }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>School Type: </strong>${ school.type }</h4>
		    			</div>
		    		</div>
		    		<div class='container mt-2'>
		    			<h4>Classes Offered:</h4>
		    			<a href="/classes/new" class="btn btn-primary mb-3">+ Add Class</a>
		    			<table class="container table table-hover align-middle bg-white border border-2 rounded">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">Class</th>
					            <th scope="col">Subject</th>
					            <th scope="col">Action</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${allClasses}" var="classs">
					        <c:if test="${classs.period.id == school.id }">
					        <tr>
					            <td>
					            	<a href="/classes/${ classs.id }" class="text-decoration-none link-dark"><c:out value="${classs.id }" /></a></td>
					            <td>
					            	<a href="/classes/${ classs.id }" class="text-decoration-none link-dark"><c:out value="${classs.name }" /></a></td>
					            <td>
					            	<a href="/classes/${ classs.id }" class="text-decoration-none link-dark"><c:out value="${classs.subject }" /></a></td>
					            <td class="d-flex">
					            	<div class="mx-1">
					            		<a href="/classes/${ classs.id }" class='btn btn-success border border-dark rounded'>view</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="/classes/edit/${ classs.id }" class='btn btn-warning border border-dark rounded'>edit</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="/classes/delete/${ classs.id }" class='btn btn-danger border border-dark rounded'>delete</a>
					            	</div>
					            </td>
					        </tr>
					        </c:if>
					        </c:forEach>
					    </tbody>
					</table>
		    		</div>
		    		<div class='container '>
		    			<h4>Faculty Members:</h4>
		    			<a href="/faculty/new" class="btn btn-primary mb-3">+ Add Faculty Member</a>
		    			<table class="table table-hover align-middle bg-white border border-2 rounded">
		    			<thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">First Name</th>
					            <th scope="col">Last Name</th>
					            <th scope="col">Position</th>
					            <th scope="col">Action</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${allFaculty}" var="faculty">
					        <c:if test="${faculty.organization.id == school.id }">
					        <tr>
					            <td><c:out value="${faculty.id}" /></td>
					            <td><c:out value="${faculty.firstName}" /></td>
					            <td><c:out value="${faculty.lastName}" /></td>
					            <td><c:out value="${faculty.position}" /></td>
					            <td class="d-flex">
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-success border border-dark rounded'>view</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-warning border border-dark rounded'>edit</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-danger border border-dark rounded'>delete</a>
					            	</div>
					            </td>
					        </tr>
					        </c:if>
					        </c:forEach>			    	
						    </tbody>
			    		</table>
		    		</div>
		    		<div class='container '>
		    			<h4>Students:</h4>
		    			<a href="/students/new" class="btn btn-primary mb-3">+ Add Student</a>
		    			<table class="table table-hover align-middle bg-white border border-2 rounded">
		    			<thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">First Name</th>
					            <th scope="col">Last Name</th>
					            <th scope="col">Grade</th>
					            <th scope="col">Action</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${allStudents}" var="student">
					        <c:if test="${student.pupil.id == school.id }">
					        <tr>
					            <td><c:out value="${student.id}" /></td>
					            <td><c:out value="${student.firstName}" /></td>
					            <td><c:out value="${student.lastName}" /></td>
					            <td><c:out value="${student.grade}" /></td>
					            <td class="d-flex">
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-success border border-dark rounded'>view</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-warning border border-dark rounded'>edit</a>
					            	</div>
					            	<div class="mx-1">
					            		<a href="#" class='btn btn-danger border border-dark rounded'>delete</a>
					            	</div>
					            </td>
					        </tr>
					        </c:if>
					        </c:forEach>			    	
						    </tbody>
			    		</table>
		    		</div>
		    	</div>
	    	</div>
    	</div>
    </body>
</html>