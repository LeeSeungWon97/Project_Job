<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<a class="navbar-brand" href="${pageContext.request.contextPath }/">
					<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
				</a>
			</div>
		</div>
	</header>




	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="card border-0 shadow rounded-3 mt-3 mb-3" style="width: 60%;">
			<span class="h3 mt-2"style="text-align: center;">공고 양식</span>
			
			<div class="card-body px-5 mt-1">
			
			<form action="${pageContext.request.contextPath }/WriteEmployment" method="post" onsubmit="">
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">기업명</span>
					<input type="text" class="form-control" name="epciname" value="${sessionScope.cinfo.ciname}" readonly="readonly" style="background-color: white;">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">공고명</span>
					<input type="text" class="form-control" name="epname" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">학력</span>
					<select name="epedu" class="form-control">
							<option value="대학교졸업(4년)">대학교졸업(4년)</option>
							<option value="대졸(2년)">대졸(2년)</option>
							<option value="대학원 석사 졸업">대학원 석사 졸업</option>
							<option value="대학원 박사 졸업">대학원 박사 졸업</option>
							<option value="고등학교 졸업">고등학교 졸업</option>
							<option value="학력무관">학력무관</option>
					</select> 
					<!-- <input type="text" class="form-control" name="epedu" value=""> -->
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">경력</span>
					<input type="text" class="form-control" name="epcareer" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">우대</span>
					<input type="text" class="form-control" name="eptreat" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">고용형태</span>
					<select name="eptype" class="form-control">
							<option value="정규직">정규직</option>
							<option value="계약직">계약직</option>
							<option value="인턴">인턴</option>
							<option value="파견직">파견직</option>
							<option value="도급">도급</option>
							<option value="프리랜서">프리랜서</option>
							<option value="아르바이트">아르바이트</option>
							<option value="연수생/교육생">연수생/교육생</option>
					</select> 
					<!-- <input type="text" class="form-control" name="eptype" value=""> -->
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">급여</span>
					<input type="text" class="form-control" name="epmoney" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">지역</span>
					<input type="text" class="form-control" name="eparea" value="" readonly="readonly" style="background-color: white;">
				</div>
		
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">고용시간</span>
					<input type="text" class="form-control" name="eptime" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="width: 15%; justify-content: center;">마감일</span>
					<input type="date" class="form-control" id="epdeadline" name="epdeadline" value="">
				</div>
				<div class="input-group input-group-lg mb-3">
					<input type="hidden" class="form-control" name="epstate" value="Y" placeholder="공고상태">
				</div>
				<div class="input-group input-group-lg mb-3">
					<input type="hidden" class="form-control" name="epesstate" value="x" placeholder="자소서여부">
				</div>
				
				<div class="d-grid mb-4">
					
					<button class="btn btn-dark btn-lg" type="submit">공고 저장</button>
				</div>
			</form>
			
			
			</div>
			</div>
		</div>
	</section>
	
</body>
</html>