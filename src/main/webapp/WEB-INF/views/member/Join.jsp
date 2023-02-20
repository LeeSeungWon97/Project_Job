<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JoinForm</title>
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
		<div class="section-div">
			<div class="col-lg-10 col-xl-8" style="width: 100%;">
				<div class="card mt-4 mb-4 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<div class="d-grid mb-3">
							<div class="btn-group btn-group-lg">
								<a href="${pageContext.request.contextPath }/joinMemberPage" class="btn btn-outline-info" style="border: solid #539DDB;"><span class="fs-3" style="color: black;">개인회원</span><br>
									<img src="${pageContext.request.contextPath }/resources/assets/img/person.png" style="width:200px; height:300px;">
								</a>
								<a href="${pageContext.request.contextPath }/joinCompanyPage" class="btn btn-outline-info"  style="border: solid #539DDB;"><span class="fs-3" style="color: black;">기업회원</span><br>
									<img src="${pageContext.request.contextPath }/resources/assets/img/company.png" style="width:200px; height:300px;">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>