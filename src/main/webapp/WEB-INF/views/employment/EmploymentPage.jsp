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
<title>채용공고</title>
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

.emci {
	width: 17%; /* 기업명 */
}

.emnu {
	width: 1%; /* 스크랩 */
}

.emna {
	width: 30%; /* 제목 */
}

.emde {
	width: 7%;
	text-align: center; /* 마감일 */
}

.embu {
	width: 7%;
	text-align: right; /* 즉시지원 */
}

.selectM {
	background-color: gray;
	color: white;
}

.top {
	border: 2px solid #79BAEC;
	padding: 3px;
	padding-top: 0px;
	display: scroll;
	position: fixed;
	bottom: 20px;
	right: 60px;
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

		<div class="card mt-4 mb-4 border-0 shadow rounded-3" style="width: 1280px;">
			<div class="table-responsive">
				<div class="d-flex justify-content-center">
					<div class="input-group mx-3 mt-4 mb-4" style="width: 100%;">
						<select id="selectType" class="form-select" style="border: 1px solid #ddd; max-width: 120px;">
							<option value="공고">공고명</option>
							<option value="기업">기업명</option>
						</select>
						<input class="form-control" type="search" placeholder="기업명, 공고제목 등 검색" aria-label="Search" name="searchValue" id="searchInput" style="border: 1px solid #ddd;">
						<button class="search-btn " onclick="searchValue()" style="border: 1px solid #ddd; height: auto;">

							<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png" style="width: 90%; height: auto;">
						</button>
					</div>
				</div>
				<!-- <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
  					<button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button> -->

				<!--  -->
				<table class="table">
					<thead style="background-color: #f9f9f8;  border-top: 1px solid black;" id="ajaxCiname">
						<tr style="color: #888; text-align: center;">
							<th scope="col" style="">회사</th>
							<th scope="col"></th>
							<th scope="col" style="">공고명</th>
							<th scope="col" style="">마감일</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="epListArea" style="border-top: none;">
						<c:forEach items="${epList }" var="employ">
							<tr>			
								<td class="emci">
									<a href="${pageContext.request.contextPath }/viewReciname?viewReciname=${employ.epciname }">
										<span>${employ.epciname }</span>
									</a>
								</td>
								<td class="emnu">
									<input type="button" class="scrap" id="${employ.epnum }" onclick="checkVal('${employ.epnum }', this)" value="⭐">
								</td>
								<td class="emna">
									<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${employ.epnum }">
										<span style="color: #333; font-weight: bold;">${employ.epname }</span>
									</a>
								</td>
								<td class="emde">
									<span>${employ.epdeadline }</span>
								</td>
								<td class="embu">
									<button class="mt-1" onclick="WriteResume('sideX','${employ.epnum }')" style="font-size: 14px; background-color: #ff7e00; border: solid #ff7e00;">
										<span style="color: white;">즉시지원</span>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="mx-auto my-auto">
				<ul class="pagination">
				</ul>
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
		if(loginType == 'P'){
		selectScrapInfo();
		}
		createPageBtn();
});
	
	function pageLoad(pageBtn){
		var pageNum = pageBtn.innerText;
		location.href = "${pageContext.request.contextPath}/EmploymentPage?pageNum="+pageNum;
	}
	
	function createPageBtn(){
		var maxNum = '${pageIdxMax}';
		var element = $('.pagination');
		var pageNum = '${pageNum}';
		var output = "";
		console.log(maxNum);
		for(var i = 0; i < maxNum; i++ ){
			if(i+1 == pageNum){
				output += '<li class="page-item active"><p class="page-link" onclick="pageLoad(this)">'+(i+1)+'</p></li>';	
			} else{
				output += '<li class="page-item"><p class="page-link" onclick="pageLoad(this)">'+(i+1)+'</p></li>';				
			}
		}
		element.html(output);
	}
</script>
<script type="text/javascript">
	function searchValue(){
		var searchVal = $('#searchInput').val();	
		var selectType = $('#selectType').val();	
		console.log(searchVal);
		console.log(selectType);
		if(searchVal.length < 2){
			alert('검색어는 2글자 이상 입력해주세요');
			location.reload();
		}
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/searchValueJson",
			data : {"searchValue" : searchVal,
					"selectType" : selectType},
			dataType : "json",
			success:function(epListArea){
				console.log(epListArea);
				var element = $('#epListArea');
				var output = "";
				if(epListArea.length <= 0){
					alert("검색결과가 없습니다.정확한 이름인지 다시 한번 확인해 주세요.");
					return null;
				} else{
					for(var i = 0; i<epListArea.length;i++){
						if(epListArea[i].epesstate == 'x'){
							output += '<tr>';
							output += '<td class="emci">';
							output += '<a href="">';
							output += '<span>'+epListArea[i].epciname+'</span>';
							output += '</a>';
							output += '</td>';
							output += '<td class="emnu">';
							output += '<input type="button" class="scrap" id="'+epListArea[i].epnum+'" onclick="checkVal(\''+epListArea[i].epnum+'\', this)" value="⭐">';
							output += '</td>';
							output += '<td class="emna">';
							output += '<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum='+epListArea[i].epnum+'">';
							output += '<span style="color: #333; font-weight: bold;">'+epListArea[i].epname+'</span>';
							output += '</a>';
							output += '</td>';
							output += '<td class="emde">';
							output += '<span>'+epListArea[i].epdeadline+'</span>';
							output += '</td>';
							output += '<td class="embu">';
							output += '<button class="mt-1" onclick="WriteResume(\'sideX\',\''+epListArea[i].epnum+'\')" style="font-size: 14px; background-color: #ff7e00; border: solid #ff7e00;">';
							output += '<span style="color: white;">즉시지원</span>';
							output += '</button>';
							output += '</td>';
							output += '</tr>';	
						}
					}	
				}
				element.html(output);
				selectScrapInfo();
				$('.pagination').addClass("d-none");
			}
		});
		}	

	function WriteResume(sideX, epnum) {
		var popupWidth = 900;
		var popupHeight = 950;
		var popupX = (window.screen.width/2)-(popupWidth/2);
		var popupY = (window.screen.height/2)-(popupHeight/2);
		console.log(sideX);
		console.log(epnum);
		window.open("${pageContext.request.contextPath}/myResume?sideX="+sideX+"&epnum="+epnum+"&state=1",
				"이력서 선택", "width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);
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
	</script>

</html>