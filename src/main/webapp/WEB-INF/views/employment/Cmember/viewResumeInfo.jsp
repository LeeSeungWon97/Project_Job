<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>인재정보</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- Bootstrap icons-->
<style type="text/css">
.mainbox {
	width: 710px;
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
				<h1 style="text-align: center;">이력서</h1>
				<div class="section-l">
					<div class="section-l-bottom">
						<div class="row">
							<c:forEach items="${ResumeList}" var="Resume">
								<div class="col-4" style="padding: 15px">
									<a href="${pageContext.request.contextPath}/viewApplyInfo?viewId=${Resume.remid}" target="_blank">
										<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />

										<span class="h2" style="color: black;">${Resume.remid}</span>
									</a>
									<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
										<p class="card-text">${Resume.reedu[i.index]}</p>
										<p class="card-text">${Resume.reedu[i.index + 1]}</p>
									</c:forEach>

								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-danger btn-lg" onclick="'${apply.APREMID}')">상세보기</button>
				<!--  -->

				<div class="d-grid gap-2 col-6 mx-auto">
					<button id="modifyBtn" class="btn btn-dark btn-lg" type="button" onclick="modifyResume()">수정</button>
					<button id="saveBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="saveResume()">저장</button>
					<c:if test="${sideX != null }">
						<button id="applyBtn" class="btn btn-dark btn-lg " type="button" onclick="applyResume('${epnum}')">지원하기</button>
					${epnum}
					</c:if>
					<button id="cancleBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="modifyCancle()">취소</button>
				</div>

			</div>

		</div>
	</section>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var checkSide = '${sideX}';
			if (checkSide.length > 0) {
				$('#sideBar').addClass("d-none");
			}

		});
		
		
	

		function modifyResume() {
			console.log("이력서 수정");
			$('#modifyBtn').addClass("d-none");
			$('#saveBtn').removeClass("d-none");
			$('#cancleBtn').removeClass("d-none");
			$('.modifyBtn').removeClass("d-none");
			$('.resumeContent').attr("readonly", false);
		}

		function saveResume() {
			console.log("이력서 저장");
			var rehope = document.getElementsByClassName("rehope");
			var reedu = document.getElementsByClassName("reedu");
			var recarrer = document.getElementsByClassName("recarrer");
			var react = document.getElementsByClassName("react");
			var relicense = document.getElementsByClassName("relicense");

			var rehopeData = $('.rehope').val();
			var phoneNum = $('#phoneNum').val();
			var reeduData = "";
			var recarrerData = "";
			var reactData = "";
			var relicenseData = "";

			for (var i = 0; i < reedu.length; i++) {
				reeduData += reedu[i].value;
				if (i == reedu.length - 1) {
					continue;
				}
				reeduData += "!@#";
			}

			for (var i = 0; i < recarrer.length; i++) {
				recarrerData += recarrer[i].value;
				if (i == recarrer.length - 1) {
					continue;
				}
				recarrerData += "!@#";
			}

			for (var i = 0; i < react.length; i++) {
				reactData += react[i].value;
				if (i == react.length - 1) {
					continue;
				}
				reactData += "!@#";
			}

			for (var i = 0; i < relicense.length; i++) {
				relicenseData += relicense[i].value;
				if (i == relicense.length - 1) {
					continue;
				}
				relicenseData += "!@#";
			}

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/WriteResume",
				data : {
					"rehope" : rehopeData,
					"retell" : phoneNum,
					"reedu" : reeduData,
					"recarrer" : recarrerData,
					"react" : reactData,
					"relicense" : relicenseData
				},
				async : false,
				success : function(result) {
				}
			});
			$('#modifyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('.modifyBtn').addClass("d-none");
			$('.resumeContent').attr("readonly", true);
		}

		function applyResume(epnum) {
			console.log("이력서 저장");
			var rehope = document.getElementsByClassName("rehope");
			var reedu = document.getElementsByClassName("reedu");
			var recarrer = document.getElementsByClassName("recarrer");
			var react = document.getElementsByClassName("react");
			var relicense = document.getElementsByClassName("relicense");

			var rehopeData = $('.rehope').val();
			var phoneNum = $('#phoneNum').val();
			var reeduData = "";
			var recarrerData = "";
			var reactData = "";
			var relicenseData = "";

			for (var i = 0; i < reedu.length; i++) {
				reeduData += reedu[i].value;
				if (i == reedu.length - 1) {
					continue;
				}
				reeduData += "!@#";
			}

			for (var i = 0; i < recarrer.length; i++) {
				recarrerData += recarrer[i].value;
				if (i == recarrer.length - 1) {
					continue;
				}
				recarrerData += "!@#";
			}

			for (var i = 0; i < react.length; i++) {
				reactData += react[i].value;
				if (i == react.length - 1) {
					continue;
				}
				reactData += "!@#";
			}

			for (var i = 0; i < relicense.length; i++) {
				relicenseData += relicense[i].value;
				if (i == relicense.length - 1) {
					continue;
				}
				relicenseData += "!@#";
			}

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/applyResume",
				data : {
					"rehope" : rehopeData,
					"retell" : phoneNum,
					"reedu" : reeduData,
					"recarrer" : recarrerData,
					"react" : reactData,
					"relicense" : relicenseData,
					"epnum" : epnum
				},
				async : false,
				success : function(result) {
				}
			});
			$('#modifyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('.modifyBtn').addClass("d-none");
			$('.resumeContent').attr("readonly", true);
		}

		function modifyCancle() {
			console.log("수정 취소");
			location.reload();
		}

		function addSearchKeyA() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent reedu' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent reedu' name='reedu' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#reeduData').append(rowItem);

		}

		function delSearchKeyA() {

			$("#reeduData div:last").remove();

		}

		function addSearchKeyB() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent recarrer' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent recarrer' name='recarrer' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#recarrerData').append(rowItem);

		}

		function delSearchKeyB() {

			$("#recarrerData div:last").remove();

		}

		function addSearchKeyC() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent react' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent react' name='react' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#reactData').append(rowItem);

		}

		function delSearchKeyC() {

			$("#reactData div:last").remove();

		}

		function addSearchKeyD() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent relicense' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent relicense' name='relicense' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#relicenseData').append(rowItem);

		}

		function delSearchKeyD() {

			$("#relicenseData div:last").remove();

		}
	</script>
</body>
</html>