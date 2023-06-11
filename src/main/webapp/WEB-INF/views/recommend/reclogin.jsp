<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>

#login { width: 350px; }
	#login th{ width: 120px; }
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>회원로그인 임시<small> </small></h1>
		
		<main id="main">
		<form method="POST" action='/wood/recommend/reclogin.do'>
			<table id="login" class="vertical">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id" required class="short"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" id="pw" name="pw" required class="short"></td>
				</tr>
			</table>
			
			<div>
				<button type="submit" class="login primary">로그인</button>
			</div>
		</form>
		
		<hr>
		
		<div style="display: flex;">
		<form method="POST" action='/wood/recommend/reclogin.do'>
			<input type="hidden" name="id" value="bwgOXg113">
			<input type="hidden" name="pw" value="eNlFyz736">
			<input type="submit" value="편술소(역삼동)">
		</form>
		<form method="POST" action='/wood/recommend/reclogin.do'>
			<input type="hidden" name="id" value="sfHFUK601">
			<input type="hidden" name="pw" value="daEnWm506">
			<input type="submit" value="양권열(역삼동)">
		</form>
		
		
	</main>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>

















