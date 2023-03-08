<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고작성</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<!--  -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<!--  -->

<style type="text/css">
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
	color: #006633;
	margin: 0 5px;
}


.anw {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #f4f4f2;
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #666;
	margin: 0 5px;
}

.arrow-wrap {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translate(0, -50%);
}

.que .arrow-top {
	display: none;
}

.que .arrow-bottom {
	display: block;
}

.que.on .arrow-bottom {
	display: none;
}

.que.on .arrow-top {
	display: block;
}
/*  */



.sel {
	display: inline-block;
}

.sel:hover {
	background-color: #539DDB;
}
.checkBtn {
	background-color: #539DDB;
}
</style>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<!-- Header -->
	

	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="card border-0 shadow rounded-3 mt-3 mb-3" style="width: 60%;">

				<div class="card-body px-5 mt-1">
					<!--  -->
					<div class="list-group reserveArea">



						<div class="row mb-4" style="border-style: groove; text-align: center; height: 50px" id="btnArea">
							<input type="hidden" value="${reviewList[0].rvtype }" id="checkRvtype">
							<button id="btn1" style="width: 25%" class="menuBar sel" onclick="ViewReview('1','${ciname}',this)">합격자소서</button>

							<button id="btn2" style="width: 25%" class="menuBar sel" onclick="ViewReview('2','${ciname}',this)">인적성후기</button>

							<button id="btn3" style="width: 25%" class="menuBar sel" onclick="ViewReview('3','${ciname}',this)">면접후기</button>

							<button id="btn4" style="width: 25%" class="menuBar sel" onclick="ViewReview('4','${ciname}',this)">최종합격후기</button>

						</div>
					
						<c:choose>
							<c:when test="${empty reviewList}">
								<div class="small mb-1">등록된 후기가 없습니다. </div>
							</c:when>						
							<c:otherwise>
								<c:forEach items="${reviewList }" var="review">
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
									</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!--  -->
				</div>
				<!--  -->

				<!--  -->
			</div>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		var viewBno = '${board.bno }';

		var loginType = $('#loginType').val();
		var loginId = $('#loginId').val();
		var reviewList = '${reviewList}';
		
		
		
		$(".que").click(function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');

		});
		
		var checkBtn = 	'${rvtype}';	

		$(document).ready(function() {
			var btnObj =$('#checkRvtype').val();
			
			switch(btnObj){
			case "1":
				$('#btn1').addClass("checkBtn");	
				break;
			case "2":
				$('#btn2').addClass("checkBtn");	
				break;
			case "3":
				$('#btn3').addClass("checkBtn");	
				break;
			case "4":
				$('#btn4').addClass("checkBtn");	
				break;
			}
			
		});
		
		function ViewReview(rvtype, ciname, selBtn) {
			
			console.log(rvtype);
			location.href = "${pageContext.request.contextPath }/ViewReview?rvtype="
					+ rvtype + "&ciname=" + ciname;
		}
	</script>
</body>
</html>