<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
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
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favoriteList}"  var="favoriteList" >
				<tr>
					<td>${favoriteList.id}</td>
					<td>${favoriteList.name}</td>
					<td>${favoriteList.url}</td>
					<td>
					<%-- 1) name 속성과 value 속성을 이용해서 삭제버튼 감지 --%>
					
					
					<%-- 2) data를 이용해서 태그에 임시 저장해놓기 --%>
					<!-- id로 하면 하나의 버튼만 선택되니까 class로 해서 여러버튼 선택될 수 있도록 해준다. -->
					<!-- data-favorite-id 무조건 하이픈으로 연결해줘야 한다.  data- : 문법 뒤부터가 변수!!-->
					<button type="button" class="deleteBtn btn btn-danger" data-favorite-id="${favoriteList.id}">삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(e){
			// 1) name 속성과 value 속성을 이용해서 삭제버튼 감지
			    //var id = e.target.value;
		
			// 2) data를 이용해서 태그에 임시 저장해놓기
		 	$('.deleteBtn').on('click',function(e){
				//var id = $(this).attr('value'); 
				
				// 많이 사용한다!! 잘 알고 있기!!
				// 태그: date-favorite-id 속성      date-   그 뒤부터는 우리가 이름을 정한다. (반드시 -)
				// 자바스크립트 : $(this).data('favorite-id');
				var id = $(this).data("favorite-id");
				//alert(id);
				
				// id가 반드시 있어야 그 행이 삭제된다. id를 안넘기면 전체가 삭제된다.
			
				
				// AJAX를 호출했는데 ERROR 쪽으로 가면 통신 자체가 안된 것이다.
				  $.ajax({
					// POST 방어용으로 좋다!!! (개인정보)
					type: "POST"
					,url: "/lesson06/delete_favorite"
					// "id" : controller의 값 , id: jsp의 값
					,data: {"id":id}
					,success: function(data){
						//alert(data.result); // controller의 result 키 값 호출
					
								location.reload(); // 새로고침
								//location.href="/lesson06/get_favorite"
						
						// controller에서 삭제가 되고 나서 들어오기 때문에 여기서는 새로고침만 해주면 된다.
					}
					,error: function(e) {
						alert("error");
					}
				});  
			});
		});
	</script>
</body>
</html>