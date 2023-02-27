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

	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content:center;">
			<div class="col-lg-10 col-xl-8 " style="width: 65%;">
				<div class="card mt-4 mb-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<div class="row-5 mx-auto mb-5">
							<h1>${cinfo.ciname }</h1>
							<h5>${cinfo.ciind }</h5>
							<div class="d-md-flex justify-content-md-end">
								<!--  
								<button type="button" class="btn btn-outline-secondary btn-lg" onclick="deleteInfo()">
									<i class="bi bi-bookmark-check"></i> 스크랩
								</button>
								-->
							</div>
						</div>

						<div class="mb-5">
							<h4>기업정보</h4>
							<div class="row content">
								<div class="col-5" style="margin-right: auto;">
									<p>
										<strong>기업형태 :</strong> ${cinfo.citype }
									</p>
									<br>
									<p>
										<strong>자본금 :</strong> ${cinfo.cimoney }
									</p>
									<br> <strong>업종 :</strong> ${cinfo.cimajor }
								</div>
								<div class="col-5">
									<p>
										<strong>대표자 :</strong> ${cinfo.cileader }
									</p>
									<br>
									<p>
										<strong>사원수 :</strong> ${cinfo.cipeople }
									</p>
									<br>
									<p>
										<strong>매출액 :</strong> ${cinfo.cisales }
									</p>
									<br> <strong>4대보험 :</strong> ${cinfo.ciinsurance }
								</div>
							</div>
						</div>

						<div class="nowRs">
							<h4>지금 채용중인 공고</h4>
							<div class="content">

								<div style="text-align: center; margin: 10px">
									<c:forEach items="${epList}" var="employ">
										<c:choose>
											<c:when test="${employ.epnum == null }">
												<p>등록된 공고정보가 없습니다.</p>
											</c:when>

											<c:otherwise>
												<tr style="font-size: 16px;">
													<td class="emci"><a href=""><span>${employ.epciname }</span></a></td>
													<td class="emnu"><input type="button" class="scrap" id="${employ.epnum }" onclick="checkVal('${employ.epnum }', this)" value="⭐"></td>
													<td class="emna"><a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${employ.epnum }"><span style="color: #333; font-weight: bold;">${employ.epname }</span></a></td>
													<td class="emde"><span>${employ.epdeadline }</span></td>
													<td class="embu">
														<button class="mx-1 mt-1" onclick="WriteResume('sideX','${employ.epnum }')" style=" background-color: #ff7e00; border: solid #ff7e00;">
															<span style="color: white; ">즉시지원</span>
														</button>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</div>


						<div style="text-align: center; margin: 5px">
							<a href="${pageContext.request.contextPath }/CinfoListPage">
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
function WriteResume(sideX, epnum) {
	console.log(sideX);
	console.log(epnum);
	if (loginId == "") {
		alert("로그인이 필요한 서비스입니다.");
		location.href = "${pageContext.request.contextPath}/login";
	} else if (loginType == "C") {
		alert("일반회원을 위한 서비스입니다.");
		location.reload();
	} else {
		window.open("${pageContext.request.contextPath}/myResume?sideX="+sideX+"&epnum="+epnum,
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
