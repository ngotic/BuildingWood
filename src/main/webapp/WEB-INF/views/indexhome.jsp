<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>

.banner-container {
	position: relative;
	width: 100%;
	height: 400px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.banner-container img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: auto;
	object-fit: cover;
}

.banner-text {
	font-size: 36px;
	color: white;
	text-align: center;
	margin-bottom: 20px;
	z-index: 1;
}

.banner-button {
	padding: 10px 20px;
	background-color: #333;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
}

.minmenu {
	width: 105px;
	height: 100px;
	display: inline-block;
	margin-right: 18px;
	padding-left: 4px;
}

.container {
	font-size: 18px;
	font-weight: bold;
	max-width: 85%;
	margin-top: 30px;
	font-family: var(- -main-content-font-family);
	margin-bottom: 100px;
}

.card {
	border: 0px;
	margin-bottom: 60px;
	/* background-color: #eeeeee6b; */
	padding: 20px 25px 40px 25px;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	border-radius: 20px;
}
.card-last {
	height: 456.12px;
	text-align: left;
}

.pic {
	display: inline-block;
	width: 45%;
	height: 160px; 
	margin : .5% .5% .5% 1.3%;
	position: relative;
	margin: .5% .5% .5% 1.3%;
}

.pic:nth-child(2n) {
	margin: 1.2% .5% 1.2% 1.7%;
}

.pic>img {
	width: 100%;
	border-radius: 10px;
}

.card-title {
	margin: 15px 0px 0px 15px;
	width: 100%;
	font-family: 'Pretendard';
}

.card-title>h3 {
	display: inline-block;
	width: 80%;
	margin-bottom: 15px;
}

.card-link {
	text-decoration: none;
	font-size: 0.9rem;
	color: #777;
}

#minibar>div>span {
	font-size: 5rem;
	color: green;
}

#minibar>div>a {
	text-decoration: none;
	color: #777;
	margin-left: 25%;
}

#minibar>div {
	cursor: pointer;
}

#minibar {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0px;
}
#minibar2 {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0px;
	text-align: center;
}

#minibar::after {
	clear: both;
}

.pic img {
	object-fit: contain;
	width: 100%;
	height: 100%;
	vertical-align: middle;
    object-fit: cover;
    padding: 11px 18px;
    cursor: pointer;
}

.text {
	position: absolute;
	top: 80%;
	left: 50%;
	width: 81%;
	transform: translate(-50%, -50%);
	background-color: rgba(48, 48, 48, 0.479);
	text-align: center;
	color: white;
	font-size: 13px;
    letter-spacing: -.5px;
}
.py-5 {
	width:1000px !important;
	margin: 0 auto !important;
}
.wrap {
	text-align: center !important;
}
.wrap-last {
	text-align: left !important;
	letter-spacing: -0.5px;
	word-spacing: -1px;
	font-size: 16px;
}
.row {
	display: flex;
	flex-wrap: wrap !important;
	justify-content: space-evenly !important;
}
.col-md-4 {
	width:48% !important;
}
.div-sug {
	margin: 5px 10px 21px;
	cursor: pointer;
}
.mini-btn {
	width: 115px;
	height: 115px;
    font-size: 21px;
    font-family: 'Pretendard';
    letter-spacing: -0.5px;
    border: none;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
}
.ori-icon2 {
	font-size: 32px;
}
.minmenu button:hover span {
	color: #fff !important;
}
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
	<div class="banner-container">
		<img
			src="https://cdn.pixabay.com/photo/2020/11/05/23/16/city-5716456_1280.jpg"
			alt="Banner Image">
		<h1 class="banner-text">한독 빌딩입니다.</h1>
		<button class="banner-button">더보기</button>
	</div> -->
	<section class="container">
	
		<%@ include file="/WEB-INF/views/mainheader.jsp" %> 
	    
	    <div id="minibar2">
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/snsmain.do';">
	     			<span class="material-symbols-outlined ori-icon2">contacts</span>
	     			<br>SNS
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/carpool/list.do';">
	     			<span class="material-symbols-outlined ori-icon2">minor_crash</span>
	     			<br>카풀
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/study/list.do';">
	     			<span class="material-symbols-outlined ori-icon2">diversity_3</span>
	     			<br>스터디
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/teach/list.do';">
	     			<span class="material-symbols-outlined ori-icon2">school</span>
	     			<br>과외
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/promise/list.do';">
	     			<span class="material-symbols-outlined ori-icon2">priority</span>
	     			<br>약속
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/club/club.do';">
	     			<span class="material-symbols-outlined ori-icon2">groups_3</span>
	     			<br>동호회
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/recommend/recommend.do';">
	     			<span class="material-symbols-outlined ori-icon2">restaurant_menu</span>
	     			<br>맛집
	     		</button>   
	        </div>
	        <div class="minmenu">
	     		<button type="button" class="btn btn-outline-secondary btn-sm mini-btn" onclick="location.href='/wood/suggest/suggest.do';">
	     			<span class="material-symbols-outlined ori-icon2">settings_account_box</span>
	     			<br>고객지원
	     		</button>   
	        </div>
	    </div>

  <div class="py-5">
      <div class="row hidden-md-up">
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>SNS 최신글</h3><a href="/wood/snsmain.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/rain.jpeg" alt=""><span class="text">지금 우리동네만 비오나요<br>#습도 상승 #역삼역</span></div>
              <div class="pic"><img src="/wood/asset/img/main/hot.jpg" alt=""><span class="text">더워요<br>#여름 싫어</span></div>
              <div class="pic"><img src="/wood/asset/img/main/line.jpeg" alt=""><span class="text">늦었다고 생각되면 이미 늦음<br>#무한도전 #갓명수</span></div>
              <div class="pic"><img src="/wood/asset/img/main/snow.jpg" alt=""><span class="text">겨울이 벌써 그리와요<br>#내사랑 #겨울까지<br>#d-day #186</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>카풀 최신글</h3><a href="/wood/carpool/list.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/GN02_EXT.jpg" alt=""><span class="text">매일 아침 6시<br>#한국지식재산연구원 <br>#노원구 #3명 구합니다.</span></div>
              <div class="pic"><img src="/wood/asset/img/main/ev9.jpg" alt=""><span class="text">내일 아침 7시<br>#논현동 #비케이 빌딩 <br>#별내 #2명 구합니다.</span></div>
              <div class="pic"><img src="/wood/asset/img/main/niro-ev.jpg" alt=""><span class="text">월계동 아침 6시 30분<br>#골든타워 #강남구 삼성동</span></div>
              <div class="pic"><img src="/wood/asset/img/main/TM10_EXT.jpg" alt=""><span class="text">명동역 아침 7시<br>#홍선빌딩 #강남구 삼성동 <br>#2명 구해요.</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>스터디 최신글</h3><a href="/wood/study/list.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/interview.jpeg" alt=""><span class="text">면접 연습 스터디<br>#IT #대치동 #저녁 8시</span></div>
              <div class="pic"><img src="/wood/asset/img/main/studyengineer.jpg" alt=""><span class="text">정처기 실기 스터디<br>#잡담금지 #역삼역 <br>#저녁 7시 #스타벅스<br>#주중 매일</span></div>
              <div class="pic"><img src="/wood/asset/img/main/RC.jpg" alt=""><span class="text">토익 RC 스터디<br>#지식 공유 #논현동 <br>#정처기 필기 합격자만<br>#자세한 사항은 쪽지 주세요</span></div>
              <div class="pic"><img src="/wood/asset/img/main/talk.jpeg" alt=""><span class="text">논리적이고 똑바른 말 공부방<br>#강남동 #부담없음 <br>#날마다 다른 주제 선정 <br>#자유로운 얘기</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>과외 최신글</h3><a href="/wood/teach/list.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/cost.jpg" alt=""><span class="text">원가관리 회계 과외합니다.<br>#선생님 #쪽지 주세요</span></div>
              <div class="pic"><img src="/wood/asset/img/main/Engineer.jpg" alt=""><span class="text">정보처리기사 탈락시 돈 안받습니다.<br>#선생님 #강남 <br>#저녁 4시이후</span></div>
              <div class="pic"><img src="/wood/asset/img/main/Survey.jpg" alt=""><span class="text">사회조사분석사 1:1과외합니다. <br>#선생님 #신사</span></div>
              <div class="pic"><img src="/wood/asset/img/main/java.jpg" alt=""><span class="text">자바 선생님 구합니다.<br>#학생 #역삼역 <br>#GS강남타워 #저녁 8시</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>약속 최신글</h3><a href="/wood/promise/list.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/walk.jpg" alt=""><span class="text">산책가실 분<br>#산책 #점심시간 #역삼역2번출구</span></div>
              <div class="pic"><img src="/wood/asset/img/main/salad.jpg" alt=""><span class="text">어제를 회개하며 샐러드 배달 모집<br>#11시50분까지 받아요 <br>#배달료 나오면 1/n<br>#삼성</span></div>
              <div class="pic"><img src="/wood/asset/img/main/dinner.jpg" alt=""><span class="text">오늘 저녁 같이 마라탕!!!<br>#8시 #마라탕<br>#오직 밥만</span></div>
              <div class="pic"><img src="/wood/asset/img/main/dawn.jpg" alt=""><span class="text">저랑 하이볼 뿌실 분<br>#12시 #90분 #하이볼</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>동호회 최신글</h3><a href="/wood/club/club.do" class="card-link">더보기</a></div>
              <div class="wrap">
              <div class="pic"><img src="/wood/asset/img/main/morning.jpeg" alt=""><span class="text">아침 운동<br>#아침 6시 #출근전 #30분 #러닝</span></div>
              <div class="pic"><img src="/wood/asset/img/main/bicycle.jpeg" alt=""><span class="text">자전거<br>#자전거를 #사랑하시는 분 <br>#한강</span></div>
              <div class="pic"><img src="/wood/asset/img/main/boardgame.jpeg" alt=""><span class="text">보드게임<br>#역삼역 #수요일 #저녁8시 #보드카페</span></div>
              <div class="pic"><img src="/wood/asset/img/main/diablo.jpeg" alt=""><span class="text">디아블로4<br>#저녁 9시 #오래 #같이 #즐길분만</span></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-block">
              <div class="card-title"><h3>맛집 최신글</h3><a href="/wood/recommend/recommend.do" class="card-link">더보기</a></div>
              <div class="wrap">
             <div class="pic"><img src="/wood/asset/img/main/fishcake.jpg" alt=""><span class="text">청담오뎅<br>#오뎅 #개 #맛있어요<br>#삼성월드타워아파트</span></div>
             <div class="pic"><img src="/wood/asset/img/main/basbuger.jpg" alt=""><span class="text">바스버거<br>#역삼점 #자율 감자칩<br>#개맛있어요</span></div>
             <div class="pic"><img src="/wood/asset/img/main/buger.jpg" alt=""><span class="text">스매쉬치즈버거<br>#역삼점 #새우버거<br>#새우버거 도라이</span></div>
             <div class="pic"><img src="/wood/asset/img/main/noodle.jpg" alt=""><span class="text">현우동<br>#우동 #미쉐린<br>#강남구 논현동</span></div>
             </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card card-last">
            <div class="card-block">
              <div class="card-title"><h3>공지/	건의/질문</h3><a href="/wood/suggest/suggest.do" class="card-link">더보기</a></div>
              <div class="wrap-last">
              	<br>
              	<ul>
              	<li class="div-sug">[건의] 차단한 유저의 네트워크 채팅이 안보이게 해주세요</li>
              	<li class="div-sug">[질문] 관리자님께 질문</li>
              	<li class="div-sug">[공지] 6월 2차 건의 사항 현황판 업데이트 안내</li>
              	<li class="div-sug">[건의] 진지하게 건의 사항이 있습니다</li>
              	<li class="div-sug">[건의] 여러 번 제재당한 유저를 영구 정지했으면 좋겠습니다</li>
              	<li class="div-sug">[건의] 확인 가능한 쪽지 개수를 늘려주세요!!!</li>
              	</ul>
             </div>
            </div>
          </div>
        </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>


	
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$(document).ready(function() {
			var slides = $('.banner-slide');
			var currentIndex = 0;

			// Show the first slide
			$(slides[currentIndex]).addClass('active');

			// Start the slide show
			setInterval(function() {
				$(slides[currentIndex]).removeClass('active');
				currentIndex = (currentIndex + 1) % slides.length;
				$(slides[currentIndex]).addClass('active');
			}, 3000); // Change slide every 3 seconds
		});
	</script>
	
</body>
</html>