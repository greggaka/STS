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
        <title>Server Counter</title>
    </head>
    <body>
		<p class="text-center">
			You have visited <a href="http://localhost:8080/your_server">localhost:8080/your_server</a> ${ count } times.
			<br>
			<br>
			<a href="http://localhost:8080/your_server">Test another visit?</a>
		</p>
    </body>
</html>