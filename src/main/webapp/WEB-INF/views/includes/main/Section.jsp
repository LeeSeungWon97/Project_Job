<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<section id="section">
	<div class="section-div">
		<div class="section-l">
			<div class="section-l-top">
				<!-- Slider main container -->

				<div class="swiper mt-4">
					<!-- Additional required wrapper -->
					<h2>얼마 남지않은 공고</h2>
					<div class="swiper-wrapper">
						<!-- Slides -->
						<c:forEach items="${closeDeadLine}" var="closeDead">
							<div class="swiper-slide">
								<h3>
									<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${closeDead.epnum}">${closeDead.epciname }</a>
								</h3>
								<hr>
								<span>${closeDead.epname }</span>
							</div>
						</c:forEach>
					</div>
					<!-- If we need pagination -->
					<!-- <div class="swiper-pagination"></div> -->

				</div>
			</div>
			<div class="section-l-bottom">
				<div class="swiper mt-4">
					<!-- Additional required wrapper -->
					<h2>새로운 공고</h2>
					<div class="swiper-wrapper">
						<!-- Slides -->
						<c:forEach items="${newEmploy}" var="newEmploy">
							<div class="swiper-slide">
								<h3>
									<a href="${pageContext.request.contextPath }/ViewEpInfo?epnum=${newEmploy.epnum}">${newEmploy.epciname }</a>
								</h3>
								<hr>
								<span>${newEmploy.epname }</span>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>

		<div class="section-r">
			<div class="section-r-top">
				<div class="profile-box mt-4">
					<div class="card mb-8">
						<%-- 비로그인--%>
						<c:if test="${sessionScope.loginInfo == null }">
							<div class="card-body mx-auto">
								<div class="d-grid">
									<a href="${pageContext.request.contextPath }/login">
										<button type="button" class="btn-lg" style="background-color: #539DDB; border: solid #539DDB;">
											<span style="color: white;">개인/기업 로그인</span>
										</button>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-center gap-1">
									<a href="${pageContext.request.contextPath }/join">
										<button class="btn btn-outline-secondary btn-sm" type="button">회원가입</button>
									</a>
									<a href="${pageContext.request.contextPath }/FindIdPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">아이디 찾기</button>
									</a>
									<a href="${pageContext.request.contextPath }/FindPwPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">비밀번호 찾기</button>
									</a>
								</div>
							</div>
						</c:if>
						<%-- 로그인 --%>
						<c:if test="${sessionScope.loginInfo != null }">
							<div class="card-body mx-auto">
								<div class="info">

									<c:choose>
										<c:when test="${sessionScope.loginType == 'P' }">
											<span style="font-size: 20px;">${sessionScope.loginInfo.mname}</span>
										</c:when>
										<c:otherwise>
											<span style="font-size: 20px;">${sessionScope.loginInfo.cmname}</span>
										</c:otherwise>
									</c:choose>

									&ensp;&ensp;&ensp;&ensp;
									<a href="${pageContext.request.contextPath }/logout">
										<button type="button" class="btn-lg" style="background-color: #539DDB; border: solid #539DDB;">
											<span style="color: white;">로그아웃</span>
										</button>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-center gap-1">

									<%-- 개인회원 로그인 --%>
									<c:if test="${sessionScope.loginType == 'P' }">
										<a href="${pageContext.request.contextPath }/myInfo">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">내정보</button>
										</a>
										<a href="${pageContext.request.contextPath }/myResume" >
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">이력서</button>
										</a>
										<a href="${pageContext.request.contextPath }/viewApply">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">지원현황</button>
										</a>
										<a href="${pageContext.request.contextPath }/myScrap">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">스크랩</button>
										</a>
										<a href="${pageContext.request.contextPath }/RecinameList">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">열람기업</button>
										</a>
									</c:if>

									<%-- 기업회원 로그인 --%>
									<c:if test="${sessionScope.loginType == 'C' }">
										<a href="${pageContext.request.contextPath }/myInfo">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">내정보</button>
										</a>
										<a href="${pageContext.request.contextPath }/viewApply">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">지원현황</button>
										</a>
										<a href="${pageContext.request.contextPath }/WriteEmploymentPage">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 65%;">공고등록</button>
										</a>
									</c:if>

								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="section-r-bottom">
				<div class="card-body mt-4 mx-auto">
					<div class="text-center">
						<table class="table table-bordered">
							<tr>
								<th scope="col"><a href="${pageContext.request.contextPath }/calendar">공채달력</a></th>
								<th scope="col"><a href="${pageContext.request.contextPath }/PassEssayPage?rvtype=1&pageNum=1">합격자소서</a></th>
								<th scope="col"><a href="${pageContext.request.contextPath }/ReviewState?pageNum=1">취업후기</a></th>
							</tr>
						</table>
					</div>
				</div>
				<div class="card-body mx-auto mb-2">
					<div class="pop" style="border: 1px solid #dee2e6; border-radius: 0.25rem; padding: 1.5rem 1.5rem 0 1.5rem;">
						<h5>인기 기업 Top 5</h5>
						<hr>
						<ul style="list-style: none; padding-left: 0;">
							<c:forEach items="${popularCompany }" var="popularCompany" varStatus="i">
								<li>
									<span>Top ${i.index + 1 } </span>
									<a href="${pageContext.request.contextPath }/viewCiInfo?cinum=${popularCompany.cinum}"> 
										<span>${popularCompany.ciname }</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>