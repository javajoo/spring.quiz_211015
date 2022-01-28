<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
menu {height: 1000px;}
.content1 {height: 1000px;}
footer {height: 100px;}
</style>
</head>
<body>

<div id="wrap">
	<section class="d-flex">
		<menu class="bg-primary col-2">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link">날씨</a></li>
				<li class="nav-item"><a class="nav-link">날씨입력</a></li>
				<li class="nav-item"><a class="nav-link">테마날씨</a></li>
				<li class="nav-item"><a class="nav-link">관측기후</a></li>
			</ul>
		</menu>
		<section class="content1 bg-warning col-10">
			<h1>과거 날씨</h1>
		</section>
	</section>
	<footer class="bg-danger d-flex">
	<div class="bg-info col-2"></div>
	<div class="bg-dark col-3"></div>
	</footer>
</div>



</body>
</html>