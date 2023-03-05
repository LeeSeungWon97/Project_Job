<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button onclick="WriteReview('${cinum}',this)" value="1">합격자소서 등록하기</button>
	<button onclick="WriteReview('${cinum}',this)" value="2">인적성 후기 등록하기</button>
	<button onclick="WriteReview('${cinum}',this)" value="3">면접 후기 등록하기</button>
	<button onclick="WriteReview('${cinum}',this)" value="4">최종합격 후기 등록하기</button>
	<input type="hidden" id="loginType" value="${sessionScope.loginType }">
	<c:choose>
		<c:when test="${sessionScope.loginType == 'P'}">
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.cmid }">
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
	function WriteReview(cinum,Btnval) {
		var rvType = Btnval.value;
		if (loginId == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "${pageContext.request.contextPath}/login";
		} else if (loginType == "C") {
			alert("일반회원을 위한 서비스입니다.");
			location.reload();
		} else {
			window.open("${pageContext.request.contextPath}/ReviewWrite?cinum="
					+ cinum+"&type="+rvType, "후기작성 ", "width=900,height=1500,top=10,left=100");
		}

	}
</script>

</html>