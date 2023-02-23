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
<title>채용공고</title>
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
.content {
	border-bottom: 1px solid #ebebeb;
	border-top: 1px solid #ebebeb;
	padding: 20px;
}

p {
	margin: 1px;
}

.nowRs {
	margin-bottom: 80px;
}
</style>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<section id="section">
		<div class="section-div" style="justify-content:center;">
			<div class="col-lg-10 col-xl-8" style="width: 65%;">
				<div class="card mt-4 mb-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<div class="row-5 mx-auto mb-5">
							<h1>${epInfo.epname }</h1>
							<h5>${epInfo.epciname }</h5>
						</div>
						
						<div class="mb-5">
						<div class="row">
							<div class="col-5" style="margin-right: auto;">
								<h4>지원자격</h4>
							</div>
							<div class="col-5">
								<h4>근무조건</h4>
							</div>
						</div>
						<div class="row content">
							<div class="col-5" style="margin-right: auto;">
								
								<p>
									<strong>경력 : </strong> ${epInfo.epcareer }
								</p>
								<br>
								<p>
									<strong>학력 : </strong> ${epInfo.epedu }
								</p>
								<br>
								<p>
									<strong> 우대 : </strong> ${epInfo.eptreat }
								</p>
							</div>
							<div class="col-5">
								<p>
									<strong>급여 : </strong> ${epInfo.epmoney }<br>
								</p>
								<br>
								<p>
									<strong>시간 : </strong> ${epInfo.eptime }<br>
								</p>
								<br>
								<p>
									<strong>고용형태 : </strong> ${epInfo.eptype }<br>
								</p>
								<br>
								<p>
									<strong>지역 : </strong> ${epInfo.eparea }
								</p>
							</div>
						</div>
						</div>
						<div style="text-align: right; margin: 30px">
							<input type="button" class="btn btn-warning btn-lg mx-1" onclick="WriteResume('${epInfo.epnum }')" value="즉시지원"> <input type="button" class="btn btn-secondary btn-lg" onclick="deleteInfo()" value="스크랩하기">
						</div>
						<div style="text-align: center; margin: 5px">
							<a href="${pageContext.request.contextPath }/EmploymentPage">
								<button type="button" class="btn btn-outline-danger btn-lg">
									<i class="bi bi-file-excel"></i> 닫기
								</button>
							</a>
						</div>
					</div>
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
	$(document).ready(function(){
		selectScrapInfo();
	});
</script>
<script type="text/javascript">
	function WriteResume(epnum) {
		console.log(epnum)
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
		} else if (loginType == "C") {
			alert("일반회원을 위한 서비스입니다.");
			location.reload();
		} else {
			window.open("${pageContext.request.contextPath}/WriteResumePage?epnum="+epnum,
					"이력서 선택", "width=400,height=400,top=10,left=100");
		}

	}
	</script>


<script type="text/javascript">	
		function checkVal(checkedName, selBtn){
		console.log(checkedName);
		
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
			return null;
		} 
		if ($(selBtn).hasClass("scrap_click")) {
			$(selBtn).removeClass("scrap_click");
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/removeScrap",
				data : {"checkedName" : checkedName},
				dataType : "json",
				success:function(result){
				}
			});
			
		}else{
		$(selBtn).addClass("scrap_click");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/scrapEpname",
			data : {"checkedName" : checkedName},
			dataType : "json",
			success:function(result){
			}
		});
		}
		
		}
		
		function selectScrapInfo(){
			$.ajax( { 
				type : "get",
				url : "${pageContext.request.contextPath }/selectScrapInfo",
				async:false,
				dataType:"json",
				success : function(scrapList){
						 for(var scrapinfo of scrapList){
						 $("#"+scrapinfo.spepnum).addClass("scrap_click");
						 }
					
				}
			} );			
		}
		
		
		
	</script>

</html>