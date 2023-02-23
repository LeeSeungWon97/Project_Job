<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- Favicon-->
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />


</head>
<body>
	<!-- Header -->
	<header id="header">
	<div class="header-div">
		<div class="logo">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
			</a>
		</div>
	</div>
	</header>
	
	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="col-lg-10 col-xl-5" style="width: 45%;">
				<div class="card border-0 my-4 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<form action="${pageContext.request.contextPath }/FindMemberPw" method="post" onsubmit="return checkInputVal(this)">
							<div class="mb-2">
								<input type="radio" id="personal" name="loginType" value="개인" checked="checked">
								<label for="personal">개인</label>
								<input type="radio" id="company" name="loginType" value="기업">
								<label for="company">기업</label>
							</div>

							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="form-control" id="id" name="id" maxlength="15" placeholder="아이디">
							</div>
							<div class="d-grid mb-3">
								<button class="btn-lg" type="submit" style="background-color: #539DDB; border: solid #539DDB;"><span style="color: white;">비밀번호 찾기</span></button>
							</div>
						</form>
						<div>
							<span>아이디가 기억나지 않는다면? <a href="${pageContext.request.contextPath }/FindIdPage">아이디 찾기</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
	
	<script type="text/javascript">
		function checkInputVal(formObj) {
			var selectType = formObj.loginType;
			var id = formObj.id;
			if(id.value.length == 0){
				alert("아이디를 입력해주세요");
				id.focus();
				return false;
			} else {
				alert("등록하신 메일로 비밀번호가 발송되었습니다!");
				return true;
			}
		}
	</script>
</body>
</html>