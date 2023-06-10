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
		<form id= "form1" method="POST" action="/wood/club/addclub.do" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}">
			<table class="table table-bordered col-md-8 justify-content-center align-middle" >
				<tbody>
					<tr>
						<th>동호회 이름</th>
						<td colspan="3">
							<input type="text" class="form-control" name="name">	
						</td>
					</tr>
					<tr>
						<th>신청자</th>
						<td>${nickname}</td>
						<th>건물명</th>
						<td>${building}</td>
					</tr>
					<tr>
						<th>동호회 소개글</th>
						<td colspan="3">
						  <div class="mb-3">
						    <textarea class="form-control"  rows="7" name="intro"></textarea>
						  </div>
						</td>
					</tr>
					<tr>
						<th>정원</th>
						<td>
							<div class="input-group input-group-sm">
							  <input type="number" class="form-control" min="0" max="20" value=20 name="amount">
							  <span class="input-group-text" id="inputGroup-sizing-sm" style="width:3rem;">명</span>
							</div>
						</td>
						<th>개설날짜</th>
						<td><input type="date" class="form-control" id="startdate" name="opendate"/></td>
					</tr>
					<tr>
						<th>동호회 사진</th>
						<td colspan="3">
							 <input type="file" name="pic" required accept="image/gif, image/png, image/jpg, image/jpeg">
						</td>				
					</tr>
				</tbody>
			</table>
		</form>
		
		<div class="text-end">
			<button class="back greencolor" onclick="location.href='/wood/club/club.do';">돌아가기</button>
			<button id="addbtn" class="add bluecolor">추가하기</button>
		</div>
	
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	
	function getSpecificDate(pattn, num){
		var currnt_ = new Date();
	    // 1000 : 밀리세컨드,  60 : 1분, 60 : 1시간, 24 : 24시간 = 86400000 밀리세컨드
	    var temp_ = new Date(Date.parse(currnt_) + (num * 1000 * 60 * 60 * 24));
	    var year_ = temp_.getFullYear();
	    var month_ = temp_.getMonth()+1;
	    var day_ = temp_.getDate();
	    
	    month_ = month_ < 10? '0'+month_:month_;
	    day_   = day_ < 10? '0'+day_:day_;
	    
	    return year_+pattn+month_+pattn+day_;
	}
	
	$('#startdate').val(getSpecificDate('-', 0)); 
	// 값을 - 스타일로 넣어주고 이게 바뀐다.
	
	let addbtn = $('#addbtn');
	addbtn.click(function(){
		$('#form1').submit();
	});
	
</script>
</body>
</html>