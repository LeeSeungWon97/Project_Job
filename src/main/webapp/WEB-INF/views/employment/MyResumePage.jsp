<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서작성페이지</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
<style type="text/css">
.mainbox {
    width: 710px;
    padding: 30px;
    margin: 30px;
    margin-right: auto;
    margin-left: auto;      
    border: 1px solid #ebebeb;  
    box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15);  
}
h1 {
 font-size:26px;
    margin-bottom: 35px;
}

.first{
    border-bottom: 2px solid #ebebeb;   
    border-top: 2px solid #ebebeb;   
    margin-bottom: 20px;
}

h3{
    font-size:13px;
    color:#282828;
    font-weight: lighter;
    margin-bottom: 16px;

    padding-bottom: 5px;
}

h2 {
    font-size:20px;
    color:#282828;
    font-weight: lighter;
    margin-bottom: 16px;
    border-bottom: 2px solid black;
    padding-bottom: 5px;
}

</style>
</head>
<body>
	<div class="mainbox">
	<h1 style="text-align: center;">이력서 작성 양식</h1>
	
	<form action="${pageContext.request.contextPath }/WriteResume" method="post" onsubmit="">
	
<div class="d-flex mb-4">
  <div class="flex-shrink-0">
    <img src="${pageContext.request.contextPath }/resources/assets/img/resumePro.png" style="width: 120px; height: 130px;">

  </div>
  <div class="flex-grow-1 ms-3">
		<div class="top">
	<input type="hidden" class="form-control"  placeholder="아이디" name="remid" value="${sessionScope.loginInfo.mid}" >
				<input type="text" class="form-control" placeholder="이름" value="${sessionScope.loginInfo.mname}" style="width: 150px; font-size: large;" >
		</div>
		<div class="top mt-1">
			<input type="date" class="form-control"  placeholder="생년월일"  min="1900-01-01" max="" 
						value="${sessionScope.loginInfo.mbirth}" style="width: 200px; height: 30px;">
		</div>	
		<div class="top mt-1">
			<input type="text" class="form-control" name="rehope" placeholder="#희망직무태그" value="${Resume.rehope }" style="width: 200px; height: 30px;">
		</div>			

  </div>
</div>

  <section class="first">
  <div class="row g-2">
	<div class="col-3 mt-3 mb-2 ">
	<input type="text" class="form-control" placeholder="이메일" value="${sessionScope.loginInfo.memail}" style="height: 30px; font-size: small;">
		</div>
		
	<div class="col-3 mt-3 mb-2 ">
	<input type="text" class="form-control" name="retell"  placeholder="전화번호" style="height: 30px; font-size: small;">
</div>	
	
	<div class="col-6 mb-2 mt-3 ">
<input type="text" class="form-control"  placeholder="주소" value="${sessionScope.loginInfo.maddr}" style="height: 30px; font-size: small;">
		</div>	
  </div>
    </section>
    
    
   <section class="mb-3">  
        <h2> <a> <img src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> </a> 
        학력</h2> 

  
  <div class="input-group" id="reeduData">

  <input type="text"  class="form-control"  placeholder="재학기간" style="height: 60px;">
  <input type="text"  class="form-control" name="reedu"  placeholder="학력" value="${Resume.reedu}" style="width: 300px; height: 60px;">
</div>
<div style="text-align: center;" class="mt-2">
<button type="button" class="btn btn-secondary"  onclick="addSearchKeyA()">
          	<span class="plus">+</span>
</button> 
<button type="button" class="btn btn-danger" onclick="delSearchKeyA(this)">
          	<span class="die">-</span>
</button> 
          
  </div>


      </section>
			
				
    <section>   
        <h2> <a> <img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> </a> 
        경력</h2>   
         
       
<div class="input-group" id="recarrerData">
  <input type="text"  class="form-control"  placeholder="재직기간" style="height: 60px;">
  <input type="text"  class="form-control" name="recarrer" value="${Resume.recarrer }" placeholder="경력내용" style="width: 300px; height: 60px;">
</div>

<div style="text-align: center;" class="mt-2">
<button type="button" class="btn btn-secondary"  onclick="addSearchKeyB()">
          	<span class="plus">+</span>
</button> 
 <button type="button" class="btn btn-danger" onclick="delSearchKeyB(this)">
          	<span class="die">-</span>
</button>         
  </div>
         
     

     

      </section>					
      
    <section class="mb-3">  
        <h2> <a> <img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> </a> 
        인턴/대외활동</h2> 

 
  <div class="input-group" id="reactData">

  <input type="text"  class="form-control"  placeholder="재직기간" style="height: 60px;">
  <input type="text"  class="form-control"  name="react" placeholder="인턴/대외 활동"  value="${Resume.react }" style="width: 300px; height: 60px;">
</div>
<div style="text-align: center;" class="mt-2">
<button type="button" class="btn btn-secondary" onclick="addSearchKeyC()">
          	<span class="plus">+</span>
</button> 
    <button type="button" class="btn btn-danger" onclick="delSearchKeyC(this)">
          	<span class="die">-</span>
</button>                
  </div>
          



      </section>     
        <section class="mb-5">  
        <h2> <a> <img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;"> </a> 
       	자격증</h2> 
  
  <div class="input-group" id="relicenseData">

  <input type="text"  class="form-control"  placeholder="수료날짜" style="height: 60px;">
  <input type="text"  class="form-control"  name="relicense"  placeholder="자격증" value="${Resume.relicense }" style="width: 300px; height: 60px;">
</div>
<div style="text-align: center;" class="mt-2">
<button type="button" class="btn btn-secondary" onclick="addSearchKeyD()">
          	<span class="plus">+</span>
</button> 
   <button type="button" class="btn btn-danger" onclick="delSearchKeyD(this)">
          	<span class="die">-</span>
</button>                 
  </div>
          
      </section> 
    	
			
	<div class="d-grid gap-2 col-6 mx-auto">
			<button class="btn btn-dark btn-lg" type="submit">이력서 저장</button>
							</div>
						</form>
	</div>
	
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


<script type="text/javascript">



function addSearchKeyA(){
	var	rowItem = "<div class=input-group>";
		rowItem += "<input type='text' class='form-control' placeholder='재학기간' style='height: 60px;'>";
		rowItem += "<input type='text' class='form-control' name='reedu' placeholder='학력' style='width: 300px; height: 60px;'>";
		rowItem += "</div>";
		

	$('#reeduData').append(rowItem);

}

function delSearchKeyA()
{


	$("#reeduData div:last").remove();
	
}


function addSearchKeyB(){
	var	rowItem = "<div class=input-group>";
		rowItem += "<input type='text' class='form-control' placeholder='재직기간' style='height: 60px;'>";
		rowItem += "<input type='text' class='form-control' name='recarrer' placeholder='경력내용' style='width: 300px; height: 60px;'>";
		rowItem += "</div>";
		
		

	$('#recarrerData').append(rowItem);

}

function delSearchKeyB()
{


	$("#recarrerData div:last").remove();
	
}

function addSearchKeyC(){
	var	rowItem = "<div class=input-group>";
		rowItem += "<input type='text' class='form-control' placeholder='재직기간' style='height: 60px;'>";
		rowItem += "<input type='text' class='form-control' name='react' placeholder='인턴/대외 활동' style='width: 300px; height: 60px;'>";
		rowItem += "</div>";

	
	$('#reactData').append(rowItem);

}

function delSearchKeyC()
{


	$("#reactData div:last").remove();
	
}


function addSearchKeyD(){
	var	rowItem = "<div class=input-group>";
		rowItem += "<input type='text' class='form-control' placeholder='수료날짜' style='height: 60px;'>";
		rowItem += "<input type='text' class='form-control' name='relicense' placeholder='자격증' style='width: 300px; height: 60px;'>";
		rowItem += "</div>";

	
	$('#relicenseData').append(rowItem);

}

function delSearchKeyD()
{


	$("#relicenseData div:last").remove();
	
}
</script>
</body>
</html>