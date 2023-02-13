<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>info</title>
<!-- Favicon-->
 <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
    		<a class="navbar-brand" href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 200px; height:100px;"></a> 
    	</div>
	    	<div class="row">
	    		<div class="col-2">
	    		<!-- SideBar -->	
	 			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 100%; display: flex; ">
			      	<a href="" class="d-flex align-items-center link-dark text-decoration-none">
			        	<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
			        	<strong>mdo</strong>
			      	</a>
			   		<hr>
			    <ul class="nav nav-pills flex-column mb-auto">
			    	<li class="nav-item">
			        	<a href="${pageContext.request.contextPath }" class="nav-link link-dark">
			          	내정보
			       		</a>
			     	 </li>
			      <li>
			        <a href="${pageContext.request.contextPath }" class="nav-link link-dark">
			          이력서
			        </a>
			      </li>
			      <li>
			        <a href="${pageContext.request.contextPath }" class="nav-link link-dark">
			        지원현황
			        </a>
			      </li>
			      <li>
			        <a href="${pageContext.request.contextPath }" class="nav-link link-dark">
			        	스크랩
			        </a>
			      </li>
			      <li>
			        <a href="${pageContext.request.contextPath }" class="nav-link link-dark">
			       열람기업
			        </a>
			      </li>
			    </ul>
 				 </div>
				</div>      	
				    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    		<div class="col-lg-10 col-xl-8 mx-auto">
	    			<div class="card flex-row  border-0 shadow rounded-3">
	    				<div class="card-body p-4 p-sm-5 mb-3">
						<c:choose>
							<c:when test="${sessionScope.loginType == 'P'}">
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">아이디</span>
									<input type="text" class="id form-control" value="${sessionScope.loginInfo.mid }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">비밀번호</span>
									<input type="password" class="pw form-control" value="${sessionScope.loginInfo.mpw }" readonly="readonly" style="background-color: white;">
									<input type="hidden" class="pwBtn btn btn-secondary" onclick="changePw()" value="변경">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">이름</span>
									<input type="text" class="name form-control" value="${sessionScope.loginInfo.mname }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">주소</span>
									<input type="text" class="addr form-control" value="${sessionScope.loginInfo.maddr }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">생년월일</span>
									<input type="text" class="form-control" value="${sessionScope.loginInfo.mbirth }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">이메일</span>
									<input type="text" class="email form-control" value="${sessionScope.loginInfo.memail }" readonly="readonly" style="background-color: white;">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<input type="hidden" class="cmcinum" value="${sessionScope.loginInfo.cmcinum }" readonly="readonly">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">회사명</span>
									<input type="text" class="cmciname form-control" readonly="readonly" style="background-color: white;" >
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">아이디</span>
									<input type="text" class="id form-control" value="${sessionScope.loginInfo.cmid }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">비밀번호</span>
									<input type="password" class="pw form-control" value="${sessionScope.loginInfo.cmpw }" readonly="readonly" style="background-color: white;">
									<input type="hidden" class="pwBtn btn btn-secondary" onclick="changePw()" value="변경">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">이름</span>
									<input type="text" class="name form-control" value="${sessionScope.loginInfo.cmname }" readonly="readonly" style="background-color: white;">
								</div>
								<div class="input-group input-group-lg mb-3">
									<span class="input-group-text" style="width: 18%; justify-content: center;">이메일</span>
									<input type="text" class="email form-control" value="${sessionScope.loginInfo.cmemail }" readonly="readonly" style="background-color: white;">
								</div>
							</c:otherwise>
						</c:choose>

							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input type="button" class="changeBtn btn btn-outline-primary btn-lg mx-1" onclick="changeInfo()" value="수정">
						<input type="hidden" class="saveBtn btn btn-outline-primary btn-lg mx-1" onclick="saveInfo()" value="저장">
						<input type="button" class="deleteBtn btn btn-outline-danger btn-lg" onclick="deleteInfo()" value="탈퇴">
						<input type="hidden" class="cancleBtn btn btn-outline-secondary btn-lg" onclick="changeCancle()" value="취소">
					</div>

					</div>
				</div>
			</div>
		</div>
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
			window.open("${pageContext.request.contextPath }/deleteUser",
						"회원 탈퇴", "width=400,height=400,top=10,left=100");
		}

		function changeCancle() {
			console.log("changeCancle() 호출");
			location.reload();
		}
		
		function deleteCheck(result){
			if(result){
				location.href="${pageContext.request.contextPath}/logout"	
			} else{
				location.reload();
			}
		}
	</script>
</body>
</html>