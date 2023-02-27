<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이력서</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<style type="text/css">
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
			<div class="row  my-4" style="width: 100%;">

				<div class="col-2 mx-4" style="width: 15%;">
					<!-- SideBar -->
					<div id="sideBar">
						<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
					</div>
				</div>

				<div class="col-lg-10 col-xl-8" style="width: 70%;">
					<div class="card border-0 shadow rounded-3">
						<div class="card-body p-4 p-sm-5 mb-3">
							<%@ include file="/WEB-INF/views/employment/ResumeForm.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var checkSide = '${sideX}';
			console.log(checkSide);
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
			console.log("이력서 지원");
			location.href = "${pageContext.request.contextPath}/applyResume?epnum="
					+ epnum;

		}

		function callEssay(epnum, epciname) {
			console.log("해당 공고 자소서 요청");
			console.log(epnum);
			console.log(epciname);
			location.href="${pageContext.request.contextPath}/WriteEssayPage?epnum="+ epnum + "&epciname=" + epciname;
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