<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
	
	.searchdiv {
		text-align: center;
		width: fit-content;
	    margin: 30px auto;
	    /* border: 1px solid #aaa; */
	    border-radius: 5px;
	    font-family: 'Pretendard-Regular';
	    margin-bottom: 20px;
	}
	
	#ori-icon2 {
		font-size: 20px;
   }

</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>건의 게시판<small> 삭제</small></h1>
	</section>
	
	<form method="POST" action="/wood/suggest/suggestdel.do">
			
			<div class="searchdiv">
				<button type="button" class="back btn btn-outline-secondary btn-sm" onclick="history.back()"><span class="material-symbols-outlined" id="ori-icon2">reply</span>돌아가기</button>
				<button type="submit" class="del btn btn-outline-secondary btn-sm" style="margin-left: 10px;"><span class="material-symbols-outlined" id="ori-icon2">delete</span>삭제하기</button>
			</div>
			
			<input type="hidden" name="suggestseq" value="${suggestseq}">
		</form>
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>

















