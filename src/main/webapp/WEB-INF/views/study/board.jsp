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
		margin-bottom: -15px;
		margin-top: 15px;
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
	<div class="mb-3">
	  <p class="content-margin">제목</p>
	  <input type="text" class="form-control table-margin " id="exampleFormControlInput1" placeholder="제목">
	  <p class="content-margin">모집 종료 기간</p><input type="date" class="form-control table-margin" id="floatingInput" placeholder="name@example.com">
	  <div>
		  <div class="content-margin">
			   <input type="radio" name="chk_info" value="on" >온라인
			   <input type="radio" name="chk_info" value="off" checked="checked"  >오프라인
			   </div>
			  <input type ="text" class ="content-margin" name ="addresstext" placeholder="주소(오프라인)" style=" width: 100%; display: block;margin-bottom:10px; " >
		  
	  </div>
	<div>  
		<p class="content-margin">시작 날짜</p> <input type="date" class="form-control table-margin" id="floatingInput" placeholder="name@example.com">
		<p class="content-margin">종료 날짜</p>	<input type="date" class="form-control table-margin" id="floatingInput" placeholder="name@example.com">
	  </div>
	
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-content"placeholder="내용">내용</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	</div>
		<div id="btn-table" style="display: block; text-align: left; margin-top: 20px;" >
          	<a  href = "./list.do" class="">
        	<button type="submit" style="text-align: center;" class="button" >등록하기</button>
        	</a>
        	<a href ="javascript:history.back();" class="button">
        	<button type="button" style="text-align: center;" class="button" >목록으로</button>
        	</a>
        </div>
        
</div>
</div>
</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

	$(document).ready(function(){
		 
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=chk_info]").click(function(){
	 
	        if($("input[name=chk_info]:checked").val() == "off"){
	            $("input:text[name=addresstext]").attr("disabled",false);
	            
	            // radio 버튼의 value 값이 1이라면 활성화
	 
	        }else if($("input[name=chk_info]:checked").val() == "on"){
	              $("input:text[name=addresstext]").attr("disabled",true);
	            // radio 버튼의 value 값이 0이라면 비활성화
	              $("input:text[name=addresstext]").val("");
	        }
	    });
	});


</script>

</body>
</html>





