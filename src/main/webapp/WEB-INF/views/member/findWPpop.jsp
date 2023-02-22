<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사검색</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-8 mx-auto" >
				<div class="card-body p-4 p-sm-5 mb-1">
					<div id="serchArea1">
						<div class="input-group input-group-lg mb-3">
		 					<input type="text" id="ciname" name="Wval" placeholder="회사명을 입력해주세요" class="form-control">
         					<input type="button" onclick="findWP1_2()" value="찾기" class="btn btn-secondary">
						</div>
					</div>
					
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">회사</th>
									<th scope="col">대표</th>
									<th scope="col">주소</th>
									<th scope="col" style="min-width: 65px;" >비고</th>
								</tr>
							</thead>
							<tbody id="serchedListArea">
						
							</tbody>
						</table>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>





	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
		
	<script type="text/javascript">
		function findWP1_2(){
			var w_Obj= document.getElementById('ciname');
			var ciname = w_Obj.value;
			console.log("findWP1_2()호출");
			console.log("WpName : " + ciname);
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/getWPList",
				data : {"ciname" : ciname},
				dataType : "json",
				success:function(WpList){
					console.log(WpList);
					var output ="";
					if(WpList.length <= 0){
						alert("검색결과가 없습니다.정확한 이름인지 다시 한번 확인해 주세요.");
					}else{
						//회사명, 대표이름, 주소
						for(var i = 0; i < WpList.length; i++){
							//회사명, 대표이름, 주소 받아와서 목록 ouput에 저장하기
							//output += '<button type="button" class="list-group-item" onclick="selectMovie(this,'+ "'"+mvinfo.mvcode+"'" +')">'+mvinfo.mvtitle+'</button> ';
							/* output += '<button type="button" class="list-group-item" onclick="selectth('+ "'"+thinfo.thcode+"'" +',this)">'+thinfo.thname+'</button> '; */
							
							
							output += '<tr>';
							output += '<td>'+WpList[i].CINAME+'</td>';
							output += '<td>'+WpList[i].CILEADER+'</td>';
							output += '<td>'+WpList[i].CIADDR+'</td>';
							output += '<td>';
							output += '<button type="button" class="btn btn-secondary btn-sm" onclick="inputcinfo('+ "'"+WpList[i].CINUM+"'"+",'"+WpList[i].CINAME+"'" +",'"+WpList[i].CILEADER+"'"+",'"+WpList[i].CIADDR+"'" +",'"+WpList[i].CITYPE+"'"+',this)">';
							output += '선택';
							output += '</button>';
							output += '</td>';
							output += '</tr>';
							
							//onclick="replyLike('+ "'"+reList[i].renum+"'" +',this)">';
						}
						
					}
					$("#serchedListArea").html(output);
				}
			});
		}
		
		
		function inputcinfo(cinum,ciname,cileader,ciaddr,citype,cB){
			console.log("inputcinfo()호출")
			//session값으로 부모 페이지로 보내기
			console.log(cinum + ciname+cileader + ciaddr);
			window.opener.document.getElementById('inputCinum').value = cinum;
			window.opener.document.getElementById('inputCiname').value = ciname;
			window.opener.document.getElementById('inputCileader').value = cileader;
			window.opener.document.getElementById('inputCiaddr').value = ciaddr;
			window.opener.document.getElementById('inputCitype').value = citype;
			
	
			
			window.open('about:blank','_self').self.close();
			
		}
	</script>





	






	<!--  
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CINAME+'</textarea>';
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CILEADER+'</textarea>';
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CIADDR+'</textarea>';
	output += '<button type="button" onclick="inputcinfo('+ "'"+WpList[i].CINUM+"'"+",'"+WpList[i].CINAME+"'" +",'"+WpList[i].CILEADER+"'"+",'"+WpList[i].CIADDR+"'" +",'"+WpList[i].CITYPE+"'"+',this)">';
	output += '선택';
	output += '</button>';
	output += '<br>';
	-->








</html>