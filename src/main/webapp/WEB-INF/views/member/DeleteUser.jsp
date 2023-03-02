<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

</head>
<body>
		<div class="col-lg- col-xl-8 mx-auto" style="text-align: center;">
		<div class="card-body p-4 p-sm-5 mt-5">
	<label>비밀번호</label>
	<br>
	<input type="password" id="inputPw" class="form-control mt-1">
	<button onclick="checkPw()" class="btn btn-outline-danger mt-2">확인</button>
	<input type="hidden" id="result">
</div>
</div>

	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		function checkPw() {
			var inputPw = $('#inputPw').val();
			console.log(inputPw);
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/checkPassword",
				data : {
					"currentPw" : inputPw
				},
				async : false,
				success : function(result) {
					console.log(result);
					if (result == "OK") {
						var selectVal = confirm("정말 탈퇴하시겠습니까?");
						var deleteResult = false;
						console.log(selectVal);
						if(selectVal){
							deleteResult = deleteUserInfo();
						}
						window.opener.deleteCheck(selectVal);
						window.close();
					} else {
						alert("비밀번호 불일치");
					}
				}
			});
			
		}
		
		function deleteUserInfo(){
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath }/deleteUserInfo",
				async: false,
				success: function(result){
					if(result){
						return true;
					}else{
						return false;
					}
				}
			});
		}
	</script>
</body>
</html>