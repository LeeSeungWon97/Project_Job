<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>커뮤니티</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>

	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>

	<!-- Section  -->
	<section id="section">


		<div class="card mt-4 mb-4 shadow rounded-3" style="width: 1000px; border: 1px solid #e3e6f0;">

			<div class="d-flex justify-content-between">
				<div class="mt-4 mb-3">
					<div class="input-group mx-3" style="width: 100%;">
						<select id="selectType" class="form-select" style="border: 1px solid #ddd; max-width: 120px;">
							<option value="ALL">전체</option>
							<option value="BTITLE">제목</option>
							<option value="BCONTENTS">내용</option>
							<option value="BMID">작성자</option>
						</select>
						<select id="selectTag" class="form-select" style="border: 1px solid #ddd; max-width: 120px;">
								<option value="ALL">전체</option>
								<option value="기타">기타</option>
								<option value="경영,사무">경영,사무</option>
								<option value="마케팅,광고,홍보">마케팅,광고,홍보</option>
								<option value="IT인터넷">IT인터넷</option>
								<option value="디자인">디자인</option>
								<option value="무역,유통">무역,유통</option>
								<option value="영업,고객상담">영업,고객상담</option>
								<option value="서비스">서비스</option>
								<option value="연구개발,설계">연구개발,설계</option>
								<option value="생산,제조">생산,제조</option>
								<option value="교육">교육</option>
								<option value="건설">건설</option>
								<option value="의료">의료</option>
								<option value="미디어">미디어</option>
								<option value="전문,특수직">전문,특수직</option>
						</select>
						 <input class="form-control" type="search" placeholder="검색어를 입력해주세요" aria-label="Search" name="searchValue" id="searchInput" style="border: 1px solid #ddd;">
						<button class="search-btn" onclick="searchValue()" style="border: 1px solid #ddd; height: auto;">
							<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png" style="width: 90%; height: auto;">
						</button>
					</div>
				</div>
						
				<div class="mt-4 mb-3">
					<div class="mx-3">
						
					
						<button class="btn-dark btn-lg" style="color: white;" onclick="boardWritePage()">글쓰기</button>
					</div>
				</div>
			</div>


			<div class="card-body">
				<div class="table-responsive">
					<div class="row" style="line-height: 2;">
						<table class="table">
							<thead style="background-color: #f9f9f8; border-top: 1px solid black;">
								<tr>
									<th scope="col" style="padding: 12px; text-align: center;">번호</th>
									<th scope="col" style="padding: 12px;">제목</th>
									<th scope="col" style="padding: 12px;">작성자</th>
									<th scope="col" style="padding: 12px; text-align: center;">작성일</th>
									<th scope="col" style="padding: 12px; text-align: center;">조회</th>
								</tr>
							</thead>

							<tbody id="boardListArea" class="reserveArea" style="border-top: 1px solid #eaeaea;">
								<c:forEach items="${boardList}" var="board">
									<tr>
										<td style="padding: 12px; width: 10%; text-align: center;">${board.bno}</td>
										<td style="padding: 12px; width: 30%;"><a href="${pageContext.request.contextPath }/ViewBoardInfo?bno=${board.bno}"> <span>${board.btitle}</span>
										</a></td>
										<td style="padding: 12px; width: 20%;"><span>${board.bmid}</span></td>
										<td style="padding: 12px; width: 15%; text-align: center;"><span>${board.bdate}</span></td>
										<td style="padding: 12px; width: 5%; text-align: center;"><span>${board.bcount}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--  


							<div class="small mb-1">${board.bhope}, 조회수: ${board.bcount} 댓글 : ${board.breplycount}</div>
		
				
		-->
	
		
		
		
		<input type="hidden" id="loginType" value="${sessionScope.loginType }">
		<c:choose>
			<c:when test="${sessionScope.loginType == 'P'}">
				<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
			</c:when>
			<c:otherwise>
				<input type="hidden" id="loginId" value="${sessionScope.loginInfo.cmid }">
			</c:otherwise>
		</c:choose>
		<div class="col-2"></div>
	</div>
	<!--end board  -->

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>
</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var loginType = $('#loginType').val();
	var loginId = $('#loginId').val();	
	
	function searchValue(){
		var searchVal = $('#searchInput').val();	
		var selectType = $('#selectType').val();	
		var selectTag = $('#selectTag').val();	
		console.log(searchVal);
		console.log(selectType);
		console.log(selectTag);
		if(searchVal.length < 2){
			alert('검색어는 2글자 이상 입력해주세요');
			location.reload();
		}
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/searchBoardJson",
			data : {"searchValue" : searchVal,
					"selectType" : selectType,
					"selectTag" : selectTag},
			dataType : "json",
			success:function(boardList){
				console.log(boardList);
				var element = $('#boardListArea');
				var output = "";
				var count = 0;
				if(boardList.length <= 0){
					alert("검색결과가 없습니다.");
					return null;
				} else{
					for(var i = 0; i<boardList.length;i++){
							output += '<tr>';
							output += '<td style="padding: 12px; width: 10%; text-align: center;">'+boardList[i].bno+'</td>';
							output += '<td style="padding: 12px; width: 30%;"><a href="${pageContext.request.contextPath }/ViewBoardInfo?bno='+boardList[i].bno+'"> <span>'+boardList[i].btitle+'</span>'
							output += '</a>';
							output += '</td>';
							output += '<td style="padding: 12px; width: 20%;"><span>'+boardList[i].bmid+'</span></td>';
							output += '<td style="padding: 12px; width: 15%; text-align: center;"><span>'+boardList[i].bdate+'</span></td>';
							output += '<td style="padding: 12px; width: 5%; text-align: center;"><span>'+boardList[i].bcount+'</span></td>';
							output += '</tr>';
					}
					if(count == boardList.length){
						alert("검색결과가 없습니다.");
						return null;
					}
				}
				element.html(output);
			}
		});
		}
	
	function boardWritePage() {
		console.log("글작성 버튼 클릭");
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
			return null;
		}
		location.href = "${pageContext.request.contextPath }/BoardWritePage"

	}
</script>
</html>