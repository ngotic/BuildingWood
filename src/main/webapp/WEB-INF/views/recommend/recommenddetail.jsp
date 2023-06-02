<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >

<style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
<style data-tag="default-style-sheet">

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

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
   top: 162px;
   /* left: 156px; */
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
   #container-loc {
   height: 130px;
   }

   #content {
      height: 600px;
   }
   #comment td:nth-child(1) { width: auto; }
   #comment td:nth-child(2) { 
      width: 170px;
      text-align: center;
   }
   #addcomment td:nth-child(1) { width: auto;}
   #addcomment td:nth-child(2) {
      width: 150px;
      text-align: center;
   }
   .comment-regdate {
      font-size: 12px;
      color: #777;
   }
   .comment-content {
      display: flex;
      justify-content: space-between;
   }
   .mb-5 {
    margin-bottom: 3rem!important;
    width: 900px;
    margin: 0 auto;
    padding-left: 10px;
    
   }
   
   
   
   #main {
      display: flex;
      align-items: flex-start;
      justify-content: center;
      font-family: 'Pretendard-Regular';
   }
   
   #map {
      border: 1px solid #CCC;
      width: 450px;
      height: 465px;
      margin: 8px 30px 50px 0;
   }
   
   #list {
      width: 400px;
      margin-top: 0;
   }
   
   #rec-comment {
   width: 750px;
    display: inline-block;
   }
   #rec-comment-arrow {
   margin:5px 3px 0 0;
   }
   .btn-add1 {
    height: 60px;
    position: absolute;
    left: 778px;
    top: 17px;
    border-radius: 5px;
   }
   
   .fw-bold > span {
    background-color: #eee;
    border-radius: 10px;
    font-size: 1.5rem;
    cursor: pointer;
   }
   .fw-bold > button {
    background-color: #eee;
    border-radius: 10px;
    height: 24px;
    width: 24px;
    position: absolute;
    left: 260px;
   }
   #rec-comment-edit {
    position: absolute;
    top: 100px;
    left: 230px;
    }
   #rec-comment-del { 
    position: absolute;
    top: 90px;
    left: 240px; 
   }
   
   .map-all {
   height: 40px;
   }
   .map-menu {
   height: 20px;
   }
   .map-head {
   width:66px;
   }
	
	.container.gallery-container {
    background-color: #fff;
    color: #35373a;
    min-height: 100vh;
    border-radius: 20px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.06);
}

.gallery-container h1 {
    text-align: center;
    margin-top: 70px;
    font-family: 'Droid Sans', sans-serif;
    font-weight: bold;
}

.gallery-container p.page-description {
    text-align: center;
    max-width: 800px;
    margin: 25px auto;
    color: #888;
    font-size: 18px;
}

.tz-gallery {
    padding: 0px;
}

.tz-gallery .lightbox img {
    width: 100%;
    margin-bottom: 30px;
    transition: 0.2s ease-in-out;
    box-shadow: 0 2px 3px rgba(0,0,0,0.2);
    height: 100px;
    display: block;
    object-fit: cover;
}


.tz-gallery .lightbox img:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 15px rgba(0,0,0,0.3);
}

.tz-gallery img {
    border-radius: 4px;
}

.baguetteBox-button {
    background-color: transparent !important;
}
.row > div {
	padding-right: 0px;
}

@media(max-width: 768px) {
    body {
        padding: 0;
    }

    .container.gallery-container {
        border-radius: 0;
    }
}

.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: tomato url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

</style>


</head>
<body>
   <!-- template.jsp > index.jsp -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>
   <section class="container" id="container-loc">
      <h1>맛집 추천 <small>상세보기</small></h1>
      <!-- 위치 -->
      <div class="frame-group1222">
           <div class="frame-mappin">
             <span class="material-symbols-outlined">location_on</span>
           </div>
           <span class="frame-text15"><span>강남구 역삼동</span></span>
         </div>
   </section>
         
         
    <div id="main">
      <div id="map">지도</div>
      <table id="list">
      
      <!-- 지도 -->
      	 <tr>
			<td style="display:flex; cursor:pointer;" data-lat="37.49804838498247" data-lng="127.03198091216792" class="item"></td>
		 </tr>
      
      
         <tr>
         	<td class="map-head">가게명</td>
            <td class="map-all">육전식당4호점</td>
         </tr>
         <tr>
         	<td class="map-head">별점</td>
            <td class="map-all">★★★★★</td>
         </tr>
         <tr>
         	<td class="map-head">한줄평</td>
            <td class="map-all">나의 인생 삼겹살</td>
         </tr>
         <tr>
         	<td class="map-head">메뉴</td>
            <td class="map-menu">목살 (150g) - 17,000원</td>
         </tr>
         <tr>
         	<td class="map-head"> </td>
            <td class="map-menu">삼겹살 (150g) - 17,000원</td>
         </tr>
         <tr>
         	<td class="map-head"> </td>
            <td class="map-menu">항정살 (150g) - 19,000원</td>
         </tr>
         <tr>
         	<td class="map-head"> </td>
            <td class="map-menu">육전돼지불백 - 9000원</td>
         </tr>
         <tr>
         	<td class="map-head">주소</td>
            <td class="map-all">서울 강남구 역삼동 823-10</td>
         </tr>
         <tr>
         	<td class="map-head"> </td>
            <td class="map-gallary">
            
				<div class="tz-gallery">
			        <div class="row">
			
			            <div class="col-sm-12 col-md-4">
			                <a class="lightbox" href="/wood/asset/rec_img/육전식당4호점1.jpg">
			                    <img src="/wood/asset/rec_img/육전식당4호점1.jpg" alt="img1">
			                </a>
			            </div>
			            <div class="col-sm-6 col-md-4">
			                <a class="lightbox" href="/wood/asset/rec_img/육전식당4호점2.jpg">
			                    <img src="/wood/asset/rec_img/육전식당4호점2.jpg" alt="img2">
			                </a>
			            </div>
			            <div class="col-sm-6 col-md-4">
			                <a class="lightbox" href="/wood/asset/rec_img/육전식당4호점3.jpg">
			                    <img src="/wood/asset/rec_img/육전식당4호점3.jpg" alt="img3">
			                </a>
			            </div>
			            <div class="col-sm-6 col-md-4">
			                <a class="lightbox" href="/wood/asset/rec_img/육전식당4호점4.jpg">
			                    <img src="/wood/asset/rec_img/육전식당4호점4.jpg" alt="img4">
			                </a>
			            </div>
			        </div>
			    </div>
			    
			    
            </td>
         </tr>
         <!-- 이미지 -->
      </table>
   </div>
         
         
      <!-- 댓글 -->
      <section class="mb-5">
          <div class="card bg-light" style="border-color: #eee">
          
              <div class="card-body">
                  <!-- Comment form-->
                  <form class="mb-4" id="rec-comment"><textarea class="form-control" rows="2" placeholder="가게 평가를 남겨주세요!"></textarea></form>
                  <input type="submit" value="등록하기" id="btn btn-add" class="btn-add1" style="margin:0 0 5px 10px">
                  
                  <!-- Comment with nested comments-->
                  <div class="d-flex mb-4">
                      <!-- Parent comment-->
                      <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                      <div class="ms-3">
                          <div class="fw-bold">Commenter Name
                         	 	<span class="material-symbols-outlined rec-comment-edit" onclick="location.href='';">edit</span>
                         	 	
                          		<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="material-symbols-outlined rec-comment-del">delete</span></button>
                          			<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="exampleModalLabel">댓글삭제</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">삭제하시겠습니까?</div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									        <button type="button" class="btn btn-success" onclick="del(${dto.seq});">Delete</button>
									      </div>
									    </div>
									  </div>
									</div>
                          </div>
                          If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                          
                          
                          <!-- Child comment 1-->
                          <div class="d-flex mt-4">
                          <span class="material-symbols-outlined" id="rec-comment-arrow">subdirectory_arrow_right</span>
                              <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                              <div class="ms-3">
                                  <div class="fw-bold">Commenter Name
                                  		<span class="material-symbols-outlined rec-comment-edit">edit</span>
                          				<span class="material-symbols-outlined rec-comment-edit">delete</span>
                                  </div>
                                  And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                              </div>
                          </div>
                      </div>
                  </div>
                  
                  <!-- Single comment-->
                  <div class="d-flex">
                      <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                      <div class="ms-3">
                          <div class="fw-bold">Commenter Name
                          		<span class="material-symbols-outlined rec-comment-edit">edit</span>
                          		<span class="material-symbols-outlined rec-comment-edit">delete</span>
                          </div>
                          When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                      </div>
                  </div>
                  	  
             </div>
          </div> 
      </section><!-- mb-5 댓글 -->
      

      <br><br><br><br><br><br>
   
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c436ba63a01d9316c75c3b9b08e2475c"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>

<script>

	function del(seq) {
		location.href='/memo/del.do?seq=' + seq;
	}
	
	baguetteBox.run('.tz-gallery');
	
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.49804838498247, 127.03198091216792), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var imageSrc = '/wood/asset/rec_img/marker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(32, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.49804838498247, 127.03198091216792); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var content = '<div class="customoverlay">' +
	    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
	    '    <span class="title">역전식당4호점</span>' +
	    '  </a>' +
	    '</div>';
	
	// 커스텀 오버레이가 표시될 위치입니다 
	var position = new kakao.maps.LatLng(37.49804838498247, 127.03198091216792);  
	
	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    map: map,
	    position: position,
	    content: content,
	    yAnchor: 1 
	});
	
	
	
</script>
</body>
</html>










