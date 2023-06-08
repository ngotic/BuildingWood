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
	
	
	.ptag{
	
	margin-top: 15px;
	
	}
	
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<%@ include file="/WEB-INF/views/study/studyheader.jsp" %>  
	
	
	
	<form method="post" action="./add.do">
	
	<div class= "addbox">
		
		
	
	
	
			<div class = "study-content-title " >
		<h2 id ="blank">스터디 개설</h2>	  
	   
	   <div style="     display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin-top: 50px;">
	   
	   <!-- 스터디명 name , 진행상황 status , 정원 recuit ,
	    스터디소개 intro, 모집기간 period, 모집위치 place , 
	    시작날짜 startdate , 종료날짜 enddate, 온옾아린 onoff -->
        <div class="form-group">
              <label for="exampleFormControlInput1" class="ptag">스터디명</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="name" placeholder="스터디명을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1" class="ptag">모집인원</label>
            <input type="number" class="form-control" id="exampleFormControlInput1" name="recruit" placeholder="모집인원수를 적어주세요.">
          </div>
        
         
	  <p class="content-margin ptag">모집 종료 기간</p>
	  <input type="date" class="form-control table-margin" id="floatingInput" placeholder="" name="period" style="width: 80% ">
	  <div style="width: 80%";
    display: inline-block;">
		  <div class="content-margin ptag" style="width: 104%;
    display: flex; justify-content: space-between;flex-direction: row; ">
			  <div class="align-middle mt-3" >
			   <input type="radio" name="onoff" value="on" class="align-middle"><label for="chk_info">온라인</label>
			   <input type="radio" name="onoff" value="off" checked="checked"><label for="chk_info">오프라인</label>
			   </div>
			    <input type ="text" class ="content-margin ptag" name ="address" placeholder="주소(오프라인)" style=" width: 80%; display: block;margin-bottom:10px; margin-right: 4%;" >
			  
	  		</div>
	<div>  
		<span class="content-margin">시작 날짜</span> <input type="date" name="startdate" class="form-control table-margin" id="floatingInput" placeholder="name@example.com">
		</div>
		<div><span class="content-margin">종료 날짜</spna>	<input type="date" name="enddate" class="form-control table-margin" id="floatingInput" placeholder="name@example.com">
	  </div>
	  </div>
	  <div class="form-group">
            <label for="exampleFormControlTextarea1">소개 내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="intro" rows="10" placeholder="소개내용을 적어주세요."></textarea>
          </div>
	</div>
	
          <div style="display: inline-block; text-align: left; margin-top: 20px;" >
          	
        	<input type="submit"  class="button" value ="등록하기">
        	
        	<a href ="./list.do;" class="button">
        	<button type="button" class="button" >목록으로</button>
        	</a>
        </div>
        </div>
	</div>
	</div>
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=onoff]").click(function(){
 
        if($("input[name=onoff]:checked").val() == "off"){
            $("input:text[name=address]").attr("disabled",false);
            
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name=onoff]:checked").val() == "on"){
              $("input:text[name=address]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
              $("input:text[name=address]").val("");
        }
    });
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>







