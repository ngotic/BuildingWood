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
		<h1 style="margin-bottom:30px;">동호회 모집글 수정하기</h1>
		<form id="form1" method="POST" action="/wood/club/edit.do">
		<input type="hidden" name="hobbyclubseq" value="${cbdto.hobbyclubseq}">
		<input type="hidden" name="clubseq" value="${cbdto.clubseq}">
			<table class="table table-bordered col-md-8 justify-content-center align-middle" >
				<tbody>
				<tr>
					<th>동호회 이름</th>
					<td colspan="3">
						<c:if test="${cbdto!=null}">
							 <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${cbdto.name}">	
						</c:if>
					</td>
				</tr>
				<tr>
					<th>신청자</th>
					<td>${cbdto.nickname}</td>
					<th>건물명</th>
					<td>${cbdto.buildingname}</td>
				</tr>
				<tr>
					<th>동호회 소개글</th>
					<td colspan="3">
					  <div class="mb-3">
					    <textarea class="form-control"  rows="7" name="content">${cbdto.content}</textarea>
					  </div>
					</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>
						<div class="input-group input-group-sm">
						  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" min="0" max="20" value=5 name="recruits">
						  <span class="input-group-text" id="inputGroup-sizing-sm" style="width:3rem;">명</span>
						</div>
					</td>
					<th>개설날짜</th>
					<td>${cbdto.opendate}</td>
				</tr>
				<tr>
					<th>모집시작</th>
					<td><input type="date" class="form-control" id="startdate" name="openregdate" value="${cbdto.openregdate}"/></td>
					<th>모집마감</th>
					<td><input type="date" class="form-control" id="enddate" name="closeregdate" value="${cbdto.closeregdate}"/></td>
				</tr>
				</tbody>
			</table>
		</form>
		<div class="text-end">
				<button class="back basecolor" onclick="location.href='/wood/club/detail.do?hseq=${cbdto.hobbyclubseq}';">돌아가기</button>
				<button id="modiBtn" class="group basecolor">수정하기</button>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>


$('#startdate').val('${cbdto.openregdate}'.substring(0,10));
$('#enddate').val('${cbdto.closeregdate}'.substring(0,10));  

let addbtn = $('#modiBtn');
addbtn.click(function(){
	$('#form1').submit();
});

</script>
</body>
</html>