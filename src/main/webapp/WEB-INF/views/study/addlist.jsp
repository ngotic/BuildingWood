<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

	.study-content-title{
	
		
		
	}
	.addbox{
		margin-top : 100px;
	  position: absolute;
 	  left: 10%;
 	  right: 10%;
 	  
		width: 80%;
		height: 300px;
		/* border: 1px solid black; */
		
		
	}
	
	.study-content-title{
		
		width: 100%;
		height: 50px;
		/* border: 1px solid black; */
		text-align: center;
		
		display: block;
	}
		 .ip{
		margin-left: 70px;
		width: 70%;
		height: 50px;
		/* border: 1px solid black; */
		 position:absolute;
		 top: 0px;
	}
	.study-text{
		width: 100%;
		height: 100%;
	}
	.form-group{
	
		width: 80%;
		
		
	}
	form{
		display: inline-block;
          /* text-align: center; */
         /*  align-content: center; */
		width: 80%;
		padding-left: 15%; 
	}
	.btn{
	
		width: 100px;
		height: 30px;
		
	}
	
	.button {
   position: relative;
   left: 0;
   top: 0;
   padding-left: 35px;
   text-align: center;
}

</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div class= "addbox">
		
		
	
		<div class = "study-content-title " >
		<h2 >스터디 개설</h2>
	  
	   
	   <div style="     display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px;">
	   
        <div class="form-group">
              <label for="exampleFormControlInput1">스터디명</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="name" placeholder="스터디명을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">모집 인원수</label>
            <input type="number" class="form-control" id="exampleFormControlInput1" name="recruit" placeholder="모집 인원수을 적어주세요.">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">소개 내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="intro" rows="10" placeholder="소개내용을 적어주세요."></textarea>
          </div>
          <div style="display: inline-block; text-align: left; margin-top: 20px;" >
          	<a  href = "./list.do" class="">
        	<button type="submit" style="" class="button">등록하기</button>
        	</a>
        	<a href ="javascript:history.back();" class="button">
        	<button type="button" class="button" >목록으로</button>
        	</a>
        </div>
        </div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>



</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>






