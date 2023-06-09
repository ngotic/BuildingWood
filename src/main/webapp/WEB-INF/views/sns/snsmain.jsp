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
	span.material-symbols-outlined {
    margin-top: 1px;
    color: tomato;
	}
	.frame-text15 > span {
	color: tomato;
	}
</style>	
<link href="asset/snscss/snsboxSizing.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/snsMarker.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/snsModal.css" rel="stylesheet" type="text/css">
<link href="asset/snscss/SnsMainContent.css" rel="stylesheet" type="text/css">

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
					<div class="box" style="position:absolute; right:0px;"><button id="addsnscontent">접기</button></div>
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
										    <label for="addpic1" id="label_addpic" style="text-align:center; vertical-align:middle; width:180px; height:120px; overflow:hidden;">
													<img style="height:120px;" id="preview-image1" src="">
											</label>
										    <input type="file" id="addpic1" name="addpic1" style="display:none"/>
									    </div>
									    <div class="coll">
									      	 <label for="addpic2" id="label_addpic" style="text-align:center; vertical-align:middle; width:180px; height:120px; overflow:hidden;">
													<img style="height:120px;" id="preview-image2" src="">
											</label>
										    <input type="file" id="addpic2" name="addpic2" style="display:none"/>
									    </div>
									  </div>
									</div>
								<button type="submit" class="add">등록하기</button>
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
							<div id="usercontent" style="position:relative;">
								<div id="userid">
									${dto.nickname}
								</div>
								<div id="useritem">
									${dto.content}
								</div>
								<div class="imagebox" data-count="${dto.cpic}" id="send_modal">
								    <ul class="slides" id="slide${status.count}" style="width:calc(${dto.cpic} * 450px)"> 
								   		<c:forEach items="${plist}" var="pic">
							   			<c:if test="${dto.snsboardseq==pic.snsboardseq}">
								     		<li><img alt="" src="/wood/asset/sns/${pic.pic}" style="width:450px;height:300px; "></li>
								     	</c:if>
								     	</c:forEach>
								    </ul>  
								    <p class="controller">
								      
								      <!-- &lang: 왼쪽 방향 화살표
								      &rang: 오른쪽 방향 화살표 -->
								      <span class="prev" data-num="${status.count}">&lang;</span>  
								      <span class="next" data-num="${status.count}">&rang;</span>
								    </p>
								  </div>
						       	
						       	<div id="to_modal_commentlist" style="display:none;">
							       	<c:forEach items="${commentlist}" var="clist">
							       		<c:if test="${clist.snsboardseq==dto.snsboardseq}">
						     				<div class="modal_commentbox" >
						     					<div class="u_imagebox box">
						     						<img alt="" src="/wood/asset/sns/${clist.profile}" class="comment_userimage">
							     				</div>
							     				<div class="modal_usernick">
													<div class="box top">
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
									<div class="like" data-index="${status.count}">
										<span class="material-symbols-outlined">
											favorite
										</span>
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
			<c:if test="${hidemapbox eq 'f'}">
			<div style="width:50%;">
				<div id="hidemap" style="text-align:right;" onclick="hidemap();">맵 숨기기</div>
				<div id="map" style="width:600px;"></div>
			</div>
			</c:if>
			<c:if test="${hidemapbox eq 't'}">
			<div style="width:50%;">
				<div id="hidemap" style="text-align:right;" onclick="hidemap();">맵 보이기</div>
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
     			<td style="width:550px;height:50px; border-bottom: 3px solid rgb(219,219,219);" >
     				<div class="u_imagebox box" id="u_imagebox">
     					<img alt="" src="/wood/asset/sns/pic.png" class="comment_userimage">
     				</div>
     				<div id="modal_usernick"></div>
					<div class="modal_comment" id="modal_content"></div>
     				
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
     					<input name="w_modal_comment" id="w_modal_comment" type="text" value="text" style="font-size:12px;">
     					<div style="float:right; margin-top:5px;"><button id="btnadd" type="button" style="font-size:12px;">게시하기</button></div>
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
	let hidemapbox="${hidemapbox}";
	console.log(hidemapbox);
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
	$(document).ready(function(){
		<c:forEach items="${blist}" var="dto" varStatus="status">
		content${status.count}='<div class="overlaybox">' +
	    '    <div class="boxtitle">${dto.name}</div>' +
	    '    <div class="first">' +
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
	                alert("error");
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
	 $(".like").on('click',function(){
		 var index = parseInt($(this).data('index')-1);
		 
		 if(user==1){
			 var tofill = $('#boardwrap').children().eq(index+1).find('.like').html();
			 var toblank = $('#boardwrap').children().eq(index+1).find('.like').html();
			 tofill=tofill.replaceAll("outlined","rounded");
			 toblank=toblank.replaceAll("rounded","outlined");
			 if(heart[index]==0){
				 $('#boardwrap').children().eq(index+1).find('.like').html(tofill);
	   				heart[index]=1;
			 }else{
				 $('#boardwrap').children().eq(index+1).find('.like').html(toblank);
	 				heart[index]=0;
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
			 }else{
				 $('#boardwrap').children().eq(index).find('.like').html(toblank);
					heart[index]=0;
			 }
		 }
 	 });
	
	

	
	    	
   	$(document).ready(function() {     
   		if(hidemapbox=='t'){
   			$('#map').css("transition-duration","1s");
   			$('#content').css("transition-duration","2s");
			$('#map').css("transform","translate(1000px,0)");
			$('#content').css("transform","translate(300px,0)");
			
			$('#hidemap').html('맵 보이기');
			hidemapbox='t'
		}
		else{
			$('#map').css("transition-duration","1s");
   			$('#content').css("transition-duration","2s");
			$('#map').css("transform","translate(0,0)"); 
			$('#content').css("transform","translate(0,0)"); 
			$('#hidemap').html('맵 숨기기');
			hidemapbox= 'f';
		}
       $('#staticBackdrop').on('show.bs.modal', function(event) {       
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
        
        let str= $("#boardwrap").children().eq(index).find("#send_modal").html().substring();
        let commented = $("#boardwrap").children().eq(index).find("#to_modal_commentlist").html().substring();
        let like = $("#boardwrap").children().eq(index).find(".like").html().substring();
        
        if(${ubuildingseq!=buildingseq}){
        	str= $("#boardwrap").children().eq(index-1).find("#send_modal").html().substring();
        	commented = $("#boardwrap").children().eq(index-1).find("#to_modal_commentlist").html().substring();
        	like = $("#boardwrap").children().eq(index-1).find(".like").html().substring();
        }
        str=str.replaceAll('450px','600px');
        str=str.replaceAll('300px','600px');
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
        $("#modal_react").html(like);
        
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
    	
    	$(".to_comment").on("click",function(){
    		$("#w_modal_comment").val('@'+this.value+" ");
    		$("#w_modal_comment").focus();
    	});
    	
    	 $('#btnadd').on("click",function addcomment(){
     		$.ajax({
  	            url:"/wood/snsmain.do",
  	            type: "post", // post 방식
  	            data:{
  	            	type:"1",
  	            	snsboardseq:snsboardseq, 
  	            	comment:$('#w_modal_comment').val()},// json 방식으로 서블릿에 보낼 데이터
  	            success:function(data){
 	                alert("success");
 	                
 	                location.replace();
  	            },
  	            error:function(){
  	                alert("error");
  	            }
  	        });
     	});
       });
     });
    	
    	
	 $("#addpic1").on("change", function(event) {
			$(this).parent().css("outline","none");
		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#preview-image1").attr("src", e.target.result);
		        $("#preview-image1").css("border","3px solid gray"); 
		    }

		    reader.readAsDataURL(file);
	});
	 $("#addpic2").on("change", function(event) {
		 $(this).parent().css("outline","none");
		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#preview-image2").attr("src", e.target.result);
		        $("#preview-image2").css("border","3px solid gray"); 
		    }

		    reader.readAsDataURL(file);
	});
	 
	 

		
</script>


</body>
</html>