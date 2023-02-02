<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<form action="${pageContext.request.contextPath }/loginMember" method="post" onsubmit="return checkInputVal(this)">
		<div>
			<input type="radio" id="personal" name="loginType" value="개인" checked>
			<label for="personal">개인</label>
			<input type="radio" id="company" name="loginType" value="기업">
			<label for="company">기업</label>
		</div>
		<div>
			<label>아이디</label>
			<input type="text" id="loginId" name="mid">
		</div>
		<div>
			<label>비밀번호</label>
			<input type="password" id="loginPw" name="mpw">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>


	<script type="text/javascript">
		function checkInputVal(formObj) {
			var selectType = formObj.loginType;
			var inputId = formObj.mid;
			var inputPw = formObj.mpw;
			if (inputId.value.length == 0) {
				alert("아이디를 입력해주세요.");
				inputId.focus();
				return false;
			} else if (inputPw.value.length == 0) {
				alert("비밀번호를 입력해주세요.");
				inputPw.focus();
				return false;
			} else {
				alert("로그인 성공!");
				return true;
			}
		}
	</script>
</body>
</html>