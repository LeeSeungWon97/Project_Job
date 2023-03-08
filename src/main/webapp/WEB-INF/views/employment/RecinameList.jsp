<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>열람기업</title>
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


<title>내 이력서</title>
<!-- Bootstrap icons-->
<style type="text/css">
.mainbox {
	width: 710px;
	padding: 30px;
	margin: 30px;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid #ebebeb;
	box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15);
}

h1 {
	font-size: 26px;
	margin-bottom: 35px;
}

.first {
	border-bottom: 2px solid #ebebeb;
	border-top: 2px solid #ebebeb;
	margin-bottom: 20px;
}

h3 {
	font-size: 13px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	padding-bottom: 5px;
}

h2 {
	font-size: 20px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	border-bottom: 2px solid black;
	padding-bottom: 5px;
}
</style>
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
				<div class="col-2  mx-4" style="width: 15%;">
					<!-- SideBar -->
					<div id="sideBar">
						<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
					</div>
				</div>


				<div class="col-lg-10 col-xl-8" style="width: 65%;">
					<div class="card border-0 shadow rounded-3">
						<div class="card-body p-4 p-sm-5 mb-3">
							<h1 style="text-align: center;">열람기업</h1>
							<div class="row">
								<c:choose>
									<c:when test="${Resume.reciname == null }">
										<p>열람한 기업이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach items="${Resume.reciname }" varStatus="i" step="1">
											<div style="padding: 10px;" class="list-group reserveArea">
												<div class="row" style="padding: 10px; border-bottom-style: dotted;">
													<a href="${pageContext.request.contextPath}/viewReciname?viewReciname=${Resume.reciname[i.index]}" target="_blank">${Resume.reciname[i.index]}</a>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>



	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var checkSide = '${sideX}';
			if (checkSide.length > 0) {
				$('#sideBar').addClass("d-none");
			}
		});
	</script>
</body>
</html>