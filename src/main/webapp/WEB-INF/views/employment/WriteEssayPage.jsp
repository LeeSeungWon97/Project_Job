<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자소서 작성페이지</title>
</head>
<body>
	<h1>자소서 작성 양식</h1>
	<form action="${pageContext.request.contextPath }/WriteEssay" method="post" onsubmit="EssayClose()">
		<div class="input-group input-group-lg mb-3">
			<input type="hidden" class="form-control" placeholder="자소서 작성 아이디" name="esmid" value="${sessionScope.loginInfo.mid}">
			<input type="hidden" class="form-control" placeholder="공고코드" name="esepnum" value="${epnum}">
			<input type="hidden" class="form-control" name="escontents" id="escontents">
			<input type="text" class="form-control" placeholder="기업명" name="esciname" value="${epciname}">
			<input type="text" class="form-control" placeholder="공고명" value="${epname}">
		</div>


		<input type="text" class="form-control" name="retell" placeholder="1번질문" value="1번질문">
		<div class="input-group input-group-lg mb-3">
			<textarea rows="" cols="" onchange="writeContents()" id="area1"></textarea>
		</div>
		<input type="text" class="form-control" placeholder="2번질문" value="2번질문">
		<div class="input-group input-group-lg mb-3">
			<textarea rows="" cols="" onchange="writeContents()" id="area2"></textarea>
		</div>
		<input type="text" class="form-control" placeholder="3번질문" value="3번질문">
		<div class="input-group input-group-lg mb-3">
			<textarea rows="" cols="" onchange="writeContents()" id="area3"></textarea>
		</div>
		<div class="d-grid mb-4">
			<button class="btn btn-dark btn-lg" type="submit">자소서 저장</button>
		</div>
	</form>
	<button onclick="contentsCheck()">escontentCheck</button>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function writeContents() {
			var escontents = '!@#' + $('#area1').val() + '!@#'
					+ $('#area2').val() + '!@#' + $('#area3').val();
			$('#escontents').attr('value', escontents);
		}

		function contentsCheck() {
			var escontents = document.getElementById('escontents').value;
			console.log(escontents);
		}
	</script>

</body>
</html>




