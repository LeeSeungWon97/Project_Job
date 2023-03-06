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
	border: 1px solid gray;
	background-color: gray;
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
	margin-top: 30px;
	border-left: 1px solid #ebebeb;
	border-right: 1px solid #ebebeb;
}

.topBox {
	padding-top: 15px;
	border-top: 2px solid black;
}

h5 {
	margin-bottom: 15px;
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
			<div class="card mt-4 mb-4  border-0 shadow rounded-3">
				<div class="card-body p-4 p-sm-5 mb-3">
					<div class="">
						<div class="row-5 mx-auto topBox">
							<h6>${epInfo.epciname }</h6>
							<h3>${epInfo.epname }</h3>
						</div>
						
							<div class="mt-1" style="text-align: right;">
						~ ${epInfo.epdeadline}
						</div>
						
						<div class="row content">
							<div class="col-6" style="margin-right: auto;">
								<h5>지원자격</h5>
								<p>
									<strong>경력:</strong> ${epInfo.epcareer }<br>
								</p>
								<p>
									<strong> 학력:</strong> ${epInfo.epedu }<br>
								</p>
								<p>
									<strong> 우대:</strong> ${epInfo.eptreat }
								</p>
							</div>
							<div class="col-6">
								<h5>근무조건</h5>
								<p>
									<strong> 급여 : </strong> ${epInfo.epmoney }<br>
								</p>
								<p>
									<strong> 시간 : </strong>${epInfo.eptime }<br>
								</p>
								<p>
									<strong>고용형태 :</strong> ${epInfo.eptype }<br>
								</p>
								<p>
									<strong> 지역 : </strong>${epInfo.eparea }</p>
							</div>
						</div>

					</div>


					<div style="text-align: center; margin: 30px">
						<c:choose>
							<c:when test="${epInfo.epesstate == 'x' }">
								<button type="button" class="btn btn-warning btn-lg mx-1" onclick="WriteResume1('${epInfo.epnum }','${epInfo.epdeadline }')">
									<i class="bi bi-check-lg"></i> 즉시지원
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-warning btn-lg mx-1" onclick="WriteResume2('${epInfo.epnum }','${epInfo.epciname }','${epInfo.epdeadline }')">
									<i class="bi bi-check-lg"></i> 즉시지원
								</button>
							</c:otherwise>

						</c:choose>
						<input type="button" class="btn btn-lg scrap" id="${epInfo.epnum }" onclick="checkVal('${epInfo.epnum }', this)" value="⭐ 스크랩">
					</div>
					<div class="mt-5" style="text-align: center;">
						
							<button type="button" class="btn btn-outline-danger" onclick="backpage()">
								<i class="bi bi-file-excel"></i> 닫기
							</button>
						
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
	function checkDate(date){
	var today = new Date();
	var targetDay = new Date(date);
	return today > targetDay;
	}
	
	
	function WriteResume2(epnum, epciname, epdeadline) {
		if(checkDate(epdeadline)){
			alert("지원 마감");
		}else{
		console.log("자소서 창");
		var popupWidth = 900;
		var popupHeight = 950;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY = (window.screen.height/2)-(popupHeight/2);
		console.log(epnum);
		console.log(epciname);
		window.open("${pageContext.request.contextPath }/WriteEssayPage?epnum=" + epnum + "&epciname=" + epciname,
				"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);
		}
	}
	
	function WriteResume1(epnum, epdeadline) {
		if(checkDate(epdeadline)){
			alert("지원 마감");
		}else{
			
		console.log("이력서창")
		var popupWidth = 900;
		var popupHeight = 950;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY = (window.screen.height/2)-(popupHeight/2);
		console.log(epnum);
		window.open("${pageContext.request.contextPath}/myResume?sideX=sideX&epnum="+epnum+"&state=1",
				"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);
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
		
		function backpage(){
			var referrer = document.referrer;
			if(referrer == 'http://localhost:8080/controller/login'){
				history.go(-2);
			} else{
				history.back();
			}
			
			
		}
		
	</script>

</html>