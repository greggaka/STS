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
        <title>Dashboard</title>
    </head>
    <body id='background'>
    	<div class='container mx-auto'>
		   	<div class="d-flex justify-content-between py-4 px-4 mb-4 rounded" id="background">
		   		<div class='w-full'>
			    	<h2>Alpha District School Management System</h2>
			   		<h3>Admin Dashboard</h3>
		   		</div>
		   		<div class="text-center">
					<h5><c:out value="${loggedInAdmin.name }" /></h5>    		
					<a href="/admin/logout" class="mt-auto btn btn-light border border-dark rounded">Logout</a>    	    		
		   		</div>
		   	</div>
		   	<div class='bg-light border border-dark rounded mb-5'>
		   		<div class="row d-flex mx-1 my-3">
			    	<div class=" col border border-2 rounded me-2 mb-2" id="schools">
			    		<div class="py-3 text-center">
					    	<h3>Schools</h3>
				    		<a href="schools/new" class="btn btn-primary">+ Add School</a>
			    		</div>
			    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
						    <thead>
						        <tr>
						            <th scope="col">ID</th>
						            <th scope="col">School Name</th>
						            <th scope="col">Type</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:forEach items="${allSchools}" var="school">
						        <tr>
						            <td>
						            	<a href="schools/${school.id}" class="text-decoration-none link-dark">
						            		<c:out value="${school.id }" />
						            	</a>
						            </td>		
						            <td>
						            	<a href="schools/${school.id}" class="text-decoration-none link-dark">
						            		<c:out value="${school.name }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="schools/${school.id}" class="text-decoration-none link-dark">
						            		<c:out value="${school.type }" />
						            	</a>
						            </td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
			    	</div>
			    	<div class="container col border border-2 rounded ms-2 mb-2" id="classes">
			    		<div class="py-3 text-center">
				    		<h3 class='text-center'>Classes</h3>
				    		<a href="classes/new" class="btn btn-primary">+ Add Class</a>
			    		</div>
			    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
						    <thead>
						        <tr>
						            <th scope="col">ID</th>
						            <th scope="col">Class</th>
						            <th scope="col">Subject</th>
						            <th scope="col">School</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:forEach items="${allClasses}" var="classs">
						        <tr>
						            <td>
						            	<a href="classes/${classs.id}" class="text-decoration-none link-dark">
							            	<c:out value="${classs.id }" />
						            	</a>
					            	</td>
						            <td>
						            	<a href="classes/${classs.id}" class="text-decoration-none link-dark">
						            		<c:out value="${classs.name }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="classes/${classs.id}" class="text-decoration-none link-dark">
						            		<c:out value="${classs.subject }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="classes/${classs.id}" class="text-decoration-none link-dark">
						            		<c:out value="${classs.period.name }" />
						            	</a>
						            </td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
			    	</div>    		
		   		</div>
		   		<div class="row d-flex mx-1 my-3">
			    	<div class="container col border border-2 rounded me-2 mt-2" id="faculty">
			    		<div class="py-3 text-center">
				    		<h3 class='text-center'>Faculty</h3>
				    		<a href="faculty/new" class="btn btn-primary">+ Add Faculty Member</a>
			    		</div>
			    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
						    <thead>
						        <tr>
						            <th scope="col">ID</th>
						            <th scope="col">First Name</th>
						            <th scope="col">Last Name</th>
						            <th scope="col">Position</th>
						            <th scope="col">School</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:forEach items="${allFaculty}" var="faculty">
						        <tr>
						            <td>
						            	<a href="faculty/${faculty.id}" class="text-decoration-none link-dark">
						            		<c:out value="${faculty.id }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="faculty/${faculty.id}" class="text-decoration-none link-dark">
						            		<c:out value="${faculty.firstName }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="faculty/${faculty.id}" class="text-decoration-none link-dark">
						            		<c:out value="${faculty.lastName }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="faculty/${faculty.id}" class="text-decoration-none link-dark">
						            		<c:out value="${faculty.position }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="faculty/${faculty.id}" class="text-decoration-none link-dark">
						            		<c:out value="${faculty.organization.name }" />
						            	</a>
						            </td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
			    	</div>
			    	<div class="container col border border-2 rounded ms-2 mt-2" id="students">
			    		<div class="py-3 text-center">
				    		<h3 class='text-center'>Students</h3>
				    		<a href="students/new" class="btn btn-primary">+ Add Student</a>
			    		</div>
			    		<table class="container table table-hover align-middle bg-white border border-2 rounded">
						    <thead>
						        <tr>
						            <th scope="col">ID</th>
						            <th scope="col">First Name</th>
						            <th scope="col">Last Name</th>
						            <th scope="col">School</th>
						            <th scope="col">Grade</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:forEach items="${allStudents}" var="student">
						        <tr>
						            <td>
						            	<a href="students/${student.id}" class="text-decoration-none link-dark">
						            		<c:out value="${student.id }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="students/${student.id}" class="text-decoration-none link-dark">
						            		<c:out value="${student.firstName }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="students/${student.id}" class="text-decoration-none link-dark">
						            		<c:out value="${student.lastName }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="students/${student.id}" class="text-decoration-none link-dark">
						            		<c:out value="${student.pupil.name }" />
						            	</a>
						            </td>
						            <td>
						            	<a href="students/${student.id}" class="text-decoration-none link-dark">
						            		<c:out value="${student.grade }" />
						            	</a>
						            </td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
			    	</div>    		
		   		</div>
		   	</div>
	   	</div>
    </body>
</html>