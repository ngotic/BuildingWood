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

<form action="./list.do" method="post">

	<div style=" display: flex;  justify-content: center;align-items: center;  min-height: 100vh; margin-top: 30px;">
		<div class = "study-content-black">
			<div class = "menu">
				
				
				  <select class="button"  name="ck">
				    <option value="name" selected="selected">스터디명</option>
				    <option  value="content">모집 내용</option>
				    <option  value ="tag">태그</option>
				  </select>
				
					<input class = "textbox" type="text" name = "name" placeholder ="검색어를 입력하세요." style = "align-self: right; align-content: left; padding: 10px;"  >
					<input class ="button" type ="submit" value ="검색" style = "align-content: left;">
					<a href ="./board.do">
					<input class ="button" type ="button" value ="글작성"style="margin-left: 30px;" >
					</a >
					<a href ="./add.do">
				<input class ="button" type ="button" max ="30" value ="스터디 등록"style="margin-left: 30px;" >
				</a >
			</div>
		<div class="row" style="margin-left: 57px; padding-left: 5%;">	
		
		<table class="table">
		</form>	
  <thead>
  	<h1 style="text-align: center">공지사항</h1>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
		
	<c:forEach items="${list}" var="dto">
	
 	<a type="button" href="view.do?openstudyseq=${dto.openstudyseq}&addlist=off" class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">
 	
		<div >	
		  <img src="/wood/asset/img/img.jpg" class="card-img-top" alt="...">
		  <div class="content-card-body">
		  <div style="display: none" name="addlist" vlaues= "off"></div>
		    <span class="card-title title nametxt"  name="name">${dto.name}   </span>
		    <p style="text-align: right; font-size: 15px;" name="recruit">${dto.recruit}</p>
		 
		    <p class="card-text introtxt" name="intro">${dto.intro}</p>
		    	<div style="display: none" name="openstudyseq">${dto.openstudyseq}</div>
		   	<span>태그</span>
		  </div>
		</div>
	</a>

	</c:forEach>
			

		</div><!-- div class row -->
		
		
		</div>
	</div>	

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	$('.introtxt').each((index, item)=>{
		
		$(item).text(clipstring($(item).text()));
		
	});
	
	$('.nametxt').each((index, item)=>{
		$(item).text(clipstring2($(item).text()));
	});
	//$('.introtxt').each()

	
	
	function clipstring(str){
		return str.substring(0, 20);
	}
/* 	$('#introtxt').text(clipstring($('#introtxt').text()));
	$('#nametxt').text(clipstring2($('#nametxt').text())); */
	
	function clipstring2(str){
		return str.substring(0,6);
	}

 
	$('.btn').click(function(){

		    var form = document.getElementByclassName(".btn");

		    form.action = "./view.do";

		    form.method = "get";

		    form.submit();

		}); 
</script>
<!-- JavaScript Bundle with Popper -->

	
 
</body>
</html>




