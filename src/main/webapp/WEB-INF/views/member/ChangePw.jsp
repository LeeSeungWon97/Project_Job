<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>현재 비밀번호</label>
	<br>
	<input type="password" id="currentPw">
	<br>
	<label>새 비밀번호</label>
	<br>
	<input type="password" id="newPw">
	<br>
	<label>새 비밀번호 확인</label>
	<br>
	<input type="password" id="newPwCheck">
	<br>
	<br>
	<input type="button" id="changeBtn" value="변경" onclick="changePw()">


	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 정규식 -->
	<script src="${pageContext.request.contextPath }/resources/js/regex.js"></script>

	<script type="text/javascript">
		var ischeckCpw = false;
		var ischeckNewPwForm = false;
		var isCheckNewPw = false;

		function checkCurrentPw() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/checkPassword",
				data : {
					"currentPw" : $('#currentPw').val()
				},
				async : false,
				success : function(result) {
					console.log(result);
					if (result == "OK") {
						ischeckCpw = true;
					} else {
						ischeckCpw = false;
						alert("현재 비밀번호 불일치");
						$('#currentPw').focus();
					}
				}
			});
		}

		function checkPwForm() {
			console.log("checkPwForm() 호출");
			var newPw = $('#newPw').val();
			var checkEn = false;
			var checkNum = false;
			var checkSc = false;

			isCheckPw = false;
			if (newPw.length >= 8 && newPw.length <= 16) {
				checkEn = checkRegex(newPw, 'en');
				checkNum = checkRegex(newPw, 'num');
				checkSc = checkRegex(newPw, 'sc');
				console.log("checkEn: " + checkEn + ", checkNum: " + checkNum
						+ ", checkSc: " + checkSc);
				if (checkEn && checkNum && checkSc) {
					ischeckNewPwForm = true;
				} else {
					ischeckNewPwForm = false;
					alert("비밀번호는 영문+숫자+특수문자(!,@,#,$,%)가 포함되어야 합니다.");
					$('#newPw').focus();
				}
			} else {
				ischeckNewPwForm = false;
				alert("비밀번호는 8~16글자 입니다.");
				$('#newPw').focus();
			}
			console.log("isCheckPw: " + isCheckPw);
		}

		function checkPw() {
			console.log("checkPw() 호출");
			isCheckNewPw = false;
			var inputPw = $('#newPw').val();
			var ReInputPw = $('#newPwCheck').val();
			if (inputPw == ReInputPw) {
				isCheckNewPw = true;
			} else {
				isCheckNewPw = false;
				alert("비밀번호를 확인하세요");
				$('#newPwCheck').focus();
			}
			console.log("isCheckNewPw: " + isCheckNewPw);
		}

		function changePw() {
			console.log("비밀번호 변경 요청");
			checkCurrentPw();
			if (ischeckCpw) {
				checkPwForm();
				if (ischeckNewPwForm) {
					checkPw();
					if (isCheckNewPw) {
						alert("변경확인");
						window.opener.$('.pw').val()= $('#newPw');
						window.opener.location.reload();
						window.close();
					}
				}
			}
		}
	</script>
</body>
</html>