<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div style=" display: flex;  justify-content: center; align-items: center;  min-height: 50vh; text-align: left; margin-top:50px;">
		<div class = "study-content-black">
			<div class = " menu-board" style="
    background-color: #abdbff1a;
    border-radius: 64px;">
			
			
<div><!-- 소개 -->
  <div class = "menu" style="display: flex;
    text-align: center;
    flex-direction: column-reverse;
    align-items: stretch;
    border-bottom: 0px;">
		
	<table >
	
		<tr>
			<td></td>
		</tr>
	
	</table>
	
	

	  <div class="" >  			
		<div class="mb-3">
		<div style="    display: flex;
    flex-direction: row;
    align-items: flex-end;
    justify-content: center;">
			
			<div><input type="image"  class="profile" src="/wood/asset/img/img.jpg" >
			  </div>
			<span>작성자이름</span></div>
		  <div class="content-margin "> <span >${dto.status}</span></div>	
		  
		</div>
		  <div class="mb-3">
		  <span style="font-size: 35px;">${dto.name}</span>
		  </div>
		  
		  <div style="display: block;
    font-size: 23px;
    margin-top: 16px;">
		  <label for="exampleFormControlTextarea1" class="form-content" placeholder="내용" style="padding: 0px 13%;
    font-size: 18px;">${dto.intro }</label>
		  
		</div>
		<div style="margin-top: 14px;">
		  <span class="content-margin date">모집 종료 기간 : ${dto.period}</sapn>
		  </div>
		<div style="margin-top: 14px;">  
			<span class="content-margin date3">시작 날짜 : ${dto.startdate}</span>
			<span class="content-margin date3">종료 날짜 : ${dto.enddate}</span>
			<p style="margin-top: 14px;">모집인원 : ${dto.recruit }</p>
			<p id= "onoff">${dto.onoff }</p>
			<p>주소 : ${dto.address}</p>
		  </div>
		
		</div>
		
		
	  </div>

	
		
		</div>
		
		

<div style="display: flex; justify-content: center; ">	
	<button style="width: 200px; height: 50px; border-radius: 20px;" onclick ="href='./studyadd.do?openstudyseq=${dto.openstudyseq}'">스터디 등록</button>
</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

$(document).ready(function() {
	$('#onoff').text(function(i, oldText) {
	return oldText === 'on' ? '온라인' : '오프라인';
	});
	});
	

$('.date').each((index, item)=>{
	$(item).text(clipstring($(item).text()));
});
function clipstring(str){
	return str.substring(0, 21);
}


$('.date2').each((index, item)=>{
	$(item).text(clipstring2($(item).text()));
});
function clipstring2(str){
	return str.substring(0, 10);
}



$('.date3').each((index, item)=>{
	$(item).text(clipstring3($(item).text()));
});
function clipstring3(str){
	return str.substring(0, 18);
}
</script>

</body>
</html>