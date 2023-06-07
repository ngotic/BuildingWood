<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 게시판</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style data-tag="reset-style-sheet">
 html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
</style>
<!-- 마커 스타일  -->
<style>
.overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:250px;background: url('/wood/asset/img/포스코타워 역삼.png') no-repeat;margin-bottom:8px;background-size: cover;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
</style>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
</style>
<style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);

      }
     .frame-group1222 {
	  top: 300px;
	  right: 300px;
	  width: 194px;
	  height: 43px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
	  border-color: #cccccc;
	  border-width: 0.5px;
	  border-radius: 30px;
	  background-color: rgba(255, 255, 255, 1);
	}
	.frame-group1222:hover{
		cursor:pointer;
		background-color:green;
	}
	
	.frame-mappin {
	  top: 7px;
	  left: 32px;
	  width: 26px;
	  height: 28px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
	}
	.frame-pin-stroke {
	  top: 0px;
	  left: 0px;
	  width: 26px;
	  height: 28px;
	  position: absolute;
	}
	.frame-pin {
	  top: 1.7142906188964844px;
	  left: 1.857421875px;
	  width: 22px;
	  height: 25px;
	  position: absolute;
	}
	.frame-circle {
	  top: 7.428572654724121px;
	  left: 8.047615051269531px;
	  width: 10px;
	  height: 9px;
	  position: absolute;
	}
	.frame-text15 {
	  top: 9px;
	  left: 65px;
	  color: rgba(255, 95, 95, 1);
	  height: auto;
	  position: absolute;
	  font-size: 17px;
	  font-style: Medium;
	  text-align: left;
	  font-family: Inter;
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	span.material-symbols-outlined {
    margin-top: 1px;
    color: tomato;
	}
	.frame-text15 > span {
	color: tomato;
	}
</style>	

<style>
	*{
		  -webkit-user-select:none;
		  -moz-user-select:none;
		  -ms-user-select:none;
		  user-select:none 
	}
	.header-area {
	    position: fixed; /* 여기도 */
	    top: 0;
	    left: 0;
	    width: 100%;
	    z-index: 3;
	    background-color: white;
	    border-bottom: 2px solid #eee;
	}
	/*컨테이너 오버라이딩  */
	.container {
	    font-size: 14px; 
	    max-width: 1300px;
	    margin-top: 100px;    
	    font-family: var(--main-content-font-family);
	    
	    
	} 
	.wrap{
		display:flex;
		margin-top: 110px;
	}

	#content{
		  width:45%;
		  height:864px;
		  margin-right:50px;
		  overflow:hidden;
	}
	#content:last-child{
		margin-right:0px;
	}
	#map{
	width:52%;
	height:864px;
	
	}
	#cheader{
		height:40px;
		text-align:center;
		position:relative;
		color:black;
		margin:10px;
		border-bottom:3px solid #008D62;
		font-size:20px;
	}
	#board{
		overflow-y:scroll;
		height:830px;
	}

	.boardcontent{
		width:90%;
		height:400px;
		background-color:white;
		display:flex;
		border-bottom: 3px solid rgb(219,219,219);
		margin: 15px auto;
	}
	#usercontent{
		width:450px;
		height:390px;
		position:realtive;
	}
	#useritem{
		margin: 10px auto;
	}

	
	#modal_imagebox {
		position:relative;
		width:600px;
		height:600px;
		text-align:center;
		vertical-align:center;
		align-items: center;
		background-size:contain;
		overflow:hidden;
	}
	#react{
		position:absolute;
		bottom:0px;
		
	}
	#comment , #like{
		display:inline-block;
		margin-right: 40px;
		margin-left:20px;
		color:tomato;
	}
	#comment:hover , #like:hover{
		cursor:pointer;
		color:black;
		
	}
	#board::-webkit-scrollbar {
    	display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
	img{
		margin:auto;
		display:block;
		object-fit: cover;
	}
	.modal_usernick{
		display:inline-block;
		width:110px;
		font-size:12px;
		font-weight: bold;
	}
	#modal_usernick{
		display:inline-block;
		width:110px;
		font-size:12px;
		font-weight: bold;
	}
	.modal_commentbox{
		width:460px;
		height:40px;
		margin-top:5px;
		position:relative;
		
	}
	.modal_comment{
		width:300px;
		height:40px;
		display:inline-block;
		font-size:12px;
	}
	.comment_userimage{width:35px; display:inline-block;align-items: center;}
	#modal_react{
		margin:7px 0;
		height:65px;
		padding-bottom:2px ;
		border-bottom:3px solid black;
	}
	
	
	#w_modal_comment{
		float:left;
		vertical-align:top;
		align-content:top;
		width:300px;
		height:35px;
	}
	#modal_scroll::-webkit-scrollbar {
    	display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
	.to_comment{
		position:absolute;
		bottom:5px;
	}
	.top{
		position:absolute;
		top:0px;
	}
	.box{
		display:inline-block;
	}
	.snshash{
		vertical-align: center;
		width:273px;
		height:18px;
		overflow:hidden;
	}
	#addcontent{
		width:90%;
		height:410px;
		background-color:white;
		display:flex;
		border-bottom: 3px solid rgb(219,219,219);
		margin: 15px auto;
	}
	#add_useritem{
		width:450px;
		height: 180px;
		border: 3px solid rgb(219,219,219);
		display:inline-block;
		border-radius: 5px;
		outline-color: rgb(219,219,219);
	}
	.add:hover{
		border:1px solid rgb(219,219,219);
		background-color:rgb(219,219,219);
		color:white;
	}
	.imagebox{
		 width: 450px;
		  height: 300px;
		  position: relative;
		  overflow:hidden;
	}
	.u_imagebox{
		background-color:none;
	}
	li{
  list-style-type: none;	
}

 	label:hover{
 	cursor:pointer;
 	}
.slides{
  position: absolute;
  left: 0;
  top: 0;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.3s ; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child){
  float: left;
}

.slides li{
  float: left;
}

.controller span{
  position:absolute;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  top: 50%;
  font-size: 1.3em;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}

.prev{
  left: 10px;
}


.next{
  right: 10px;
}
.col{
	width:126px;
	margin-top:-100px;
	background-color:black;
	height:130px;
	padding:0 0 0 0;
	margin-left: 12px;
	margin-right: 12px;
}

.mslides{
  position: absolute;
  left: 0;
  top: 0;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.3s ; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}


.mslides li:not(:last-child){
  float: left;
}

.mslides li{
  float: left;
}

.mcontroller span{
  position:absolute;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  top: 50%;
  font-size: 1.3em;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.mcontroller span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}

.mprev{
  left: 10px;
}


.mnext{
  right: 10px;
}
button.btnsnsadd{
		display:inline-block;
		width:80px;
		margin-top:2px;
		margin-bottom:2px;
		float:right;
		border:1px solid white;
		padding:0 0 0 0 !important;
	}
</style>

</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<div style="text-align:center;">
		<!-- <h1>지역 SNS <small>메인</small></h1> -->
		</div>
		<div class="wrap">
			<div id="content">
				<div id="cheader" >
				<div class="box"> 강남구 삼성동 골든타워</div>
				<div class="box" style="position:absolute; right:0px;"><button id="addsnscontent">접기</button></div>
				</div>
				<div id="board">
					<!--로드 할 게시물들  -->
					<div id="boardwrap" style="max-height:8500px;">
						<form action="/wood/snsmain.do" id="snsaddboard" method="Post" enctype="multipart/form-data">
							<div id="addcontent">
								<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
									<!-- 유저 이미지 넣기  -->
									<img alt="" src="/wood/asset/sns/${profile}" style="width:50px;">
								</div>
								<div id="usercontent">
									<div id="usernickname"  style="margin-bottom:15px;">
										<input type="text" name = "id" value="${unickname}" readonly>
									</div>
									<textarea id="add_useritem" name="add_useritem"></textarea>
									<div class="container">
									  <div class="row">
									    <div class="col">
										    <label for="addpic" id="label_addpic" style="text-align:center; vertical-align:middle; width:126px; height:130px; overflow:hidden;">
											    <span class="material-symbols-outlined" style="font-size:70px; margin-top:30px;">
													add
												</span>
											</label>
										    <input type="file" id="addpic" name="addpic" style="display:none;" onchange="f1();"/>
									      
									    </div>
									    <div class="col">
									      	<label for="addpic2" id="label_addpic" style="text-align:center; vertical-align:middle; width:126px; height:130px; overflow:hidden;">
											    <span class="material-symbols-outlined" style="font-size:70px; margin-top:30px;">
													add
												</span>
											</label>
										    <input type="file" id="addpic2" name="addpic2" style="display:none;" onchange="f1();"/>
									    </div>
									    <div class="col">
									      	<label for="addpic3" id="label_addpic" style="text-align:center; vertical-align:middle; width:126px; height:130px; overflow:hidden;">
											    <span class="material-symbols-outlined" style="font-size:70px; margin-top:30px;">
													add
												</span>
											</label>
										    <input type="file" id="addpic3" name="addpic3" style="display:none;" onchange="f1();"/>
									    </div>
									  </div>
									</div>
								<button type="submit" class="btnsnsadd">등록하기</button>
								</div>
							</div>
						</form>
						
						<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="boardcontent" style="position:relative;">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/sns/${dto.profile}" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									${dto.nickname}
								</div>
								<div id="useritem">
									${dto.content}
								</div>
								<div class="imagebox" data-count="${dto.cpic}" id="send_modal">
								    <ul class="slides" style="width:calc(${dto.cpic} * 450px)"> 
								   		<c:forEach items="${plist}" var="pic">
							   			<c:if test="${dto.snsboardseq==pic.snsboardseq}">
								     		<li><img alt="" src="/wood/asset/sns/${pic.pic}" style="width:450px; height:300px; "></li>
								     	</c:if>
								     	</c:forEach>
								    </ul>  
								    <p class="controller">
								      
								      <!-- &lang: 왼쪽 방향 화살표
								      &rang: 오른쪽 방향 화살표 -->
								      <span class="prev">&lang;</span>  
								      <span class="next">&rang;</span>
								    </p>
								  </div>
						       	
						       	<div id="to_modal_commentlist" style="display:none;" >
						       	<c:forEach items="${commentlist}" var="clist">
						       		<c:if test="${clist.snsboardseq==dto.snsboardseq}">
					     				<div class="modal_commentbox" >
					     					<div class="u_imagebox box">
					     						<img alt="" src="/wood/asset/sns/${clist.profile}" class="comment_userimage">
						     				</div>
						     				<div class="modal_usernick">
												<div class="top">
													${clist.nickname}
												</div>
												<div>
													<button class="to_comment" value="${clist.nickname}">답글 달기</button>
												</div>
											</div>
											<div class="modal_comment top">
												${clist.content}
											</div>
					     				</div>
				     				</c:if>
	     						</c:forEach>
								</div>
								
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
										${dto.clike }
									</div>
									<div id="comment">
										 <button class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-snsboardseq="${dto.snsboardseq}" data-content="${dto.content}" data-clike="${dto.clike }" data-profile="${dto.profile}" data-nickname="${dto.nickname}" data-cpic="${dto.cpic}" data-index="${status.index}">
											chat_bubble
										</button>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="map"></div>
		</div>
				
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
		
	
	
	
	
	<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding: 5px 5px; ">
     	
     	<table>
     		<tr>
     			<!-- 이미지  -->
     			<td rowspan='4' style="width:600px; height:700px; display:relative;">
     				<div class="modal_imagebox" id="modal_imagebox"></div>
     			</td>
     			<!-- 오른쪽  -->
     			<td style="width:400px;height:70px; border-bottom:3px solid black;" >
     				<div class="u_imagebox box" id="u_imagebox">
     					<img alt="" src="/wood/asset/sns/pic.png" class="comment_userimage">
     				</div>
     				<div id="modal_usernick"></div>
					<div class="modal_comment" id="modal_content"></div>
     				
     			</td>
     		</tr>
     		<tr style="height:500px; border-bottom:3px solid black;">
     			<!-- 댓글  -->
	   			<td>
	     			<div id="modal_scroll" style="vertical-align:top; height:500px; overflow-y:scroll;">
	     				<!-- 댓글1  -->
	     				<c:forEach items="">
		     				<div class="modal_commentbox" >
		     					<div class="u_imagebox box">
		     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
			     				</div>
			     				<div class="modal_usernick">
									<div class="top">
										당당한이병건477
									</div>
									<div>
										<button class="to_comment" value="당당한이병건477">답글 달기</button>
									</div>
								</div>
								<div class="modal_comment top">
									진짜요.. 8월엔 얼마나 더우려구...ㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
								</div>
		     				</div>
	     				</c:forEach>
	     			<!--댓글2  -->
	     				<div class="modal_commentbox" >
	     					<span>
	     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
		     				</span>
		     				<div class="modal_usernick">
								<div class="top">
									멋있는하이에나943
								</div>
								<div>
									<button class="to_comment" value="멋있는하이에나943">답글 달기</button>
								</div>
							</div>
							<div class="modal_comment top">
								아이스크림... 드릴까요?
							</div>
	     				</div>
	     			</div>
	   			</td>
     		</tr>
     		<tr>
     			<td style="height:50px;">
     				<div id="modal_react">
     					<span class="material-symbols-outlined" id="like">
							favorite
						</span>
						<span class="material-symbols-outlined" id="comment">
							chat_bubble
						</span>
						<div style="font-size:12px; margin-left: 10px; margin-top:5px;">
							좋아요0개
						</div>
					</div>
     			</td>
     		</tr>
     		<tr>
     			<td style="border-bottom:3px solid black;">
     				<form method="Post">
     					<input name="w_modal_comment" id="w_modal_comment" type="text" value="text" style="font-size:12px;">
     					<div style="float:right; margin-top:5px;"><button type="submit" style="font-size:12px;">게시하기</button></div>
     				</form>
     			</td>
     		</tr>
     		
     	</table>
     	
     	
     	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="	text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
<script>
	
	$("#addsnscontent").on("click",function(){
		
		if($('#addsnscontent').text()=='접기'){
			$("#snsaddboard").hide(1000);
			$('#addsnscontent').text("글쓰기");
		}
		else if($('#addsnscontent').text()=="글쓰기"){
			$("#snsaddboard").show(1000);
			$('#addsnscontent').text("접기");
			$('#add_useritem').focus();
			$('#board').animate({
				scrollTop:0
			},1000);
			
		}
	});
	
	
	$(".to_comment").on("click",function(){
		$("#w_modal_comment").val('@'+this.value+" ");
		$("#w_modal_comment").focus();
	});
	
	

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.507676802251, 127.05556435590361), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var content = '<div class="overlaybox">' +
    '    <div class="boxtitle">삼성동 골든타워</div>' +
    '    <div class="first">' +
    '        <div class="triangle text">1</div>' +
    '        <div class="movietitle text">삼성동 골든타워</div>' +
    '    </div>' +
    '</div>';

	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.507676802251, 127.05556435590361); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	var customOverlay = new kakao.maps.CustomOverlay({
	    position: markerPosition,
	    content: content,
	    xAnchor: 1,
	    yAnchor: 0.91
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    

	
	//클릭이벤트
	kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {        
	    
		
	    var customOverlay = new kakao.maps.CustomOverlay({
		    position: markerPosition,
		    content: content,
		    xAnchor: 0.3,
		    yAnchor: 0.99
		});
	    
	    marker.setMap(null);
		customOverlay.setMap(map);
	
	});
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		marker.setMap(map);
		$('.overlaybox').hide();
	});
	
	
	let currentIdx =0; //현재 슬라이드 index
	let slideCount =0; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	
	
	$('.prev').on('mousedown', function () {
		if(slideCount!=$(this).parent().parent().data("count")-1){
			slideCount=$(this).parent().parent().data("count")-1;
			currentIdx=0;
			
			$('.slides').css("left",0);
		}
	});

	$('.prev').on('click', function () {
		if(currentIdx<=0){
			currentIdx=0;
		}
		else if(slideCount<currentIdx){
			currentIdx=0;
		}
		else{
		  $(this).parent().parent().children().css("left",$(this).parent().parent().children().position().left + 450);
		  currentIdx--;
		}
	});
	

	$('.next').on('mousedown', function () {
		if(slideCount!=$(this).parent().parent().data("count")-1){
			slideCount=$(this).parent().parent().data("count")-1;
			currentIdx=0;
			$('.slides').css("left",0);
		}
	});
	
	$('.next').on('click', function () {
		
		if(currentIdx==slideCount){
			currentIdx=slideCount;
		}
		else if(slideCount<currentIdx){
			currentIdx=0;
		}
		else{
		  $(this).parent().parent().children().css("left",$(this).parent().parent().children().position().left - 450);
		  currentIdx++;
		}
	 
	});
	
		
	    	
    	$(document).ready(function() {     
            $('#staticBackdrop').on('show.bs.modal', function(event) {       
            	var Idx =1; //현재 슬라이드 index
            	const snsboardseq=$(event.relatedTarget).data('snsboardseq');
            	const index= 1+$(event.relatedTarget).data('index');
            	const content=$(event.relatedTarget).data('content');
    	        const clike=$(event.relatedTarget).data('clike');
    	        const profile="/wood/asset/sns/"+$(event.relatedTarget).data('profile');
    	        const nickname=$(event.relatedTarget).data('nickname');
    	        const cpic=$(event.relatedTarget).data('cpic');
    	        
    	        $("#modal_usernick").text(nickname);
    	        $("#u_imagebox").html("<img alt="+"\"\" src=\""+profile+"\"class=\"comment_userimage\">");
    	        $("#modal_content").text(content); 
    	        let str= $("#boardwrap").children().eq(index).find("#send_modal").html().substring();
    	        str=str.replaceAll('450px','600px');
    	        str=str.replaceAll('300px','600px');
    	        str=str.replaceAll('class=\"','class=\"m');
    	        str=str.replaceAll('left: -900px;','');
    	        str=str.replaceAll('left: -600px;','');
    	        str=str.replaceAll('left: -300px;','');
    	        str=str.replaceAll('calc(1350px);','calc(1800px);');
    	        str=str.replaceAll('calc(900px);','calc(1200px);');
    	        str=str.replaceAll('calc(450px);','calc(600px);');
    	        
    	        $("#modal_imagebox").html(str); 
    	        
    	        
    	    	$('.mprev').on('click', function () {
    	    		if(Idx<=1){
    	    			Idx=1;
    	    		}
    	    		else{
    	    		 $(".mslides").css("left",$(".mslides").position().left + 600);
    	    		  Idx--;
    	    		}
    	    	});
    	    	
    	    	$('.mnext').on('click', function () {
    	    		if(Idx>=cpic){
    	    			Idx=cpic;
    	    		}
    	    		else{
   	    			 $(".mslides").css("left",$(".mslides").position().left - 600);
    	    		  Idx++;
    	    		}
    	    	 
    	    	});
    	    	
            });
            
            
        });
    
</script>


</body>
</html>