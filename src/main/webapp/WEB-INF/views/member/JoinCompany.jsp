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
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
    		<a class="navbar-brand" href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" style="width:120px; height:100px;"></a> 
    	</div>
		<div class="row">
			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row my-4 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3">
						<form action="${pageContext.request.contextPath }/joinCiMember" method="post" onsubmit="return joinFormCheck(this)">

							<div class="input-group input-group-lg mb-3">
								<input type="text" class="form-control" disabled="disabled" id="inputCiname" name="cmciname" placeholder="회사명">
								<input type="button" onclick="findWP()" class="btn btn-secondary" value="회사검색">
							</div>

							<div class="input-group input-group-lg mb-3">
								<input type="hidden" class="form-control" readonly="readonly" id="inputCinum" name="cmcinum" placeholder="사업자 등록번호">
								<input type="text" class="form-control" disabled="disabled" id="inputCileader" name="cmcileader" placeholder="대표자">
								<input type="text" class="form-control" disabled="disabled" id="inputCitype" name="inputCitype" placeholder="기업형태">
							</div>


							<div class="input-group input-group-lg mb-3">
								<input type="text" id="inputCiaddr" name="ciaddr" placeholder="회사주소" readonly="readonly" class="form-control">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
							</div>


							<div class="input-group input-group-lg mb-1">
								<input type="text" class="form-control" id="cmid" name="cmid" placeholder="아이디">
								<button type="button" class="btn btn-secondary" onclick="checkSameCId()">중복체크</button>
							</div>
							<div class="mb-3">
								<span id="idCheckResult"></span>
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="text" class="form-control" name="cmpw" maxlength="16" placeholder="비밀번호">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="text" class="form-control" name="cmname" placeholder="이름">
							</div>

							<div class="input-group input-group-lg mb-3">
								<input type="hidden" class="form-control" id="cmemail" name="cmemail" placeholder="이메일">
								<input type="text" class="form-control" id="cemailId" onchange="createEmail()" placeholder="이메일">
								<span class="input-group-text">@</span>
								<input type="text" id="cdomain" onchange="createEmail()" class="form-control">
								<select onchange="domainSelect(this)" class="form-select">
									<option value="">직접입력</option>
									<option value="daum.com">다음</option>
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="kakao.com">카카오</option>
								</select>
							</div>
							
							<div class="input-group mb-1">
								<input type="text" id="cinputCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력" class="form-control">
								<input type="hidden" id="cemailCode" disabled="disabled" maxlength="6">
								<button type="button" id="cmailCheckBtn" class="btn btn-secondary">이메일 인증번호 받기</button>
							</div>
							<div class="mb-4">
								<span id="cmailCheckResult"></span>
							</div>
							<div class="d-grid mb-4">
								<button class="btn btn-dark btn-lg" type="submit">회원가입</button>
							</div>
							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Script Start -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- html -->
	<script type="text/javascript">
		// ID 중복확인 여부
		var isCheckId = false;
		var isCheckEmail = false;

		function joinFormCheck(formObj) {
			console.log("joinFormCheck() 호출");
			var ciname = formObj.cmciname;
			var cmid = formObj.cmid;
			var cmpw = formObj.cmpw;
			var cmname = formObj.cmname;
			var cemailId = $('#cemailId');
			var cdomain = $('#cdomain');
			
			if(ciname.value.length == 0){
				alert("기업정보를 입력해주세요");
				return false;
			} else if(cmid.value.length == 0){
				alert("아이디를 입력해주세요");
				cmid.focus();
				return false;
			} else if(cmpw.value.length == 0){
				alert("비밀번호를 입력해주세요");
				cmpw.focus();
				return false;
			} else if(cmname.value.length == 0){
				alert("이름을 입력해주세요");
				cmname.focus();
				return false;
			} else if(cemailId.val().length == 0){
				alert("이메일을 입력해주세요");
				cemailId.focus();
				return false;
			} else if(cdomain.val().length == 0){
				alert("도메인을 입력해주세요");
				cdomain.focus();
				return false;
			} else if (!isCheckId) {
				alert('아이디 중복확인을 해주세요');
				return false;
			} else if (!isCheckEmail) {
				alert('이메일 인증번호를 입력해주세요');
				return false;
			} else {
				return true;
			}
		}

		function checkSameCId() {
			var inputId = $('#cmid').val();
			console.log(inputId);
			$
					.ajax({
						type : 'get',
						url : '${pageContext.request.contextPath }/joinCIdCheck?cmid='
								+ inputId,
						success : function(result) {
							console.log(result);
							if (result == 'OK') {
								isCheckId = true;
								$('#idCheckResult').text('사용 가능한 아이디!').css(
										'color', 'green');
							} else {
								isCheckId = false;
								$('#idCheckResult').text('사용중인 아이디!').css(
										'color', 'red');
							}

						},
					});
			console.log(isCheckId);
		}

		function domainSelect(obj) {
			document.getElementById('cdomain').value = obj.value;
			createEmail();
		}

		function createEmail() {
			var totalEmail = $('#cemailId').val() + '@' + $('#cdomain').val();
			$('#cmemail').attr('value', totalEmail);
		}

		function citypeSelect(obj) {
			document.getElementById('inputCitype').value = obj.value;
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
								//document.getElementById("extraAddress").value = extraAddr;

							} //else {
								//document.getElementById("extraAddress").value = '';
							//}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('postcode').value = data.zonecode;
							//document.getElementById("address").value = addr;
							document.getElementById("inputCiaddr").value = addr;

							// 커서를 상세주소 필드로 이동한다.
							//$('#detailAddress').attr('disabled', false);
							//document.getElementById("detailAddress").focus();
						}
					}).open();
		}
	</script>

	<!-- email -->
	<script type="text/javascript">
		// 인증코드 전송
		$('#cmailCheckBtn')
				.click(
						function() {
							var email = $('#cmemail').val();
							console.log(email);
							$
									.ajax({
										type : 'get',
										url : '${pageContext.request.contextPath }/mailCheck?email='
												+ email,
										success : function(data) {
											console.log(data);
											$('#cemailCode').attr('value', data);
											alert('인증번호가 발송되었습니다.');
											$('#cinputCode').attr('disabled',
													false);
											$('#cinputCode').focus();
										}
									});
						});

		// 이메일 인증 번호 확인
		$('#cinputCode').change(function() {
			var inputVal = $('#cinputCode').val();
			var correctCode = $('#cemailCode').val();
			console.log(inputVal.length);
			if (inputVal == correctCode) {
				$('#cmailCheckResult').text('인증성공!')
				$('#cmailCheckResult').css('color', 'green');
				isCheckEmail = true;
			} else if (inputVal.length < 6) {
				$('#cmailCheckResult').text('');
				isCheckEmail = false;
			} else {
				$('#cmailCheckResult').text('인증실패!');
				$('#cmailCheckResult').css('color', 'red');
				isCheckEmail = false;
			}
			console.log(isCheckEmail);
		});

		// 기업 정보 검색 팝업창 띄우기
		function findWP() {
			console.log("find_WP 호출")
			window.open("${pageContext.request.contextPath }/find_WP",
					"WPPopUp", "width=600,height=800,top=10,left=100");
		}
	</script>


</body>
</html>