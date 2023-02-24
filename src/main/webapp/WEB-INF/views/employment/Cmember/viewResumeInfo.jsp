<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>좋은 직장을 위한 취업플랫폼, 굿잡</title>
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.css"
	rel="stylesheet" />

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
	href="${pageContext.request.contextPath }/resources/assets/css/footer.css"
	rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">


<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- Bootstrap icons-->
<style type="text/css">
.mainbox {
	width: 750px;
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

.resumbox{
border: 1px solid #ebebeb;
margin: 3px;
height: 280px;


}
.resumbox:hover {
border: 2px solid #79BAEC;	
}
</style>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>

	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>




	



	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="mainbox">
				<h1 style="text-align: center;"><i class="bi bi-trophy-fill"></i> 우수 이력서</h1>
				<div class="section-l">
					<div class="section-l-bottom ">
						<div class="row">
							<c:forEach items="${ResumeList}" var="Resume">
								<div class="col-4 resumbox" style="padding: 15px;  width: 32.3%;">
									<%-- <a class="btn" href="${pageContext.request.contextPath}/viewApplyInfo?viewId=${Resume.remid}" target="_blank"> --%>
										<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
										<span class="h2" style="color: black;">${Resume.remid}</span>
									<!--</a>  -->
									<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
										<p class="card-text">${Resume.reedu[i.index]}</p>
										<p class="card-text">${Resume.reedu[i.index + 1]}</p>
									</c:forEach>
										<button class="mt-1" onclick="checkMtype('${Resume.remid}')" style="font-size: 14px; background-color: #ff7e00; border: solid #ff7e00;">
											<span style="color: white;">열람하기</span>
										</button>
						
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--  -->

				

			</div>

		</div>
	</section>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
	var loginType = '${loginType}';
	var loginId = $('#loginId').val();	
	
		$(document).ready(function() {
			var checkSide = '${sideX}';
			if (checkSide.length > 0) {
				$('#sideBar').addClass("d-none");
			}

		});
		
		function checkMtype(mid){
			console.log("checkMtype 호출");
			console.log(loginType);
			console.log();
			console.log(mid);
			if (loginId == "") {
				alert("로그인이 필요한 서비스입니다.");
				location.href = "${pageContext.request.contextPath}/login";
			} else if (loginType == "P") {
				alert("기업회원을 위한 서비스입니다.");
				return false;
			} else {
				location.href = "${pageContext.request.contextPath}/viewApplyInfo?viewId="+mid;
			}
		}
	

		
	</script>
</body>
</html>