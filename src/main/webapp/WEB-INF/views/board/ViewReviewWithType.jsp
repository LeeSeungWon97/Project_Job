<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고작성</title>
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link
	href="${pageContext.request.contextPath }/resources/assets/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/nav.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/section.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/footer.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.css"
	rel="stylesheet" />
<style type="text/css">
.menuBar:hover {
	color: #0d6efd;
}

.Rsname {
	border-bottom: 2px solid #ebebeb;
}

.ViewBox {
	padding: 10px;
	border-style: outset;
	text-align: center;
}


details >summary {list-style: none;}
summary::-webkit-details-marker {display:none;}

details summary::-webkit-details-marker {
display: none;
}

summary{
outline: none;
}
</style>

</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="header-div">
			<div class="logo">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/">
					<img
					src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png"
					style="width: 80%; height: auto;">
				</a>
			</div>
		</div>
	</header>

	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="card border-0 shadow rounded-3 mt-3 mb-3"
				style="width: 60%;">

				<div class="card-body px-5 mt-1">
					<!--  -->
					<div style="padding: 10px;" class="list-group reserveArea">


						<div class="row mb-4 ViewBox">
							<div class="col-4">
								<button class="menuBar" onclick="ViewReview('2','${ciname}')">인적성후기</button>
							</div>

							<div class="col-4">
								<button class="menuBar" onclick="ViewReview('3','${ciname}')">면접후기</button>
							</div>

							<div class="col-4">
								<button class="menuBar" onclick="ViewReview('4','${ciname}')">최종합격후기</button>
							</div>
						</div>


						<c:forEach items="${reviewList }" var="review">
							<c:if test="${reviewList.isEmpty()}">
								<div class="row" style="padding: 10px; border-style: groove;">등록된
									후기가 없습니다.</div>
							</c:if>
					
							
							<div class="" style=""> 
							<details class="Onbox">
								<summary>
									<div class="row" style="padding: 10px;">
										<div class="row-2">
											<div class="small mb-1">${review.rvdate}-${review.rveptype}-${review.rvobj}</div>
										</div>
										<div class="row-2 Rsname">
											<h4>${review.rvciname}-${review.rvobj}</h4>
										</div>
									</div>
								</summary>


								<div class="Rbox mt-1 mb-1">
									<div class="row" style="padding: 10px;">
										<c:forEach items="${review.rvcontents }" varStatus="i"
											step="2">
											<div class="row-5">
												<h6>${review.rvcontents[i.index]}</h6>
												<p class="lead">${review.rvcontents[i.index +1]}</p>
											</div>
										</c:forEach>
									</div>
								</div>

							</details>
							</div>


						</c:forEach>
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

		/* 		var loginType = "";
		 var loginId = "";
		 if( $('#loginType').val() != undefined){
		 loginType = $('#loginType').val();
		 loginId = $('#loginId').val();	
		 } */

		$(document).ready(function() {
		});
		function ViewReview(rvtype, ciname) {
			console.log(rvtype);
			location.href = "${pageContext.request.contextPath }/ViewReview?rvtype="
					+ rvtype + "&ciname=" + ciname;
		}
	</script>
</body>
</html>