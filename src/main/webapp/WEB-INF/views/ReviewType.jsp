<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성</title>
<style type="text/css">
.Rcontent {
	display: inline-block;
	margin-top: 200px;
	margin-left: 60px;
}

.Rbtn {
	border: none;
	background-color: white;
	cursor: pointer;
	font-size: large;
	margin-right: 5px;
}

.topLine {
	margin-bottom: 40px;
	border-color: black;
}

.bLine {
	margin-top: 40px;
	border-color: black;
}

.Rbtn:hover {
	color: #0d6efd;
}


</style>
</head>
<body>

	<div class="Rcontent mb-2 mt-2">


		<hr class="topLine">
		<button class="Rbtn" onclick="WriteReview('${cinum}',this)" value="1">합격자소서
			등록하기</button>
		<button class="Rbtn" onclick="WriteReview('${cinum}',this)" value="2">인적성
			후기 등록하기</button>
		<button class="Rbtn" onclick="WriteReview('${cinum}',this)" value="3">면접
			후기 등록하기</button>
		<button class="Rbtn" onclick="WriteReview('${cinum}',this)" value="4">최종합격
			후기 등록하기</button>
		<hr class="bLine">

 	
			
	</div>
	<input type="hidden" id="loginType" value="${sessionScope.loginType }">
	<c:choose>
		<c:when test="${sessionScope.loginType == 'P'}">
			<input type="hidden" id="loginId"
				value="${sessionScope.loginInfo.mid }">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="loginId"
				value="${sessionScope.loginInfo.cmid }">
		</c:otherwise>
	</c:choose>

</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var loginType = $('#loginType').val();
	var loginId = $('#loginId').val();
	$(document).ready(function() {

	});
</script>
<script type="text/javascript">
	function WriteReview(cinum, Btnval) {
		var rvType = Btnval.value;
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
		} else if (loginType == "C") {
			alert("일반회원을 위한 서비스입니다.");
			location.reload();
		} else {
			window.open("${pageContext.request.contextPath}/ReviewWrite?cinum="
					+ cinum + "&type=" + rvType, "후기작성 ",
					"width=900,height=1500,top=10,left=100");
		}

	}
	

</script>

</html>