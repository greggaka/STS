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
        <title>Omikuji Display</title>
    </head>
    <body>
		<h1 class="text-center">Here's Your Omikuji!</h1>
		<div class="container border border-1 w-25 bg-info ">
			<p> 
				In <c:out value="${ num }" /> years, you will live in <c:out value="${ city }" /> with <c:out value="${ person }" /> as your roommate,
				<c:out value="${ endeavor }"  /> for a living. The next time you see a
				<c:out value="${ thing }" /> you will have good luck.
				Also, <c:out value="${ message }" />.
			</p>
		</div>
		<p class="text-center"><a href="http://localhost:8080/omikuji">Go back</a></p>
    </body>
</html>