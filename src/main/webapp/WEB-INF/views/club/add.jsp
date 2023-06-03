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
		<h1 style="margin-bottom:30px;">동호회 모집 등록하기</h1>
		<form id="form1" method="POST" action="/wood/club/add.do">
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
					<th>모집인원</th>
					<td>
						<div class="input-group input-group-sm mb-3">
						  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" min="0" max="20" value=5 name="recruits">
						  <span class="input-group-text" id="inputGroup-sizing-sm" style="width:3rem;">명</span>
						</div>
					</td>
					<th>개설날짜</th>
					<td>${cdto.opendate}</td>
				<tr>
				<tr>
					<th>모집시작</th>
					<td><input type="date" class="form-control" id="startdate" name="openregdate"/></td>
					<th>모집마감</th>
					<td><input type="date" class="form-control" id="enddate" name="closeregdate" /></td>
				</tr>
				</tbody>
			</table>
		</form>
		<div class="text-end">
				<button class="back greencolor" onclick="location.href='/wood/club/club.do';">돌아가기</button>
				<button id="addbtn" class="group bluecolor" onclick="location.href='/wood/club/add.do';">등록하기</button>
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
$('#enddate').val(getSpecificDate('-', 7));

let addbtn = $('#addbtn');
addbtn.click(function(){
	$('#form1').submit();
});

</script>
</body>
</html>