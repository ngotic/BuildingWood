<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/wood/asset/css/study.css">
<style>

	#btn-table{
	
		padding-right: 35px;
	
	    text-align: right;
	    padding: 0px;
	}
	.table-margin{
		margin-top: 15px;
	}
	.content-margin{
		margin-bottom: -5px;
		margin-top: 15px;
	}

	.comment-box{
		
		display: flex;  
		justify-content: right;
		margin-top: 10px;
		position: static;
	
	}
	.comment-box:first-child{
		
		justify-content: left;
	
	}
	.comment-btn{
	
	
	}
	
	.profile{
	
		width: 35px;
    height: 35px;
    border-radius: 10px;
    margin-right: 10px;
    margin-top: 10px;
	
	}
	.cotnet-button{
			

	
	}
	#study-board{
		
		width: 100%;
		height: auto;
		border: 1px solid black;
		
	}
	.board-main{
		
		
	
	}
	.board-content{
	
	
	}
	.txt-center{
		
	}
	#study-board tr td:nth-child(1){
		text-align: center;
		width: 7%;
		
	}
	#study-board tr td:nth-child(2){
		
		width: 55%;
		
	}
	#study-board tr td:nth-child(3){
		text-align: center;
		width: 10%;
		
	}
	#study-board tr td:nth-child(4){
		text-align: center;
		width: 10%;
		
	}
	#study-board tr td:nth-child(5){
		text-align: center;
		width: 7%;
		
	}
	#study-board tr td{
	
		padding: 4px;
		
	}
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
		
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<%@ include file="/WEB-INF/views/study/studyheader.jsp" %>  
	


<div style=" display: flex;  justify-content: center; align-items: center;  min-height: 50vh; text-align: left; margin-top:50px;">
		<div class = "study-content-black">
			<div class = " menu-board" style="
    background-color: #abdbff1a;
    border-radius: 64px;">
			
			
<div><!-- 소개 -->
  <div class = "menu" style="display: flex;
    text-align: center;
    flex-direction: column-reverse;
    align-items: stretch;
    border-bottom: 0px;">
		


	  <div class="" >  			
		<div class="mb-3">
		<div style="    display: flex;
    flex-direction: row;
    align-items: flex-end;
    justify-content: space-between;">
			<div><input type="image"  class="profile" src="/wood/asset/img/img.jpg" >작성자이름</div>
		  <div class="content-margin "> <span >${odto.status}</span></div>	
		  
		  </div>
		  <div class="mb-3">
		  <span style="font-size: 35px;">${odto.name}</span>
		  </div>
		  
		  <div style="    display: block;
    font-size: 23px;
    margin-top: 16px;">
		  <label for="exampleFormControlTextarea1" class="form-content" placeholder="내용" style="padding: 0px 13%;
    font-size: 18px;">${odto.intro }</label>
		  
		</div>
		<div style="margin-top: 14px;">
		  <span class="content-margin date">모집 종료 기간 : ${odto.period}</sapn>
		  </div>
		<div style="margin-top: 14px;">  
			<span class="content-margin date3">시작 날짜 : ${odto.startdate}</span>
			<span class="content-margin date3">종료 날짜 : ${odto.enddate }</span>
			<p style="margin-top: 14px;">모집인원 : ${odto.recruit }</p>
			<p id= "onoff">${odto.onoff }</p>
			<p>주소 : ${odto.address}</p>
		  </div>
		
		</div>
		
		
	  </div>

	
		
		</div>
		
		







</div>		
						
				<form style="margin-top: 14px;
    border-top: 1px solid;
    padding: 30px;
    margin-left: 10%;
    border-bottom: 1px solid;">
			
				<table style="    width: 100%;
    height: auto;
    border-collapse: separate;
    border-spacing: 0px 6px;">
			
					<tr class="board-cotnet board-main">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
		
		
			<c:forEach items="${list}" var="dto">	
				
					<tr onclick='location.href="./viewboard.do?openstudyseq=${openstudyseq}&studyseq=${dto.studyseq}"'>
						<th class="txt-center" >${dto.rownum }</th>
						<th>${dto.title}</th>
						<th class="txt-center">id</th>
						<th class="txt-center date2">${dto.regdate}</th>
						<th class="txt-center ">조회수</th>
					</tr>		
			</c:forEach>
		
				
				</table>
	
			</form>
				
		
		</div>	
		
		<form action ="./view.do?openstudyseq=${openstudyseq}" method="post" style="border: 5px solid; margin-top: 35px;   padding: 27px;
    display: flex;

    flex-direction: column;
    margin-left: 10%;">
			
		<div class="mb-3">
		
			<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
			<span class="content-margin " style="padding-bottom: 3px;">작성자이름</span>
			
		  <label for="exampleFormControlInput1" class="form-label">	</label>
		  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name ="title">
		</div>
			<input type="text" name = "addlist"  value="on" style="display: none">
			<input type="text" id = "sseq" name ="openstudyseq"  style="display: none" value="${openstudyseq}">
	
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label"></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder = "텍스트" name="content"></textarea>
		</div>
		<div class="btn">

	 
	<div class="comment-box" style="display: flex;
    justify-content: flex-end;">
			
        	<button type="submit" class="button" style="width: 129px; padding: 0px;">게시글작성</button>
        	
        	<a href ="./list.do;" class="">
        	<button type="button" class="button"  style="width: 129px; padding: 0px;">목록으로가기</button>
        	</a>
        </div>
        </form>	
			

		
	</div >
					


	
	

</div>
</div>
</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
window.onload=function(){
	history.replaceState({}, null, './view.do?openstudyseq=${openstudyseq}');
	}

window.onkeydown = function() {
	var kcode = event.keyCode;
	if(kcode == 116) {
	
	history.replaceState({}, null, './view.do?openstudyseq=${openstudyseq}');
	}
	}

	

$(document).ready(function() {
	$('#onoff').text(function(i, oldText) {
	return oldText === 'on' ? '온라인' : '오프라인';
	});
	});
	

$('.date').each((index, item)=>{
	$(item).text(clipstring($(item).text()));
});
function clipstring(str){
	return str.substring(0, 21);
}


$('.date2').each((index, item)=>{
	$(item).text(clipstring2($(item).text()));
});
function clipstring2(str){
	return str.substring(0, 10);
}



$('.date3').each((index, item)=>{
	$(item).text(clipstring3($(item).text()));
});
function clipstring3(str){
	return str.substring(0, 18);
}

</script>

</body>
</html>






