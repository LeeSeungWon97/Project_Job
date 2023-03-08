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
.scrap {
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	border: none;
	background-color: transparent;
}

.scrap:hover {
	text-shadow: 0 0 0 #fdf002; /* 마우스 호버 */
	text-shadow: 0 0 0 #fdf002; /* 마우스 호버 뒤에오는 이모지들 */
	text-shadow: 0 0 0 #fdf002; /* 마우스 클릭 체크 */
}

.scrap_click {
	text-shadow: 0 0 0 #fdf002;
}

.top {
	border: 2px solid #79BAEC;
	padding: 3px;
	padding-top: 0px;
	display: scroll;
	position: fixed;
	bottom: 30px;
	right: 275px;
	text-align: center;
	color: #79BAEC;
}
.page-link {
	cursor: pointer;
}
</style>

</head>
<body>

	<!-- topbar -->
	<a class="top" href="javascript:window.scrollTo(0,0);">
		<i class="bi bi-caret-up-fill"></i><br> TOP
	</a>


	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>
	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="card mt-4 mb-4 shadow rounded-3 " style="width: 65%;">
				<div class="d-flex justify-content-center">
					<div class="input-group mx-3 mt-4" style="width: 100%;">
						<input class="form-control" type="search" placeholder="기업명 검색" aria-label="Search" name="searchValue" id="searchInput" style="border: 1px solid #ddd;">
						<button class="search-btn " onclick="searchValue()" style="border: 1px solid #ddd; height: auto;">
							<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png" style="width: 90%; height: auto;">
						</button>
					</div>
				</div>
				<ul style="width: 100%; padding-right: 2rem; margin-top: 1rem" id="cInfoListArea">
					<c:forEach items="${cinfoList }" var="cinfo">
						<li style="list-style: none; border-bottom: 1px solid #ebebeb; width: 100%;">
							<div class="" style="width: 100%; padding: 1rem; align-items: center; display: flex;">
								<div class="cLogo col-3">
									<img class="card-img-top" src="${pageContext.request.contextPath }/resources/assets/img/building.png" style="width: 80%; height: auto;">
								</div>
								<div class="cName col-9">
									<a href="${pageContext.request.contextPath }/viewCiInfo?cinum=${cinfo.cinum }">
										<span class="h3">${cinfo.ciname }</span>
									</a>
									<div class="cDetail">
										<br>
										<span>${cinfo.ciind }</span>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="mx-auto my-auto">
					<ul class="pagination">
					</ul>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="loginType" value="${sessionScope.loginType }">
	<c:choose>
		<c:when test="${sessionScope.loginType == 'P'}">
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.cmid }">
		</c:otherwise>
	</c:choose>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var loginType = $('#loginType').val();
	var loginId = $('#loginId').val();		
	$(document).ready(function(){
		selectScrapInfo();
		createPageBtn();
	});
	
	function pageLoad(pageBtn){
		var pageNum = pageBtn.innerText;
		location.href = "${pageContext.request.contextPath}/CinfoListPage?pageNum="+pageNum;
	}
	
	function createPageBtn(){
		var maxNum = '${pageIdxMax}';
		var element = $('.pagination');
		var pageNum = '${pageNum}';
		var startBtn = '${startBtn}';
		var endBtn = '${endBtn}';
		var output = '<li class="page-item"><p class="page-link" onclick="prePage('+pageNum+')">이전</p></li>';
		console.log(maxNum);
		for(var i = startBtn-1; i < endBtn; i++ ){
			if(i+1 == pageNum){
				output += '<li class="page-item active"><p class="page-link" onclick="pageLoad(this)">'+(i+1)+'</p></li>';	
			} else{
				output += '<li class="page-item"><p class="page-link" onclick="pageLoad(this)">'+(i+1)+'</p></li>';				
			}
		}
		output += '<li class="page-item"><p class="page-link" onclick="nextPage('+pageNum+')">다음</p></li>';
		element.html(output);
	}
	
	function prePage(pageNum){
		if(pageNum > 1){
			pageNum -= 1;
			location.href = "${pageContext.request.contextPath}/CinfoListPage?pageNum="+pageNum;			
		}
	}
	function nextPage(pageNum){
		var maxNum = '${pageIdxMax}';
		if(pageNum < maxNum){
			pageNum += 1;
			location.href = "${pageContext.request.contextPath}/CinfoListPage?pageNum="+pageNum;			
		}
	}
	
</script>	

<script type="text/javascript">	
		function checkVal(checkedName, selBtn){
		console.log(checkedName);
		
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
			return null;
		} 
		if ($(selBtn).hasClass("scrap_click")) {
			$(selBtn).removeClass("scrap_click");
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/removeScrap",
				data : {"checkedName" : checkedName},
				dataType : "json",
				success:function(result){
				}
			});
			
		}else{
		$(selBtn).addClass("scrap_click");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/scrapEpname",
			data : {"checkedName" : checkedName},
			dataType : "json",
			success:function(result){
			}
		});
		}
		
		}
		
		function selectScrapInfo(){
			$.ajax( { 
				type : "get",
				url : "${pageContext.request.contextPath }/selectScrapInfo",
				async:false,
				dataType:"json",
				success : function(scrapList){
						 for(var scrapinfo of scrapList){
						 $("#"+scrapinfo.spepnum).addClass("scrap_click");
						 }
					
				}
			} );			
		}
		
		function searchValue(){
			var searchVal = $('#searchInput').val();		
			console.log(searchVal);
			if(searchVal.length < 2){
				alert('검색어는 2글자 이상 입력해주세요');
				location.reload();
			} else{
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath }/searchCinfoJson",
					data : {"searchValue" : searchVal},
					dataType : "json",
					success:function(cInfo){
						console.log(cInfo);
						var element = $('#cInfoListArea');
						var output = "";
						if(cInfo.length <= 0){
							alert("검색결과가 없습니다.");
							return null;
						} else{
							for(var i = 0; i<cInfo.length;i++){
								output += '<li style="list-style: none; border-bottom: 1px solid #ebebeb; width: 100%;">';
								output += '<div style="width: 100%; padding: 1rem; align-items: center; display: flex;">';
								output += '<div class="cLogo col-3">';
								output += '<img class="card-img-top" src="${pageContext.request.contextPath }/resources/assets/img/building.png" style="width: 80%; height: auto;">';
								output += '</div>';
								output += '<div class="cName col-9">';
								output += '<a href="${pageContext.request.contextPath }/viewCiInfo?cinum='+cInfo[i].cinum+'">';
								output += '<span class="h3">'+cInfo[i].ciname+'</span>';
								output += '</a>';
								output += '<div class="cDetail">';
								output += '<br><span>'+cInfo[i].ciind+'</span>';
								output += '</div>';
								output += '</div>';
								output += '</div>';
								output += '</li>';
							}	
						}
						element.html(output);
						selectScrapInfo();
						$('.pagination').addClass("d-none");
					}
				});
			}
		}		
	</script>

</html>