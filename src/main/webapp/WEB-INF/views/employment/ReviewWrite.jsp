<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자소서 작성페이지</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<style type="text/css">
.mainbox {
	width: 710px;
	padding: 30px;
	margin: 10px;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid #ebebeb;
	box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15);
}

h1 {
	font-size: 20px;
	margin-bottom: 20px;
	text-align: center;
}

.top {
	border-bottom: 2px solid #79BAEC;
	border-top: 2px solid #79BAEC;
	margin-bottom: 40px;
}

.form-floating, .form-control-plaintext {
	margin-bottom: 10px;
	margin-top: 8px;
}

.box {
	margin-bottom: 25px;
}

.esciname {
	height: 30px;
	font-size: medium;
	text-align: center;
}

.epname {
	font-size: x-large;
	text-align: center;
}

.Clickbtn {
	text-align: center;
}

.myInfo {
	border-bottom: 2px solid #ebebeb;
	border-top: 2px solid #ebebeb;
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="header-div">
			<div class="logo">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/"> <img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
				</a>
			</div>
		</div>
	</header>



	<!-- Section -->
	<section id="section">
		<div class="section-div" style="justify-content: center;">

			<div class="mainbox mb-3">
				<!--본문 -->
				
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="justify-content: center;">기업명</span> <input type="text" class="form-control" name="" value="${cinfo.ciname }" style="background-color: white;">
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="justify-content: center;">응시년도</span> <select name="rvdate" id="rvdate" class="form-control">
						<option value="">응시년도를 선택해주세요</option>
						<option value="2023년 하반기">2023년 하반기</option>
						<option value="2023 상반기">2023 상반기</option>
						<option value="2022 하반기">2022 하반기</option>
						<option value="2022 상반기">2022 상반기</option>
						<option value="2021 하반기">2021 하반기</option>
						<option value="2021 상반기">2021 상반기</option>
					</select> <label style="margin: 10px;">2021년부터 등록 가능합니다.</label>
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="justify-content: center;">근무형태</span>
					<select name="rveptype" id="rveptype" class="form-control">	
						<option value="">근무형태를 선택해주세요</option>
						<option value="신입">신입</option>
						<option value="인턴">인턴</option>
						<option value="경력">경력</option>
					</select>				
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="justify-content: center;">지원분야</span> <select name="rvobj" id="rvobj" class="form-control">
						<option value="">지원분야를 선택해주세요</option>
						<option value="경영,사무">경영,사무</option>
						<option value="마케팅,광고,홍보">마케팅,광고,홍보</option>
						<option value="IT인터넷">IT인터넷</option>
						<option value="디자인">디자인</option>
						<option value="무역,유통">무역,유통</option>
						<option value="영업,고객상담">영업,고객상담</option>
						<option value="서비스">서비스</option>
						<option value="연구개발,설계">연구개발,설계</option>
						<option value="생산,제조">생산,제조</option>
						<option value="교육">교육</option>
						<option value="건설">건설</option>
						<option value="의료">의료</option>
						<option value="미디어">미디어</option>
						<option value="전문,특수직">전문,특수직</option>
					</select>
				</div>
				<div class="input-group input-group-lg mb-3">
					<span class="input-group-text" style="justify-content: center;">면접 난이도</span> <select name="rvdif" id="rvdif" class="form-control">
						<option value="">난이도를 선택해주세요</option>
						<option value="매우쉬움">매우쉬움</option>
						<option value="쉬움">쉬움</option>
						<option value="보통">보통</option>
						<option value="어려움">어려움</option>
						<option value="매우 어려움">매우 어려움</option>
					</select>
				</div>
				

				<div id="EssayReview" class="d-none">
					<div id="EssayForm">

						<div class="box">
							<input type="text" class="form-control-plaintext" name="" placeholder="질문을 입력해주세요 " value="">
							<div class="form-floating">
								<textarea class="form-control EssayContent area1" id="" style="height: 100px"></textarea>
							</div>
						</div>
					</div>
					<div style="text-align: center;" class="mt-2">
						<button type="button" class="btn btn-secondary  modifyBtn" onclick="addSearchKeyA()">
							<span class="plus">+</span>
						</button>
						<button type="button" class="btn btn-danger modifyBtn" onclick="delSearchKeyA(this)">
							<span class="die">-</span>
						</button>
					</div>
				</div>
				<div id="AttitudeReview" class="d-none">
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" readonly="readonly" placeholder="고사장 시험환경은 어떠했습니까?  " value="고사장 시험환경은 어떠했습니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" readonly="readonly" placeholder="어떠한 유형의 문제들이 나왔습니까?  " value="어떠한 유형의 문제들이 나왔습니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" readonly="readonly" placeholder="인·적성검사 준비생을 위한 조언 한 마디 부탁드립니다. " value="인·적성검사 준비생을 위한 조언 한 마디 부탁드립니다.">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>

				</div>

				<div id="InterviewReview" class="d-none">
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="면접은 어디에서, 몇 시에 보셨습니까?" value="면접은 어디에서, 몇 시에 보셨습니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="면접관 및 지원자는 몇 명이었습니까?" value="면접관 및 지원자는 몇 명이었습니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="면접유형은 어땠습니까? " value="면접유형은 어땠습니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="면접 진행방식에 대해 적어주세요. " value="면접 진행방식에 대해 적어주세요.">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="면접 질문과 그에 대한 답변을 적어주세요. " value="면접 질문과 그에 대한 답변을 적어주세요.">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>

				</div>
				<!--  -->

				<!--  -->
				<div id="FinalReview" class="d-none">
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="어떤 점이 합격에 가장 큰 영향을 주었다고 생각하십니까?" value="어떤 점이 합격에 가장 큰 영향을 주었다고 생각하십니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="취업준비에 가장 도움이 되었던 활동은 무엇입니까?" value="취업준비에 가장 도움이 되었던 활동은 무엇입니까?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="회사에 입사해보니 어떤가요? " value="회사에 입사해보니 어떤가요? ">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>
					<div class="box">
						<input type="text" class="form-control-plaintext" name="" placeholder="취업 준비생에게 조언을 한다면?" value="취업 준비생에게 조언을 한다면?">
						<div class="form-floating">
							<textarea class="form-control " id="" style="height: 100px"></textarea>
						</div>
					</div>



				</div>



				<!--  -->



				<!-- ResumeForm -->
				<h1 style="text-align: center;">${cinfo.ciname }합격스펙</h1>
				<div id="resumeForm">
					<div class="mb-3">
						<h2>
							<img src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> 학력
						</h2>
						<div class="input-group" id="reeduData">
							<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent reedu" value="${Resume.reedu[i.index]}" style="height: 60px;" readonly="readonly"> <input type="text" class="form-control resumeContent reedu" value="${Resume.reedu[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>

					</div>
					<div class="mb-3">
						<h2>
							<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> 경력
						</h2>
						<div class="input-group" id="recarrerData">
							<c:forEach items="${Resume.recarrer }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent recarrer" value="${Resume.recarrer[i.index]}" style="height: 60px;" readonly="readonly"> <input type="text" class="form-control resumeContent recarrer" value="${Resume.recarrer[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>

					</div>
					<div class="mb-3">
						<h2>
							<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> 인턴/대외활동
						</h2>
						<div class="input-group" id="reactData">
							<c:forEach items="${Resume.react }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent react" value="${Resume.react[i.index]}" style="height: 60px;" readonly="readonly"> <input type="text" class="form-control resumeContent react" value="${Resume.react[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>

					</div>
					<div class="mb-5">
						<h2>
							<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> 자격증
						</h2>
						<div class="input-group" id="relicenseData">
							<c:forEach items="${Resume.relicense }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent react" value="${Resume.relicense[i.index]}" style="height: 60px;" readonly="readonly"> <input type="text" class="form-control resumeContent react" value="${Resume.relicense[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>

					</div>

				</div>

				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="submit" class="btn btn-dark btn-lg" type="button" onclick="WriteReview()">저장</button>
				</div>

			</div>
		</div>

		<!-- </div> -->
	</section>


	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		var loginType = $('#loginType').val();
		var loginId = $('#loginId').val();
		var ciname = '${cinfo.ciname}'
		var rvtype = '${rvtype}';
		$(document).ready(function() {
			console.log(rvtype);
			if (rvtype == 1) {
				$('#EssayReview').removeClass("d-none");
				$('#EssayReview div>textarea').addClass("answer");
				$('#EssayReview div>input').addClass("reviewQ");

			} else if (rvtype == 2) {
				$('#AttitudeReview').removeClass("d-none");
				$('#AttitudeReview div>textarea').addClass("answer");
				$('#AttitudeReview div>input').addClass("reviewQ");
			} else if (rvtype == 3) {
				$('#InterviewReview').removeClass("d-none");
				$('#InterviewReview div>textarea').addClass("answer");
				$('#InterviewReview div>input').addClass("reviewQ");
			} else if (rvtype == 4) {
				$('#FinalReview').removeClass("d-none");
				$('#FinalReview div>textarea').addClass("answer");
				$('#FinalReview div>input').addClass("reviewQ");
			}

		});

		function addSearchKeyA() {
			var rowItem = '<div class="box">';
			rowItem += "<input type='text' class='form-control-plaintext reviewQ'  placeholder='질문을 입력해주세요' value=''>";
			rowItem += "<div class='form-floating'>";
			rowItem += '<textarea class="form-control EssayContent area1 answer" id="" style="height: 100px"></textarea>';
			rowItem += "</div>";
			rowItem += "</div>";

			$('#EssayForm').append(rowItem);
		}

		function delSearchKeyA() {
			$("#EssayForm div:last").remove();
		}

		function WriteReview() {
			var rvdate = $('#rvdate').val();
			var rveptype = $('#rveptype').val();
			var rvobj = $('#rvobj').val();
			var rvdif = $('#rvdif').val();
			
			if(rvdate.length <1){
				alert('응시년도를 선택해주세요');
				return false;
			}else if(rveptype.length <1){
				alert('근무형태를 선택해주세요');
				return false;
			}else if(rvobj.length <1){
				alert('지원분야를 선택해주세요');
				return false;
			}else if(rvdif.length <1){
				alert('난이도를 선택해주세요');
				return false;
			} 
			
			
			
			
			var rvcontents = document.getElementsByClassName("answer");
			var rvcontentsData = "";
			var reviewQ = document.getElementsByClassName("reviewQ");
			var rvanswerData = "";

			for (var i = 0; i < rvcontents.length; i++) {
				rvcontentsData += reviewQ[i].value;
				rvcontentsData += "!@#";
				rvcontentsData += rvcontents[i].value;

				if (i == rvcontents.length - 1) {
					continue;
				}
				rvcontentsData += "!@#";
			}
			console.log(rvcontentsData);

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/WriteReview",
				data : {
					"rvtype" : rvtype,
					"rvcontents" : rvcontentsData,
					"rvciname" : ciname,
					"rveptype" : rveptype,
					"rvobj" : rvobj,
					"rvdif" : rvdif,
					"rvdate" : rvdate,
					"rvstate" : '0'
					
				},
				async : false,
				success : function(result) {
					console.log(result);
					if(result == 1){
					alert("등록 요청 완료!");
					window.close();
					}else{
						alert("등록 요청 실패");							
					}
				}
			});
		}
		//location.href = "${pageContext.request.contextPath}/myResume";
	</script>



</body>
</html>




