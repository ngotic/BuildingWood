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

	.btn{
	display: flex;
    justify-content: right;
    }
    .btn > button{
    
    	
    	
    }
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
		
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<%@ include file="/WEB-INF/views/study/studyheader.jsp" %>  
	
<form action="./board.do" method="post">

	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">	</label>
	  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목" name ="title">
	</div>
	
	<div class="input-group mb-3">
	  <input type="file" class="form-control" id="inputGroupFile02">
	  <label class="input-group-text" for="inputGroupFile02">Upload</label>
	</div>
	
	
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label"></label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder = "텍스트" name="contents"></textarea>
	</div>
	<div class="btn">
	    
<button type="submit" class="btn btn-primary btn-sm" style="margin-right: 10px;">글쓰기</button>
<button type="button" class="btn btn-secondary btn-sm" href="./list.do">뒤로가기</button>


</div>


</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>




</script>

</body>
</html>





