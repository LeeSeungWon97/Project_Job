<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고작성</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
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
			<div class="card border-0 shadow rounded-3 mt-3 mb-3" style="width: 60%;">
				<span class="h3 mt-2" style="text-align: center;">상세보기 양식</span>

				<div class="card-body px-5 mt-1">
					<!--  -->
					<div style="padding: 10px;" class="list-group reserveArea">

						<div class="row" style="padding: 10px; border-style: groove;">
								<div class="row-2">
									<div class="small mb-1">${board.bhope}</div>
								</div>
								<div class="row-2">
									<h1> ${board.btitle}</h1>
								</div>
								<div class="row-5">
									<p class="lead">${board.bcontents }</p>
								</div>
								<div class="row-2">
									<div class="small mb-1">${board.bmid} ${board.bdate }</div>
								</div>
						</div>
					</div>
					<!--  -->
				</div>
				<!--  -->
				<!-- 게시글 추천 버튼 -->
                <div class="row">
                	<div class="col-lg-7 ml-auto mr-auto align-items-center text-center pb-3" style="background-color: white;" >
                		<button id="likeBtn" class="btn border-primary btn-user text-primary" onclick="boardLike('${board.bno }')">
                			<i class="p-0 far fa-thumbs-up ">추천</i> <span id="like_count">${blikeCount}</span>
                		</button>
                	</div>
                </div>
                
                <hr>
                
                <!-- 댓글 출력 -->
                <div class="row">
                	<div class="col-lg-7 ml-auto mr-auto" style="background-color: white;" >
                		<div class="pt-1 px-5 pb-1 ">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-1">댓글 목록</h1>
                            </div>
                             
                            <div id="replyListArea">
                            <c:forEach items="${replyList }" var="reply">
	                            <div class="card shadow">
	                                <div class="card-body p-3">
	                                    <div class="row no-gutters align-items-center text-xs font-weight-bold">
		                                	<div class="col">
					                            <span class="text-primary">${reply.rewriter }</span>
					                            <span class="text-uppercase pl-2">${reply.redate }</span>
				                            </div>
				                            <div class="col-auto">
				                            	<c:choose>
				                            		<c:when test="${reply.relikeCheck == null }">
						                            	<button class=" text-xs btn btn-sm border-primary btn-user text-primary" onclick="replyLike('${reply.renum}',this)">
						                            	추천 <span> ${reply.relikecount } </span>
						                            	</button>
				                            		</c:when>
				                            		<c:otherwise>
						                            	<button class=" text-xs btn btn-sm border-primary btn-user text-white bg-primary" onclick="replyLike('${reply.renum}',this)">
						                            	추천 <span> ${reply.relikecount } </span>
						                            	</button>				                            		
				                            		</c:otherwise>
				                            	</c:choose>
				                            	
				                            </div>                                    
	                                    </div>
	                                    <hr class="my-1">
	                                    <div class="row no-gutters align-items-center">
		                                	<div class="col">
		                                		<textarea readonly="readonly" 
	                                            class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">${reply.recontent }</textarea>
				                        	</div>
				                            <div class="col-auto">
				                            	<c:if test="${reply.rewriter == sessionScope.loginInfo.mid}">
				                            	<button class="btn btn-sm btn-danger btn-user" onclick="replyDelete_ajax('${reply.renum}')">삭제</button>
				                            	</c:if>
				                            </div>	                                    
	                                    </div>	                                    
	                                </div>
	                            </div>	
								</c:forEach>
                        	</div>
                        	
                		</div>
                	</div>
                </div>
                
                <hr>
                
                <!-- 댓글 작성 폼 -->
                <c:if test="${sessionScope.loginType != null }">
				<div class="row">
                    <div class="col-lg-7 ml-auto mr-auto" style="background-color: white;" >
                        <div class="pt-1 px-5 pb-1">
                            <form class="user" onsubmit="return replyWrite(this)">
                            	<input type="text" name="rebno"  value="${board.bno }">
                            	<c:choose>
                            	<c:when test="${sessionScope.loginType == 'P'}">
                            	<input type="hidden" name="rewriter" id="loginId" value="${sessionScope.loginInfo.mid}">
                            	</c:when>
                            	<c:otherwise>
                            	<input type="hidden" name="rewriter" id="loginId" value="${sessionScope.loginInfo.cmid}">
                            	</c:otherwise>
                            	</c:choose>
                                <div class="form-group">
                                    <label for="inputrecontent" class="font-weight-bold">댓글작성</label>
                                    <textarea name="recontent" id="inputrecontent" class="form-control" rows="3"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block" >
                                    댓글작성
                                </button>
                                <hr>
                            </form>
                        </div>
                    </div>
                </div>                
               </c:if> 
				
				<!--  -->
			</div>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		//replyList(viewBno);
	});
		var viewBno = '${board.bno }';
		var loginType = $('#loginType').val();
		var loginId = $('#loginId').val();	
		
		function replyWrite(formObj){
			console.log("replyWrite(formObj) 호출")
			var rebno = formObj.rebno;
			console.log("댓글작성 글번호 : " + rebno.value);
			var rewriter = formObj.rewriter;
			console.log("댓글작성자 : " + rewriter.value);
			var recontent = formObj.recontent;
			console.log("댓글내용 : " + recontent.value);			

			$.ajax( { 
				type : "get",
				url : "${pageContext.request.contextPath }/replyWrite",
				data : { "rebno" : rebno.value,
						 "rewriter" : rewriter.value,
						 "recontent" : recontent.value
				},
				async:false,
				success : function(checkResult){
					console.log(checkResult);
					if(checkResult == '1'){
						alert("댓글 등록 성공");
						replyList(rebno.value);
					} else {
						alert("댓글 등록 실패");
					}
				}
			} );
			
			recontent.value = "";
			
			return false;
		}
		
		
		function BoardWriteCheck(formObj) {
			var btitle = formObj.btitle.value;
			var bmid = formObj.bmid.value;
			var bcontents = formObj.bcontents.value;
			var bhope = formObj.bhope.value;
			if (btitle.length)

				return false;

		}
		
		function boardLike(bno){
			if(loginId.length > 0 ){
				$.ajax( { 
					type : "get",
					url : "${pageContext.request.contextPath }/boardLike",
					data : { "lbno" : bno, "lmid" : loginId },
					async:false,
					dataType:"json",
					success : function(result){
						console.log(result.likeResult);
						if(result.likeResult == '1'){
							alert("추천 되었습니다.");
							$("#likeBtn").removeClass("text-primary");
							$("#likeBtn").addClass("text-white");
							$("#likeBtn").addClass("bg-primary");
						} else {
							alert("추천이 취소되었습니다.");
							$("#likeBtn").addClass("text-primary");
							$("#likeBtn").removeClass("text-white");
							$("#likeBtn").removeClass("bg-primary");
						}
						
						$("#like_count").text(result.likeCount);
					}
				} );				
			} else {
				alert('로그인 후 추천 가능합니다.');
			}
		}
		
		function replyList(rebno){
			console.log('댓글 목록 조회 replyList(rebno) 호출')
			$.ajax( { 
				type : "get",
				url : "${pageContext.request.contextPath }/replyList",
				data : { "rebno" : rebno },
				dataType : "json",
				async:false,
				success : function(reList){
					var output = "";
					for(var i = 0; i < reList.length; i++){
						console.log(reList[i].rewriter + " : " + reList[i].recontent);
						output += '<div class="card shadow">';
						output += '<div class="card-body p-3">';
						output += '<div class="row no-gutters align-items-center text-xs font-weight-bold">';
						output += '<div class="col">';
						
						
						output += '<span class="text-primary">';
						output += reList[i].rewriter+'</span>';
						
						output += '<span class="text-uppercase pl-2 text-xs ">'+reList[i].redate+'</span>';
						output += '</div>';
						output +='<div class="col-auto align-items-center">';
						
						if(reList[i].relikeCheck == null){
							output += '<button class=" text-xs btn btn-sm border-primary btn-user text-primary" onclick="replyLike('+ "'"+reList[i].renum+"'" +',this)">';
						} else {
							output += '<button class=" text-xs btn btn-sm border-primary btn-user text-white bg-primary" onclick="replyLike('+ "'"+reList[i].renum+"'" +',this)">';
						}
						
						output += '추천 '+reList[i].relikecount;
						output += '</button>';
						output += '</div>';
						output += '</div>';
						output += '<hr class="my-1">';
						output += '<div class="row no-gutters align-items-center">';
						output += '<div class="col">';
						output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+reList[i].recontent+'</textarea>';
						output += '</div>';
						output += '<div class="col-auto">';
						if(reList[i].rewriter == loginId){
							output += '<button class="btn btn-sm btn-danger btn-user" onclick="replyDelete_ajax(\''+reList[i].renum+'\')" >삭제</button>';
							
						}
						output += '</div>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
						//
					}
					$("#replyListArea").html(output);
				}
			} );			
		}
		
	</script>
</body>
</html>