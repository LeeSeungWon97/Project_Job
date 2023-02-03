<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>JoinForm</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet"/>
</head>
<body>
	<!-- <div class="container">
	    <div class="row">
			<div class="col-lg-10 col-xl-8 mx-auto">
				<div class="card flex-row my-5 border-0 shadow rounded-3">
					<div class="card-body p-4 p-sm-5 mb-3"> -->
					<!-- 	<div class="d-grid mb-4">
							<div class="btn-group btn-group-lg">
								<button type="button" class="btn btn-outline-dark" onclick="selectTypeBtn(this)" value="p">개인회원</button>
								<button type="button" class="btn btn-outline-dark" onclick="selectTypeBtn(this)" value="c">기업회원</button>
							</div>
						</div> -->
						<!-- 일반회원 양식 -->
						<%-- <div class="person d-none"  id="person">
							<form action="${pageContext.request.contextPath }/joinMember" method="post" onsubmit="return joinFormCheck(this)">
								<div class="input-group input-group-lg mb-1">
									<input type="text" class="form-control" id="mid" name="mid" placeholder="아이디"> 
									<button type="button" class="btn btn-secondary" onclick="checkSameId()">중복체크</button>
								</div>
								<div class="mb-3">
									<span id="idCheckResult"></span>
								</div>
								<div class="input-group input-group-lg mb-3">
									<input type="text" class="form-control" name="mpw" maxlength="16" placeholder="비밀번호"> 
								</div>
								<div class="input-group input-group-lg mb-3">
									<input type="text" class="form-control" name="mname" placeholder="이름"> 
								</div>
								<div class="input-group input-group-lg mb-3">
									<input type="date" class="form-control" name="mbirth" placeholder="생년월일"> 
								</div>
								<div class="input-group">
									<input type="text" id="postcode" placeholder="우편번호" disabled="disabled" class="form-control">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
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
									<button class="btn btn-dark btn-lg" type="submit">회원가입</button>
								</div>
								<hr class="my-4">
							</form>
						</div> --%>
						
						<!-- 기업회원 양식 -->
						<div class="company" id="company">
							<!-- 기업회원 양식 시작 -->
							<form action="${pageContext.request.contextPath }/joinCiMember" method="post" onsubmit="return cmjoinFormCheck(this)">
								
								<div class="input-group input-group-lg mb-3">
						          <input type="text" class="form-control" disabled="disabled" id="inputCiname" name="cmciname" placeholder="회사명">
						          <input type="button" onclick="findWP()" class="btn btn-secondary" value="회사검색">
						        </div>
						        
						        <div class="input-group input-group-lg mb-3">
						          <input type="hidden" class="form-control" disabled="disabled" id="inputCinum" name="cmcinum" placeholder="사업자 등록번호">
						          <input type="text" class="form-control" disabled="disabled" id="inputCileader" name="cmcileader" placeholder="대표자">
						          <input type="select" class="form-control" disabled="disabled" id="inputCitype" name="inputCitype"  placeholder="기업형태">
						          <select onchange="citypeSelect(this)" class="form-select">
										<option value="">직접입력</option>
										<option value="대기업">대기업</option>
										<option value="공기업">공기업</option>
										<option value="중소기업">중소기업</option>
									</select>
						        </div> 
								
								<div class="input-group input-group-lg mb-3">
									<input type="text" id="inputCiaddr" name="cmciaddr" placeholder="회사주소" disabled="disabled" class="form-control">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
								</div>
								
								
								<div class="input-group input-group-lg mb-1">
									<input type="text" class="form-control" id="cid" name="cmid" placeholder="아이디"> 
									<button type="button" class="btn btn-secondary" onclick="checkSameId()">중복체크</button>
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
									<input type="text" id="inputCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력" class="form-control">
									<input type="hidden" id="emailCode" disabled="disabled" maxlength="6" placeholder="인증번호 6자리 입력">
									<button type="button" id="mailCheckBtn" class="btn btn-secondary">이메일 인증번호 받기</button>
								</div>
								<div class="mb-4">
									<span id="mailCheckResult"></span>
								</div>
								<div class="d-grid mb-4">
									<button class="btn btn-dark btn-lg" type="submit">회원가입</button>
								</div>
								<hr class="my-4">
							</form>
							
							
							
							
							
							
							
							
							
							
							
							
							<!-- 기업회원 양식 끝 -->
				<!-- 		</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- html -->
	<script type="text/javascript">
		
	
	// ID 중복확인 여부
		var isCheckId = false;
		var isCheckEmail = false;
	 
	function cmjoinFormCheck(formObj) {
		console.log("cmjoinFormCheck() 호출");
	
		var cmciname = formObj.cmciname;
		var cmcileader = formObj.cmcileader;
		var cmcitype = formObj.cmcitype;
		var cmnum = formObj.cmnum;
		var mid = formObj.cmid;
		var mpw = formObj.cmpw;
		var mname = formObj.cmname;
		var maddr = formObj.cmciaddr;
		var memail = formObj.cmemail;
		var emailId = $('#cemailId');
		var domain = $('#cdomain');			
	
		if (mid.value.length == 0) {
			alert('아이디를 입력해 주세요');
			mid.focus();
			return false;
		} else if (mpw.value.length == 0) {
			alert('비밀번호를 입력해 주세요');
			mpw.focus();
			return false;
		} else if (mname.value.length == 0) {
			alert('이름을 입력해 주세요');
			mname.focus();
			return false;
		} else if (maddr.value.length == 0) {
			alert('주소를 입력해 주세요');
			$('#postBtn').focus();
			return false;
		} else if (emailId.val().length == 0) {
			alert('이메일을 입력해 주세요.');
			emailId.focus();
			return false;
		} else if (domain.val().length == 0) {
			alert('도메인 입력해 주세요.');
			domain.focus();
			return false;
		} else if (!isCheckId) {
			alert('아이디 중복확인을 해주세요');
			return false;
		} else if (!isCheckEmail) {
			alert('이메일 인증번호를 입력해주세요');
			return false;
		}  else if (cmcinum.val.length==0) {
			alert('회사 코드 입력해주세요');
			return false;
		}  else if (cmciname.val.length==0) {
			alert('회사 이름 입력해주세요');
			return false;
		}  else if (cmcileader.val.length==0) {
			alert('회사 대표 입력해주세요');
			return false;
		}  else if (cmcitype.val.length==0) {
			alert('회사 형태를 입력해주세요');
			return false;
		} 
		
		else {
			return true;
		}
	}
	

	
		function citypeSelect(obj) {
			document.getElementById('inputCitype').value = obj.value;
		}
		
	</script>


	<!-- email -->
	<script type="text/javascript">
		
		
		// 기업 정보 검색 팝업창 띄우기
		function findWP(){
        	console.log("find_WP 호출")
    		window.open("${pageContext.request.contextPath }/find_WP","WPPopUp","width=600,height=800,top=10,left=100");
        }
		
		
	</script>
	
	
</body>
</html>