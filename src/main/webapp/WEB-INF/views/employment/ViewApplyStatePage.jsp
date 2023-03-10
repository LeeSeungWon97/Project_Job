<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>지원현황</title>
<!-- Favicon-->
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
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
		<div class="section-div" style="justify-content: center;">
			<div class="row my-4" style="width: 100%;">
				<div class="col-2  mx-4" style="width: 15%;">
					<!-- SideBar -->
					<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
				</div>

				<div class="col-lg-10 col-xl-8" style="width: 70%;">
					<div class="card  shadow rounded-3" style="border: 1px solid #e0e0e0;">
						<div class="card-body p-4 p-sm-5 mb-3">
							<c:choose>
								<c:when test="${sessionScope.loginType == 'C'}">
									<div style="padding: 10px;" class="list-group reserveArea">
										<c:forEach items="${ApplyList}" var="apply">
											<div class="row" style="padding: 10px; margin: auto;">
												<div class="col-2">
													<img class="card-img-top" src="${pageContext.request.contextPath }/resources/assets/img/resumePro.png" alt="..." style="max-width: 120px;" />
													<p class="lead">${apply.MNAME}</p>
												</div>
												<div class="col-7">
													<p class="lead">공고명 :${apply.EPNAME}</p>
													<div class="small mb-1">마감일 : ${apply.EPDEADLINE}</div>
												</div>

												<div class="col-2" style="text-align: center">
													<button type="button" class="btn btn-danger btn-lg" onclick="viewApplyInfo('${apply.APREMID}')">상세보기</button>
													<button type="button" class="btn btn-outline-success btn-lg" onclick="acceptMember('${apply.EPNUM}','${apply.APREMID }','${apply.MEMAIL}','${apply.CINAME}','${apply.EPNAME }','${apply.MNAME}')">회신하기</button>
												</div>
											</div>
										</c:forEach>
									</div>


								</c:when>
								<c:otherwise>
									<div style="padding: 10px;" class="list-group reserveArea">
										<c:forEach items="${ApplyList}" var="apply" varStatus="i">
											<div class="row" style="padding: 10px; border-bottom-style: dotted;">
												<div class="col-4">
													<p class="lead">
														<a href="${pageContext.request.contextPath }/viewReciname?viewReciname=${apply.EPCINAME}"> ${apply.EPCINAME}</a>
													</p>
												</div>
												<div class="col-6">
													<p class="lead">
														<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${apply.EPNUM}"> 공고명 :${apply.EPNAME} </a>
													</p>
													<div class="small mb-1">마감일 : ${apply.EPDEADLINE}</div>
												</div>

												<div class="col-2" style="text-align: center">
													<c:choose>
														<c:when test="${apply.APSTATE == 'N'}">
															<div class="small mb-1">아직 발표전입니다.</div>
														</c:when>
														<c:otherwise>
															<div class="small mb-1">이메일을 통해 결과를 확인하세요.</div>
															<button type="button" class="btn btn-dark btn-lg" onclick="deleteDiv('${apply.APEPNUM}','${apply.APREMID}')">확인완료</button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- jQuery -->

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<!-- 정규식  -->
	<script src="${pageContext.request.contextPath }/resources/js/regex.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			console.log(sessionStorage.getItem("loginInfo"));
		});
	</script>


	<script type="text/javascript">
		function viewApplyInfo(viewId) {
			window.open(
					"${pageContext.request.contextPath}/viewApplyInfo?viewId="
							+ viewId, "이력서 선택",
					"width=400,height=400,top=10,left=100");
		}

		function acceptMember(epnum, mid, memail,ciname,epname,mname) {
			console.log("acceptMember 클릭");
			var confirm_Result = confirm("서류접수 통과입니까?");
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/updateApState",
				async : false,
				data : {
					"passResult" : confirm_Result,
					"apepnum" : epnum,
					"apremid" : mid,
					"memail": memail,
					"ciname": ciname,
					"epname": epname,
					"mname": mname
				},
				success : function(result) {
					location.reload();
				}
			});
		}
		function deleteDiv(apepnum, apremid){
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/deleteApply",
				data:{
					"apepnum": apepnum,
					"apremid": apremid
				},
				success: function(result){
					location.reload();
				}
			});
		}
	</script>

</body>
</html>