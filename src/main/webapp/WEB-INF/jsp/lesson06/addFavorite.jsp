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
		<form method="post" action="/lesson06/add_Favorite">
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			
			<div class="form-group">
				<label for="url">주소</label>
				<input type="text" class="form-control" id="url" name="url">
			</div>
			<button type="button" class="btn btn-success form-control" id="addBtn">추가</button>
			</form>
	</div>
	
	<script>
	$(document).ready(function() {	
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
		
		
		
		$.ajax({
			type: "post"
			, url: "/lesson06/add_Favorite"
			, data: {"name":name, "url":url}
			, success: function(data) {
				alert(data);
				location.href = "/lesson06/get_Favorite";
			}
			, error: function(e) {
				alert("error: " + e)
			}
		});
		});
	});
</script>
</body>
</html>