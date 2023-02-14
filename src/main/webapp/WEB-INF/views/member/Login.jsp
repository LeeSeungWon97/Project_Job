<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>로그인 | 굿잡</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />


<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />

</head>
<body>

	<div class="d-flex justify-content-center">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 200px; height: 100px;">
		</a>
	</div>



	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-5 mx-auto">
				<div class="card flex-row my-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-4 mb-3">
						<form action="${pageContext.request.contextPath }/loginMember" method="post" onsubmit="return checkInputVal(this)">
							<div class="mb-2">
								<input type="radio" id="personal" name="loginType" value="개인" checked>
								<label for="personal">개인</label>
								<input type="radio" id="company" name="loginType" value="기업">
								<label for="company">기업</label>
							</div>

							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="form-control" id="loginId" name="id" maxlength="15" placeholder="아이디">
							</div>

							<div class="input-group input-group-xs mb-3">
								<input type="password" id="loginPw" class="form-control" name="pw" maxlength="15" placeholder="비밀번호">
							</div>

							<div class="d-grid mb-3">
								<button type="submit" class="btn-lg" style="background-color: #539DDB;">
									<span style="color: white;">로그인</span>
								</button>
							</div>
							<div>
								<span>
									아이디가 기억나지 않는다면?
									<a href="${pageContext.request.contextPath }/FindIdPage">아이디 찾기</a>
								</span>
								<br>
								<span>
									비밀번호가 기억나지 않는다면?
									<a href="${pageContext.request.contextPath }/FindPwPage">비밀번호 찾기</a>
								</span>
								<br>
								<span>
									회원가입이 필요하다면?
									<a href="${pageContext.request.contextPath }/join">회원가입</a>
								</span>
							</div>
						</form>

					</div>
				</div>
			</div>
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
				return true;
			}
		}
	</script>

</body>
</html>