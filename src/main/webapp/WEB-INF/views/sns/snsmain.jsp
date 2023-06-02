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
	  top: 120px;
	  right: 380px;
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
		margin-top: 30px;
	}

	#content{
		  background-color: gray;
		  width:45%;
		  height:864px;
		  margin-right:50px;
		  overflow:hidden;
		  
	}
	#map{
	width:45%;
	height:864px;
	
	}
	#cheader{
		text-align:center;
		position:relative;
		color:black;
		margin:10px;
		border-bottom:3px solid orange;
		font-size:20px;
	}
	#board{
		overflow-y:scroll;
		height:830px;
	}

	#boardcontent{
		width:90%;
		height:400px;
		background-color:white;
		display:flex;
		border-bottom: 3px solid orange;
		margin: 15px auto;
	}
	#usercontent{
	
		background-color:black;
		width:450px;
		height:390px;
		position:realtive;
	}
	#useritem{
		margin: 10px auto;
	}

	.imagebox{
		text-align:center;
		align-items: center;
		background-size:contain;
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
	.modal_commentbox{
		width:460px;
		height:50px;
	}
	.modal_comment{
		width:300px;
		height:45px;
		display:inline-block;
		font-size:12px;
		margin:5px auto;
	}
	.comment_userimage{width:35px; display:inline-block;}
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
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>지역 SNS <small>메인</small></h1>
			<div style="text-align:right; margin-right:78px; font-size:20px;">
				<div class="frame-group1222">
		           <div class="frame-mappin">
		             	<span class="material-symbols-outlined">location_on</span>
		           </div>
	           <span class="frame-text15"><span>강남구 역삼동</span></span>
				</div>
			</div>
		<div class="wrap">
			<div id="content">
				<div id="cheader"> 송파구 땡땡빌딩 타임라인</div>
				<div id="board">
					<!--로드 할 게시물들  -->
					<div id="boardwrap" style="max-height:8500px;">
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									${dto.id}
								</div>
								<div id="useritem">
									${dto.content}
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
						<div id="boardcontent">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/img/logo.png" style="width:50px;">
							</div>
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="like">
										<span class="material-symbols-outlined">
											favorite
										</span>
									</div>
									<div id="comment">
									
										 <span class="material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											chat_bubble
										</span>
									</div>
								</div>
							</div>
						</div>
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
     			<td rowspan='4' style="width:600px; height:700px;">
     				<div class="imagebox">
     					<img alt="" src="/wood/asset/img/logo.png">
     				</div>
     			</td>
     			<!-- 오른쪽  -->
     			<td style="width:400px;height:70px; border-bottom:3px solid black;" >
     				<span>
     					<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
     				</span>
     				<div class="modal_usernick">
						멋있는하이에나943
					</div>
					<div class="modal_comment">
							오늘 날씨가 너무 덥네요
					</div>
     				
     			</td>
     			
     		</tr>
     		<tr style="height:500px; border-bottom:3px solid black;">
     			<!-- 댓글  -->
   			<td>
     			<div id="modal_scroll" style="vertical-align:top; height:500px; overflow-y:scroll;">
     				<!-- 댓글1  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							당당한이병건477
						</div>
						<div class="modal_comment">
							진짜요.. 8월엔 얼마나 더우려구...ㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
							아이스크림... 드릴까요?
						</div>
     				</div>
     			<!--댓글2  -->
     				<div class="modal_commentbox" >
     					<span>
     						<img alt="" src="/wood/asset/img/logo.png" class="comment_userimage">
	     				</span>
	     				<div class="modal_usernick">
							멋있는하이에나943
						</div>
						<div class="modal_comment">
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
						<div>
							좋아요0개
						</div>
					</div>
     			</td>
     		</tr>
     		<tr>
     			<td style="border-bottom:3px solid black;">
     				<form method="Post">
     					<input name="w_modal_comment" id="w_modal_comment" type="text" value="text">
     					<div style="float:right; margin-top:5px;"><button type="submit">게시하기</button></div>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
<script>



	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.507676802251, 127.05556435590361), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	document.getElementById('comment').onclick(function(){
		location.href='/wood/SnsComment.do';
	});
	

	
	
	

</script>
</body>
</html>