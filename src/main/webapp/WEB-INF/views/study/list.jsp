<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
	#search-textbox{
		width: 100%;
		height: 100px;
		border: solid 5px black;
		align-content: flex;
		margin-bottom: 80px;
	}
	#search-textbox > input	 {
		align-self: center;
	}
	
	#calender-content{
	
		width : 300PX;
		height: 500PX;
		border: solid 5px black;
		display: inline-flex;
		margin-left: 50px;
		margin-right: 100px;
		position: fixed;
		top: 300px;
	}
	
	.study-content-black{
	
		width : 70%;
		height: auto;
		/* border: solid 5px black; */
		display: block;
		justify-content: center;
		align-content: center;	 
		
		
	}
	.study-content{
		width: 300px;
		height: 450px;
		border: solid 1px black;
		margin: 40px;
	}
	.study-content-img{
	
		width: auto;
		height: 200px; 
		
		
	}
	
	.study-content-div{
	
		width:100%;
		height: 698px;
		
	}
	.menu {
		text-align: right;
	    padding: 20px;
	    border-bottom: solid 1px #333;
	    width: 80%;
	    margin-left: 10%;
	    margin-right: 10%;
	    display: inline-block;
	}
	
	.button{
	
		width: 100px;
		height: 50px;
	
	}
	.textbox {
		width:  300px;
		height: 50px;
		
	}
	
	.title{
		font-size: 30px;
	}
	
	a {
	display: inline-block;
	
	}
	
	.content-card{
	border: 0px;
    margin: -2px 13px 0px 0px;
    width: 21%;
        text-decoration-line: none;
	}
	
	.content-card-body{
		width: 100%;
		height: 100%;
	
	}
	.row{
	    padding-top: 50px;
	    
	    }

</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<%@ include file="/WEB-INF/views/study/studyheader.jsp" %>  

<form action="">

	<div style=" display: flex;  justify-content: center;align-items: center;  min-height: 100vh; margin-top: 30px;">
		<div class = "study-content-black">
			<div class = "menu">
				
				
				  <select class="button" >
				    <option value="name" selected="selected">스터디명</option>
				    <option  value="content">모집 내용</option>
				    <option value ="tag">태그</option>
				  </select>
				
					<input class = "textbox" type="text" placeholder ="검색어를 입력하세요." style = "align-self: right; align-content: left; padding: 10px;"  >
					<input class ="button" type ="button" value ="검색" style = "align-content: left;">
					<a href ="./board.do">
					<input class ="button" type ="button" value ="스터디 개설"style="margin-left: 30px;" >
					</a >
					<a href ="./add.do">
				<input class ="button" type ="button" max ="30" value ="스터디 등록"style="margin-left: 30px;" >
				</a >
			</div>
		<div class="row" style="margin-left: 57px; padding-left: 5%;">	
		

 	<a href="./view.do" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div >	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>

 	<a href="./view.do" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
	
 	<a href="./view.do" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
	
 	<a href="./view.do" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
	
 	<a href="####" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
	
 	<a href="####" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
	
	
 	<a href="####" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
		
 	<a href="####" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
		
 	<a href="####" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
		<div class="">	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		    <span class="card-title title">제목<p style="text-align: right; font-size: 15px;">모집인원</p></span>
		    <p class="card-text">모집 내용</p>
		   	<span>태그</span>
		  </div>
		</div>
	</a>
			

		</div><!-- div class row -->
		
		
		</div>
	</div>	
</form>	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

	

</script>
<!-- JavaScript Bundle with Popper -->

</body>
</html>




