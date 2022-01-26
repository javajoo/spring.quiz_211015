<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01 - JSTL Core 라이브러리</title>
</head>
<body>

	<!-- 처음에 코어 노란줄 뜨면 라이브러리가 들어갔는지 가장 먼저 확인한다! -->

	<h2>1. JSTL core 변수</h2>
	<c:set var="number1" value="36" />
	<c:set var="number2" value="3" />
	<b>첫번째 숫자: ${number1} </b><br><br>
	<b>두번째 숫자: ${number2} </b><br>
	
	<h2>2. JSTL core 연산</h2>
	<b>더하기: ${number1 + number2} </b> <br><br>
	<b>빼기: ${number1 - number2} </b> <br><br>
	<b>곱하기: ${number1 * number2} </b> <br><br>
	<b>나누기: ${number1 / number2} </b> <br>
	
	<h2>3. core out</h2>
	<b><c:out value="<title>core out</title>" /></b><br>
	
	<h2>4. core if</h2>
	<c:if test="${(number1 + number2) / 2 >= 10}">
		<h1>${(number1 + number2) / 2}</h1>
	</c:if>
	
		<c:if test="${(number1 + number2) / 2 < 10}">
		<h3>${(number1 + number2) / 2}</h3>
	</c:if>
	
	<h2>5. core if</h2>
	<c:if test="${(number1 * number2) > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
	
</body>
</html>