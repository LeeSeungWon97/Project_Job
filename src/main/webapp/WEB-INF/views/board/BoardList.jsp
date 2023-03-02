<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>좋은 직장을 위한 취업플랫폼, 굿잡</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>

	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>

	<!--start board  -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<!-- Page Heading -->
			<div class="row">
				<div align="right">
					<button style="align-items:" onclick="boardWritePage()">글작성버튼</button>
				</div>
			</div>
			<div class="row" style="text-align: center; padding-top: 20px;">
				<div class="col-4" style="">
					<button>좋아요 남긴 글</button>
				</div>
				<div class="col-4">
					<button>인기</button>
				</div>
				<div class="col-4">
					<button>전체</button>
				</div>
			</div>
			<!-- Content Row -->
			<!-- DataTales Example -->
			<div>
				<div style="padding: 10px;" class="list-group reserveArea">
					 <c:forEach items="${boardList}" var="board"> 
					 
					<div class="row" style="padding: 10px; border-style: groove;">
						<a href="${pageContext.request.contextPath }/ViewBoardInfo?bno=${board.bno}">
						<div class="row-2">
							<p class="lead">${board.btitle}</p>
						</div>
						<div class="row-5" style="overflow:hidden;">
							<p class="lead">${board.bcontents }</p>
						</div>
						</a>
						<div class="row-2">
							<div class="small mb-1">${board.bhope}, 좋아요, ${board.breplycount}</div>
						</div>
					</div>
					</c:forEach> 
				</div>

			</div>

		</div>
		<input type="hidden" id="loginType" value="${sessionScope.loginType }">
		<c:choose>
			<c:when test="${sessionScope.loginType == 'P'}">
				<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
			</c:when>
			<c:otherwise>
				<input type="hidden" id="loginId" value="${sessionScope.loginInfo.cmid }">
			</c:otherwise>
		</c:choose>
		<div class="col-2"></div>
	</div>
	<!--end board  -->

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>
</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var loginType = $('#loginType').val();
	var loginId = $('#loginId').val();	

	function boardWritePage() {
		console.log("글작성 버튼 클릭");
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
			return null;
		}
		location.href = "${pageContext.request.contextPath }/BoardWritePage"

	}
</script>
</html>