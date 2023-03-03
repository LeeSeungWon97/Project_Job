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
			<div class="card border-0 shadow rounded-3 mt-3 mb-3" style="width: 60%;">
				<span class="h3 mt-2" style="text-align: center;">공고 양식</span>

				<div class="card-body px-5 mt-1">


					<form action="${pageContext.request.contextPath }/BoardWrite" method="post" class="user" onsubmit="return BoardWriteCheck(this)">
						<div class="form-group ">
							<input name="btitle" type="text" id="inputTitle" placeholder="제목을 입력해주세요." class="form-control form-control-user">
							<c:choose>
								<c:when test="${sessionScope.loginType =='P'}">
									<input name="bmid" type="hidden" id="sessionId" value="${sessionScope.loginInfo.mid}" class="form-control form-control-user">
								</c:when>
								<c:otherwise>
									<input name="bmid" type="hidden" id="sessionId" value="${sessionScope.loginInfo.cmid}" class="form-control form-control-user">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="form-group">
							<textarea name="bcontents" id="inputContent" class="form-control" rows="10"></textarea>
						</div>
						<div class="form-group ">
							<input type="hidden" >
							<label for="inputHope" >관력 직무 태그</label>
							 <select  id="inputHope" name="bhope" class="form-control">
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
							<!-- <input name="bhope" type="text" id="inputHope" placeholder="#태그입력(#으로 구분해주세요.)" class="form-control form-control-user"> -->
						</div>
						<div class="form-group " style="text-align: center;">
							<button class="btn btn-dark btn-lg" type="submit">글작성</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function BoardWriteCheck(formObj) {

			var btitle = formObj.btitle.value;
			var bmid = formObj.bmid.value;
			var bcontents = formObj.bcontents.value;
			var bhope = formObj.bhope.value;
			if (btitle.length<0){
				btitle.focus();
				alert('글 제목을 입력해주세요! ');
			}else{
				return true;
			}

		}
	</script>
</body>
</html>