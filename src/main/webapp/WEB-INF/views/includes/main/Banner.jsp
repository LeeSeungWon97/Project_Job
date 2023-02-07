<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>슬라이드</title>
  <link href="${pageContext.request.contextPath }/resources/assets/css/banner.css" rel="stylesheet" />
  
</head>
<body>
<div id="banner">
  <div class="banner-div">
  <div class="slideShow">
    <ul class="slides">
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
      <li><div class="banner-link"><a href="">추천공고제목</a></div></li>
    </ul>  
    <p class="controller">
      
      <!-- &lang: 왼쪽 방향 화살표
      &rang: 오른쪽 방향 화살표 -->
      <span class="prev">&lang;</span>  
      <span class="next">&rang;</span>
    </p>
  </div>
  
  
  
  <div class=profil-box> 
  
  <div class="card mb-8">
					<%-- 비로그인--%>
					<c:if test="${sessionScope.loginInfo == null }">
						<div class="card-body mx-auto">
							<div class="d-grid">
								<a href="${pageContext.request.contextPath }/login">
									<button type="button" class="btn btn-dark btn-lg">개인/기업 로그인</button>
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
								<span>${sessionScope.loginInfo.mname}지훈님</span>&ensp;&ensp;&ensp;&ensp;
								<a href="${pageContext.request.contextPath }/logout">
									<button type="button" class="btn btn-dark">로그아웃</button>
								</a>
							</div>
						</div>
						<div class="card-footer">
							<div class="d-flex justify-content-center">
								<div class="btn-group btn-group-sm gap-1">
									<button type="button" class="btn btn-outline-secondary">내정보</button>
									<button type="button" class="btn btn-outline-secondary">이력서</button>
									<button type="button" class="btn btn-outline-secondary">지원현황</button>
									<button type="button" class="btn btn-outline-secondary">스크랩</button>
									<button type="button" class="btn btn-outline-secondary">열람기업</button>
								</div>
							</div>
						</div>
					</c:if>	
				</div>
				
				</div>
				
				</div>
  
  </div>
  

  <script>
  const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
  const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
  let currentIdx = 0; //현재 슬라이드 index
  const slideCount = slideImg.length; // 슬라이드 개수
  const prev = document.querySelector('.prev'); //이전 버튼
  const next = document.querySelector('.next'); //다음 버튼
  const slideWidth = 200; //한개의 슬라이드 넓이
  const slideMargin = 30; //슬라이드간의 margin 값

  //전체 슬라이드 컨테이너 넓이 설정
  slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

  function moveSlide(num) {
    slides.style.left = -num * 100 + 'px';
    currentIdx = num;
  }

  prev.addEventListener('click', function () {
    /*첫 번째 슬라이드로 표시 됐을때는 
    이전 버튼 눌러도 아무런 반응 없게 하기 위해 
    currentIdx !==0일때만 moveSlide 함수 불러옴 */

    if (currentIdx !== 0) moveSlide(currentIdx - 1);
  });

  next.addEventListener('click', function () {
    /* 마지막 슬라이드로 표시 됐을때는 
    다음 버튼 눌러도 아무런 반응 없게 하기 위해
    currentIdx !==slideCount - 1 일때만 
    moveSlide 함수 불러옴 */
    if (currentIdx !== slideCount - 1) {
      moveSlide(currentIdx + 1);
    }
  });
  </script>
  
</body>
</html>