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
        <title>Insert title here</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1><em><c:out value="${book.title }"/></em></h1>
    		<a href="/" class="mt-auto">back to the shelf</a>
    	</div>
    	<div class="container">
    		<p>
    			<span class="text-danger"><c:out value="${book.reader.userName }"/></span> read <span class="text-primary text-decoration-underline" ><c:out value="${book.title }" /></span> by <span class="text-success"><c:out value="${book.author }" /></span>.
    		</p>
    		<p>Here are <c:out value="${book.reader.userName }"/>'s thoughts: </p>
    		<p><c:out value="${book.thoughts }"/></p>
    		<div class="d-flex">
	    		<c:if test="${book.reader.id == user_id}">
	    			<a href="/books/edit/${book.id }" class="btn btn-primary">Edit</a>
	    			<form action="/books/delete/${book.id }" method="post">
			            <input type="hidden" value="delete" name="_method" />
			            <input type="submit" value="Delete" class="btn btn-danger" />
			        </form>    		
	    		</c:if>    		
    		</div>
    	</div>
    </body>
</html>