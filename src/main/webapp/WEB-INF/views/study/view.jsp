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
	
			
	.pagingtbl{
    display: flex;
    justify-content: center;
	}

	.pagingtr{
		
	}
	
	.pagingtd{
	
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
			
			
			
			
			
			
			
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">${odto.name}</th>
	      <td></td>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">닉네임</th>
	      <td>${odto.nickname }</td>
	      <th>모집여부</th>
	      <td>${odto.status}</td>
	    </tr>
	    <tr>
	      <th scope="row">2모집 종료일자</th>
	      <td> ${odto.period}</td>
	      <td>모집인원</td>
	      <td>${odto.recruit }</td>
	    </tr>
	    <tr>
	      <th scope="row">시작날짜</th>
	      <td>${odto.startdate}</td>
	      <td>종료날짜</td>
	      <td>${odto.enddate }</td>
	    </tr>
	    <tr>
	      <th scope="row">온오프라인</th>
	      <td>${odto.onoff }</td>
	      <td>주소</td>
	      <td>${odto.address}</td>
	    </tr>

	    <tr>
	    	<td colspan="4">${odto.intro }</td>
	    </tr>

	  </tbody>
	</table>	
			
			
			
			
				
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
		

			<c:forEach items="${list}" var="dto" begin="${pagedto.startNumber }" end="${pagedto.endNumber }">	
				
					<tr onclick='location.href="./viewboard.do?openstudyseq=${openstudyseq}&studyseq=${dto.studyseq}"'>
						<th class="txt-center" >${dto.rownum }</th>
						<th>${dto.title}</th>
						<th class="txt-center">${dto.nickname }</th>
						<th class="txt-center date2">${dto.regdate}</th>
						<th class="txt-center ">${dto.checke }</th>
					</tr>		
			</c:forEach>
				<div>
						<a class="pagingtd" onclick="page_click(this)" href="./pagingview.do?openstudyseq=${openstudyseq}&pagenumber=이전&startListpageNumber=${pagedto.startListpageNumber}&endtListpageNumber=${pagedto.endtListpageNumber}" type="submit">이전</a>
							
						<c:forEach var="pagenum" begin="${pagedto.startListpageNumber }" end="${pagedto.endtListpageNumber}">
						
						<a class="pagingtd page" onclick="page_click(this)" href="./pagingview.do?openstudyseq=${openstudyseq}&startListpageNumber=${pagedto.startListpageNumber}&endtListpageNumber=${pagedto.endtListpageNumber}&pagenumber=${pagenum}" >${pagenum }</a>
						
						</c:forEach>
						<a class="pagingtd" onclick="page_click(this)" href="./pagingview.do?openstudyseq=${openstudyseq}&pagenumber=다음&startListpageNumber=${pagedto.startListpageNumber}&endtListpageNumber=${pagedto.endtListpageNumber}" >다음</a>
					
					</div>
					<form action="./view.do" method="get">
				<div class="menu"
					style="display: inline-flex; justify-content: center;">


					<select class="button" name="ck">

						<option value="name" selected="selected">제목</option>
						<option value="content">작성자</option>

					</select> <input class="textbox" type="text" name="name"
						placeholder="검색어를 입력하세요."
						style="align-self: right; align-content: left; padding: 10px;">
						
					<input type="hidden" name ="openstudyseq" value= "${openstudyseq}">
					<input class="button" type="submit" value="검색"
						style="align-content: left;"> 
				</div>
				</form>
				</table>
	

		</div>		
		<form action ="./view.do" method="get" style="border: 5px solid; margin-top: 35px;   padding: 27px;
    display: flex;

    flex-direction: column;
    margin-left: 10%;">
			
		<div class="mb-3">
		
			<input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
			<span class="content-margin " style="padding-bottom: 3px;">${nickname }</span>
			
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



/* onclick="location.href='./pagingview.do?openstudyseq=${openstudyseq}'" */
	function page_click(item) {
    var text = $(item).text()

}







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






