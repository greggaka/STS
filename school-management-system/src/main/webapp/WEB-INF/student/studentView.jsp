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
        <title>View Student Info</title>
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
						<h1 class=''><em><c:out value="${student.firstName}"/> <c:out value="${student.lastName}"/></em></h1>
					</div>
					<div class="text-end me-2 mt-2 d-flex">
						<div class="me-2">
							<a href="/students/edit/${ student.id }" class="btn btn-warning border border-dark">Edit</a>
						</div>
						<div>
							<form action="/students/${student.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger border border-dark rounded">
							</form>
						</div>
					</div>
	    		</div>
	    		<div>
		    		<div class='row ms-1' >
		    			<div class="">
				    		<h4><strong>Student ID: </strong>${ student.id }</h4>
		    			</div>
		    			<div class="">
				    		<h4><strong>School: </strong>${ student.pupil.name }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Grade: </strong>${ student.grade  }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Email: </strong>${ student.email }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Classes: </strong>${ student.classes }</h4>
		    			</div>
		    		</div>
		    	</div>
	    	</div>
	    	<div class="bg-light border border-dark rounded mx-auto mt-5 w-75 mb-5" id="students">
	    		<div class="py-3 text-center">
		    		<h3 class='text-center'>All Students in the System</h3>
		    		<a href="/students/new" class="btn btn-primary">+ Add Student</a>
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