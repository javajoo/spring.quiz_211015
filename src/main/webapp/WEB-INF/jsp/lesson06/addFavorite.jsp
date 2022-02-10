<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨  찾기 추가하기</title>
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
		<h1>즐겨 찾기 추가하기</h1>
		<!-- ajax 사용할거면 위쪽에 form 태그 안만들어도 된다!! -->
		<!-- form 태그에서만 submit 버튼을 쓴다. -->
		<!-- name속성도 필요가 없다!!! -->
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" class="form-control" id="name" >
			</div>
			
			<div class="form-group">
				<label for="url">주소</label>
				<div class="d-flex">
					<input type="text" class="form-control col-10 mr-3" id="url" >
					<input type="button" id="nameCheckBtn" class="form-control btn-info" value="중복확인">
				</div>
				<!-- 1번째 방법 -->
				<div id="nameStatusArea"></div>
				
				<!-- 2번째 방법 -->
				<!-- 중복인 경우 나타내고 아닌 경우 숨긴다. -->
				<span id="isDuplicationText" class="text-danger d-none">중복된 url 입니다.</span>
				<span id="availableText" class="text-success">저장가능한 url 입니다.</span>
			</div>
			<button type="button" class="btn btn-success form-control" id="addBtn">추가</button>
			<!-- button 타입 안정해놓으면 form태그로 인식한다! -->
	</div>
	
	<script>
	$(document).ready(function() {	
		
		// 즐겨찾기 추가 버튼
		$('#addBtn').on('click',function(e){
			var name = $('#name').val().trim();
			if(name.length < 1) {
				alert("이름을 입력 해주세요")
				return;
			}
			
			var url = $('#url').val().trim();
			if(url == '') {
				alert("url을 입력 해주세요")
				return;
			}
		
			// http도 아니고 https도 아닐 때 => 얼럿을 띄워야 함 (and)
			if (url.startsWith('http') == false && url.startsWith('https') == false) {
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			// quiz02 - 중복확인 체크 
			if ($('#availableText').hasClass("d-none")) {
				// 저장 가능 url 문구가 없으면 검사를 다시 해야한다.
				alert("다시 중복 확인을 해주세요");
				return;
			}
			
		
		// 서버 호출
		$.ajax({
			/* "" 큰따옴표로 해주는 게 좋다! */
			type: "post"
			, url: "/lesson06/add_favorite"
			, data: {"name":name, "url":url}
			, success: function(data) {
				//alert(data.result);
				if (data.result == "success") {
					// 성공한게 맞으면 목록 화면으로 이동
					location.href = "/lesson06/get_favorite";
				} 
			}
			, error: function(e) {
				alert("error: " + e)
			}
		});
	  });
		
		
		// 중복 확인 버튼
		
		$('#nameCheckBtn').on('click',function(e) {
			
			//alert("click");
			var url = $('#url').val().trim();
			
			if (url == '') {
				alert("검사할 url을 입력 해주세요");
				return;
			}
			$('#nameStatusArea').empty();
			
			
			$.ajax({
				type:"POST"
				,url:"/lesson06/is_duplication"
				,data: {"url":url}
				,success: function(data) {
					
					if (data.is_duplication == true) { 
						// 중복일 때
						$('#nameStatusArea').append('<span class="text-danger">중복된 url 입니다.</span>')
						//$('#isDuplicationText').removeClass("d-none");
						//$('#availableText').addClass("d-none");
						
					} else { 	
						// 중복이 아닐 때
						$('#nameStatusArea').append('<span class="text-success">저장 가능한 url 입니다.</span>');
						//$('#availableText').removeClass("d-none");
						//$('#isDuplicationText').addClass("d-none");
					}
				}
				,errer: function(e) {
					alert("error");
				}
			});
			
			
		});
			
	});
</script>
</body>
</html>