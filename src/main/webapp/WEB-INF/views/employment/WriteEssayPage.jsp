<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자소서 작성페이지</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<style type="text/css">
.mainbox {
	width: 710px;
	padding: 30px;
	margin: 10px;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid #ebebeb;
	box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15);
}

h1 {
	font-size: 20px;
	margin-bottom: 20px;
	text-align: center;
}

.top {
	border-bottom: 2px solid #79BAEC;
	border-top: 2px solid #79BAEC;
	margin-bottom: 40px;
}

.form-floating, .form-control-plaintext {
	margin-bottom: 10px;
	margin-top: 8px;
}

.box {
	margin-bottom: 25px;
}

.esciname {
	height: 30px;
	font-size: medium;
	text-align: center;
}

.epname {
	font-size: x-large;
	text-align: center;
}

.Clickbtn {
	text-align: center;
}

.myInfo {
	border-bottom: 2px solid #ebebeb;
	border-top: 2px solid #ebebeb;
	margin-bottom: 20px;
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

			<div class="mainbox mb-3">
				<!--본문 -->
				<%@ include file="/WEB-INF/views/employment/EssayForm.jsp"%>

				<div class="Clickbtn">
					<button id="modifyBtn" class="btn btn-dark btn-lg" type="button" onclick="modifyEssay()">수정</button>
					<button id="saveBtn" class="btn btn-dark btn-lg mx-2 d-none" type="button" onclick="saveEssay()">
						<i class="bi bi-check"></i> 저장
					</button>
					<button id="cancleBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="modifyCancle()">
						<i class="bi bi-x"></i> 취소
					</button>
					<button id="applyBtn" class="btn btn-dark btn-lg" type="button" onclick="apply()">지원</button>
				</div>
			</div>

		</div>
	</section>



	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var content = '${content}';
			if (content == 'x') {
				$('#modifyBtn').addClass("d-none");
				$('#applyBtn').addClass("d-none");
				$('#saveBtn').removeClass("d-none");
				$('#cancleBtn').addClass("d-none");
				$('.EssayContent').attr("readonly", false);
			} else {
				alert("이미 작성한 자소서가 있습니다.");
				var ans1 = '${myEssay.escontents[0]}';
				var ans2 = '${myEssay.escontents[1]}';
				var ans3 = '${myEssay.escontents[2]}';
				$('#area1').html(ans1);
				$('#area2').html(ans2);
				$('#area3').html(ans3);
			}
		});
	</script>

	<script type="text/javascript">
		function modifyEssay() {
			console.log("자소서 수정");
			$('#modifyBtn').addClass("d-none");
			$('#applyBtn').addClass("d-none");
			$('#saveBtn').removeClass("d-none");
			$('#cancleBtn').removeClass("d-none");
			$('.EssayContent').attr("readonly", false);
		}

		function saveEssay() {
			var content = '${content}';
			var esciname = '${epciname}';
			var esepnum = '${epnum}';
			var esmid = '${sessionScope.loginInfo.mid}';
			var DataArea1 = $('.area1').val();
			var DataArea2 = $('.area2').val();
			var DataArea3 = $('.area3').val();
			console.log("content:" + content);
			console.log("esciname: " + esciname);
			console.log("")
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/WriteEssay",
				data : {
					"esciname" : esciname,
					"esepnum" : esepnum,
					"esmid" : esmid,
					"DataArea1" : DataArea1,
					"DataArea2" : DataArea2,
					"DataArea3" : DataArea3,
					"content" : content
				},
				async : false,
				success : function(result) {
				}
			});

			$('#modifyBtn').removeClass("d-none");
			$('#applyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('#cancleBtn').addClass("d-none");
			$('.EssayContent').attr("readonly", true);
		}

		function modifyCancle() {
			console.log("수정 취소");
			location.reload();
		}

		function apply() {
			console.log("지원 버튼 클릭");
			var epnum = '${epnum}';
			location.href = "${pageContext.request.contextPath}/applyResume?epnum="
					+ epnum;
		}
	</script>


</body>
</html>




