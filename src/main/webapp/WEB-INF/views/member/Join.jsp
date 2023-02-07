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
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
    		<a class="navbar-brand" href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/assets/img/company-logo.png" style="width:120px; height:100px;"></a> 
    	</div>
		<div class="row">
			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row my-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<div class="d-grid mb-3">
							<div class="btn-group btn-group-lg">
								<a href="${pageContext.request.contextPath }/joinMemberPage" class="btn btn-outline-dark"><span class="fs-3">개인회원</span><br>
									<img src="${pageContext.request.contextPath }/resources/assets/img/person.png" style="width:200px; height:200px;">
								</a>
								<a href="${pageContext.request.contextPath }/joinCompanyPage" class="btn btn-outline-dark"><span class="fs-3">기업회원</span><br>
									<img src="${pageContext.request.contextPath }/resources/assets/img/company.png" style="width:200px; height:200px;">
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>