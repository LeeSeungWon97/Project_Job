<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>공고이름 | 굿잡</title>
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png" />

<link
	href="${pageContext.request.contextPath }/resources/assets/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/nav.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/section.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/joincompany.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/acontents.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.css"
	rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

</head>

<body>
	<!-- Start Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp" %>
	<!-- End Header -->

	<!-- Start Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<!-- End Nav -->



	<div class="acontents">
		<div class="cont1">
			<div class="top">
				<div class="cont1-top">
					<div class="cont1-top1">
						<div class="cont1-title-1">기업 이름</div>
						<div class="cont1-title-2">
							<button class="interest" type="button">관심기업</button>
						</div>
						<div class="cont1-title-2">
							<button class="scrap" type="button">스크랩</button>
						</div>
						<div class="cont1-title-2">
							<button type="button">지원</button>
						</div>
					</div>
					<div class="cont1-top2">
						<div class="atitle">채용 공고 제목</div>
					</div>
					<div class="cont1-top3">
						<div class="cont1-top3-1">
							<div class="qualification">
								지원자격 <br>
								<span class="cont1-sub1">경력</span> <span class="cont1-sub2">데이터</span> <br>
								<span class="cont1-sub1">학력</span> <span class="cont1-sub2">데이터</span> <br>
								<span class="cont1-sub1">우대</span> <span class="cont1-sub2">데이터</span> <span class="cont1-sub2">데이터</span>

							</div>
						</div>
						<div class="cont1-top3-2">
							<div class="condition">근무조건<br>
								<span class="cont1-sub1">고용형태</span> <span class="cont1-sub2">데이터</span> <br>
								<span class="cont1-sub1">급여</span> <span class="cont1-sub2">데이터</span> <br>
								<span class="cont1-sub1">지역</span> <span class="cont1-sub2">데이터</span> <br>
								<span class="cont1-sub1">시간</span> <span class="cont1-sub2">데이터</span>
							
							</div>
						</div>
					</div>
				</div>
				<div class="cont1-top4">
				<div class="cont1-img">
				<img class="cont1-img" src="${pageContext.request.contextPath }">
				</div>
				<div class="cont1-coinfo">기업정보<br>
					<span class="cont1-sub1">업종</span> <span class="cont1-sub2">데이터</span> <br>
					<span class="cont1-sub1">설립년도</span> <span class="cont1-sub2">데이터</span> <br>
					<span class="cont1-sub1">기업형태</span> <span class="cont1-sub2">데이터</span> <br>
					<span class="cont1-sub1">홈페이지</span> <a href="${pageContext.request.contextPath }">url</a>
				</div>
				</div>
			</div>
			<div class="bottom">
				<div class="cont1-contests">
					내용<br> 내용<br> 내용<br> 내용<br> 내용<br> 내용<br>
					내용<br> 내용<br> 내용<br> 내용<br> 내용<br> 내용<br>
					내용<br> 내용<br> 내용<br>
				</div>
			</div>
		</div>
	</div>




	<!-- Start Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>
	<!-- End Footer-->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>

</html>