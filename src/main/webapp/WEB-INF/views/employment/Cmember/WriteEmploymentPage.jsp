<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서작성페이지</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<h1>공고 작성 양식</h1>
	<form action="${pageContext.request.contextPath }/WriteEmployment" method="post" onsubmit="">
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="epciname" placeholder="기업명" value="${sessionScope.cinfo.ciname}">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="epname" value="-" placeholder="공고명">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="epedu" value="-" placeholder="학력">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="epcareer" value="-" placeholder="경력" >
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="eptreat" value="-" placeholder="우대">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="eptype" value="-" placeholder="고용형태">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="epmoney" value="-" placeholder="급여" >
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="eparea" value="-" placeholder="지역" >
		</div>

		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="eptime" value="-" placeholder="고용시간">
		</div>
		<div class="input-group input-group-lg mb-3">
		<label for="epdeadline">마감일</label>
			<input type="date" class="form-control" id="epdeadline" name="epdeadline" value="-" placeholder="공고마감일">
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
	

</body>
</html>