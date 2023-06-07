<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
.center {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
}

.card {
	width: 450px;
	height: 250px;
	background-color: #fff;
	background: linear-gradient(#f8f8f8, #fff);
	box-shadow: 0 8px 16px -8px rgba(0, 0, 0, 0.4);
	border-radius: 6px;
	overflow: hidden;
	position: relative;
	margin: 1.5rem;
}

.card h2 {
	text-align: center;
}

.card .additional {
	width: 150px;
	height: 100%;
	background: linear-gradient(#dE685E, #EE786E);
}

.card.green .additional {
	background: linear-gradient(#92bCa6, #A2CCB6);
}

.card .additional .user-card {
	width: 150px;
	height: 100%;
	position: relative;
	float: left;
}

.card .additional .user-card .level, .card .additional .user-card .points
	{
	top: 15%;
	color: black;
	text-transform: uppercase;
	font-size: 0.8rem;
	font-weight: bold;
	/* background: #FEF5ED; */
	padding: 0.125rem 0.75rem;
	border-radius: 100px;
	white-space: nowrap;
}

.card .additional .user-card .points {
	top: 80%;
	text-align: center;
	font-size: 1.1rem;
	color: #FEF5ED;
	padding: 0px;
}

.card .additional .user-card .points .four {
	top: 85%;
	text-align: center;
	font-size: 1.1rem;
	color: #FEF5ED;
	padding: 0px;
}

.points {
	width: 80px;
	height: 30px;
}

.card .additional .user-card svg {
	top: 50%;
}

.card .additional .more-info {
	width: 300px;
	float: left;
	position: absolute;
	left: 150px;
	height: 100%;
}

.card .additional .more-info h2 {
	color: #fff;
	margin-bottom: 0;
}

.card.green .additional .more-info h2 {
	color: #224C36;
}

.card .additional .coords {
	margin: 0 1rem;
	color: #fff;
	font-size: 1rem;
}

.card.green .additional .coords {
	color: #325C46;
}

.card .additional .coords span+span {
	float: right;
}

.card .additional .stats {
	font-size: 2rem;
	display: flex;
	position: absolute;
	bottom: 1rem;
	left: 1rem;
	right: 1rem;
	top: auto;
	color: #fff;
}

.card.green .additional .stats {
	color: #325C46;
}

.card .additional .stats>div {
	flex: 1;
	text-align: center;
}

.card .additional .stats i {
	display: block;
}

.card .additional .stats div.title {
	font-size: 0.75rem;
	font-weight: bold;
	text-transform: uppercase;
}

.card .additional .stats div.value {
	font-size: 1.5rem;
	font-weight: bold;
	line-height: 1.5rem;
}

.card .additional .stats div.value.infinity {
	font-size: 2.5rem;
}

.card .general {
	width: 300px;
	height: 100%;
	position: absolute;
	top: 0;
	right: 0;
	z-index: 1;
	box-sizing: border-box;
	padding: 1rem;
	padding-top: 0;
}

.card .general .more {
	position: absolute;
	bottom: 1rem;
	right: 1rem;
	font-size: 0.9em;
}

.stars>img {
	width: 30px;
}

.rate {
	color: #777;
	font-weight: bold;
	font-size: 25px;
}

.amount {
	font-weight: 100;
	font-size: 15px;
}

.picon {
	width: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
}

button {
	cursor: pointer;
}

.btn {
	border: 0px;
	background: #71cc747e;
	padding: 0.125rem 0.75rem;
	border-radius: 100px;
	font-size: 15px;
	color: black !important;
}

.detail {
	border: 0px;
	background: #a6f7a93d;
	padding: 0.125rem 0.75rem;
	border-radius: 100px;
	color: black !important;
}

h2 {
	padding-top: 8px;
	padding-bottom: 8px;
}

.rightbtn {
	color: black;
	float: right;
	/* background: #FEF5ED; */
}

.rightbtn::after {
	clear: both;
}

#wbtn {
	color: black;
	font-size: 1rem;
	border: 0px;
	padding: 10px;
	border-radius: 10px;
	background: #C6EBC5;
}

section {
	background-color: #EEEEEE;
	padding: 10px 30px 55px 5px;
}

#teach {
	background: #79E0EE;
}

#student {
	background: #FFF1AF;
}

#dbtn, .applied {
	margin-right: 10px;
	background: #355340;
	color: white !important;
}

#dis {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#id {
	font-size: 0.8rem;
}

#fifteen {
	font-size: 18px;
}


</style>
</head>
<body>
	<section class="container">
		<h1>
			1:1 과외<small>게시판</small>
			<div>
				<c:if test="${not empty id}">
					<form method="POST" action="/wood/teach/logout.do">
						<input type="submit" value="로그아웃">
					</form>
				</c:if>
				<c:if test="${empty id}">
					<form method="GET" action="/wood/teach/login.do">
						<input type="submit" value="로그인">
					</form>
				</c:if>
			</div>
		</h1>

		<select id="sel1" onchange="go()">
			<option value="" selected disabled hidden>지역</option>
			<option value="전체">전체</option>
			<c:forEach items="${set }" var="area">
				<option value="${area}">${area}</option>
			</c:forEach>
		</select> <select id="sel2" onchange="dollar()">
			<option value="" selected disabled hidden>가격</option>
			<option value="전체">전체</option>
			<option value="저가">저가순</option>
			<option value="고가">고가순</option>
		</select> <select id="sel3" onchange="go()">
			<option value="" selected disabled hidden>기타</option>
			<option value="전체">전체</option>
			<option value="별점">별점순</option>
			<option value="조회">조회순</option>
			<option value="최신">최신순</option>
			<option value="마감전">마감전</option>
		</select>

		<!-- <input type="range" min="9000" max="100000" step="1000" onchange="document.getElementById('txt').value=this.value;"
        list="tickmarks" />
	    <datalist id="tickmarks">
	        <option value="10000">10000</option>
	        <option value="20000">20000</option>
	        <option value="30000">30000</option>
	        <option value="40000">40000</option>
	        <option value="50000">50000</option>
	        <option value="60000">60000</option>
	        <option value="70000">70000</option>
	        <option value="80000">80000</option>
	        <option value="90000">90000</option>
	        <option value="100000">100000</option>
	    </datalist>
		<input type="text" id="txt"> -->
		<div id="dis">
			<c:forEach items="${list}" var="dto" varStatus="status">
				<div class="card green" data-place="${dto.place}"
					data-money="${dto.price}">
					<div class="additional">
						<div class="user-card">
							<c:if test="${not empty dto.intro}">
								<div class="level center" id="teach">선생님</div>
							</c:if>
							<c:if test="${not empty dto.student}">
								<div class="level center" id="student">학생</div>
							</c:if>
							<c:if test="${(dto.nickname).length()>4 }">
								<div class="points center">
									${(dto.nickname).substring(0,4) } <br>${(dto.nickname).substring(4,(dto.nickname).length()) }
								</div>
							</c:if>
							<c:if test="${(dto.nickname).length()< 4 }">
								<div class="points center four">${dto.nickname }</div>
							</c:if>

							<svg width="110" height="110" viewBox="0 0 250 250"
								class="center">
                                <clipPath id="scene">
                                    <circle cx="125" cy="125" r="120" />
                                </clipPath>
                                <g stroke="none" stroke-width="0"
									clip-path="url(#scene)">
                                    <rect x="0" y="0" width="250"
									height="250" />
                                    <image
									xlink:href="/wood/asset/img/teach/${dto.img }" x="0" y="0"
									width="250" height="250" preserveAspectRatio="xMidYMid slice" />
                                    <%-- <image xlink:href="/wood/asset/img/teach/${dto.img }" x="0" y="0" width="250"
                                        height="250" preserveAspectRatio="xMidYMid slice" /> --%>
                                </g>
                            </svg>
						</div>
						<div class="more-info">
							<div class="general">
								<h2>${dto.title }</h2>
								<c:if test="${(dto.content).length() < 22}">
									<c:if test="${(dto.content).length() < 16}">
										<p>&nbsp;</p>
										<p>${(dto.content).substring(0, (dto.content).length()) }
									</c:if>
									<c:if
										test="${(dto.content).length() > 16 && (dto.content).length() < 22}">
										<p>${(dto.content).substring(0, 10) }</p>
										<p>${(dto.content).substring(10, (dto.content).length()) }
									</c:if>
								</c:if>
								<c:if test="${(dto.content).length() > 22}">
									<p>${(dto.content).substring(0, 22) }</p>
									<p>
										<c:if test="${(dto.content).length() < 40}">
                                            ${dto.content.substring(22, (dto.content).length())}
                                        </c:if>
										<c:if test="${(dto.content).length() > 40}">
                                            ${dto.content.substring(22, 40)}...
                                        </c:if>
								</c:if>
								<button class="detail rightbtn"
									onclick="location.href='/wood/teach/view.do?teachseq=${dto.teachseq}';">
									<span>상세보기</span>
								</button>
								</p>
								<c:if test="${not empty dto.intro }">
									<div class="stars">
										<c:if test="${not empty dto.matchNum}">
											<c:forEach var="i" begin="1"
												end="${Integer.parseInt(dto.matchNum.substring(0,1))}"
												step="1">
												<img src="/wood/asset/img/teach/star.png" />
											</c:forEach>
											<c:if
												test="${Integer.parseInt(dto.matchNum.substring(2))<=5 &&Integer.parseInt(dto.matchNum.substring(2))>0}">
												<img src="/wood/asset/img/teach/leftstar.png" />
											</c:if>
										</c:if>
										<c:if test="${empty dto.matchNum}">
                                            첫번째 제자에 지원하세요!
                                        </c:if>
										<span class="rate"> <span> ${dto.matchNum } <span
												class="amount">${dto.review}개</span>
										</span>
										</span>
									</div>
									<div>
										<img src="/wood/asset/img/teach/notice.png" class="picon" />
										<span>${dto.intro}</span>
									</div>
								</c:if>
								<c:if test="${not empty dto.student}">
									<div class="stars">
										<span class="rate"> <c:if
												test="${(dto.place).length() < 15}">
												<span> 위치: ${dto.place }</span>
											</c:if> <c:if test="${(dto.place).length() > 15}">
												<span id="fifteen"> 위치: ${dto.place.substring(0, 15)}...</span>
											</c:if>
										</span>
									</div>
									<div>
										<img src="/wood/asset/img/teach/dollar.png"
											class="picon money" /> <span>시급 :
											${String.format("%,d",Integer.parseInt(dto.price)) }원</span>
									</div>
								</c:if>
								<input type="hidden" value="${dto.price }" name="price">
								<input type="hidden" value="${dto.onoff }" name="onoff">
								<input type="hidden" value="${dto.period }" name="period">

								<c:if test="${id == dto.id }">
									<input type="button" value="수정하기" class="btn rightbtn"
										onclick="location.href='/wood/teach/edit.do?teachseq=${dto.teachseq}';">
									<input type="button" value="삭제하기" class="btn rightbtn"
										id="dbtn"
										onclick="location.href='/wood/teach/del.do?teachseq=${dto.teachseq}';">
								</c:if>
								<c:if test="${not empty alist}">
									<c:set var="check" value="false" />
									<c:forEach items="${alist}" var="adto">
										<c:if test="${adto.ateachseq == dto.teachseq}">
											<c:set var="check" value="true" />
											<input type="button" value="신청 중"
												class="btn rightbtn applied"
												onclick="location.href='/wood/teach/signup.do?teachseq=${dto.teachseq}&aseq=${adto.aseq}';">
										</c:if>
									</c:forEach>
									<c:if test="${id != dto.id && check==false}">
										<input type="button" value="신청하기"
											class="btn rightbtn apply duplication"
											onclick="location.href='/wood/teach/signup.do?teachseq=${dto.teachseq}';">
									</c:if>
								</c:if>
								<c:if test="${empty alist}">
									<c:if test="${id != dto.id}">
										<input type="button" value="신청하기" class="btn rightbtn apply"
											onclick="location.href='/wood/teach/signup.do?teachseq=${dto.teachseq}';">
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${not empty id}">
			<input type="button" value="+ 글쓰기" class="rightbtn" id="wbtn"
				onclick="location.href='/wood/teach/add.do';">
		</c:if>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>

            /* $('.apply') */
            /*  $('.apply').click(function () {
                 if ($(this).val() === '신청하기') {
                     $(this).prop('readonly', true);
                     $(this).val("신청 중");
                     $(this).css({
                         'background-color': '#999',
                         'color': 'white'
                     });
                 } else {
                     $(this).prop('readonly', true);
                     $(this).val("신청하기");
                     $(this).css({
                         'background-color': 'rgba(0, 0, 0, 0.0)',
                         'color': 'black'
                     });
                     $.post('/wood/teach/signup.do'),{teachseq: "${dto.teachseq}"};
                 }
             }); */
            function go() {

                 $('.card.green').each((index, item) => {

                	if(event.target.value == '전체'){
                    	$(item).show();
                		//$(item).css('visibility', 'visible');	
                	}else if ($(item).data('place') == event.target.value) {
                    	//$(item).css('visibility', 'visible');
                    	$(item).show();
                	}else{
                		//$(item).css('visibility', 'hidden');
                        $(item).hide();
                    }

                });
                 /* const list = Array.from(document.getElementsByClassName('card'));

                 $('#dis').html('');
            	 
                	 list.forEach(item => {

                	if(event.target.value == '전체'){
                	 	$('#dis').append(item);
                	 
                	}else ($(item).data('place') == event.target.value) {
                	 	$('#dis').append(item);
//                    	$(item).css('visibility', 'visible');
                    	//$(item).show();
                	}
                }); */

             }
             function dollar() {

                 const list = Array.from(document.getElementsByClassName('card'));
                 //console.log(list.length);

                 $('#dis').html('');

                 var don = [];

                 $.each(${ money }, function (index, value) {
                     don.push(value)
                 });

                 if (event.target.value == '전체') {
                	 
                	 list.forEach(item => {
                	 	$('#dis').append(item);
                	 });
                 }else{ 
                	 
                	 if (event.target.value == '저가') {
	                     don.sort(function (a, b) {
	                         return a - b;
	                     });

	                 } else if (event.target.value == '고가') {
	                     don.sort(function (a, b) {
	                         return b - a;
	                     });
	                 }
                  for (let i = 0; i < don.length; i++) {

                     list.forEach(item => {

                         if (don[i] == $(item).data('money')) {
                             $('#dis').append(item);
                         }
                     });
                 	} 
                 }
                 
             }
            	
            		
            	/*
            	$('.card.green').each((index, item) => {
            			$(item).css('visibility', 'hidden');
            		});
             
            	 

            	 for (var i = 0; i < don.length; i++) {
                $('.card.green').each((index, item) => {

                	if(event.target.value == '전체'){
                		$(item).css('visibility', 'visible');	
                	}else if (event.target.value == '저가') {
                		don.sort(function(a, b) {
    	            		  return a - b;
                  		});
  	                		if($(item).data('money') == don[i]){
  	                    		$(item).css('visibility', 'visible');
                  			 }
                  	}else if (event.target.value == '고가') {
                  		don.sort(function(a, b) {
    	            		  return b - a;
                  		});
  	                		if($(item).data('money') == don[i]){
  	                			console.log(don[i],$(item).data('money'));
  	                    		$(item).css('visibility', 'visible');
  	                		}
                      } else {
                		$(item).css('visibility', 'hidden');
              	     
                  			 }
                });

             }
            	 */
            

                /* location.href='/wood/teach/list.do?'+(decodeURIComponent($('#sel1 option:selected').val())); */
            
        /*$('#sel1').change(function () {
                                            var select = $('#sel1 option:selected').val();
                                            if($('input[name=place]').val() == select){
                                            	
                                                $('.card').hide();
                                            	
                                            }
                                            /* if(select != null){
                                        	
                                                $('.card').hide();
                                                $('.select').show();
                                                $('.select').css('display', 'block');
                                            } */
            /*
            });
            */
        </script>
</body>
</html>