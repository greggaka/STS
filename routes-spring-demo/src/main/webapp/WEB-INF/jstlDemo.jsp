<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="text-success">Styling Test</h1>
	<h3 class="styleTest">testing styling</h3>
	<h1>JSTL Demo</h1>
	<h2> Displaying variables </h2>
	<p><c:out value="${ nameFromController }" /></p>
	<p>${ ageFromController }</p>
	<p>${ isHungryFromController }</p>
	<p><c:out value="${ test }" /> </p>
	
	<h1>if-statement</h1>
		<c:if test="${ isHungryFromController }">
			<p><c:out value="${ nameFromController }"/> is hungry </p>
		</c:if>
		
	<h1>if-else statement</h1>
	<c:choose>
		<c:when test="${ ageFromController < 21 }">
			<p><c:out value="${ nameFromController }"/> is under 21 </p>
		</c:when>
		<c:otherwise>
			<p><c:out value="${ nameFromController }"/> is over 21 </p>
		</c:otherwise>
	</c:choose>
	
	<h1>for each</h1>
	<c:forEach var="user" items="${ usersListFromController }">
		<p><c:out value="${ user }"/></p>
	</c:forEach>
		
		
</body>
</html>