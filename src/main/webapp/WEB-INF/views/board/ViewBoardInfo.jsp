<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
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
				<div class="card-body" style="padding: 29px 29px 0;">		
					<!-- 머리말 -->
					<div class="Article_header reserveArea" style="border-bottom: 2px solid #e3e6f0; margin-bottom: 20px; padding-bottom: 20px;">
						<div class="Article_title" style="margin-bottom: 10px;">
							<span style="color: #539DDB; font-size: 14px;">태그: ${board.bhope}</span>
							<h3 style="margin-top: 7px; font-size: 28px;">제목: ${board.btitle}</h3>
						</div>

						<div class="writer_info">
							<div class="profile_area" style="margin-bottom: 6px;">
								<span style="font-size: 14px;">작성자: ${board.bmid}</span><br>
							</div>

							<div class="dateHit_area" style="font-size: 12px;">
								<span style="margin-right: 8px;">${board.bdate }</span> <span>조회: ${board.bcount }</span>
							</div>
						</div>
					</div>	
					<!-- 내용 -->
					<div class="content_area">
						<p style="line-height: 1.8;">
							<span>${board.bcontents }</span>
						</p>
					</div>
					<!-- 게시글 추천 버튼 -->
					<div class="like_box" style="margin: 40px 0 25px;">
						<div class="d-flex justify-content-center" style="background-color: white;">
							<button id="likeBtn" class="btn border-primary btn-user text-primary" onclick="boardLike('${board.bno }')">
								<i class="p-0 far fa-thumbs-up ">추천</i> <span id="like_count">${blikeCount}</span>
							</button>
						</div>
					</div>
					<!-- 댓글 출력 -->
					<div class="comment_box" style="border-top: 2px solid #e3e6f0;">
						<div class="comment_option" style="padding-top: 16px; margin-bottom: 11px;">
							<div class="pt-1 px-5 pb-1 ">
								<div class="text-center">
									<h3 class="text-gray-900 mb-1" style="font-size: 20px;">댓글 목록</h3>
								</div>
								<div id="replyListArea">
									<c:forEach items="${replyList }" var="reply">
										<div class="comment_area">
											<div class="p-3">
												<div class="row no-gutters align-items-center text-xs font-weight-bold">
													<div class="col">
														<span class="text-primary" style="font-size: 14px;">${reply.rewriter }</span><br><span class="text-uppercase pl-2" style="font-size: 12px;">작성일: ${reply.redate }</span>
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
												<hr class="my-2">
												<div class="row no-gutters align-items-center">
													<div class="col">
														<textarea readonly="readonly" class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100 form-control" style="background-color: #F0F2E6;">${reply.recontent }</textarea>
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
					<!-- 댓글 작성 폼 -->
					<div class="comment_writer" style="margin: 12px 0 29px; padding: 16px 10px 10px 18px; box-sizing: border-box;">
						<div class="px-5">
						<div style=" border: 2px solid #e3e6f0; border-radius: 6px;">
						<c:if test="${sessionScope.loginType != null }">
							<div class="pt-4 px-4 pb-4">
								<form class="user" onsubmit="return replyWrite(this)">
									<div class="input-group">
										<input type="hidden" name="rebno" value="${board.bno }" class="form-control" readonly="readonly">
										<c:choose>
											<c:when test="${sessionScope.loginType == 'P'}">
												<input type="text" name="rewriter" id="loginId" value="${sessionScope.loginInfo.mid}" class="form-control" readonly="readonly">
											</c:when>
											<c:otherwise>
												<input type="text" name="rewriter" id="loginId" value="${sessionScope.loginInfo.cmid}" class="form-control" readonly="readonly">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="form-group">
										<textarea name="recontent" id="inputrecontent" class="form-control" rows="3" placeholder="댓글을 남겨보세요"></textarea>
									</div>
									<div class="mt-1" style="text-align: center;">
										<button type="submit" class="btn btn-dark btn-user btn-block">댓글작성</button>
									</div>
								</form>
							</div>
						</c:if>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>





	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		var viewBno = '${board.bno }';

		var loginType = $('#loginType').val();
		var loginId = $('#loginId').val();
		/* 		var loginType = "";
		 var loginId = "";
		 if( $('#loginType').val() != undefined){
		 loginType = $('#loginType').val();
		 loginId = $('#loginId').val();	
		 } */

		$(document).ready(function() {
			replyList(viewBno);
		});
		function replyDelete_ajax(renum) {
			console.log(viewBno);
			console.log("삭제할 댓글 번호 : " + renum);
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/replyDelete_ajax",
				data : {
					"renum" : renum
				},
				async : false,
				success : function(checkResult) {
					console.log(checkResult);
					if (checkResult == '1') {
						alert("댓글 삭제 성공");
						replyList(viewBno);
					} else {
						alert("댓글 삭제 실패");
					}
				}
			});
		}

		function replyLike(renum, likeBtn) {
			console.log("replyLike 호출");
			if (loginId) {
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/replyLike",
					data : {
						"rlnum" : renum,
						"rlmid" : loginId
					},
					dataType : "json",
					async : false,
					success : function(result) {
						if (result.likeResult == '1') {
							alert("댓글이 추천 되었습니다.");
							$(likeBtn).removeClass("text-primary");
							$(likeBtn).addClass("text-white");
							$(likeBtn).addClass("bg-primary");
						} else {
							alert("댓글 추천이 취소되었습니다.");
							$(likeBtn).addClass("text-primary");
							$(likeBtn).removeClass("text-white");
							$(likeBtn).removeClass("bg-primary");
						}
						$(likeBtn).html('추천 ' + result.likeCount);
					}
				});
			} else {
				alert('로그인 후 추천 가능합니다.');
				location.href = "${pageContext.request.contextPath}/login";
				
			}
		}

		function replyWrite(formObj) {
			console.log("replyWrite(formObj) 호출")
			var rebno = formObj.rebno;
			console.log("댓글작성 글번호 : " + rebno.value);
			var rewriter = formObj.rewriter;
			console.log("댓글작성자 : " + rewriter.value);
			var recontent = formObj.recontent;
			console.log("댓글내용 : " + recontent.value);

			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/replyWrite",
				data : {
					"rebno" : rebno.value,
					"rewriter" : rewriter.value,
					"recontent" : recontent.value
				},
				async : false,
				success : function(checkResult) {
					console.log(checkResult);
					if (checkResult == '1') {
						alert("댓글 등록 성공");
						replyList(rebno.value);
					} else {
						alert("댓글 등록 실패");
					}
				}
			});

			recontent.value = "";

			return false;
		}

		

		function boardLike(bno) {
			console.log(loginId);
			if (loginId) {
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/boardLike",
					data : {
						"lbno" : bno,
						"lmid" : loginId
					},
					async : false,
					dataType : "json",
					success : function(result) {
						console.log(result.likeResult);
						if (result.likeResult == '1') {
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
				});
			} else {
				alert('로그인 후 추천 가능합니다.');
				location.href = "${pageContext.request.contextPath}/login";
			}
		}

		function replyList(rebno) {
			console.log('댓글 목록 조회 replyList(rebno) 호출')
			$
					.ajax({
						type : "get",
						url : "${pageContext.request.contextPath }/replyList",
						data : {
							"rebno" : rebno
						},
						dataType : "json",
						async : false,
						success : function(reList) {
							console.log(reList);
							console.log(viewBno);
							var output = "";
							for (var i = 0; i < reList.length; i++) {
								console.log(reList[i].rewriter + " : "
										+ reList[i].recontent);
								output += '<div class="comment_area">';
								output += '<div class="p-3">';
								output += '<div class="row no-gutters align-items-center text-xs font-weight-bold">';
								output += '<div class="col">';

								output += '<span class="text-primary" style="font-size: 14px;">';
								output += reList[i].rewriter + '</span><br>';

								output += '<span class="text-uppercase pl-2 text-xs" style="font-size: 12px;">'
										+ reList[i].redate + '</span>';
								output += '</div>';
								output += '<div class="col-auto align-items-center">';

								if (reList[i].relikeCheck == null) {
									output += '<button class=" text-xs btn btn-sm border-primary btn-user text-primary" onclick="replyLike('
											+ "'"
											+ reList[i].renum
											+ "'"
											+ ',this)">';
								} else {
									output += '<button class=" text-xs btn btn-sm border-primary btn-user text-white bg-primary" onclick="replyLike('
											+ "'"
											+ reList[i].renum
											+ "'"
											+ ',this)">';
								}

								output += '추천 ' + reList[i].relikecount;
								output += '</button>';
								output += '</div>';
								output += '</div>';
								output += '<hr class="my-2">';
								output += '<div class="row no-gutters align-items-center">';
								output += '<div class="col">';
								output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100 form-control" style="background-color: #F0F2E6;">'
										+ reList[i].recontent + '</textarea>';
								output += '</div>';
								output += '<div class="col-auto">';
								if (reList[i].rewriter == loginId) {
									output += '<button class="btn btn-sm btn-danger btn-user" onclick="replyDelete_ajax(\''
											+ reList[i].renum
											+ '\')" >삭제</button>';

								}
								output += '</div>';
								output += '</div>';
								output += '</div>';
								output += '</div>';
								//
							}
							$("#replyListArea").html(output);
						}
					});
		}
	</script>
</body>
</html>