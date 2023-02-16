<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>기업정보</title>
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
<style type="text/css">
.nav-divEp{
	width: 33%;
	height: 50px;
	margin-top: 20px;
	float: left;
}
.epheader{
	position: relative;
    padding-left: 11px;
    margin-bottom: 7px;
    line-height: 1.42857;
    font-size: 26px;
    color: #000;
}
</style>
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<nav id="nav">
	<div class="navigator">
		<div class="nav-divEp"><a href="${pageContext.request.contextPath }">기업정보</a></div>
		<div class="nav-divEp"><a href="${pageContext.request.contextPath }">채용</a></div>
		<div class="nav-divEp"><a href="${pageContext.request.contextPath }">합격자소서</a></div>
	</div> 
	</nav>
	
	<!-- Section -->
	<section id="section">
		<div class="section-div">
			<div class="card mt-4 mb-4 shadow rounded-3">
				<div class="card-header">기업정보</div>
					<div class="card-body">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th>산업</th>
									<td>
										<div class="value">공연시설 운영업</div>
									</td>
									<th>사원수</th>
									<td>
										<div class="value">450명</div>
										<div class="reference">(2015.12.31)</div>
									</td>
								</tr>
						
						
								<tr>
									<th>기업구분</th>
									<td>
										<div class="value">비영리법인</div>
									</td>
									<th>설립일</th>
									<td>
										<div class="value">1999.07.01</div>
										<div class="reference">(25년차)</div>	
									</td>
								</tr>
								
								
								<tr>
									<th>자본금</th>
									<td>
										<div class="value">17억 7천만원</div>
										<div class="reference">(2020.12.31)</div>	
									</td>
									<th>매출액</th>
									<td>			
										<div class="value">487억 2천만원</div>
										<div class="reference">(2020.12.31)</div>	
									</td>
								</tr>
								
								
								<tr>
									<th>대표자</th>
									<td>
										<div class="value">안호상</div>
									</td>
									<th>대졸초임</th>
									<td>
										<div class="value">3,120만원</div>
									</td>
								</tr>
								
								
								<tr>
									<th>주요사업</th>
									<td>
										<div class="value">공연장 운영</div>
									</td>
									<th>4대보험</th>
									<td>
										<div class="value">국민연금, 건강보험, 고용보험, 산재보험</div>
									</td>
								</tr>
								
								
								<tr>
									<th>홈페이지</th>
									<td>
										<div class="value">
											<a href="http://www.sejongpac.or.kr" target="_blank">http://www.sejongpac.or.kr</a>
										</div>
									</td>
									<th>주소</th>
									<td>
										<div class="value">서울 종로구 세종로 81-3 세종문화회관 경영지원팀</div>
									</td>
								</tr>
								
						
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</html>