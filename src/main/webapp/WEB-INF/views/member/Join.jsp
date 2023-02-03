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
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row my-5 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<div class="d-grid mb-3">
							<div class="btn-group btn-group-lg">
								<a href="${pageContext.request.contextPath }/joinMemberPage" class="btn btn-outline-dark">개인회원</a>
								<a href="${pageContext.request.contextPath }/joinCompanyPage" class="btn btn-outline-dark">기업회원</a>
							</div>
						</div>
						<div class="d-flex justify-content-center">
							<img src="${pageContext.request.contextPath }/resources/assets/img/joinLogo.png" style="width:500px; height:190px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>