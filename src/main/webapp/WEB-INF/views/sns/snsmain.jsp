<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 게시판</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
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
	height:90vh;
	
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
	#imagebox{
		text-align:center;
		items-align:center;
	}
	#react{
		position:absolute;
		bottom:0px;
	}
	#comment , #like{
		display:inline-block;
		margin-right: 40px;
		margin-left:20px;
	}
	#board::-webkit-scrollbar {
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
				<button value="서울시 송파구">서울시 송파구</button>
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
									userid
								</div>
								<div id="useritem">
									오늘 날씨가 덥다ㅏㅏㅏㅏ
								</div>
								<div id="imagebox">
									<img alt="" src="/wood/asset/img/logo.png" style="width:300px;">
								</div>
								<div id="react">
									<div id="comment">댓글이모티콘!!</div>
									<div id="like">like</div>
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
									<div id="comment">댓글이모티콘!!</div>
									<div id="like">like</div>
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
									<div id="comment">댓글이모티콘!!</div>
									<div id="like">like</div>
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
									<div id="comment">댓글이모티콘!!</div>
									<div id="like">like</div>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
<script>

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.507676802251, 127.05556435590361), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

</script>
</body>
</html>