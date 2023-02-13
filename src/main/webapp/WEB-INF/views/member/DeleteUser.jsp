<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>비밀번호</label>
	<br>
	<input type="password" id="inputPw">
	<button onclick="checkPw()">확인</button>
	<input type="hidden" id="result">


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