<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
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
			<div class="display-4 d-flex justify-content-center pt-3">
				<div><a href="/lesson06/booking_check" class="logo">통나무 팬션</a></div>
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill ">
				<li class="nav-item"><a href="#" class="nav-link text-white">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_reserve" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking_list" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<section>
			<section class="content1 bg-success">
				<img id="bannerImage" src="/images/test06_banner1.jpg" alt="banner" width="1110" height="400">
			</section>
			<section class="content2 d-flex">
				<div class="div1 col-4 text-white display-4 d-flex justify-content-center align-items-center">
					<div>실시간<br>예약하기</div>
				</div>
				<div class="div2 col-4">
					<div class="text-white pt-3 pl-3"><h3>예약 확인</h3></div>
					<div class="form-group d-flex justify-content-end pr-5 text-white">
						<label for="name">이름:</label>
						<div><input type="text" class="form-control" id="name" name="name"></div>
					</div>
					<div class="form-group d-flex justify-content-end pr-5 text-white">
						<label for="phoneNumber">전화번호:</label>
						<div><input type="text" class="form-control" id="phoneNumber" name="phoneNumber"></div>
					</div>
					
					<div class="d-flex justify-content-end">
						<button type="button" class="check-btn btn-success form-control col-4">조회 하기</button>
					</div>
				</div>
				<div class="div1 col-4 text-white d-flex justify-content-center align-items-center font-weignt-bold">
					<div><h3>예약문의:<br>010-<br>0000-1111</h3></div>
				</div>
			</section>
			
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
		$(document).ready(function(e){
			//alert("click");
			var bannerImage = [
				'/images/test06_banner1.jpg',
				'/images/test06_banner2.jpg',
				'/images/test06_banner3.jpg',
				'/images/test06_banner4.jpg'];
			var currentIndex = 0;
			
			// setInterval 함수가 2개 (이벤트,시간)
			setInterval(function() {
				$('#bannerImage').attr('src',bannerImage[currentIndex]);
				currentIndex++;
				
				if (currentIndex > bannerImage.length) {
					 currentIndex = 0;
				}
					
				
			
			}, 3000);
			
			// 조회하기 버튼 클릭 이벤트
			$('.check-btn').on('click',function(e){
				//alert("click");
				
				// 유효성 검사
				var name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력하세요");
					return;
				}
				
				var phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("전화번호을 입력하세요");
					return;
				}
				
				if (phoneNumber.startsWith('010') == false) {
					alert('010으로 시작하는 번호만 입력할 수 있습니다');
					return;
				}
				
			
				
				$.ajax({
					type: "POST"
					,url: "/lesson06/check"
					,data: {"name": name, "phoneNumber": phoneNumber }
					,success: function(data) {
						// 성공시
						// {"result": "success",
						// "code" : "1",
						// "booking": {"name: "신보람", "phonenumber": "010-222-2222"}}
						
						if (data.code == 1) {
							// 성공
							var booking = data.booking;
							var message = "이름:" + booking.name + "\n날짜:" + booking.date.slice(0,10) + "\n일수:" + booking.day
							+ "\n인원:" + booking.headcount + "\n상태:" + booking.state;
							
							alert(message);
						} else {
							// 실패
							alert('예약 내역이 없습니다');
						}
						
					}
					,error: function(e) {
						alert('서버 통신 실패');
					}
					
					
				});
				
			});
				
			
		});
	</script>
</body>
</html>