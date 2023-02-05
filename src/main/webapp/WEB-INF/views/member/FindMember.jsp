<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />


</head>
<body>


	<div>
		<div class="mt-5 pt-4">
			<h3 class="card-title text-center pb-0 ">아이디 찾기</h3>
		</div>
	</div>


	<div class="containe">
		<div class="row">

			<div class="col-xs-7 col-xl-4 mx-auto">
				<div class="card flex-row my-2 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<form action="${pageContext.request.contextPath }/FindMember" method="post" onsubmit="return checkInputVal(this)">
							<div>
								<input type="radio" id="personal" name="loginType" value="개인">
								<label for="personal">개인</label>
								<input type="radio" id="company" name="loginType" value="기업">
								<label for="company">기업</label>
							</div>
							
							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="form-control" id="ciname" name="ciname" placeholder="기업명">
							</div>
							
							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="form-control" id="mname" name="mname" maxlength="15" placeholder="이름">
							</div>

							<div class="input-group input-group-xs mt-1 mb-2">
								<input type="text" class="form-control" id="memail" name="memail" placeholder="이메일주소">
							</div>

							

							<div class="d-grid mb-3">
								<button class="btn btn-dark" type="submit">아이디 찾기</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
	
	<script type="text/javascript">
		function checkInputVal(formObj) {
			var selectType = formObj.loginType;
			var mname = formObj.mname;
			var memail = formObj.memail;
			if (mname.value.length == 0) {
				alert("아이디를 입력해주세요.");
				mname.focus();
				return false;
			} else if (memail.value.length == 0) {
				alert("비밀번호를 입력해주세요.");
				memail.focus();
				return false;
			} else {
				alert("입력 메일로 아이디 정보가 발송되었습니다!");
				return true;
			}
		}
		
		$("input:radio[name=loginType]").click(function(){
		    console.log('radio버튼 선택')
		    if($("input:radio[name=loginType]:checked").val()=='기업'){
		    console.log('기업 선택')
		        $("#ciname").removeClass("d-none");
		    }else{
		    console.log('개인 선택')
		        $("#ciname").addClass("d-none");
		    }
		});
	
		
	</script>
</body>
</html>