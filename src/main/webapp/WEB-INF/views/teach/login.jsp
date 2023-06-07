<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>로그인<small>페이지</small></h1>
		<form method="POST" action="/wood/teach/login.do">
		<table>
			<tr>
				<th>아이디: <input type="text" name="id" required></th>
			</tr>
			<tr>
				<th>비밀번호: <input type="password" name="pw" required></th>
			</tr>
		</table>
		<input type="submit" value="로그인하기">
	</form>
	
	<div style="display: flex;">
		<form method="POST" action="/wood/teach/login.do">
			<input type="hidden" name="id" value="owFSkN242">
			<input type="hidden" name="pw" value="OIQetu252">
			<input type="submit" value="고우섭">
		</form>
		<form method="POST" action="/wood/teach/login.do">
			<input type="hidden" name="id" value="bwgOXg113">
			<input type="hidden" name="pw" value="eNlFyz736">
			<input type="submit" value="편술소 ">
		</form>
		<form method="POST" action="/wood/teach/login.do">
			<input type="hidden" name="id" value="WJsfNX875">
			<input type="hidden" name="pw" value="DNOCHd794">
			<input type="submit" value="오휘래 ">
		</form>
		<form method="POST" action="/wood/teach/login.do">
			<input type="hidden" name="id" value="tEEzCI937">
			<input type="hidden" name="pw" value="Fglopt226">
			<input type="submit" value="홍향량 ">
		</form>
	</div>
	<div>
		<form method="POST" action="/wood/teach/logout.do">
			<input type="submit" value="로그아웃">
		</form>
	</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>