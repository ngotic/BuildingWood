<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >

<%@ include file="/WEB-INF/views/include/asset.jsp" %>
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
    .header-area {
    	z-index: 2;
    }
   .frame-group1222 {
	  top: 162px;
	  /* left: 156px; */
	  width: 194px;
	  height: 43px;
	  display: flex;
	  align-items: flex-start;
	  flex-shrink: 1;
	  border-color: #cccccc;
	  border-width: 0.5px;
	  border-radius: 30px;
	  background-color: rgba(255, 255, 255, 1);
	  margin-top: 8px;
	}
	.frame-mappin {
	  top: 8px;
	  left: 30px;
	  width: 26px;
	  height: 28px;
	  display: flex;
	  align-items: flex-start;
	  flex-shrink: 1;
	  position: relative;
	}
	.frame-text15 {
	  top: 9px;
	  left: 36px;
	  color: rgba(255, 95, 95, 1);
	  height: auto;
	  font-size: 17px;
	  font-style: Medium;
	  text-align: left;
	  font-family: Inter;
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	  position: relative;
	  font-family: 'Pretendard-Regular';
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
   span.material-symbols-outlined {
    margin-top: 1px;
    color: tomato;
   }
   .frame-text15 > span {
   color: tomato;
   }
   #container-loc {
   height: 130px;
   max-width: auto;
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
   
   .menu-row {
   	margin:10px;
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
      margin: 8px 30px 0px 0;
   }
   
   #list {
      width: 400px;
      margin-top: 0;
   }
   
   #rec-comment {
   width: 775px;
    display: inline-block;
    font-family: 'Pretendard-Regular';
   }
   #rec-comment-arrow {
   margin:5px 3px 0 0;
   }
   .btn-add1 {
    height: 61px;
    position: absolute;
    left: 789px;
    top: 61px;
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #DEE2E6;
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
   .rec-content {
    margin: 5px 8px 35px 10px;
    text-align: justify;
    font-family: 'Pretendard-Regular';
    font-size: 15px;
    letter-spacing: 0px;
    line-height: 19px;
   }
   .rec-content-score {
   	margin: 5px 8px 10px 10px;
   	color: gold;
   }
   .rec-content-score span {
   color: #CCC;
   }
   #rec-comment-list {
   	margin-bottom: 0rem !important;
   	padding-left: 10px;
   }
   .rounded-circle {
   width:40px;
   }   
   .fw-bold { 
   font-weight: 600!important;
    font-size: 15px;
    display: flex;
    flex-direction: row;
    align-content: center;
    /* justify-content: space-evenly; */
    /* align-items: center; */
    align-items: baseline;
    font-family: 'Pretendard';
   }
   .flex-shrink-0 {
   	flex-shrink: 0!important;
    padding-top: 3px;
   }
   .rec-date {
   	font-size:13px;
   	color: #aaa;
   }
   .ms-3 {
   }
   
   
   .map-all {
   height: 40px;
   }
   .map-all span {
   color: gold;
   }
   .map-menu {
   height: 22px;
   }
   .map-head {
   width:66px;
   color: tomato;
   padding: 10px 0;
   }
   #btn-ori {
    width: 880px;
    text-align: left;
    margin: 0 auto;
    margin-bottom: 50px;
    font-family: 'Pretendard-Regular';
   }
   #btn-ori .btn:nth-child(2) {
    margin-left: 15px;
   }
   #ori-icon1 {
	font-size: 20px;
    /* margin-top: 3px; */
   
   }
   #ori-icon2 {
	font-size: 20px;
    margin-top: 3px;
   
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
	#next-button {
		left:1350px !important;
	}
	#close-button {
		left:20px !important;
		top: 20px !important;
	}
	
	
	/* 별점추가 */
	#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	    margin-left: 6px;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 2em;
	    color: transparent;
	    text-shadow: 0 0 0 #DDD;
	    transition: text-shadow 0.2s linear;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 gold;
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 gold;
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 gold;
	}
	.text-bold {
		font-size: 15px;
		color: #888;
	}
	
	
	/* 댓글 수정 */
	.edit-comment textarea {
		width: 800px;
		height: 80px;
	    font-size: 14px;
	    font-family: 'Pretendard-Regular';
	    margin: 10px;
	    padding: 10px 14px;
	}
	#editCommentForm {
		margin-left: 20px;
	}
	#delCommentForm {
		margin-left: 7px;
	}
	.Reccomment-btn {
		font-size:15px;
		border-radius: 41px;
	}
	.Reccomment-btn > span {
	}
	.Reccommend-nick {
		margin-bottom: 8px;
	}
	#editcomment {
		padding: 20px;
	    border: 0.5px solid #ccc;
	    margin: 10px;
	}
	
	

.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: tomato url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
           <span class="frame-text15"><span><%= (String)session.getAttribute("location") %></span></span>
         </div>
   </section>
         
         
         
    <div id="main">
      <div id="map">지도</div>
      <table id="list">
      
      <!-- 지도 -->
      	 <tr>
			<td style="display:flex; cursor:pointer;" data-lat="${dto.lat}" data-lng="${dto.lng}" class="item"></td>
		 </tr>
      
      
         <tr>
         	<td class="map-head">가게명</td>
            <td class="map-all">${dto.title}</td>
         </tr>
         <tr>
         	<td class="map-head">별점</td>
            <td class="map-all"><span>★</span>${dto.avgscore}</td>
         </tr>
         <tr>
         	<td class="map-head">한줄평</td>
            <td class="map-all">${dto.content}</td>
         </tr>
         <tr>
         	<td class="map-head menu-row" rowspan="${mcountdto.mcnt}">메뉴</td>
         </tr>
         <c:forEach items="${mlist}" var="mdto">
         <tr>
            <td class="map-menu">${mdto.menu} - <fmt:formatNumber value="${mdto.price}"/>원</td>
         </tr>
         </c:forEach>
         <tr>
         	<td class="map-head">주소</td>
            <td class="map-all">${dto.fulladdress}</td>
         </tr>
         <tr>
         	<td class="map-head"> </td>
            <td class="map-gallary">
            
				<div class="tz-gallery">
			        <div class="row">
						
						<c:forEach items="${ilist}" var="idto">
			            <div class="col-sm-6 col-md-4">
			                <a class="lightbox" href="/wood/asset/rec_img/${idto.pic}">
			                    <img src="/wood/asset/rec_img/${idto.pic}" alt="img1">
			                </a>
			            </div>
			            </c:forEach>
			            
			           <%-- 사진 없을 때
			           <c:forEach items="${ilist}" var="idto">
                        <div class="col-sm-6 col-md-4">
                            <a class="lightbox" href="/wood/asset/rec_img/${idto.pic}">
                                <c:if test="${empty idto.pic}">
                                    <img src="/path/to/placeholder/image" alt="사진이 존재하지 않습니다.">
                                    <p>사진이 존재하지 않습니다.</p>
                                </c:if>
                                <c:if test="${not empty idto.pic}">
                                    <img src="/wood/asset/rec_img/${idto.pic}" alt="img1">
                                </c:if>
                            </a>
                        </div>
                       </c:forEach> --%>
			        </div>
			    </div>
			    
			    
            </td>
         </tr>
         <!-- 이미지 -->
      </table>
   </div>

         <div id="btn-ori">
	         <button type="button" class="btn btn-outline-secondary btn-sm"  onclick="setBounds()"><span class="material-symbols-outlined" id="ori-icon1">my_location</span>지도 범위 재설정 하기
    	     <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/wood/recommend/recommend.do';"><span class="material-symbols-outlined" id="ori-icon2">format_list_bulleted</span>목록보기</button>
         </button></div>
         
      <!-- 댓글 -->
      <section class="mb-5">
          <div class="card bg-light" style="border-color: #eee">
          
              <div class="card-body">
                  <!-- 댓글 작성 -->
                  
                  <form class="mb-4" id="rec-comment" method="POST" action="/wood/recommend/reccomment.do">
	                  <div class="mb-2" id="myform">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span>
							<input type="radio" name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3" checked><label
								for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
					 </div>
                  
	                <textarea class="form-control" name="comment" rows="2" placeholder="가게 평가를 남겨주세요!" spellcheck="false" required></textarea>
	                <input type="submit" value="등록" name="comment" id="btn btn-add" class="btn-add1" style="margin:0 0 5px 10px; width:70px">
                  	
                  	<input type="hidden" name="recommendseq" value="${dto.recommendseq}">
					<input type="hidden" name="restaurantseq" value="${dto.restaurantseq}">
					<input type="hidden" name="column" value="${column}">
					<input type="hidden" name="word" value="${word}">
					<input type="hidden" name="search" value="${search}">
                  </form>
                  
                  
            <!-- 댓글 목록 -->
			<c:forEach items="${clist}" var="cdto" varStatus="status">
                <div class="d-flex mb-4" id="rec-comment-list">
                    <!-- 일반 댓글-->
                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                    <div class="ms-3">
                        <div class="fw-bold"><span class="Reccommend-nick">${cdto.nickname}</span>
                            <c:if test="${not empty id && (id == cdto.id || lv == '0')}">
                            
                            	<!-- 수정 -->
                                <%-- <span class="material-symbols-outlined rec-comment-edit" onclick="editComment('${status.index}')">edit</span> --%>
								<form method="POST" action="/wood/recommend/reccommentedit.do" id="editCommentForm">
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModaledit${status.index}" class="Reccomment-btn"><span class="material-symbols-outlined rec-comment-del">edit</span></button>

                                    <!-- 수정 Modal -->
                                    <div class="modal fade" id="exampleModaledit${status.index}" tabindex="-1" aria-labelledby="exampleModalLabeledit${status.index}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabeledit${status.index}">댓글수정</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                 <textarea rows="15" cols="30" id="editcomment" spellcheck="false" autofocus>${cdto.content}</textarea>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success" onclick="editOkComment('${cdto.rcseq}')">Edit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="rcseq" value="${cdto.rcseq}">
                                    <input type="hidden" name="recommendseq" value="${dto.recommendseq}">
                                    <input type="hidden" name="restaurantseq" value="${dto.restaurantseq}">
                                    <input type="hidden" name="column" value="${column}">
                                    <input type="hidden" name="word" value="${word}">
                                    <input type="hidden" name="search" value="${search}">
                                    <input type="hidden" name="content">
                                </form>

								<!-- 삭제 -->
                                <form method="POST" action="/wood/recommend/reccommentdel.do" id="delCommentForm">
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}" class="Reccomment-btn"><span class="material-symbols-outlined rec-comment-del">delete</span></button>

                                    <!-- 삭제 Modal -->
                                    <div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel${status.index}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel${status.index}">댓글삭제</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">삭제하시겠습니까?</div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success" onclick="delComment('${cdto.rcseq}')">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="rcseq" value="${cdto.rcseq}">
                                    <input type="hidden" name="recommendseq" value="${dto.recommendseq}">
                                    <input type="hidden" name="restaurantseq" value="${dto.restaurantseq}">
                                    <input type="hidden" name="column" value="${column}">
                                    <input type="hidden" name="word" value="${word}">
                                    <input type="hidden" name="search" value="${search}">
                                </form>
                            </c:if>
                        </div>
                        <div class="rec-date">${cdto.writedate}</div>
                    </div>
                </div>
                <div class="rec-content-score">
                    <c:if test="${cdto.commentscore == '1'}">
                        ★<span>☆☆☆☆</span>
                    </c:if>
                    <c:if test="${cdto.commentscore == '2'}">
                        ★★<span>☆☆☆</span>
                    </c:if>
                    <c:if test="${cdto.commentscore == '3'}">
                        ★★★<span>☆☆</span>
                    </c:if>
                    <c:if test="${cdto.commentscore == '4'}">
                        ★★★★<span>☆</span>
                    </c:if>
                    <c:if test="${cdto.commentscore == '5'}">
                        ★★★★★
                    </c:if>
                </div>
               
            	<div class="rec-content">${cdto.content}</div>
                
            </c:forEach>
            
            
                          
                          <!-- Child comment 1-->
                          <!-- <div class="d-flex mt-4">
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
		                  </div> -->
                  
                  <!-- Single comment-->
                  <!-- <div class="d-flex">
                      <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                      <div class="ms-3">
                          <div class="fw-bold">Commenter Name
                          		<span class="material-symbols-outlined rec-comment-edit">edit</span>
                          		<span class="material-symbols-outlined rec-comment-edit">delete</span>
                          </div>
                          When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                      </div>
                  </div> -->
                  	  
             </div>
          </div> 
      </section><!-- mb-5 댓글 -->

      <br><br><br><br><br><br>
   
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c436ba63a01d9316c75c3b9b08e2475c"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>

<script>

	/* 댓글삭제 */
	function delComment(rcseq) {
        document.getElementById("rcseqInput").value = rcseq; // rcseq 값을 입력 필드에 설정
        $('#exampleModal').modal('show'); // 모달 창 표시
    }

	function del(recommendseq) {
		location.href='/wood/recommend/recommenddel.do?recommendseq=' + recommendseq;
	}
	
	
	/* 댓글 수정 */
	function editComment(rcseq) {
        document.getElementById("rcseqInput").value = rcseq; // rcseq 값을 입력 필드에 설정
        $('#exampleModaledit').modal('show'); // 모달 창 표시
    }

	function editOkComment(cseq) {
		$('#editCommentForm input[name=content]').val($('#editcomment').val());
		$('#editCommentForm').submit();
		
	}


	
	baguetteBox.run('.tz-gallery');
	
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var imageSrc = '/wood/asset/rec_img/marker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(32, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(${dto.lat}, ${dto.lng}); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	bounds.extend(new kakao.maps.LatLng(${dto.lat}, ${dto.lng}));
	
	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	// 클릭시 카카오맵으로 이동하는 링크
	var content = '<div class="customoverlay">' +
	    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
	    '    <span class="title">${dto.title}</span>' +
	    '  </a>' +
	    '</div>';
	
	// 커스텀 오버레이가 표시될 위치입니다 
	var position = new kakao.maps.LatLng(${dto.lat}, ${dto.lng});  
	
	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    map: map,
	    position: position,
	    content: content,
	    yAnchor: 1 
	});
	
	
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
	
	
	
	
	

	
	
	
	
	
</script>
</body>
</html>










