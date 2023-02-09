<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<input type="hidden" id="mType" value="${sessionScope.loginType }">
		<c:choose>
			<c:when test="${sessionScope.loginType == 'P'}">

				<div>
					<label>아이디</label><br>
					<input type="text" class="id" value="${sessionScope.loginInfo.mid }" readonly="readonly">
				</div>
				<div>
					<label>비밀번호</label><br>
					<input type="password" class="pw" value="${sessionScope.loginInfo.mpw }" readonly="readonly">
					<input type="hidden" class="pwBtn" onclick="changePw()" value="변경">
				</div>
				<div>
					<label>이름</label><br>
					<input type="text" class="name" value="${sessionScope.loginInfo.mname }" readonly="readonly">
				</div>
				<div>
					<label>주소</label><br>
					<input type="text" class="addr" value="${sessionScope.loginInfo.maddr }" readonly="readonly">
				</div>
				<div>
					<label>생년월일</label><br>
					<input type="text" value="${sessionScope.loginInfo.mbirth }" readonly="readonly">
				</div>
				<div>
					<label>이메일</label><br>
					<input type="text" class="email" value="${sessionScope.loginInfo.memail }" readonly="readonly">
				</div>

			</c:when>
			<c:otherwise>
				<div>
					<input type="hidden" class="cmcinum" value="${sessionScope.loginInfo.cmcinum }" readonly="readonly">
				</div>
				<div>
					<label>회사명</label><br>
					<input type="text" class="cmciname" value="${cmciname }"  readonly="readonly">
				</div>
				<div>
					<label>아이디</label><br>
					<input type="text" class="id" value="${sessionScope.loginInfo.cmid }" readonly="readonly">
				</div>
				<div>
					<label>비밀번호</label><br>
					<input type="password" class="pw" value="${sessionScope.loginInfo.cmpw }" readonly="readonly">
					<input type="hidden" class="pwBtn" onclick="changePw()" value="변경">
				</div>
				<div>
					<label>이름</label><br>
					<input type="text" class="name" value="${sessionScope.loginInfo.cmname }" readonly="readonly">
				</div>
				<div>
					<label>이메일</label><br>
					<input type="text" class="email" value="${sessionScope.loginInfo.cmemail }" readonly="readonly">
				</div>
			</c:otherwise>
		</c:choose>
		<input type="button" class="changeBtn" onclick="changeInfo()" value="수정">
		<input type="hidden" class="saveBtn" onclick="saveInfo()" value="저장">
		<input type="button" class="deleteBtn" onclick="deleteInfo()" value="탈퇴">
		<input type="hidden" class="cancleBtn" onclick="changeCancle()" value="취소">
	</div>


	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<!-- 정규식  -->
	<script src="${pageContext.request.contextPath }/resources/js/regex.js"></script>
	
	<script type="text/javascript">	
		function changePw() {
			console.log("changePw() 호출");
			window.open("${pageContext.request.contextPath }/changePw",
					"비밀번호 변경", "width=400,height=400,top=10,left=100");
		}

		function changeInfo() {
			console.log("changeInfo() 호출");
			$('.pw').prop("readonly", false);
			$('.name').prop("readonly", false);
			$('.addr').prop("readonly", false);
			$('.email').prop("readonly", false);
			$('.pwBtn').prop("type", "button");
			$('.changeBtn').prop("type", "hidden");
			$('.saveBtn').prop("type", "button");
			$('.deleteBtn').prop("type", "hidden");
			$('.cancleBtn').prop("type", "button");
		}

		function saveInfo() {
			console.log("saveInfo() 호출");
			var mType = $('#mType').val();
			var id = $('.id').val();
			var pw = $('.pw').val();
			var name = $('.name').val();
			var addr = $('.addr').val();
			var email = $('.email').val();
			console.log("로그인 타입: " + mType);
			console.log("로그인 아이디: " + id);
			console.log("로그인 비밀번호: " + pw);
			console.log("로그인 이름: " + name);
			console.log("로그인 주소: " + addr);
			console.log("로그인 이메일: " + email);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/updateInfo",
				data : {
					"mType" : mType,
					"id" : id,
					"pw" : pw,
					"name" : name,
					"addr" : addr
				},
				success : function(result) {
					console.log(result);
					if (result == "OK") {
						alert("회원정보가 수정되었습니다. 다시 로그인 해주세요");
						location.href = "${pageContext.request.contextPath}/";
					} else {
						alert("오류가 발생했습니다.");
						location.reload();
					}
				}
			});

			$('.pw').prop("readonly", true);
			$('.name').prop("readonly", true);
			$('.addr').prop("readonly", true);
			$('.pwBtn').prop("type", "hidden");
			$('.changeBtn').prop("type", "button");
			$('.saveBtn').prop("type", "hidden");
			$('.deleteBtn').prop("type", "button");
			$('.cancleBtn').prop("type", "hidden");
		}

		function deleteInfo() {
			console.log("deleteInfo() 호출");
			alert("회원탈퇴를 하시겠습니까?");
		}

		function changeCancle() {
			console.log("changeCancle() 호출");
			location.reload();
		}
	</script>
</body>
</html>