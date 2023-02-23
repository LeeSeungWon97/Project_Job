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
<title>View</title>
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
		<div class="section-div" style="justify-content: center;">
			<div class="row my-4" style="width: 100%;">
				<div class="col-2  mx-4" style="width:15%;">
				<!-- SideBar -->
				<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
			</div>

			<div class="col-lg-10 col-xl-8" style="width: 70%;">
				<div class="card border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<c:choose>
							<c:when test="${sessionScope.loginType == 'C'}">
								<div style="padding: 10px;" class="list-group reserveArea">
									<c:forEach items="${ApplyList}" var="apply">
										<div class="row"
											style="padding: 10px; margin: auto;">
											<div class="col-2">
												<img class="card-img-top"  src="${pageContext.request.contextPath }/resources/assets/img/resumePro.png" alt="..."
													style="max-width: 120px;" />
												<p class="lead"> ${ apply.MNAME}</p>
											</div>
											<div class="col-7">
												<p class="lead">공고명 :${apply.EPNAME}</p>
												<div class="small mb-1">마감일 : ${apply.EPDEADLINE}</div>
											</div>

											<div class="col-2" style="text-align: center">
												<button type="button" class="btn btn-danger btn-lg" onclick="viewApplyInfo('${apply.APREMID}')">상세보기</button>
												<button type="button" class="btn btn-outline-success btn-lg">회신하기</button>
												
											</div>
										</div>
										<!-- <div class="row"
											style="padding: 10px; margin-left: 100px; margin-right: 100px;">
											<div class="col-2">
											
											</div>
											<div class="col-7">

											</div>
											<button type="button" class="btn btn-outline-success btn-lg">회신하기</button>
											<div class="col-2" style="text-align: center">
											
											</div>
										</div> -->
										
									</c:forEach>
								</div>


							</c:when>
							<c:otherwise>
								<div style="padding: 10px;" class="list-group reserveArea">
									<c:forEach items="${ApplyList}" var="apply">
										<div class="row"
											style="padding: 10px; border-bottom-style: dotted; ">
											<div class="col-4">
												<p class="lead">${apply.CINAME}</p>
											</div>
											<div class="col-6">
												<p class="lead">공고명 :${apply.EPNAME}</p>
												<div class="small mb-1">마감일 : ${apply.EPDEADLINE}</div>
											</div>

											<div class="col-2" style="text-align: center">
											<c:if test="${apply.APSTATE == 'N'}">
												<div class="small mb-1">아직 발표전입니다.</div>	
											</c:if>																								
											</div>
										</div>
										<!-- <div class="row"
											style="padding: 10px; margin-left: 100px; margin-right: 100px;">
											<div class="col-2">
											
											</div>
											<div class="col-7">

											</div>
											<button type="button" class="btn btn-outline-success btn-lg">회신하기</button>
											<div class="col-2" style="text-align: center">
											
											</div>
										</div> -->
										
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
	function viewApplyInfo(viewId){
		
	window.open("${pageContext.request.contextPath}/viewApplyInfo?viewId="+viewId,
					"이력서 선택", "width=400,height=400,top=10,left=100");
	}
	
		function changePw() {
			console.log("changePw() 호출");
			window.open("${pageContext.request.contextPath }/changePw",
					"비밀번호 변경", "width=400,height=400,top=10,left=100");

		}

		function changeInfo() {
			console.log("changeInfo() 호출");
			$('.pw').prop("readonly", false);
			$('.name').prop("readonly", false);
			$('.addr').prop("readonly", false);
			$('.pwBtn').prop("type", "button");
			$('.changeBtn').prop("type", "hidden");
			$('.saveBtn').prop("type", "button");
			$('.deleteBtn').prop("type", "hidden");
			$('.cancleBtn').prop("type", "button");
		}

		function saveInfo() {
			console.log("saveInfo() 호출");
			var mType = $('#mType').val();
			var id = $('.id').val();
			var pw = $('.pw').val();
			var name = $('.name').val();
			var addr = $('.addr').val();
			var email = $('.email').val();
			console.log("로그인 타입: " + mType);
			console.log("로그인 아이디: " + id);
			console.log("로그인 비밀번호: " + pw);
			console.log("로그인 이름: " + name);
			console.log("로그인 주소: " + addr);
			console.log("로그인 이메일: " + email);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/updateInfo",
				data : {
					"mType" : mType,
					"id" : id,
					"pw" : pw,
					"name" : name,
					"addr" : addr
				},
				success : function(result) {
					console.log(result);
					if (result == "OK") {
						alert("회원정보가 수정되었습니다. 다시 로그인 해주세요");
						location.href = "${pageContext.request.contextPath}/";
					} else {
						alert("오류가 발생했습니다.");
						location.reload();
					}
				}
			});

			$('.pw').prop("readonly", true);
			$('.name').prop("readonly", true);
			$('.addr').prop("readonly", true);
			$('.pwBtn').prop("type", "hidden");
			$('.changeBtn').prop("type", "button");
			$('.saveBtn').prop("type", "hidden");
			$('.deleteBtn').prop("type", "button");
			$('.cancleBtn').prop("type", "hidden");
		}

		function deleteInfo() {
			console.log("deleteInfo() 호출");
			window.open("${pageContext.request.contextPath }/deleteUser",
					"회원 탈퇴", "width=400,height=400,top=10,left=100");
		}

		function changeCancle() {
			console.log("changeCancle() 호출");
			location.reload();
		}

		function deleteCheck(result) {
			if (result) {
				location.href = "${pageContext.request.contextPath}/logout"
			} else {
				location.reload();
			}
		}
	</script>

</body>
</html>