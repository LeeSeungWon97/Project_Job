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


<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<style type="text/css">
.mainbox {
	width: 750px;
	padding: 30px;
	margin: 30px;
	margin-right: auto;
	margin-left: auto;
	box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 15%);
	border-radius: 0.3rem;
	border: 1px solid #e0e0e0;
}

h1 {
	font-size: 25px;
	margin-bottom: 30px;
	text-align: center;
}

.first {
	border-bottom: 2px solid #ebebeb;
	border-top: 2px solid #ebebeb;
	margin-bottom: 20px;
}

h3 {
	font-size: 15px;
}

h2 {
	font-size: 20px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	border-bottom: 2px solid black;
	padding-bottom: 5px;
}

h6 {
	font-size: 12px;
}

.resumbox {
	border: 1px solid #ebebeb;
	margin: 3px;
	height: 160px;
	padding: 15px;
	width: 32.3%;
	cursor: pointer;
}

.resumbox:hover {
	border: 2px solid #79BAEC;
}

.con2 {
	margin-top: 5px;
}
.page-link {
	cursor: pointer;
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
				<h1 style="text-align: center;">이력서 목록</h1>
				<div class="row">
					<c:forEach items="${ResumeList}" var="Resume">
						<div class="col-4 resumbox" onclick="checkMtype('${Resume.remid}')">
							<div class="d-flex">
								<img class="card-img-top" style="border-radius: 70%; width: 55px; height: 45px;" src="${pageContext.request.contextPath }/resources/assets/img/resumePerson.png" />
								<div class="h5 mx-1 mt-1" style="color: black; text-align: center;">${Resume.remid}</div>
							</div>
							<div class="con2">
								<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
									<h6>${Resume.reedu[i.index]}</h6>
									<h3>${Resume.reedu[i.index + 1]}</h3>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<ul class="pagination">
					</ul>
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
		var loginType = '${loginType}';
		var loginId = $('#loginId').val();

		$(document).ready(function() {
			var checkSide = '${sideX}';
			if (checkSide.length > 0) {
				$('#sideBar').addClass("d-none");
			}
			createPageBtn();

		});

		function checkMtype(mid) {
			console.log("checkMtype 호출");
			console.log(loginType);
			console.log();
			console.log(mid);
			if (loginType == "") {
				alert("로그인이 필요한 서비스입니다.");
				location.href = "${pageContext.request.contextPath}/login";
			} else if (loginType == "P") {
				alert("기업회원을 위한 서비스입니다.");
				return false;
			} else {
				location.href = "${pageContext.request.contextPath}/viewApplyInfo?viewId="
						+ mid;
			}
		}

		function pageLoad(pageBtn) {
			var pageNum = pageBtn.innerText;
			location.href = "${pageContext.request.contextPath}/viewResumeInfo?pageNum="
					+ pageNum;
		}

		function createPageBtn() {
			var maxNum = '${pageIdxMax}';
			var element = $('.pagination');
			var pageNum = '${pageNum}';
			var startBtn = '${startBtn}';
			var endBtn = '${endBtn}';
			var output = '<li class="page-item"><p class="page-link" onclick="prePage('
					+ pageNum + ')">이전</p></li>';
			console.log(maxNum);
			for (var i = startBtn - 1; i < endBtn; i++) {
				if (i + 1 == pageNum) {
					output += '<li class="page-item active"><p class="page-link" onclick="pageLoad(this)">'
							+ (i + 1) + '</p></li>';
				} else {
					output += '<li class="page-item"><p class="page-link" onclick="pageLoad(this)">'
							+ (i + 1) + '</p></li>';
				}
			}
			output += '<li class="page-item"><p class="page-link" onclick="nextPage('
					+ pageNum + ')">다음</p></li>';
			element.html(output);
		}
		function prePage(pageNum) {
			if (pageNum > 1) {
				pageNum -= 1;
				location.href = "${pageContext.request.contextPath}/viewResumeInfo?pageNum="
						+ pageNum;
			}
		}
		function nextPage(pageNum) {
			var maxNum = '${pageIdxMax}';
			if (pageNum < maxNum) {
				pageNum += 1;
				location.href = "${pageContext.request.contextPath}/viewResumeInfo?pageNum="
						+ pageNum;
			}
		}
	</script>
</body>
</html>