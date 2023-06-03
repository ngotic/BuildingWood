<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/wood/asset/css/clubBtn.css">
<style>
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>동호회 추가하기</h1>
		<form id= "form1" method="POST" action="/wood/club/addclub.do">
		<input type="hidden" name="clubseq" value="${cdto.clubseq}">
			<table class="table table-bordered col-md-8 justify-content-center align-middle" >
				<tbody>
				<tr>
					<th>동호회 이름</th>
					<td colspan="3">
						<c:if test="${cdto!=null}">
							 <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${cdto.name}">	
						</c:if>
					</td>
				</tr>
				<tr>
					<th>신청자</th>
					<td>${cdto.id}</td>
					<th>건물명</th>
					<td>${cdto.buildingname}</td>
				</tr>
				<tr>
					<th>동호회 소개글</th>
					<td colspan="3">
					  <div class="mb-3">
					    <textarea class="form-control"  rows="7" name="content"></textarea>
					  </div>
					</td>
				</tr>
				<tr>
					<th>정원</th>
					<td>
						<div class="input-group input-group-sm mb-3">
						  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" min="0" max="20" value=20 name="recruits">
						  <span class="input-group-text" id="inputGroup-sizing-sm" style="width:3rem;">명</span>
						</div>
					</td>
					<th>개설날짜</th>
					<td><input type="date" class="form-control" id="startdate" name="openregdate"/></td>
				<tr>
				
				</tbody>
			</table>
		</form>
		
		<div class="text-end">
			<button class="back greencolor" onclick="location.href='/wood/club/club.do';">돌아가기</button>
			<button id="addbtn" class="add bluecolor"  onclick="location.href='/wood/club/add.do';">추가하기</button>
		</div>
		
		
		
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

	let addbtn = $('#addbtn');
	addbtn.click(function(){
		$('#form1').submit();
	});
	
</script>
</body>
</html>