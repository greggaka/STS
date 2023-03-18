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
			    			<h4><strong>Email: </strong>${ faculty.email  }</h4>
		    			</div>
		    			<div class="">
				    		<h4><strong>Faculty ID: </strong>${ faculty.id }</h4>
		    			</div>
		    			<div class="">
			    			<h4><strong>Class(es): </strong></h4>
		    				<c:forEach items="${ allClasses }" var="classs">
		    					<c:if test="${ classs.instructor.id == faculty.id }">
		    						<h6>${ classs.name }</h6>
			    				</c:if>
			    			</c:forEach>
		    			</div>
		    		</div>
		    	</div>
	    	</div>
	    	<div class="bg-light border border-dark rounded mx-auto mt-5 w-75">
		    	<div class="container col border border-2 rounded me-2 mt-2" id="faculty">
		    		<div class="py-3 text-center">
			    		<h3 class='text-center'>All Faculty Members in the System</h3>
			    		<a href="/faculty/new" class="btn btn-primary">+ Add Faculty Member</a>
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