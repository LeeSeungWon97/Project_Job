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
			<div class="col-2">
				<!-- SideBar -->
				<%@ include file="/WEB-INF/views/includes/infoSidebar.jsp"%>
			</div>

			<div class="mainbox">
				<h1 style="text-align: center;">이력서</h1>
				<%@ include file="/WEB-INF/views/employment/ResumeForm.jsp"%>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button id="modifyBtn" class="btn btn-dark btn-lg" type="button" onclick="modifyResume()">수정</button>
					<button id="saveBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="saveResume()">저장</button>
					<button id="cancleBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="modifyCancle()">취소</button>
				</div>

			</div>

		</div>
	</div>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
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
			$('#modifyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('.modifyBtn').addClass("d-none");
			$('.resumeContent').attr("readonly", true);
		}
		function modifyCancle(){
			console.log("수정 취소");
			location.reload();
		}

		function addSearchKeyA() {
			var rowItem = "<div class=input-group reedu>";
			rowItem += "<input type='text' class='form-control resumeContent' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent' name='reedu' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#reeduData').append(rowItem);

		}

		function delSearchKeyA() {

			$("#reeduData div:last").remove();

		}

		function addSearchKeyB() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent' name='recarrer' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#recarrerData').append(rowItem);

		}

		function delSearchKeyB() {

			$("#recarrerData div:last").remove();

		}

		function addSearchKeyC() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent' name='react' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#reactData').append(rowItem);

		}

		function delSearchKeyC() {

			$("#reactData div:last").remove();

		}

		function addSearchKeyD() {
			var rowItem = "<div class=input-group>";
			rowItem += "<input type='text' class='form-control resumeContent' style='height: 60px;'>";
			rowItem += "<input type='text' class='form-control resumeContent' name='relicense' style='width: 300px; height: 60px;'>";
			rowItem += "</div>";

			$('#relicenseData').append(rowItem);

		}

		function delSearchKeyD() {

			$("#relicenseData div:last").remove();

		}
	</script>
</body>
</html>