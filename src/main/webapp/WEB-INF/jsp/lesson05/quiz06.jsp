<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 가게 리스트 페이지</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
header {
	height: 100px;
}


footer {
	height: 100px;
}

a {color: black;}
a{ text-decoration: none;}
a:hober { text-decoration: none;}
</style>
</head>
<body>
	<div class="container">
		<header class="bg-info text-white pl-5 pt-3">
			<div class="display-4">배탈의 민족</div>
		</header>
		<section>
			<div class="display-3">우리동네 가게</div>
			<c:forEach items="${store}" var="store">
			<div class="border border-info m-3 form-control">
				<a href="" id="name"><h1>${store.name}</h1></a>
				<div>전화번호:${store.phoneNumber}</div>
				<div>주소:${store.address}</div>
			</div>
			</c:forEach>
		</section>
	<footer>
		<hr>
		<h3>(주)우와한형제</h3>
		<h4>
			<span class="text-secondary">고객센터 : 1500-1500</span>
		</h4>
	</footer>
	</div>
</body>
</html>