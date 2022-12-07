<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
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
		<h1>Review Form</h1>
		<form action="/review/process" method="post">
			<div>
				<label>Movie</label>
				<input type="text" name="movie" />
			</div>
			<div>
				<label>Comment</label>
				<input type="text" name="comment" />
			</div>
			<div>
				<label>Rating</label>
				<input type="number" name="rating" />
			</div>
			<button type="submit">Submit Review</button>
			
		</form>
    </body>
</html>