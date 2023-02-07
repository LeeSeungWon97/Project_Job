<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JoinForm</title>
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
			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row my-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<form action="${pageContext.request.contextPath }/joinMember" method="post" onsubmit="return joinFormCheck(this)">
							<div class="input-group input-group-lg mb-1">
								<input type="text" class="form-control" id="mid" name="mid" placeholder="아이디">
								<button type="button" class="btn btn-secondary" onclick="checkSameId()">중복체크</button>
							</div>
							<div class="mb-3">
								<span id="idCheckResult"></span>
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="password" class="form-control" id="mpw" name="mpw" placeholder="비밀번호" onchange="checkPwForm()">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="password" class="form-control" id="mpwCheck" placeholder="비밀번호확인" onchange="checkPwVal()">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="text" class="form-control" id="mname" name="mname" placeholder="이름" onchange="checkName()">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="date" class="form-control" id="mbirth" name="mbirth" placeholder="생년월일" onchange="checkBirth()" min="1900-01-01" max="">
							</div>
							<div class="input-group">
								<input type="text" id="postcode" placeholder="우편번호" disabled="disabled" class="form-control">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
							</div>
							<div class="input-group mb-3">
								<input type="text" id="address" placeholder="주소" disabled="disabled" class="form-control">
								<input type="text" id="detailAddress" placeholder="상세주소" disabled="disabled" onchange="createAddr()" class="form-control">
								<input type="text" id="extraAddress" placeholder="참고항목" disabled="disabled" class="form-control">
								<input type="hidden" id="maddr" name="maddr">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="hidden" class="form-control" id="memail" name="memail" placeholder="이메일">
								<input type="text" class="form-control" id="emailId" onchange="createEmail()" placeholder="이메일">
								<span class="input-group-text">@</span>
								<input type="text" id="domain" onchange="createEmail()" class="form-control">
								<select onchange="domainSelect(this)" class="form-select">
									<option value="">직접입력</option>
									<option value="daum.com">다음</option>
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="kakao.com">카카오</option>
								</select>
							</div>
							<div class="input-group mb-1">
								<input type="text" id="inputCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력" class="form-control">
								<input type="hidden" id="emailCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력">
								<button type="button" id="mailCheckBtn" class="btn btn-secondary">이메일 인증번호 받기</button>
							</div>
							<div class="mb-4">
								<span id="mailCheckResult"></span>
							</div>
							<div class="d-grid mb-4">
								<button class="btn-lg" type="submit" style="background-color: #539DDB; border: solid #539DDB;"><span style="color: white;">회원가입</span></button>
							</div>
							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		var today = new Date().toISOString().substring(0, 10);
		document.getElementById('mbirth').value = today;
		$('#mbirth').prop("max",today);
		checkReset();
	});
	</script>
	<!-- 정규식 -->
	<script type="text/javascript">
		const regex_En = /[a-zA-Z]/;
		const regex_Ko = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const regex_Num = /[0-9]/;
		const regex_Sc = /[\!\@\#\$\%]/;
		
		function checkRegex(inputVal,type){
			console.log("확인 요청값: " + inputVal);
			console.log("확인 요청 유형: " + type);
			var checkType = null;
			var isResult = false;
			switch(type){
			case 'en':
				checkType = regex_En;
				break;
			case 'ko':
				checkType = regex_Ko;
				break;
			case 'num':
				checkType = regex_Num;
				break;
			case 'sc':
				checkType = regex_Sc;
				break;
			}
			for(var i = 0; i < inputVal.length;i++){
				var ch = inputVal.charAt(i);
				if(checkType.test(ch)){
					isResult = true;
				}
			}
			return isResult;
		}
	</script>
	<!-- html -->
	<script type="text/javascript">
	
		// 아이디 중복 및 양식 확인
		var isCheckId = false;
		
		// 비밀번호 양식 확인
		var isCheckPw = false;
		
		// 비밀번호 재입력 확인
		var isCheckPwVal = false;
		
		// 이름 양식 확인
		var isCheckName = false;
		
		// 생년월일 양식 확인
		var isCheckBirth = false;
		
		// 이메일 인증 확인
		var isCheckEmail = false;
		
		function checkReset(){
			isCheckId = false;
			isCheckPw = false;
			isCheckPwVal = false;
			isCheckName = false;
			isCheckBirth = false;
			isCheckEmail = false;
		}

		// 회원가입 양식값 확인
		function joinFormCheck(formObj) {
			console.log("joinFormCheck() 호출");
			
			if(!isCheckId){
				formObj.mid.focus();
				return false;
			} else if(!isCheckPw){
				formObj.mpw.focus();
				return false;
			} else if(!isCheckPwVal){
				$('#mpwCheck').focus();
				return false;
			} else if(!isCheckName){
				formObj.mname.focus();
				return false;
			} else if(!isCheckBirth){
				formObj.mbirth.focus();
				return false;
			} else if(!isCheckEmail){
				$('#mailCheckBtn').focus();
				return false;
			} else{		
				return true;
			}
		}

		// 아이디 중복 체크
		function checkSameId() {
			var inputId = $('#mid').val();
			
			isCheckId = false;
			
			if (inputId.length < 4) {
				isCheckId = false;
				$('#idCheckResult').text('아이디는 최소 4글자 이상입니다.').css('color',
						'red');
			} else if(checkRegex(inputId,'ko') || checkRegex(inputId,'sc')||!checkRegex(inputId,'en')){
				isCheckId = false;
				$('#idCheckResult').text('아이디는 영문+숫자입니다.').css('color',
				'red');
			} else {
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath }/joinMIdCheck?mid='
							+ inputId,
					async : false,
					success : function(result) {
						if (result == 'OK') {
							isCheckId = true;
							$('#idCheckResult').text('사용 가능한 아이디!')
									.css('color', 'green');
						} else {
							isCheckId = false;
							$('#idCheckResult').text('사용중인 아이디!').css(
									'color', 'red');
						}
					},
				});
			}
			console.log("isCheckId: " + isCheckId);
		}

		// 비밀번호 양식 체크
		function checkPwForm() {
			var inputPw = $('#mpw').val();
			var checkEn = false;
			var checkNum = false;
			var checkSc = false;
			
			isCheckPw = false;
			if (inputPw.length >= 8 && inputPw.length <= 16) {
				checkEn = checkRegex(inputPw,'en');
				checkNum = checkRegex(inputPw,'num');
				checkSc = checkRegex(inputPw,'sc');
				console.log("checkEn: " + checkEn +", checkNum: "+checkNum+", checkSc: " + checkSc);
				if (checkEn && checkNum && checkSc) {
					isCheckPw = true;
				} else {
					ischeckPw = false;
					alert("비밀번호는 영문+숫자+특수문자(!,@,#,$,%)가 포함되어야 합니다.");
				}
			} else {
				ischeckPw = false;
				alert("비밀번호는 8~16글자 입니다.");
			}
			console.log("isCheckPw: " + isCheckPw);
		}

		// 비밀번호 확인 체크
		function checkPwVal() {
			var inputPw = $('#mpw').val();
			var ReInputPw = $('#mpwCheck').val();
			if (inputPw == ReInputPw) {
				isCheckPwVal = true;
			} else {
				isCheckPwVal = false;
			}
			console.log("isCheckPwVal: " + isCheckPwVal);
		}

		// 이름 양식 확인 체크
		function checkName() {
			var inputName = $('#mname').val();
			isCheckName = false;
			if (inputName.length < 2) {
				isCheckName = false;
				alert("이름을 입력해 주세요")
			} else if(checkRegex(inputName,'num')||checkRegex(inputName,'sc')){
				isCheckName = false;
				alert("이름은 한글/영어로 입력해주세요");
			} else{
				isCheckName = true;
			}
			console.log("isCheckName: " + isCheckName);
		}
		
		// 생년월일 확인 체크
		function checkBirth(){
			var inputBirth = $('#mbirth').val();
			isCheckBirth = false;
			if(inputBirth.length != 10){
				isCheckBirth = false;
			} else {
				isCheckBirth = true;
			}
			console.log("isCheckBirth: " + isCheckBirth);
		}

		// 도메인 선택
		function domainSelect(obj) {
			document.getElementById('domain').value = obj.value;
			createEmail();
		}

		// 이메일아이디 + 도메인 병합
		function createEmail() {
			var totalEmail = $('#emailId').val() + '@' + $('#domain').val();
			$('#memail').attr('value', totalEmail);
		}
	</script>

	<!-- adress -->
	<script type="text/javascript">
		// 전체 주소 설정
		function createAddr() {
			var addr = $('#address').val();
			var detailAddr = $('#detailAddress').val();
			var totalAddr = addr + " " + detailAddr;
			$('#maddr').attr('value', totalAddr);
		}

		// 우편번호 검색 
		function DaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							$('#detailAddress').attr('disabled', false);
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}
	</script>

	<!-- email -->
	<script type="text/javascript">
		// 인증코드 전송
		$('#mailCheckBtn')
				.click(
						function() {
							var email = $('#memail').val();
							console.log(email);
							$
									.ajax({
										type : 'get',
										url : '${pageContext.request.contextPath }/mailCheck?email='
												+ email,
										success : function(data) {
											console.log(data);
											alert('인증번호가 발송되었습니다.');
											$('#emailCode').attr('value', data);
											$('#inputCode').attr('disabled',
													false);
											$('#inputCode').focus();
										}
									});
						});

		// 이메일 인증 번호 확인
		$('#inputCode').change(function() {
			var inputVal = $('#inputCode').val();
			var correctCode = $('#emailCode').val();
			console.log(inputVal.length);
			if (inputVal == correctCode) {
				$('#mailCheckResult').text('인증성공!')
				$('#mailCheckResult').css('color', 'green');
				isCheckEmail = true;
			} else if (inputVal.length < 6) {
				$('#mailCheckResult').text('');
				isCheckEmail = false;
			} else {
				$('#mailCheckResult').text('인증실패!');
				$('#mailCheckResult').css('color', 'red');
				isCheckEmail = false;
			}
			console.log(isCheckEmail);
		});
	</script>
</body>
</html>