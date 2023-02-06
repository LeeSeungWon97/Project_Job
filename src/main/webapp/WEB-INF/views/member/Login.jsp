<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<title>로그인 | 굿잡</title>
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png" />

    <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet" />

</head>

<body style="background: #F8FBFE;">
	<div class="join-container1">
		<div class="logo-join">
			<div class="logo">
				<a class="logo-link" href="${pageContext.request.contextPath }/">
				<img class="logo-img" style="padding-left:0px; width: 270px; height: auto; margin: 15px 0px 0px 0px;"
					src="${pageContext.request.contextPath }/resources/assets/img/main-logo.png">
				</a>
			</div>
		</div>
	</div>

	
	<div class="login-container">
		<div class="login-box">
			
						<form action="${pageContext.request.contextPath }/loginMember" method="post" onsubmit="return checkInputVal(this)">
							
							<div class="login-select">
								<input type="radio" id="personal" name="loginType" value="개인" checked>
								<label for="personal">개인</label>							
								<input type="radio" id="company" name="loginType" value="기업">
								<label for="company">기업</label>
							</div>


							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="login-input" id="loginId" name="id" maxlength="15" placeholder="아이디" style="margin-top: 6px;">
							</div>

							<div class="input-group input-group-xs mb-3">
								<input type="password" id="loginPw" class="login-input" name="pw" maxlength="15" placeholder="비밀번호">
							</div>
							
							<div>
								<button class="login-btn" type="submit">로그인</button>
							</div>
							
							
						</form>


		</div>
	</div>



	<script type="text/javascript">
		function checkInputVal(formObj) {
			var selectType = formObj.loginType;
			var inputId = formObj.id;
			var inputPw = formObj.pw;
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