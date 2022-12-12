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
        <title>Omikuji Form</title>
    </head>
    <body>
		<h1 class="text-center">Send an Omikuji!</h1>
		<br>
		<form action="/omikuji/process" class="container text-center border border-1 my-2" method="post">
			<div class="my-3">
				<label for="num">Pick any number from 5 to 25.</label>
				<br>
				<input type="number" name="num" value=5 />
				<br>
			</div>
			<div class="my-3">
				<label for="city">Enter the name of any city.</label>
				<br>
				<input type="text" name="city"/>
				<br>
			</div>
			<div class="my-3">
				<label for="person">Enter the name of any real person.</label>
				<br>
				<input type="text" name="person"/>
				<br>
			</div>
			<div class="my-3">
				<label for="endeavor">Enter professional endeavor or hobby.</label>
				<br>
				<input type="text" name="endeavor"/>
				<br>
			</div>
			<div class="my-3">
				<label for="thing">Enter any type of living thing.</label>
				<br>
				<input type="text" name="thing"/>
				<br>
			</div>
			<div class="my-3">
				<label for="message">Say something nice to someone.</label>
				<br>
				<input type="text" name="message" />
				<br>
			</div>
			<label>Send and show a friend</label>
			<br>
			<input type="submit" value="submit"  class="my-3"/>
		</form>
    </body>
</html>