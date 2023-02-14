<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서작성페이지</title>
</head>
<body>
	<h1>이력서 작성 양식</h1>
	<form action="${pageContext.request.contextPath }/WriteResume" method="post" onsubmit="">
		<div class="input-group input-group-lg mb-3">
			<input type="hidden" class="form-control" placeholder="아이디" name="remid" value="${sessionScope.loginInfo.mid}">
			<input type="text" class="form-control" placeholder="이름" value="${sessionScope.loginInfo.mname}">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" placeholder="이메일" value="${sessionScope.loginInfo.memail}">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="retell" placeholder="전화번호">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" placeholder="주소" value="${sessionScope.loginInfo.maddr}">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="date" class="form-control" placeholder="생년월일" min="1900-01-01" max="" value="${sessionScope.loginInfo.mbirth}">
		</div>

		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="reedu" placeholder="학력" value="${Resume.reedu}">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="recarrer" placeholder="경력" value="${Resume.recarrer }">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="react" placeholder="인턴/대외 활동" value="${Resume.react }">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="relicense" placeholder="자격증" value="${Resume.relicense }">
		</div>
		<div class="input-group input-group-lg mb-3">
			<input type="text" class="form-control" name="rehope" placeholder="희망직무태그" value="${Resume.rehope }">
		</div>
		<div class="d-grid mb-4">
			<button class="btn btn-dark btn-lg" type="submit">이력서 저장</button>
		</div>
	</form>

</body>
</html>