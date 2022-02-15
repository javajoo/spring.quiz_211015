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

<!-- 

	데이터 피커 넣을 때에는 3.6.0 말고  나머지도 넣어줘야 작동이 된다!!!!

 -->


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

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<header>
			<div class="display-4 d-flex justify-content-center pt-3">
				<div>
					<a href="/lesson06/booking_check" class="logo">통나무 팬션</a>
				</div>
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill ">
				<li class="nav-item"><a href="#" class="nav-link text-white">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_reserve"
					class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_list"
					class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<section>
			<h1 class="text-center pt-3 pb-3">예약 하기</h1>

			<div class="d-flex justify-content-center">
				<div class="form-group col-5">
					<label for="name"><b>이름</b></label> <input type="text"
						class="form-control" id="name" name="name">
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<div class="form-group col-5">
					<label for="date"><b>예약날짜</b></label> <input type="text"
						class="form-control" id="date" name="date">
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<div class="form-group col-5">
					<label for="day"><b>숙박일수</b></label> <input type="text"
						class="form-control" id="day" name="day">
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<div class="form-group col-5">
					<label for="headcount"><b>숙박인원</b></label> <input type="text"
						class="form-control" id="headcount" name="headcount">
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<div class="form-group col-5">
					<label for="phoneNumber"><b>전화번호</b></label> <input type="text"
						class="form-control" id="phoneNumber" name="phoneNumber">
				</div>
			</div>

			<div class="d-flex justify-content-center">
				<div>
					<button type="button" id="reserveBtn"
						class="btn btn-warning form-control">예약하기</button>
				</div>
			</div>
		</section>
		<footer>
			<small class="text-secondary"> 제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br> Copyrignt 2025
				tongnamu. All right reserved.
			</small>
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			//alert("click");
			 $('input[name=date]').datepicker({
				dateFormat: 'yy-mm-dd' // 2022-02-07
				, minDate: 0 // 오늘부터 그 뒤 선택
			}); 

			$('#reserveBtn').on('click', function(e) {
				//alert("click");
				/* name으로 꺼내기
				let name = $('input[name=name]').val().trim();
				let date = $('input[name=date]').val().trim();
				let day = $('input[name=day]').val().trim();
				let headcount = $('input[name=headcount]').val().trim();
				let phoneNumber = $('input[name=phoneNumber]').val().trim();
				 */
				 
				 // validation 체크
				var name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력하세요");
					return;  // 밑으로 못내려가게 막는다.
				}

				var date = $('#date').val().trim();
				if (date == '') {
					alert("날짜를 입력하세요");
					return;
				}

				var day = $('#day').val().trim();
				if (day == '') {
					alert("숙박일수를 입력하세요");
					return;
				}
				
				if (isNaN(day)) { // 숫자가 아닌 경우(함수)
					alert("숙박일수는 숫자만 입력 가능합니다");
					return;
				}

				var headcount = $('#headcount').val().trim();
				if (headcount == '') {
					alert("숙박인원을 입력하세요");
					return;
				}
				
				if (isNaN(headcount)) {
					alert("숙박인원은 숫자만 입력 가능합니다");
					return;
				}

				var phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("전화번호를 입력하세요");
					return;
				}

				$.ajax({
					type : "POST",
					url : "/lesson06/add",
					data : {
						"name" : name,
						"date" : date,
						"day" : day,
						"headcount" : headcount,
						"phoneNumber" : phoneNumber
					},
					success : function(data) {
					 	if (data.code == 1) {
							alert("예약 되었습니다.");
							location.href = "/lesson06/booking_list"; 
							// 예약목록 화면으로 이동
						} else {
							alert("예약실패");
						}

					},
					error : function(e) {
						alert("예약하는데 실패 했습니다.");
					}
				});

			});

		});
	</script>
</body>
</html>