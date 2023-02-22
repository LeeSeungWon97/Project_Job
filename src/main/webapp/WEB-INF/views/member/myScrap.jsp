<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스크랩</title>
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
			<div class="row my-4" style="width: 100%;">
				<div class="col-2 mx-4" style="width:15%;">
					<!-- SideBar -->
					<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
				</div>
	
				<div class="col-lg-10 col-xl-8" style="width: 70%;">
					<div class="card border-0 shadow rounded-3">
						<div class="card-body p-4 p-sm-5 mb-3">
							<c:forEach items="${myScrap }" var="myScrap">
								<input type="text" value="${myScrap.epciname }" readonly="readonly">
								<input type="text" value="${myScrap.epname }" readonly="readonly">
								<input type="text" value="${myScrap.epdeadline }" readonly="readonly">
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>