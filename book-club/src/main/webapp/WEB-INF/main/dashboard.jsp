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
        <title>Book Club - Dashboard</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1>Welcome, <c:out value="${loggedInUser.userName }" /></h1>
			<a href="/users/logout" class="mt-auto">Logout</a>    	
    	</div>
    	<div class="container d-flex justify-content-between">
    		<p>Books from everyone's shelves</p>
    		<a href="/books/new">+ Add a book to the shelf</a> 
    	</div>
		
		<table class="table container">
		    <thead>
		        <tr>
		            <th scope="col">ID</th>
		            <th scope="col">Title</th>
		            <th scope="col">Author</th>
		            <th scope="col">Posted By</th>
		            <th scope="col">Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${allBooks}" var="book">
		        <tr>
		            <td><c:out value="${book.id }" /></td>
		            <td><a href="/books/${book.id }"><c:out value="${book.title }" /></a></td>
		            <td><c:out value="${book.author }" /></td>
		            <td><c:out value="${book.reader.userName }" /></td>
		            <td>
		            	<c:if test="${book.reader.id == user_id}">
		            	<div class="d-flex">
	    					<a href="/books/edit/${book.id }" class="btn btn-primary">Edit</a>
	    					<form action="/books/delete/${book.id }" method="post">
			            		<input type="hidden" value="delete" name="_method" />
			           			<input type="submit" value="Delete" class="btn btn-danger" />
			        		</form>    				            	
		            	</div>
	    				</c:if>
	    			</td>  	
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </body>
</html>