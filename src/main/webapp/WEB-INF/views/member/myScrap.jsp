<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스크랩</title>
<!-- Favicon-->
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<style type="text/css">
.del {
	border: none;
}

a {
	color: black;
	text-decoration: none;
}

h4 {
	text-align: center;
}

ul {
	width: 100%;
	padding-right: 2rem;
	margin-top: 1rem;
}

.Sli {
	list-style: none;
	border-bottom: 1px solid #ebebeb;
	width: 100%;
}

.mainCon {
	width: 100%;
	padding: 1rem;
	align-items: center;
	display: flex;
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
				<div class="col-2 mx-4" style="width: 15%;">
					<!-- SideBar -->
					<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
				</div>

				<div class="col-lg-10 col-xl-8" style="width: 65%;">
					<div class="card border-0 shadow rounded-3">

						<div class="card-body p-4 p-sm-5 mb-3">
							<h4>스크랩</h4>
							<ul>
								<c:choose>
									<c:when test="${empty myScrap }">
										<p>스크랩한 공고가 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach items="${myScrap }" var="myScrap">
											<li class="Sli">
												<div class="mainCon">
													<div class="sName col-3">
														<p>${myScrap.epciname }</p>
														<br>
													</div>
													<div class="sContent col-6 mx-5">
														<h6>
															<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${myScrap.epnum }">
																<strong> ${myScrap.epname } </strong>
															</a>
														</h6>
														<br>
													</div>
													<div class="col-2">
														<div>
															<button type="button" class="btn btn-warning btn-sm" onclick="WriteResume('${myScrap.epnum }')">
																<i class="bi bi-check-lg"></i> 즉시지원
															</button>
															<p style="text-align: center; font-size: smaller;">~${myScrap.epdeadline }</p>
														</div>
													</div>
													<div class="sDel col-1">
														<button type="button" class="btn btn-outline-danger del" onclick="delBtn('${myScrap.epnum }', this)">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  														<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
														</button>
													</div>
													<hr>
												</div>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
function delBtn(epnum, selBtn){
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath }/removeScrap",
		data : {"checkedName" : epnum},
		dataType : "json",
		success:function(result){
		}
	});
	location.href="${pageContext.request.contextPath}/myScrap";
}


function WriteResume(epnum) {
	console.log("이력서창")
	var popupWidth = 900;
	var popupHeight = 950;
	var popupX = (window.screen.width/2)-(popupWidth/2);
	var popupY = (window.screen.height/2)-(popupHeight/2);
	console.log(epnum);
	window.open("${pageContext.request.contextPath}/myResume?sideX=sideX&epnum="+epnum+"&state=1",
			"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);
}

</script>

</body>
</html>