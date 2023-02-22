<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자소서 작성페이지</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

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

h1 {font-size:20px; margin-bottom: 20px; text-align: center;}

.top{border-bottom: 2px solid #79BAEC; border-top: 2px solid #79BAEC; margin-bottom: 40px;}

.form-floating, .form-control-plaintext{margin-bottom: 10px; margin-top: 8px;}

.box{margin-bottom: 25px;}

.esciname{height: 30px; font-size: medium; text-align: center;}

.epname{font-size:x-large; text-align: center;}

.Clickbtn{text-align: center;}

.myInfo {border-bottom: 2px solid #ebebeb; border-top: 2px solid #ebebeb; margin-bottom: 20px;}


</style>
</head>
<body>


<div class="container">
		<div class="d-flex justify-content-center">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 200px; height: 100px;">
			</a>
		</div>

<div class="mainbox">
	
	<!--본문 -->
	<%@ include file="/WEB-INF/views/employment/EssayForm.jsp"%>

				<div class="Clickbtn">
					<button id="modifyBtn" class="btn btn-dark btn-lg" type="button" onclick="modifyEssay()">수정</button>
					<button id="saveBtn" class="btn btn-dark btn-lg mx-2 d-none" type="button" onclick="saveEssay()"><i class="bi bi-check"></i> 저장</button>
					<button id="cancleBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="modifyCancle()"><i class="bi bi-x"></i> 취소</button>
				</div>
</div>
	</div>
	

	
	
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function modifyEssay() {
			console.log("자소서 수정");
			$('#modifyBtn').addClass("d-none");
			$('#saveBtn').removeClass("d-none");
			$('#cancleBtn').removeClass("d-none");
			$('.modifyBtn').removeClass("d-none");
			$('.EssayContent').attr("readonly", false);
		}
		
		function saveEssay() {
			var DataArea1 = $('.area1').val();
			var DataArea2 = $('.area2').val();	
			var DataArea3 = $('.area3').val();
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/WriteEssay",
				data : {
					"area1" : DataArea1,
					"area2" : DataArea2,
					"area3" : DataArea3
				},
				async : false,
				success : function(result) {
				}
			});
			
			
			$('#modifyBtn').removeClass("d-none");
			$('#saveBtn').addClass("d-none");
			$('.modifyBtn').addClass("d-none");
			$('.EssayContent').attr("readonly", true);
		}
		
		
	
		
	function modifyCancle() {
			console.log("수정 취소");
			location.reload();
		}
	</script>
	

</body>
</html>




