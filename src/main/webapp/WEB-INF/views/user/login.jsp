<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>

<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<style>
	#login { width: 350px; }
	#login th { width: 120px; }
	
	#temp-login {
	 	display: flex; 
	 	flex-wrap: wrap;
	}
	#temp-login form {
		margin: .3rem;
	}
</style>
</head>
<body>
	<!-- template.jsp > login.jsp -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<main id="main">
		<h1 class="sub">회원 <small>로그인</small></h1>
		
		<form method="POST" action="/toy/user/login.do">
		<table id="login" class="vertical">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required class="short"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" id="pw" required class="short"></td>
			</tr>
		</table>
		<div>
			<button type="button" class="back"
					onclick="location.href='/toy/index.do';">돌아가기</button>
			<button type="submit" class="login primary">로그인</button>
		</div>
		</form>

		<hr>
		
		<div id="temp-login">
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="hong">
			<input type="hidden" name="pw" value="1111">
			<input type="submit" value=" 홍길동(hong) ">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="test">
			<input type="hidden" name="pw" value="1111">
			<input type="submit" value=" 테스트(test) ">
		</form>
		
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="happy">
			<input type="hidden" name="pw" value="1111">
			<input type="submit" value=" 아무개(happy) ">
		</form>
		<div style="flex-basis: 100%"></div>
		<form method="POST" action="/toy/user/login.do">
			<input type="hidden" name="id" value="admin">
			<input type="hidden" name="pw" value="1111">
			<input type="submit" value=" 관리자(admin) ">
		</form>
		</div>
		
	</main>

<script>

</script>
</body>
</html>






