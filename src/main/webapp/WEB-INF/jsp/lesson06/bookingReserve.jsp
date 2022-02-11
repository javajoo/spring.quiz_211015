<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기 페이지</title>
<link rel="styleSheet" type="text/css" href="/css/booking.css">

<!-- ajax 통신을 사용하려면 가장 기본적인 제이쿼리 cdn 가져와야 한다. -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
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
</head>
<body>
	<div class="container">
		<header>
			<div class="display-4 text-center">
				<div>통나무 팬션</div>
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill ">
				<li class="nav-item"><a href="" class="nav-link text-white">펜션소개</a></li>
				<li class="nav-item"><a href="" class="nav-link text-white">객실보기</a></li>
				<li class="nav-item"><a href="" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<section>
			<h1 class="text-center pt-3 pb-3">예약 하기</h1>
			
			<div class="d-flex justify-content-center">
				<div class="form-group">
					<label for=""><b>이름</b></label>
					<input type="text" class="form-control" id="" name="">
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="form-group">
					<label for="date"><b>예약날짜</b></label>
					<input type="text" class="form-control" id="date" name="date">
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="form-group">
					<label for="day"><b>숙박일수</b></label>
					<input type="text" class="form-control" id="day" name="day">
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="form-group">
					<label for="headcount"><b>숙박인원</b></label>
					<input type="text" class="form-control" id="headcount" name="headcount">
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="form-group">
					<label for="phoneNumber"><b>전화번호</b></label>
					<input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
			<div><button type="button" class="btn btn-warning form-control">예약하기</button></div>
			</div>
		</section>
		<footer>
			<small class="text-secondary">
			제주특별자치도 제주시 애월읍<br>
			사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
			Copyrignt 2025 tongnamu. All right reserved.
			</small>
		</footer>
	</div>
	
	<script>
		$(document).ready(function(e) {
			//alert("alert");
			$('#date').datepicker({
				dateFormat: "yy-mm-dd";
			});
		});
		
	</script>
</body>
</html>