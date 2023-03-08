<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

.menuBar:hover {
	color: #0d6efd;
}

.clicked {
	color: gold;
}

/* * {
	box-sizing: border-box;
} */
.que:first-child {
	border-top: 1px solid black;
}

.que {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 14px;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	/* color: #006633; */
	margin: 0 5px;
}

.anw {
	font-size: 14px;
	/* background-color: #f4f4f2; */
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	/* color: #666; */
	margin: 0 5px;
}

.arrow-wrap {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translate(0, -50%);
}

.que .arrow-bottom {
	display: block;
}

.que.on .arrow-top {
	display: block;
}
/*  */
</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="header-div">
			<div class="logo">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/"> <img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
				</a>
			</div>
		</div>
	</header>



	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">

			<div class="mainbox mb-3">
				<!--본문 -->
				<div id="EssayForm">
					<div class="top">
						<input type="text" readonly class="form-control-plaintext esciname" readonly="readonly" value="합격자기소개서"> 
					</div>
					<div>
					</div>
					<div id="Accordion_wrap">
						<div class="que">
							<div class="row-2">
								<div class="small mb-1">${review.rvdate}-${review.rveptype}-${review.rvobj}</div>
							</div>
							<div class="row-2">
								<h4>${review.rvciname}-${review.rvobj}</h4>
							</div>
							<div class="arrow-wrap">
								<span class="arrow-top">↑</span>
								<span class="arrow-bottom">↓</span>
							</div>
						</div>
						<div class="anw">
							<c:forEach items="${review.rvcontents }" varStatus="i" step="2">
								<div class="que">
									<span>${review.rvcontents[i.index]}</span>
								</div>
								<div class="anw">
									<span>${review.rvcontents[i.index +1]}</span>
								</div>
							</c:forEach>
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
		$(".que").click(function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');

		});
	</script>


</body>
</html>




