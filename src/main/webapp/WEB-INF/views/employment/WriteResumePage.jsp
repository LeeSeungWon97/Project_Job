<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서작성페이지</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
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

	<div class="container">
		<div class="d-flex justify-content-center">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 200px; height: 100px;">
			</a>
		</div>

		<div class="row">
			<%-- <div class="col-2">
				<!-- SideBar -->
				<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
			</div> --%>

			<div class="mainbox">
				<h1 style="text-align: center;">이력서</h1>
				<%@ include file="/WEB-INF/views/employment/ResumeForm.jsp"%>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button id="saveBtn" class="btn btn-dark btn-lg" type="button" onclick="saveResume()">저장</button>
				</div>

			</div>

		</div>
	</div>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#modifyBtn').addClass("d-none");
			$('.modifyBtn').removeClass("d-none");
			$('.resumeContent').attr("readonly", false);
		});

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
					console.log(result);
					alert("이력서 작성 완료");
				}
			});
			$('#modifyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('.modifyBtn').addClass("d-none");
			$('.resumeContent').attr("readonly", true);
			location.href = "${pageContext.request.contextPath}/myResume";
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