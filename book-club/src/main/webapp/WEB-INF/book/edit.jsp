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
        <title>Insert title here</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1>Edit/Change Your Entry</h1>
    		<a href="/" class="mt-auto">back to the shelf</a>
    	</div>
		<form:form action = "/books/edit/${book.id }" modelAttribute="book" method="post" class="container">
			<input type="hidden" name="_method" value="put" />
			<form:input type="hidden" path="reader" />
			<div class="form-group mb-3">
	            <form:label path="title">Title</form:label>
	            <form:input type="text" path="title" />
	            <br>
	            <form:errors path="title" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="author">Author</form:label>
	            <form:input type="text" path="author" />
	            <br>
	            <form:errors path="author" class="text-danger" />
       		</div>
       		<div class="form-group mb-3">
	            <form:label path="thoughts">My Thoughts</form:label>
	            <form:input type="text" path="thoughts" />
	            <br>
	            <form:errors path="thoughts" class="text-danger" />
       		</div>
       		<input type="submit" value="Edit" class="btn btn-primary">
		</form:form>
    </body>
</html>