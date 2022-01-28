<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz03</title>
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
		<h1>1.후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표 수</th>
					<th>득표 율</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="candidate" items="${candidates}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><fmt:formatNumber value="${candidate}" type="number" /> </td>
						<td><fmt:formatNumber value="${candidate / totalCount}" type="percent" /></td>
						<%-- value="${candidate / totalCount}"와 같은 결과가 나온다. --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h1>2.카드 명세서</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cardBill" items="${cardBills}">
					<tr>
						<td>${cardBill.store}</td>
						<td><fmt:formatNumber value="${cardBill.pay}" type="currency" /></td>
						<td>
							<fmt:parseDate value="${cardBill.date}" pattern="yyyy-MM-dd" var="date" />
							<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" />
						</td>
						<td>${cardBill.installment}</td>
						<%--
						스트링을 날짜로 바로 변환할 수 없다.
						데이트 객체를 포맷으로 변환 후 내가 원하는 스트링으로 재변환 해줘야 한다.
						fmt:formatDate 데이트가 된다 스트링 - > 데이트
						pattern="yyyy-MM-dd" 에 스트링에 들어있는 패턴을 넣어줘야 한다
						바로 출력안할거면 var 저장해놓고 출력할 때 변수 사용하면 된다.
						바로 출력할거면 var 저장안하면 바로 출력이 된다.
						 --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>