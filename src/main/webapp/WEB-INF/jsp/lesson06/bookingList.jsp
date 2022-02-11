<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 페이지</title>
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
			<h1 class="text-center pt-3 pb-3">예약 목록 보기</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${booking}" var="booking">
					<tr>
						<td>${booking.name}</td>
						<td>${booking.date}</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							${booking.state}
							<%-- <c:choose>
								<c:if test="${booking.state == '대기중'}">
									<span class="text-primary">${booking.state}</span>
								</c:if>
								
								<c:if test="${booking.state == '확정'}">
									<span class="text-success">${booking.state}</span>
								</c:if>
							</c:choose> --%>
						</td>
						<td>
							<button type="button" class="del-btn btn-danger form-control" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
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
			//alert("c");
			$('.del-btn').on('click',function(e){
				//alert("c");
			var id = $(this).data('booking-id');
			//alert(id);
			  $.ajax({
				type: "POST"
				,url: "/lesson06/delete"
				,data: {"id":id}
				,success: function(data) {
					alert(data.result);
					location.reload();
				}
				,error: function(e) {
					alert("에러");
				}
			}); 
		  });
		});		
	</script>
</body>
</html>