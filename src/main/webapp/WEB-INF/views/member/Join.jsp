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

	<title>JoinForm</title>
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/icon.png" />

    <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet" />

</head>

<body style="background: #F8FBFE;">
	<div class="join-container1">
		<div class="logo-join">
			<div class="logo">
				<a class="logo-link" href="${pageContext.request.contextPath }/">
				<img class="logo-img" style="padding-left:0px; width: 270px; height: auto; margin-top: 15px;"
					src="${pageContext.request.contextPath }/resources/assets/img/header-logo.png">
				</a>
			</div>
		</div>
	</div>
	
	<div class="join-container2">
		<div class="join-box">
			<div class="choose-member">
				<a class="choose choose-common" href="${pageContext.request.contextPath }/joinMemberPage">
					<button class="choose-btn common-btn" type="button">일반회원</button>
				</a>
				<a class="choose choose-company" href="${pageContext.request.contextPath }/joinCompanyPage">
					<button class="choose-btn company-btn" type="button">기업회원</button>
				</a>
			</div>
			간편로그인 기능
		</div>
	</div>

</body>
</html>