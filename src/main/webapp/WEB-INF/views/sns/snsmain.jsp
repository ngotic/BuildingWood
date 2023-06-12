<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 게시판</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style data-tag="reset-style-sheet">
 html {  line-height: 1.15;}body {  margin: 0;}
 * {  box-sizing: border-box;  border-width: 0; border-style: solid;}
 p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption 
 {  margin: 0;  padding: 0;}button {  background-color: transparent;}
 button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}
 button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] 
 {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner 
 {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus 
 {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}
 html { scroll-behavior: smooth  }
</style>
<style data-tag="default-style-sheet">
	.heart.material-symbols-outlined{
	    color: tomato;
	    font-weight:bold;
	}
	.bubble.material-symbols-outlined{
	    color: black;
	    font-weight:bold;
	}
	.heart.material-symbols-outlined:hover, .heart.material-symbols-rounded:hover{
		font-size:30px;
	}
	
	.bubble.material-symbols-outlined{
	    color: tomato;
	}
	.bubble.material-symbols-outlined:hover{
		font-size:30px;
	}
	.bubble.material-symbols-outlined{
    color: tomato;
	}
	#dropdownMenuButton1{
		color:black;
	}
	#dropdownMenuButton1:hover{
		border-radius:15px;
		background-color:rgb(219,219,219);
	}
</style>	
<link href="asset/snscss/snsboxSizing.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/snsMarker.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/snsModal.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/SnsMainContent.css" rel="stylesheet" type="text/css">

</head>
<body style= "scroll:no;">
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<div style="text-align:center;">
		<!-- <h1>지역 SNS <small>메인</small></h1> -->
		</div>
		<div class="wrap">
			<div id="content">
				<div id="cheader" >
					<div class="box" id="dlist">
						<div class="ditem" style="display:flex; cursor:pointer;">
							<select id = "ddong" onchange="dongchange();">
								<c:forEach items="${dlist}" var="dto">
									<c:if test="${dto.dong == udong}">
										<option value="${dto.dong}" data-ddong="${dto.dong}" selected>${dto.dong}</option>
									</c:if>
									<c:if test="${dto.dong != udong}">
										<option value="${dto.dong}" data-ddong="${dto.dong}">${dto.dong}</option>
									</c:if>
								</c:forEach>	
							</select>
						</div>
					</div>
				<div class="box" id="buildingname">
					<select id="blist" onchange="change();">
						<c:forEach items="${blist }" var="dto">
							<option class="bitem" style="display:flex; cursor:pointer;" value = "${dto.dong}" data-bdong="${dto.dong}" data-lat="${dto.lat}" data-lng="${dto.lng}" data-address ="${dto.address}" data-buildingseq="${dto.buildingseq}">
								${dto.name }
							</option>
						</c:forEach>
					</select>
				</div>
				<c:if test="${ubuildingseq==buildingseq}">
					<div class="box" style="position:absolute; right:0px;"><button type="button" id="addsnscontent" class="btn btn-light">접기</button></div>
				</c:if>
				</div>
				<div id="board">
					<!--로드 할 게시물들  -->
					<div id="boardwrap" style="max-height:8500px;">
						<c:if test="${ubuildingseq==buildingseq}">
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
									<textarea id="add_useritem" name="add_useritem" ></textarea>
									<div class="image-container">
									  <div class="row">
									    <div class="coll">
										    <label for="addpic1" id="label_addpic" style="text-align:center; vertical-align:middle; width:210px; height:140px; overflow:hidden;">
													<img style="max-width:210px; max-height:140px;" id="preview-image1" src="/wood/asset/sns/free-icon-photo-album-6103474.png">
											</label>
										    <input type="file" id="addpic1" name="addpic1" style="display:none"/>
									    </div>
									    <div class="coll">
									      	 <label for="addpic2" id="label_addpic" style="text-align:center; vertical-align:middle; width:210px; height:140px; overflow:hidden;">
													<img style="max-width:210px; max-height:140px;" id="preview-image2" src="/wood/asset/sns/free-icon-photo-album-6103474.png">
											</label>
										    <input type="file" id="addpic2" name="addpic2" style="display:none"/>
									    </div>
									  </div>
									</div>
									<button type="submit" class="add btn btn-secondary"> 등록하기</button>
								</div>
							</div>
						</form>
						</c:if>
						<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="boardcontent" id="boardcontent${status.count}" style="position:relative;">
							<div id="usericon" style="display:inline-block; width:50px; height:400px; margin-right:5px;">
								<!-- 유저 이미지 넣기  -->
								<img alt="" src="/wood/asset/sns/${dto.profile}" style="width:50px;">
							</div>
							<div id="usercontent">
								<div id="userid" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-snsboardseq="${dto.snsboardseq}" data-content="${dto.content}" data-clike="${dto.clike }" data-profile="${dto.profile}" data-nickname="${dto.nickname}" data-cpic="${dto.cpic}" data-index="${status.index}" style="background:transparent;border:none;">
									${dto.nickname}
								</div>
								<div id="useritem" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-snsboardseq="${dto.snsboardseq}" data-content="${dto.content}" data-clike="${dto.clike }" data-profile="${dto.profile}" data-nickname="${dto.nickname}" data-cpic="${dto.cpic}" data-index="${status.index}" style="background:transparent;border:none;">
									${dto.content}
								</div>
								<div class="imagebox" data-count="${dto.cpic}" id="send_modal">
								    <ul class="slides" id="slide${status.count}" style="width:calc(${dto.cpic} * 450px)"> 
								   		<c:forEach items="${plist}" var="pic">
							   			<c:if test="${dto.snsboardseq==pic.snsboardseq}">
								     		<li style="display: flex; justify-content: center; width:450px;height:300px;" onclick="event.stopPropagation()"><img alt="" src="/wood/asset/sns/${pic.pic}" style="max-width:450px;max-height:300px;"></li>
								     	</c:if>
								     	</c:forEach>
								    </ul>  
								    <p class="controller">
								      
								      <!-- &lang: 왼쪽 방향 화살표
								      &rang: 오른쪽 방향 화살표 -->
								      <c:if test="${dto.cpic ne \"1\"}">
								      <span class="prev" data-num="${status.count}">&lang;</span>  
								      <span class="next" data-num="${status.count}">&rang;</span>
										</c:if>								    
								    </p>
								  </div>
						       	
						       	<div id="to_modal_commentlist" style="display:none;">
							       	<c:forEach items="${commentlist}" var="clist">
							       		<c:if test="${clist.snsboardseq==dto.snsboardseq}">
						     				<div class="modal_commentbox" >
						     					<div class="u_imagebox box">
						     						<img alt="" src="/wood/asset/sns/${clist.profile}" class="comment_userimage">
							     				</div>
							     				<div class="modal_usernick" style="width:120px;">
													<div class="box top modal_commentnick">
														${clist.nickname}
													</div>
													<div>
														<button class="to_comment" value="${clist.nickname}">답글 달기</button>
													</div>
												</div>
												<div class="modal_comment top" style="margin-left:10px;">
													${clist.content}
												</div>
						     				</div>
					     				</c:if>
		     						</c:forEach>
								</div>
								
								<div id="react">
									<c:if test="${not likelist.contains(dto.snsboardseq)}">
										<div class="like" data-index="${status.count}"data-likesnsboardseq="${dto.snsboardseq }">
											<span class="heart material-symbols-outlined">
												favorite
											</span>
										</div>
									</c:if>
									<c:if test="${likelist.contains(dto.snsboardseq)}">
										<div class="like" data-index="${status.count}"data-likesnsboardseq="${dto.snsboardseq}">
											<span class="heart material-symbols-rounded">
												favorite
											</span>
										</div> 
									</c:if>
									<div id="comment">
										 <button class="bubble material-symbols-outlined" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-snsboardseq="${dto.snsboardseq}" data-content="${dto.content}" data-clike="${dto.clike }" data-profile="${dto.profile}" data-nickname="${dto.nickname}" data-cpic="${dto.cpic}" data-index="${status.index}">
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
			<c:if test="${hidemapbox eq 'f'}">
			<div style="width:50%;">
				<div style="text-align:right;">
					<button id="hidemap"  type="submit" class="btn btn-outline-success" onclick="hidemap();">맵 숨기기</button>
				</div>
				<div id="map" style="width:600px;"></div>
			</div>
			</c:if>
			<c:if test="${hidemapbox eq 't'}">
			<div style="width:50%;">
				<div style="text-align:right;">
					<button id="hidemap"  type="submit" class="btn btn-outline-success" onclick="hidemap();">맵 보이기</button>
				</div>
				<div id="map" style="width:600px;"></div>
			</div>
			</c:if>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
		
	
	
	
	<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content" style="border-radius: 0;">
      <div class="modal-header" style="border-bottom: none;">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="headershow();"></button>
      </div>
      <div class="modal-body" style="padding: 5px 5px; ">
     	
     	<table>
     		<tr>
     			<!-- 이미지  -->
     			<td rowspan='4' style="width:600px; height:700px; display:relative;">
     				<div class="modal_imagebox" id="modal_imagebox"></div>
     			</td>
     			<!-- 오른쪽  -->
     			<td  style="width:550px;height:50px; border-bottom: 3px solid rgba(219,219,219,0.5);vertical-align: top; " >
     				<div class="box forbox" >
     				<div class="u_imagebox box" id="u_imagebox">
     					<img alt="" src="/wood/asset/sns/pic.png" class="comment_userimage">
     				</div>
     				<div id="modal_usernick" style="width:120px;"></div>
					<div class="modal_comment" id="modal_content"style="margin-left:10px;vertical-align:middle;"></div>
					<div class="box">
					<div class="dropdown" id = "fordelete">
					   <span class="material-symbols-outlined" class="btn btn-secondary dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						more_vert
						</span>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" id="btndelete" class="btndelete">삭제하기</a></li>
					  </ul>
					</div>
					</div>
     				</div>
     			</td>
     		</tr>
     		<tr style="height:500px; border-bottom: 3px solid rgb(219,219,219);">
     			<!-- 댓글  -->
	   			<td>
	     			<div id="modal_scroll" style="vertical-align:top; height:500px; overflow-y:scroll;">
	     				<!-- 댓글  -->
	     				
	     			</div>
	   			</td>
     		</tr>
     		<tr>
     			<td style="height:50px;">
     				<div id="modal_react">
     					<div id="like">
     					<!-- 모달 react  -->
     					</div>
					</div>
     			</td>
     		</tr>	
     		<tr>
     			<td style="border-bottom: 3px solid rgb(219,219,219);">
     				<form>
     					<input name="w_modal_comment" id="w_modal_comment" type="text" value="" style="margn-left:20px;width:400px;font-size:12px;">
     					<div style="float:right; margin-top:5px;"><button id="btnadd" type="button" style="font-size:12px;">게시하기</button></div>
     				</form>
     			</td>
     		</tr>
     		
     	</table>
     	
     	
     	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="headershow();">Close</button>
      </div>
    </div>
  </div>
</div>




<script type="	text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
<script>


	
	
	let hidemapbox="${hidemapbox}";
	function hidemap(){
		if(hidemapbox=='f'){
			$('#map').css("transition-duration","2s");
   			$('#content').css("transition-duration","2s");
			$('#map').css("transform","translate(1000px,0)");
			$('#content').css("transform","translate(300px,0)");
			
			$('#hidemap').html('맵 보이기');
			hidemapbox='t'
		}
		else{
			$('#map').css("transition-duration","2s");
   			$('#content').css("transition-duration","2s");
			$('#map').css("transform","translate(0,0)"); 
			$('#content').css("transform","translate(0,0)"); 
			$('#hidemap').html('맵 숨기기');
			hidemapbox= 'f';
		}
	}
	
	$('#blist').children().eq(${selected}).attr("selected",true);
	
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
	//addsnscontent
	

	//forkakao
 /* 	var content = '<div class="overlaybox">' +
    '    <div class="boxtitle">${buildinginfo.name}</div>' +
    '    <div class="first">' +
    '        <div class="movietitle text">${buildinginfo.name}</div>' +
    '    </div>' +
    '</div>';  */

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${buildinginfo.lat}, ${buildinginfo.lng}), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도),
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	let m  = null;
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${buildinginfo.lat}, ${buildinginfo.lng}); 
	var imageSrc = '/wood/asset/sns/free-icon-buildings-2084178.png'; // 마커이미지의 주소입니다 
	var imageSize = new kakao.maps.Size(50, 50); // 마커이미지의 크기입니다
	var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);	
	const ms=[];
	$(document).off().ready(function(){
		<c:forEach items="${blist}" var="dto" varStatus="status">
		content${status.count}='<div class="overlaybox">' +
	    '    <div class="boxtitle">${dto.name}</div>' +
	    '    <div class="first" style="background: url(\'/wood/asset/sns/${dto.name}.jpg\') no-repeat center;position:relative;width:157px;height:160px;margin-left:5px;margin-bottom:8px;background-size: cover;" >' +
	    '        <div class="movietitle text">${dto.name}</div>' +
	    '    </div>' +
	    '</div>'; 
		let p${status.count} = new kakao.maps.LatLng(${dto.lat},${dto.lng});
		
		let m${status.count} = new kakao.maps.Marker({
			position: p${status.count},
			image: markerImage
		});
		var customOverlay${status.count}=new kakao.maps.CustomOverlay({
		    position : p${status.count},
		    content : content${status.count},
		    xAnchor: 0.35,
		    yAnchor: 1.15
		});
		
		kakao.maps.event.addListener(m${status.count}, 'click', function(mouseEvent) {        
			location.href = '/wood/snsmain.do?buildingseq=${status.count}';
		});
		kakao.maps.event.addListener(m${status.count}, 'mouseover', function() {   
			customOverlay${status.count}.setMap(map);
		});
		kakao.maps.event.addListener(m${status.count}, 'mouseout', function() {      
			customOverlay${status.count}.setMap(null);     
		});
		
		m${status.count}.setMap(map);
		
		ms.push(m${status.count});
		$('#list td').css('background-color','transparent');
		$(this).css('background-color','gold');
		
		</c:forEach>
	});
	 
	
	
	function change(){
		
		
		 $.ajax({
	            url:"/wood/snsmain.do",
	            type: "get", // GET 방식
	            data:{buildingseq:$('#blist option:selected').data('buildingseq'),
	            	hidemapbox:hidemapbox
	            	},// json 방식으로 서블릿에 보낼 데이터
	            success:function(data){
	            	location.href='/wood/snsmain.do?buildingseq='+$('#blist option:selected').data('buildingseq')+'&hidemapbox='+hidemapbox;
	            },
	            error:function(){
	            }
	            
	        });
		 
	
		};
		//change

	//슬라이드 이벤트
	let currentIdx = [];
	let picscount = [];
	let heart = [];
	
	
	var user = 0;
	var contentlength=$("#boardwrap").children().length;
	if(${ubuildingseq==buildingseq}){
		user=1;
		heart.push(0);
	};
	for (i= user; i < contentlength; i++) {
		currentIdx.push(1);
		picscount.push($(`#slide${i}`).parent().data("count"));
		heart.push(0);
	};
	
	$('.prev').on('click', function () {
		picscount[parseInt(parseInt($(this).data('num'))) - 1] = $(this).parent().parent().data("count");
		
		if(currentIdx[parseInt($(this).data('num')) - 1]==1){
			currentIdx[parseInt($(this).data('num')) - 1]=1;
		}
		else{
		  $(this).parent().parent().children().css("left",$(this).parent().parent().children().position().left + 450);
		  currentIdx[parseInt($(this).data('num')) - 1]--;
		}
	});
	
	$('.next').on('click', function () {
		
		picscount[parseInt($(this).data('num')) - 1] = $(this).parent().parent().data("count");
		
		if(currentIdx[parseInt($(this).data('num')) - 1]>=picscount[parseInt($(this).data('num')) - 1]){
			currentIdx[parseInt($(this).data('num')) - 1]==picscount[parseInt($(this).data('num')) - 1];
		}
		else{
		  $(this).parent().parent().children().css("left",$(this).parent().parent().children().position().left - 450);
		  currentIdx[parseInt($(this).data('num')) - 1]++;
		}
	});
	
	//좋아요 처리 
	 $(".like").off().on('click',function(){
		 var heartseq = 1;
		 var index = parseInt($(this).data('index')-1);
		 var likesnsboardseq = $(this).data('likesnsboardseq');
		 if(user==1){
			 var tofill = $('#boardwrap').children().eq(index+1).find('.like').html();
			 var toblank = $('#boardwrap').children().eq(index+1).find('.like').html();
			 tofill=tofill.replaceAll("outlined","rounded");
			 toblank=toblank.replaceAll("rounded","outlined");
			 if(heart[index]==0){
				 $('#boardwrap').children().eq(index+1).find('.like').html(tofill);
	   				heart[index]=1;
	   			 $.ajax({
		  	            url:"/wood/snsmain.do",
		  	            type: "post", // post 방식
		  	            data:{
		  	            	type:"2",
		  	            	likesnsboardseq:likesnsboardseq},
	  	            	success:function(data){
	  	            		console.log('success');
		  	            },
		  	            error:function(){
		  	            	console.log('failed');
		  	            }
		  	        });
				 
	   				
			 }else{
				 $('#boardwrap').children().eq(index+1).find('.like').html(toblank);
	 				heart[index]=0;
	 				 $.ajax({
			  	            url:"/wood/snsmain.do",
			  	            type: "post", // post 방식
			  	            data:{
			  	            	type:"3",
			  	            	likesnsboardseq:likesnsboardseq},
		  	            	success:function(data){
			 	                console.log("succss");
			 	               
			  	            },
			  	            error:function(){
			  	                console.log("error");
			  	            }
			  	        });
			 }
		 }
		 else{
			 var tofill = $('#boardwrap').children().eq(index).find('.like').html();
			 var toblank = $('#boardwrap').children().eq(index).find('.like').html();
			 tofill=tofill.replaceAll("outlined","rounded");
			 toblank=toblank.replaceAll("rounded","outlined");
			 if(heart[index]==0){
				 $('#boardwrap').children().eq(index).find('.like').html(tofill);
					heart[index]=1;
					 $.ajax({
			  	            url:"/wood/snsmain.do",
			  	            type: "post", // post 방식
			  	            data:{
			  	            	type:"2",
			  	            	like:"1", 
			  	            	likesnsboardseq:likesnsboardseq},
		  	            	success:function(data){
			 	                console.log("succss");
			 	               
			  	            },
			  	            error:function(){
			  	                console.log("error");
			  	            }
			  	        });
					 
					
			 }else{
				 $('#boardwrap').children().eq(index).find('.like').html(toblank);
					heart[index]=0;
					
					 $.ajax({
			  	            url:"/wood/snsmain.do",
			  	            type: "post", // post 방식
			  	            data:{
			  	            	type:"3",
			  	            	like:"1", 
			  	            	likesnsboardseq:likesnsboardseq},
		  	            	success:function(data){
			 	                console.log("succss");
			 	               
			  	            },
			  	            error:function(){
			  	                console.log("error");
			  	            }
			  	        });
					 
			 }
		 }
 	 });

	
	 function headershow(){
			$("#header").css('opacity','1');	
			
		 };
		
	    	
   	$(document).off().ready(function() {
   		if(hidemapbox=='t'){
   			$('#map').css("transition-duration","0s");
   			$('#content').css("transition-duration","0s");
			$('#map').css("transform","translate(1000px,0)");
			$('#content').css("transform","translate(300px,0)");
			
			$('#hidemap').html('맵 보이기');
			hidemapbox='t'
		}
		else{
			$('#content').fadeIn(3000);
			$('#map').css("transform","translate(0,0)"); 
			$('#content').css("transform","translate(0,0)"); 
			$('#hidemap').html('맵 숨기기');
			hidemapbox= 'f';
		}
   		//모달 생성 시 
       	$('#staticBackdrop').off().on('show.bs.modal', function(event) {       
    	 $('#header').css("opacity","0.5");
    	
       	var Idx =1; //현재 슬라이드 index
       	const snsboardseq=$(event.relatedTarget).data('snsboardseq');
       	const index= 1+$(event.relatedTarget).data('index');
       	const modal_content=$(event.relatedTarget).data('content');
        const clike=$(event.relatedTarget).data('clike');
        const profile="/wood/asset/sns/"+$(event.relatedTarget).data('profile');
        const nickname=$(event.relatedTarget).data('nickname');
        const cpic=$(event.relatedTarget).data('cpic');
        
        $("#modal_usernick").text(nickname);
        $("#u_imagebox").html("<img alt="+"\"\" src=\""+profile+"\"class=\"comment_userimage\">");
        $("#modal_content").text(modal_content);
        
        let str= $("#boardwrap").children().eq(index).find("#send_modal").html();
        let commented = $("#boardwrap").children().eq(index).find("#to_modal_commentlist").html()
        let like = $("#boardwrap").children().eq(index).find(".like").html()
        
       
        
        if(${ubuildingseq!=buildingseq}){
        	str= $("#boardwrap").children().eq(index-1).find("#send_modal").html();
        	commented = $("#boardwrap").children().eq(index-1).find("#to_modal_commentlist").html()
        	like = $("#boardwrap").children().eq(index-1).find(".like").html()
        }
        
        
        
        str=str.substring();
        commented=commented.substring();
        console.log(commented);
        like = like.substring();
        str=str.replaceAll('450px','600px');
        str=str.replaceAll('300px','600px');
        str=str.replaceAll('max-height:600px','max-height:400px');
        str=str.replaceAll('class=\"','class=\"m');
        str=str.replaceAll('left: -900px;','');
        str=str.replaceAll('left: -600px;','');
        str=str.replaceAll('left: -300px;','');
        str=str.replaceAll('calc(1350px);','calc(1800px);');
        str=str.replaceAll('calc(900px);','calc(1200px);');
        str=str.replaceAll('calc(450px);','calc(600px);');
        
        
        
        commented= commented.replaceAll('style=\"display:none;\"','');
        like = like.replaceAll('ed\"','ed\" style=\"font-size:40px; margin-left:15px;\"')
        $('#modal_scroll').html(commented);
        
        $("#modal_imagebox").html(str); 
        $("#like").html(like);
        
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
    	
    	//modallike
    	$("#like").off().on('click',function(){
    		var mtblike='';
    		 var tofill = $('#like').html();
			 var toblank =  $('#like').html();
			 tofill=tofill.replaceAll("outlined","rounded");
			 toblank=toblank.replaceAll("rounded","outlined");
			 if(like.includes('rounded')==true){
				 $('#like').html(toblank);
				 like=like.replaceAll("rounded","outlined");
				  mtblike=like.replaceAll('ed\" style=\"font-size:40px; margin-left:15px;\"','ed\"style="font-size:24px; margin-left:1px;"');
				 if(${ubuildingseq!=buildingseq}){
		        	$("#boardwrap").children().eq(index-1).find(".like").html(mtblike);
		        	$.ajax({
		  	            url:"/wood/snsmain.do",
		  	            type: "post", // post 방식
		  	            data:{
		  	            	type:"3",
		  	            	likesnsboardseq:$("#boardwrap").children().eq(index-1).find(".like").data("likesnsboardseq")},
	  	            	success:function(data){
		 	                console.log("succss");
		 	               
		  	            },
		  	            error:function(){
		  	                console.log("error");
		  	            }
		  	        });
		        	
		         }
				 else{
				 	$("#boardwrap").children().eq(index).find(".like").html(mtblike);
				 	$.ajax({
		  	            url:"/wood/snsmain.do",
		  	            type: "post", // post 방식
		  	            data:{
		  	            	type:"3",
		  	            	likesnsboardseq:$("#boardwrap").children().eq(index).find(".like").data("likesnsboardseq")},
	  	            	success:function(data){
		 	                console.log("succss");
		 	               
		  	            },
		  	            error:function(){
		  	                console.log("error");
		  	            }
		  	        });
			 	 }
				 
			 }else{
				 $('#like').html(tofill);
				 like=like.replaceAll("outlined","rounded");
				  mtblike=like.replaceAll('ed\" style=\"font-size:40px; margin-left:15px;\"','ed\"style="font-size:24px; margin-left:1px;"');
				  console.log($("#boardwrap").children().eq(index-1).find(".like").data("likesnsboardseq"));
				 if(${ubuildingseq!=buildingseq}){
	        		$("#boardwrap").children().eq(index-1).find(".like").html(mtblike);
	        		$.ajax({
		  	            url:"/wood/snsmain.do",
		  	            type: "post", // post 방식
		  	            data:{
		  	            	type:"2",
		  	            	likesnsboardseq:$("#boardwrap").children().eq(index-1).find(".like").data("likesnsboardseq")},
	  	            	success:function(data){
		 	                console.log("succss");
		 	               
		  	            },
		  	            error:function(){
		  	                console.log("error");
		  	            }
		  	        });
	        		
			     }
				 else{
				 	$("#boardwrap").children().eq(index).find(".like").html(mtblike);
				 	$.ajax({
		  	            url:"/wood/snsmain.do",
		  	            type: "post", // post 방식
		  	            data:{
		  	            	type:"2",
		  	            	likesnsboardseq:$("#boardwrap").children().eq(index).find(".like").data("likesnsboardseq")},
	  	            	success:function(data){
		 	                console.log("succss");
		 	               
		  	            },
		  	            error:function(){
		  	                console.log("error");
		  	            }
		  	        });
				 }
			 }
			
    	});
    	
    	 $("#btndelete").off().on("click", function(){
    		 if(user==1){
	    		 $.ajax({
	   	            url:"/wood/snsmain.do",
	   	            type: "post", // post 방식
	   	            data:{
	   	            	type:"4",
	   	            	delsnsboardseq:snsboardseq} ,
	 	            	success:function(data){
	  	                console.log("success");
	  	               // 팝업 호출 url
	  	               var url = 'http://localhost:8090/wood/snsmain.do?buildingseq='+$('#blist option:selected').data('buildingseq')+'&hidemapbox='+hidemapbox;
	  	               // 팝업 호출
	  	              location.href=url;
	   	            },
	   	            error:function(){
	   	                console.log("error");
	   	            }
	   	        });
    		 }
 		});
    	
    	$(".to_comment").on("click",function(){
    		$("#w_modal_comment").val('@'+this.value+" ");
    		$("#w_modal_comment").focus();
    	});
    	
   	 	$('#btnadd').off().on("click",function addcomment(){
     		$.ajax({
  	            url:"/wood/snsmain.do",
  	            type: "post", // post 방식
  	            data:{
  	            	type:"1",
  	            	snsboardseq:snsboardseq, 
  	            	comment:$('#w_modal_comment').val()},// json 방식으로 서블릿에 보낼 데이터
	            	success:function(data){
 	                console.log(
					`<div id="to_modal_commentlist" style="display:none;">` +
							       	`<c:forEach items="${commentlist}" var="clist">`+
							       		`<c:if test="${clist.snsboardseq==dto.snsboardseq}">`+
						     				`<div class="modal_commentbox" >`+
						     					`<div class="u_imagebox box">`+
						     						`<img alt="" src="/wood/asset/sns/${clist.profile}" class="comment_userimage">`+
							     				`</div>`+
							     				`<div class="modal_usernick" style="width:120px;">`+
													`<div class="box top modal_commentnick">`+
														`${clist.nickname}`+
												`	</div>`+
													`<div>`+
														`<button class="to_comment" value="${clist.nickname}">답글 달기</button>`+
													`</div>`+
												`</div>`+
												`<div class="modal_comment top" style="margin-left:10px;">`+
													`${clist.content}`+
												`</div>`+
						     				`</div>`+
					     				`</c:if>`+
		     						`</c:forEach>`+
								`</div>`		
 	                
 	                );
 	                
 	                
 	                
 	               // 팝업 호출 url
 	              var url = 'http://localhost:8090/wood/snsmain.do?buildingseq='+$('#blist option:selected').data('buildingseq')+'&hidemapbox='+hidemapbox;
 	               // 팝업 호출
 	               
 	              location.href=url;
 	               
  	            },
  	            error:function(){
  	                console.log("error");
  	            }
  	        });
     	});
   	
       });
       	
     });//document.ready끝
    
   	
   	//파일 용량 제한
    $("#addpic1").off().on("change", function(){

		if (this.files && this.files[0]) {

			var maxSize = 10 * 1024 * 1024;
			var fileSize = this.files[0].size;

			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$(this).val('');
				return false;
			}
		}
	});
    $("#addpic2").off().on("change", function(){

		if (this.files && this.files[0]) {

			var maxSize = 10 * 1024 * 1024;
			var fileSize = this.files[0].size;

			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$(this).val('');
				return false;
			}
		}
	});

	 $("#addpic1").on("change", function(event) {
		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {
		    	$("#addpic1").parent().css("outline","none");
		        $("#preview-image1").attr("src", e.target.result);
		        $("#preview-image1").css("border","3px solid gray"); 
		    }

		    reader.readAsDataURL(file);
	});
	 $("#addpic2").on("change", function(event) {
		    var file = event.target.files[0];
				
		    var reader = new FileReader(); 
		    reader.onload = function(e) {
		    	$("#addpic2").parent().css("outline","none");
		         // 이미지 객체의 로드가 완료되면 실행될 콜백 함수를 정의합니다.
		        $("#preview-image2").attr("src", e.target.result);
		        $("#preview-image2").css("border","3px solid gray"); 
		    }

		    reader.readAsDataURL(file);
	});
	 
		
</script>


</body>
</html>