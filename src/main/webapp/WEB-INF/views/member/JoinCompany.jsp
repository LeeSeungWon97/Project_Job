<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<title>회원가입-기업회원 | 굿잡</title>
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png" />
	<link href="${pageContext.request.contextPath }/resources/assets/css/joincompany.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet" />
</head>


<body style="background: #E4E8EB;">

	<div class="join-container1">
		<div class="logo-join2">
			<div class="logo">
				<a class="logo-link" href="${pageContext.request.contextPath }/">
				<img class="logo-img" style="padding-left:0px; width: 270px; height: auto; margin: 15px 0px 0px 0px;"
					src="${pageContext.request.contextPath }/resources/assets/img/company-logo.png">
				</a>
			</div>
		</div>
	</div>

	<div class="join-container2">
		<div class="joinMember-box2">
			<div class="choose-member">
				<a class="choose cjoin-common" href="${pageContext.request.contextPath }/joinMemberPage">
					<button class="choose-btn cjoin-common-btn" type="button">일반회원</button>
				</a>
				<a class="choose cjoin-company" href="${pageContext.request.contextPath }/joinCompanyPage">
					<button class="choose-btn cjoin-company-btn2" type="button">기업회원</button>
				</a>
				
				<div class="card-body p-4 p-sm-5 mb-3">
						<form action="${pageContext.request.contextPath }/joinCiMember" method="post" onsubmit="return joinFormCheck(this)">

							<div class="input-group input-group-lg mb-3">
								<input type="text" class="join-input2" disabled="disabled" id="inputCiname" name="cmciname" placeholder="회사명">
								<input type="button" onclick="findWP()" class="find-company" value="회사검색">
							</div>

							<div class="input-group input-group-lg mb-3">
								<input type="hidden" class="join-input2" readonly="readonly" id="inputCinum" name="cmcinum" placeholder="사업자 등록번호">
								<input type="text" class="join-input2" disabled="disabled" id="inputCileader" name="cmcileader" placeholder="대표자">
								<input type="text" class="join-input2" disabled="disabled" id="inputCitype" name="inputCitype" placeholder="기업형태" style="margin-left: 5px;">
							</div>


							<div class="input-group input-group-lg mb-3">
								<input type="text" id="inputCiaddr" name="ciaddr" placeholder="회사주소" readonly="readonly" class="join-input2">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="join-input2-btn join-input2-btn1">
							</div>


							<div class="input-group input-group-lg mb-1">
								<input type="text" class="join-input2" id="cmid" name="cmid" placeholder="아이디">
								<button type="button" class="check-btn2" onclick="checkSameCId()">중복체크</button>
							</div>
							<div class="mb-3">
								<span id="idCheckResult"></span>
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="text" class="join-input2" name="cmpw" maxlength="16" placeholder="비밀번호">
							</div>
							<div class="input-group input-group-lg mb-3">
								<input type="text" class="join-input2" name="cmname" placeholder="이름">
							</div>

							<div class="input-group input-group-lg mb-3">
								<input type="hidden" class="join-input2" id="cmemail" name="cmemail" placeholder="이메일">
								<input type="text" class="join-input2" id="cemailId" onchange="createEmail()" placeholder="이메일">
								<span class="input-group-text">@</span>
								<input type="text" id="cdomain" onchange="createEmail()" class="join-input2" style="margin-left: 5px;">
								<select onchange="domainSelect(this)" class="join-select2">
									<option value="">직접입력</option>
									<option value="daum.com">다음</option>
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="kakao.com">카카오</option>
								</select>
							</div>
							
							<div class="input-group mb-1">
								<input type="text" id="cinputCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력" class="join-input2">
								<input type="hidden" id="cemailCode" disabled="disabled" maxlength="6">
								<button type="button" id="cmailCheckBtn" class="join-input2-btn join-input2-btn2">인증번호 요청</button>
							</div>
							<div class="mb-4">
								<span id="cmailCheckResult"></span>
							</div>
							<div class="mjoin-btn">
								<button class="join-input2-btn3" type="submit">회원가입</button>
							</div>
						</form>
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