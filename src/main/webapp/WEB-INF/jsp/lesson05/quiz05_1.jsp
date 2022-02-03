<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력 페이지</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
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

<!-- datepicker-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
footer {
	height: 100px
}

.nav-font {
	font-weight: bold;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<section class="d-flex">
			<nav class="bg-primary col-2">
				<img src="/images/loggo.png" alt="로고" width="150" height="80">
				<ul class="nav">
					<li class="nav-item"><a href="" class="nav-link nav-font">날씨</a></li>
					<li class="nav-item"><a href="" class="nav-link nav-font">날씨입력</a></li>
					<li class="nav-item"><a href="" class="nav-link nav-font">테마날씨</a></li>
					<li class="nav-item"><a href="" class="nav-link nav-font">관측기후</a></li>
				</ul>
			</nav>
			<section class="col-10">
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="weather" items="${weatherhistory}">
							<tr>
								<td>
									<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd" var="date" />
									<fmt:formatDate value="${date}" pattern="yyyy년MM월dd일" />
								</td>
								<td>
									<img src="${weather.weather}" alt="사진">
								</td>
								<td>${weather.temperatures}˚C</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</section>
		</section>
		<hr>
		<footer class="d-flex">
			<div class="col-2">
				<img src="/images/loggo.png" alt="로고" width="150" height="80">
			</div>
			<div class="col-10 ">
				(07062) 서울시 동작구 여의대방로16길 61<br> Copyright@2020 KMA. ALL Rignts
				RESERVED.
			</div>
		</footer>
	</div>
</body>
</html>





