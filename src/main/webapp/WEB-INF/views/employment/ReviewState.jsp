<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>취업후기</title>
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

<style type="text/css">
.scrap {
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	border: none;
	background-color: transparent;
}

.scrap:hover {
	text-shadow: 0 0 0 #fdf002; /* 마우스 호버 */
	text-shadow: 0 0 0 #fdf002; /* 마우스 호버 뒤에오는 이모지들 */
	text-shadow: 0 0 0 #fdf002; /* 마우스 클릭 체크 */
}

.scrap_click {
	text-shadow: 0 0 0 #fdf002;
}

.top {
	border: 2px solid #79BAEC;
	padding: 3px;
	padding-top: 0px;
	display: scroll;
	position: fixed;
	bottom: 30px;
	right: 275px;
	text-align: center;
	color: #79BAEC;
}

.Rmenu {
	text-align: center;
}

.Rvcon {
	width: 20px;
	background-color: red;
	border-radius: 30%;
	text-align: center;
	color: white;
	text-align: center;
	margin-left: 50px;
}

.menu {
	color: black;
}
</style>




</head>
<body>

	<!-- topbar -->
	<a class="top" href="javascript:window.scrollTo(0,0);"><i class="bi bi-caret-up-fill"></i><br> TOP</a>


	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="card mt-4 mb-4 shadow rounded-3 " style="width: 65%;">

				<ul style="width: 100%; padding-right: 2rem; margin-top: 1rem">
					<c:forEach items="${cinfoList }" var="cinfo">
						<li style="list-style: none; border-bottom: 1px solid #ebebeb; width: 100%;">
							<div class="d-flex" style="width: 100%; padding: 1rem; align-items: center; display: flex;">
								<div class="cLogo col-2">
									<img class="card-img-top" src="${pageContext.request.contextPath }/resources/assets/img/building.png" style="width: 80%; height: auto;"> <br>
									<span class="h5">${cinfo.ciname }</span>
								</div>
								<div class="col-2 Rmenu">
									<c:forEach items="${reviewcount }" var="review">
										<c:if test="${cinfo.ciname == review.RVCINAME && review.RVTYPE == '2'}">
											<div class="Rvcon mb-1">${review.RVCOUNT }</div>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath }/ViewReview?rvtype=2&ciname=${cinfo.ciname }"><span class="h5 menu">인적성후기</span></a>
								</div>

								<div class="col-2 Rmenu">
									<c:forEach items="${reviewcount }" var="review">
										<c:if test="${cinfo.ciname == review.RVCINAME && review.RVTYPE == '3'}">
											<div class="Rvcon mb-1">${review.RVCOUNT }</div>
										</c:if>
									</c:forEach>

									<a href="${pageContext.request.contextPath }/ViewReview?rvtype=3&ciname=${cinfo.ciname }"><span class="h5 menu">면접후기</span></a>
								</div>
								<div class="col-2 Rmenu">
									<c:forEach items="${reviewcount }" var="review">
										<c:if test="${cinfo.ciname == review.RVCINAME && review.RVTYPE == '4'}">
											<div class="Rvcon mb-1">${review.RVCOUNT }</div>
										</c:if>
									</c:forEach>
									<a href="${pageContext.request.contextPath }/ViewReview?rvtype=4&ciname=${cinfo.ciname }"><span class="h5 menu">최종합격후기</span></a>
								</div>

								<div style="margin-left: 15px;">
									<button class="btn btn-secondary btn-sm" onclick="WriteReview('${cinfo.cinum}')">후기작성하기</button>
								</div>

							</div>
						</li>

					</c:forEach>
				</ul>
				<div class="mx-auto my-auto">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item active"><a class="page-link" href="#">다음></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>




















	<input type="hidden" id="loginType" value="${sessionScope.loginType }">
	<c:choose>
		<c:when test="${sessionScope.loginType == 'P'}">
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.cmid }">
		</c:otherwise>
	</c:choose>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var loginType = $('#loginType').val();
	var loginId = $('#loginId').val();
	$(document).ready(function() {

	});
</script>
<script type="text/javascript">
	function WriteReview(cinum) {
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
		} else if (loginType == "C") {
			alert("일반회원을 위한 서비스입니다.");
			location.reload();
		} else {
			window.open("${pageContext.request.contextPath}/ReviewType?cinum="
					+ cinum, "후기작성 ", "width=900,height=1500,top=10,left=100");
		}

	}
</script>


<script type="text/javascript">
	
</script>

</html>