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
        <title>View Class Info</title>
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
						<h1 class=''><em><c:out value="${classs.name}"/> <c:out value="${faculty.lastName}"/></em></h1>
					</div>
					<div class="text-end me-2 mt-2 d-flex">
						<div class="me-2">
							<a href="/classes/edit/${ classs.id }" class="btn btn-warning border border-dark">Edit</a>
						</div>
						<div>
							<form action="/classes/${classs.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger border border-dark rounded">
							</form>
						</div>
					</div>
	    		</div>
	    		<div>
		    		<div class='row ms-1' >
		    			<div class="">
				    		<h4><strong>School: </strong>${ classs.period.name }</h4>
		    			</div>
		    			<div class="">
				    		<h4><strong>Subject </strong>${ classs.subject }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Class ID: </strong>${ classs.id  }</h4>
		    			</div>
		    			<div class="mb-1">
			    			<h4><strong>Instructor(s): </strong><br/>${ classs.instructor.firstName } ${ classs.instructor.lastName }</h4>
			    			<c:choose>
				    			<c:when test="${ classs.instructor.id == null }">
				    				<a href="/classes/add-instructor/${ classs.id}" class="btn btn-primary">Assign instructor</a>
				    			</c:when>
				    			<c:otherwise>
				    				<a href="/classes/add-instructor/${ classs.id}" class="btn btn-primary">Change instructor</a>
				    			</c:otherwise>
			    			</c:choose>
			    			
		    			</div>
		    			<div class="mb-3">
		    				<c:forEach var="i" begin="0" end="${ classs.student[i] }">
			    				<h4><strong>Students: </strong>${ classs.student[i].firstName }</h4>
			    			</c:forEach>
			    			<a href="/classes/add-student/${ classs.id}" class="btn btn-primary">+Add Student</a>
		    			</div>
		    		</div>
		    	</div>
	    	</div>
	    	<div class="bg-light border border-dark rounded mx-auto mt-5 w-75 mb-5" id="classes">
	    		<div class="py-3 text-center">
		    		<h3 class='text-center'>All Classes in the System</h3>
		    		<a href="/classes/new" class="btn btn-primary text-start">+ Add Class</a>
	    		</div>
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