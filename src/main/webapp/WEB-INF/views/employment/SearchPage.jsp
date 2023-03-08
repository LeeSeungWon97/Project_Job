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

.d_none {
	display: none;
}

.Shearhnav {
	border-bottom: 2px solid #ebebeb;
	margin-top: 10px;
}

.top {
	border: 2px solid #79BAEC;
	padding: 3px;
	padding-top: 0px;
	display: scroll;
	position: fixed;
	bottom: 20px;
	right: 60px;
	text-align: center;
	color: #79BAEC;
}
</style>

</head>
<body>

	<!-- topbar -->
	<a class="top" href="javascript:window.scrollTo(0,0);"> <i class="bi bi-caret-up-fill"></i><br> TOP
	</a>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>

	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<section id="section">
		<div class="section-div">
			<div class="row">
				<div class="mt-2">
					<h5>"${searchValue}"에 대한 검색결과</h5>
				</div>
				<div class="card mt-1 mb-4 shadow rounded-3">
					<div class="table-responsive">

						<nav class="justify-content-start Shearhnav">
							<ul class="nav nav-pills" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" data-bs-toggle="pill" role="tab" aria-selected="true" onclick="changeVal1()">채용정보</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" data-bs-toggle="pill" role="tab" aria-selected="false" onclick="changeVal2()">기업정보</button>
								</li>
							</ul>
						</nav>

						<table class="table table-hover" id="section1" style="border-radius: 50px; text-align: center;">
							<thead>
								<tr>
									<th scope="col">기업명</th>
									<th scope="col">공고제목</th>
									<th scope="col">마감일</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty epList}">
										<td colspan="4">검색결과가 없습니다.</td>
									</c:when>
									<c:otherwise>
										<c:forEach items="${epList }" var="employ">
											<tr>
												<td><a href="${pageContext.request.contextPath }/viewReciname?viewReciname=${employ.epciname }"> ${employ.epciname } </a></td>
												<td><input type="button" class="scrap" id="${employ.epnum }" onclick="checkVal('${employ.epnum }', this)" value="⭐"> &nbsp; <a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${employ.epnum }"> <span style="color: #333; font-weight: bold;">${employ.epname }</span>
												</a></td>
												<td>${employ.epdeadline }</td>
												<td><c:choose>
														<c:when test="${employ.epesstate == 'x' }">
															<button class="mt-1" onclick="WriteResume1('sideX','${employ.epnum }','${employ.epdeadline }')" style="font-size: 14px; background-color: #ff7e00; border: solid #ff7e00;">
																<span style="color: white;">즉시지원</span>
															</button>
														</c:when>
														<c:otherwise>
															<button class="mt-1" onclick="WriteResume2('${employ.epnum }','${employ.epciname }','${employ.epname }','${employ.epdeadline }')" style="min-width: 85px; font-size: 14px; background-color: #19ce60; border: solid #19ce60;">
																<span style="color: white;">즉시지원</span>
															</button>
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table class="table table-hover d_none" id="section2" style="border-radius: 50px; text-align: center;">
							<thead>
								<tr>
									<th scope="col">기업명</th>
									<th scope="col">기업규모</th>
									<th scope="col">대표자명</th>

								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty ciList }">
										<td colspan="3">검색결과가 없습니다.</td>
									</c:when>
									<c:otherwise>
										<c:forEach items="${ciList }" var="ciList">
											<tr>
												<td><a href="${pageContext.request.contextPath }/viewCiInfo?cinum=${ciList.cinum}"> ${ciList.ciname }</a></td>
												<td>${ciList.citype }
												<td>${ciList.cileader }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
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

function WriteResume1(sideX, epnum, epdeadline) {
	console.log(epdeadline);
	if(checkDate(epdeadline)){
		alert("지원 마감");
	} else{
		var popupWidth = 900;
		var popupHeight = 950;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY = (window.screen.height/2)-(popupHeight/2);
		console.log(sideX);
		console.log(epnum);
		window.open("${pageContext.request.contextPath}/myResume?sideX="+sideX+"&epnum="+epnum+"&state=1",
				"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);			
	}
}

function WriteResume2(epnum, epciname, epname, epdeadline) {
	if(checkDate(epdeadline)){
		alert("지원 마감");
	} else{
		var popupWidth = 900;
		var popupHeight = 950;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY = (window.screen.height/2)-(popupHeight/2);
		
		console.log(epnum + epciname + epname);
		if (loginType == "C") {
			alert("일반회원을 위한 서비스입니다.");
			location.reload();
		} else {
			window.open("${pageContext.request.contextPath }/myResume?epnum="+ epnum + "&epciname=" + epciname+"&state=2&sideX=sideX",
					"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);
		}			
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
		
		function changeVal1() {
			if ($('#section1').hasClass("d_none")) {
				$('#section1').removeClass("d_none");
				$('#section2').addClass("d_none");
			}
		
		}
		function changeVal2() {
			 if($('#section2').hasClass("d_none")){
					$('#section2').removeClass("d_none");
					$('#section1').addClass("d_none");
			}
		
		}
		
	
</script>
</ht
												ml>