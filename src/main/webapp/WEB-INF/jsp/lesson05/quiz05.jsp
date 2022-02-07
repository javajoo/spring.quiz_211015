<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="mt-3 ml-3">
					<h3>날씨 입력</h3>
				</div>
				<form method="post" action="/lesson05/quiz05/add">
					<div class="d-flex mt-5 mb-5 d-flex justify-content-between">
						<div class="d-flex">
							<label for="date">날짜</label>
							<div>
								<input type="text" id="date" name="date"
									class="form-control ml-1">
							</div>
						</div>

						<div class="d-flex">
							날씨
							<div>
								<select name="weather" class="form-control ml-1">
									<option value="맑음">맑음</option>
									<option value="구름조금">구름조금</option>
									<option value="흐림">흐림</option>
									<option value="비">비</option>
								</select>
							</div>
						</div>

						<div class="d-flex">
							미세먼지
							<div>
								<select name="microDust" class="form-control ml-1">
									<option value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="최악">최악</option>
								</select>
							</div>
						</div>
					</div>

					<div class="d-flex justify-content-between">
						<div class="d-flex">
							<label for="temperatures">기온</label>
							<div class="d-flex">
								<input type="text" id="temperatures" name="temperatures"
									class="form-control ml-1">
								<div>
									<input type="submit" value="˚C" class="btn btn-secondary">
								</div>
							</div>
						</div>

						<div class="d-flex">
							<label for="precipitation">강수량</label>
							<div class="d-flex">
								<input type="text" id="precipitation" name="precipitation"
									class="form-control">
								<div>
									<input type="submit" value="mm" class="btn btn-secondary">
								</div>
							</div>
						</div>

						<div class="d-flex">
							<label for="windSpeed">풍속</label>
							<div class="d-flex">
								<input type="text" id="windSpeed" name="windSpeed"
									class="form-control">
								<div>
									<input type="submit" value="km/h" class="btn btn-secondary">
								</div>
							</div>
						</div>
					</div>

					<div class="d-flex justify-content-end">
						<input type="submit" value="저장" class="btn btn-success mt-5 mb-5">
					</div>
				</form>
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
	
	<script>
		$(document).ready(function(){
			$('#date').datepicker({
				dateFormat: 'yy-mm-dd' // 2022-02-07
			});
			
		});
	</script>
	
</body>
</html>





