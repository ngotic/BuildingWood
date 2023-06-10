<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Form</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
	
</script>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
#date {
	text-align: right;
	color: #777;
	font-size: 12px;
}

#content {
	height: calc(( 1.5em + .75rem + 2px)*4);
}

button {
	border: 0px;
	padding: 10px;
	margin : 10px 5px 5px 5px;
	border-radius: 10px;
	margin: 10px 5px 5px 5px;
}

#rightbtn {
	float: right;
}

#rightbtn::after {
	clear: both;
}

section {
	background-color: #96d04a6e;
	padding: 10px 5px 10px 5px;
}

.weekend {
	border: 0px;
	outline: none;
	width: 40px;
	height: 40px;
	margin-right: 10px;
	font-weight: bold;
	font-size: 1.5rem;
	border-radius: 100px;
}

.form-control.time {
	width: 40% !important;
	display: inline !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section class="container">
		<h1 class="text-success text-center">
        과외 신청 게시글
	    </h1>
	    <h2 class="text-center">상세보기</h2>
	    <form method="POST" action="/wood/teach/edit.do">
	        <div class="container">
	            <div class="form-group">
	                <label for="fname">제목:</label>
	                <input type="text" class="form-control" id="fname" name="title" value="${dto.title }">
	            </div>
	            <div class="form-group">
	                <label for="lname">모집기한:</label>
	                <input type="date" class="form-control" id="lname" name="period" value="${dto.period }">
	            </div>
	            <div><label id="nn">온/오프라인: </label>
	                <div class="form-group form-check">
	                <c:if test="${dto.onoff == 'on'}">
	                    <label class="form-check-label">
	                            <input class="form-check-input" type="radio" name="onoff" checked value="on">
	                            온라인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    </label>
	                    <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="onoff" value="off">
	                        오프라인
	                    </label>
	                </c:if>
	                <c:if test="${dto.onoff == 'off'}">
	                    <label class="form-check-label">
	                            <input class="form-check-input" type="radio" name="onoff" value="on">
	                            온라인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    </label>
	                    <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="onoff" checked value="off">
	                        오프라인
	                    </label>
	                </c:if>
	                </div>
	            </div>
	            <div class="form-group">
	                <label>모집위치:</label>
	                <input type="text" class="form-control" id="place" value="${dto.place }" name="place">
	            </div>
	            <div class="form-group">
	                <label>요일:</label>
	                <div>
				        <input type="button" value="월" class="weekend" />
				        <input type="button" value="화" class="weekend" />
				        <input type="button" value="수" class="weekend" />
				        <input type="button" value="목" class="weekend" />
				        <input type="button" value="금" class="weekend" />
				        <input type="button" value="토" class="weekend" />
				        <input type="button" value="일" class="weekend" />
				        <input type="hidden" value="" id="hidden" name="hidden">
				    </div>
			    </div>
	            <div class="form-group">
	                <label>시간:</label>
	                <div>
	                	&nbsp;시작 시간: 
		                <input type="time" class="form-control time" name="sttime" value="${(dto.settime).substring(0,5) }" required>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                종료 시간: 
		                <input type="time" class="form-control time" name="edtime"  value="${(dto.settime).substring(6) }" required>
	            	</div>
	            </div>
	            <div class="form-group">
	                <label>가격:</label>
	                <input type="number" class="form-control" id="contact" step="1000" min="9620" max="1000000" value="${dto.price }"
	                    name="price">
	            </div>
	            <div class="form-group">
	                <label>내용:</label>
	                <textarea class="form-control" id="content" name="content">${dto.content }</textarea>
	            </div>
	            <div id="date">
	                <span>작성날짜:[${dto.regdate }]</span>&nbsp;&nbsp;
	                <span>수정날짜:[${dto.editdate }]</span>
	            </div>
	        </div>
	        <div>
	            <button type="button" onclick="location.href='/wood/teach/list.do';">
	                <span class="material-symbols-outlined">undo</span>
	                돌아가기
	            </button>
	           	 <input type="hidden" value="${dto.teachseq }" name="teachseq">
	            <button type="submit"  id="rightbtn">
	                <span class="material-symbols-outlined">post_add</span>
	               수정하기
	            </button>
	        </div>
	    </form>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	var insert ='';
	$(document).ready(function() {
		  var color = $('.weekend');
		  
		  <c:forEach items="${dto.weekend.split(',')}" var="item">
			$('.weekend[value=${item}]').css('background-color', '#FFE1E1');		  
		  </c:forEach>
		  alert(${dto.weekend})
		});

	$('.weekend').click(function () {

		if($(this).css('background-color') == 'rgb(240, 240, 240)'){
	        $(this).css('background-color', '#FFE1E1');
	        insert += event.target.value + ',';
			
		}else{
	        $(this).css('background-color', '');
			var remove = event.target.value + ',';
		    insert = insert.replace(remove, '');
		}
		$('#hidden').val(insert);
    });
</script>
</body>
</html>