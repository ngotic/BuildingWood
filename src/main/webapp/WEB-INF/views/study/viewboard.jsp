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
			<div class = " menu-board" style="border:  3px solid black;">
			
<!-- 			
<div>소개
  <div class = "menu" >
	<span style="float: left;">		
	 <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    강의 일정
	  </button>
	  
	
	</span>
	<span style="float: left; margin-left:30px;">		
	 <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#notification" aria-expanded="false" aria-controls="notification">
	   	공지사항
	  </button>
	  
	
	</span>
		
	
			<select class="button" >
			<option value="name" selected="selected">제목</option>
			</select>
			<input class = "textbox" type="text" placeholder ="검색어를 입력하세요." style = "align-self: right; align-content: left; padding: 10px;"  >
			<input class ="button" type ="button" value ="검색" style = "align-content: left;">
		</div>
		
		
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
	   			
		<div class="mb-3">
		<div style="display: flex;">
			<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
		  <p class="content-margin ">작성자이름</p>	
		  </div>
		  
		  <p class="content-margin">제목~~</p>
		    <p class="content-margin">모집 종료 기간 : 2023-06-25</p>
		  
		<div>  
			<p class="content-margin">시작 날짜 : 2023-06-30</p>
			<p class="content-margin" style="margin-bottom: 20px;">종료 날짜 : 2023-09-30</p>
		  </div>
		
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-content" placeholder="내용">Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus eligendi saepe, maiores labore commodi nemo dolorem minus officia sequi quaerat fugit dolores sunt odio aliquam, explicabo suscipit molestiae cum. Ipsam!</label>
		  
		</div>
		
	  </div>
	</div>




	<div class="collapse" id="notification">
	  <div class="card card-body">	
		<div class="mb-3">
		<div style="display: flex;">
			<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
		  <p class="content-margin ">작성자이름</p>	
		  </div>
		  
		  <p class="content-margin">제목~~</p>
		   
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-content" placeholder="내용">Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus eligendi saepe, maiores labore commodi nemo dolorem minus officia sequi quaerat fugit dolores sunt odio aliquam, explicabo suscipit molestiae cum. Ipsam!</label>
		</div>
			  
		<div>  
			<p class="content-margin">작성 날짜 : 2023-06-30</p>
		  </div>
	  </div>
	</div>




</div>	 -->	
						
				<form>
			
				<table id= "study-board">
					<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
			<span class="content-margin " style="padding-bottom: 3px;">작성자이름</span>
			<div class="mb-3">
	  
	  <span>${dto.title }</span>
	</div>
	<div class="mb-3">
	  
	  	<span>${dto.content}</span>
	</div>
					
		<c:forEach items="${commentlist}" var="cdto">
	
 	
 	
		<div >	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="..." style="width: 40px;">
		  <div class="content-card-body">
		  <div style="display: none" name="addlist" vlaues= "off"></div>
		    <span class="card-title title nametxt"  name="name">${cdto.content}</span>
		    <p style="text-align: right; font-size: 15px;" name="recruit"> ${cdto.modifydate}</p>
		 
		
		  </div>
		</div>
	

	</c:forEach>
				

				
				</table>
	
			</form>
				
		
		</div>	
		<form action ="./viewboard.do?openstudyseq=${ openstudyseq}&studyseq=${ studyseq}" method="post">
			
		<div class="mb-3">
		
			<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
			<span class="content-margin " style="padding-bottom: 3px;">작성자이름</span>
			
		  	
		  
		</div>
			<input type="text" name = "addlist"  value="on" style="display: none">
			<input type="text" id = "sseq" name ="openstudyseq"  style="display: none" value="${openstudyseq}">
	
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label"></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder = "텍스트" name="content"></textarea>
		</div>
		<div class="btn">

	 
	<div class="comment-box"  >
			
        	<button type="submit" class="button"  >댓글 등록 하기</button>
        	
        	<a href ="./list.do;" class="">
        	<button type="button" class="button" >목록으로</button>
        	</a>
        </div>
        </form>	
			

		
	</div >
					


	
	

</div>
</div>
</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

window.onkeydown = function() {
	var kcode = event.keyCode;
	if(kcode == 116) {
	
	history.replaceState({}, null, './viewboard.do?openstudyseq=${openstudyseq}&studyseq=${studyseq}');
	}
	}



</script>

</body>
</html>


