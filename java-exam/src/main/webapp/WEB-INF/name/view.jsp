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
        <title>View Name</title>
    </head>
    <body>
    	<div class="container d-flex justify-content-between">
			<h1><em><c:out value="${name.bname }"/></em></h1>
    		<a href="/" class="mt-auto">back to dashboard</a>
    	</div>
    	<div class="container">
    		<h4>(added by <c:out value="${name.contributor.userName }"/>)</h4>
    		<br>
    		<h3>Gender: <c:out value="${name.gender }"/></h3>
    		<h3>Origin: <c:out value="${name.origin }" /></h3>
    		<h5>Meaning: <c:out value="${name.meaning }"/></h5>
    		<div class="d-flex">
	    		<c:if test="${name.contributor.id == user_id}">
	    			<a href="/names/edit/${name.id }" class="btn btn-success">Edit</a>
	    		</c:if>    		
    		</div>
    	</div>
    </body>
</html>