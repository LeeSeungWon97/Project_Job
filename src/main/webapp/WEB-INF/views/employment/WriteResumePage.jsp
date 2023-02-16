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
	<h1>이력서 작성 양식</h1>
	<form action="${pageContext.request.contextPath }/WriteResume" method="post" onsubmit="">
		<%@ include file="/WEB-INF/views/employment/ResumeForm.jsp"%>
		<div class="d-grid mb-4">
			<button class="btn btn-dark btn-lg" type="submit">이력서 저장</button>
		</div>
	</form>

</body>
</html>