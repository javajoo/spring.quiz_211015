<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz02</title>
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
</head>
<body>
	<div class="container">
		<h1>HOT 5</h1>
		<!-- 상단에 제목이 있으면 thead와 tbody로 나눠준다. -->
		<!-- 왼쪽에 제목이 있으면 안나눠줘도 된다. -->
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<!-- 서버에서 내려온 객체 값이기 때문에 EL태그로 감싸줘야 한다. -->
				<!-- varStatus="status" count, index 사용할 때 쓴다. -->
				<c:forEach var="music" items="${musicRanking}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${music}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h1>멤버십</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>포인트</th>
			</tr>
		</thead>
		<tbody>
			<!--  varStatus="status" 안쓰면 생략해도 된다. -->
			<c:forEach var="member" items="${membership}">
				<tr>
					<td>${member.name}</td>
					<td>${member.phoneNumber}</td>
						<td>
						<!-- 따옴표 중복되면 상충되기 때문에 안에 문자열은 ''로 넣어준다. -->
							<c:choose>
								<c:when test="${member.grade eq 'VIP'}">
									<!-- 색깔 태그 넣을 때 span 태그에다가 준다. -->i
								</c:when>
	
								<c:when test="${member.grade eq 'GOLD'}">
									<span class="text-warning">${member.grade}</span>
								</c:when>
	
								<c:otherwise>
									${member.grade}
								</c:otherwise>
							</c:choose>
						</td>

					<td>
						<c:choose>
							<c:when test="${member.point >= 5000}">
								<span class="text-primary">${member.point}P</span>
							</c:when>
	
							<c:otherwise>
								${member.point}
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>