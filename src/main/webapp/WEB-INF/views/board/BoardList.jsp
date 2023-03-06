<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>커뮤니티</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>

	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>

	<!-- Section  -->
	<section id="section">


		<div class="card mt-4 mb-4 shadow rounded-3" style="width: 1000px; border: 1px solid #e3e6f0;">

			<div class="d-flex justify-content-between">
				<div class="mt-4 mb-3">
					<div class="input-group mx-3" style="width: 100%;">
						<select id="selectType" class="form-select" style="border: 1px solid #ddd; max-width: 120px;">
							<option value="공고">제목</option>
							<option value="기업">내용</option>
							<option value="기업">작성자</option>
						</select> <input class="form-control" type="search" placeholder="검색어를 입력해주세요" aria-label="Search" name="searchValue" id="searchInput" style="border: 1px solid #ddd;">
						<button class="search-btn" onclick="" style="border: 1px solid #ddd; height: auto;">
							<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png" style="width: 90%; height: auto;">
						</button>
					</div>
				</div>
				<div class="mt-4 mb-3">
					<div class="mx-3">
						<button class="btn-dark btn-lg" style="color: white;" onclick="boardWritePage()">글쓰기</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="" style="line-height: 2.5;">
					<ul style="list-style: none; padding: 0; margin: 0; border-top: 1px solid #e1e5e8;">
						
						<c:forEach items="${boardList}" var="board">
							<li style="padding: 29px 20px 0;">
								<div class="topArea">
									<a href="" style="background: #f0f3f9; padding: 5px; color: #777;">태그: ${board.bhope}</a>
								</div>
								<div class="contArea" style="padding: 0 15px 25px; border-bottom: 1px solid #e1e5e8;">
									<div class="title" style="position: relative;">
										<a href="${pageContext.request.contextPath }/ViewBoardInfo?bno=${board.bno}"> <i class="icoQ_on qnaSpB" style="font-size: 30px;">Q</i> <span style="font-size: 30px; color: black; padding-left: 10px;">제목: ${board.btitle}</span>
										</a>
									</div>
									<div class="summary" style="color: #666; font-size: 20px; margin-bottom: 10px;">
										<a href=""> <span style="color: black; max-height: 3em; line-height: 1.5em;">내용: ${board.bcontents}</span>
										</a>
									</div>
									<div class="detail" style="font-size: 15px;">
										<span style="margin-right: 10px;">작성자: ${board.bmid}</span> <span style="margin-right: 10px;">작성일: ${board.bdate}</span> <span style="margin-right: 10px;">조회: ${board.bcount}</span> <span>추천: ${board.breplycount}</span>
									</div>
								</div>
							</li>
						</c:forEach>
						
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