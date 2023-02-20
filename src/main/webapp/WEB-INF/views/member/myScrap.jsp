<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Scrap</title>
<!-- Favicon-->
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 200px; height: 100px;">
			</a>
		</div>
		<div class="row">
			<div class="col-2">
				<!-- SideBar -->
				<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
			</div>

			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row  border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<c:forEach items="${myScrap }" var="myScrap">
							<input type="text" value="${myScrap.epciname }">
							<input type="text" value="${myScrap.epname }">
							<input type="text" value="${myScrap.epdeadline }">
							<br>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>