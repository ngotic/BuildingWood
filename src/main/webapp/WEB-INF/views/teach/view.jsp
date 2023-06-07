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

input {
	display: block;
	border: 0px;
	padding: 10px;
	margin : 10px 5px 5px 5px;
	border-radius: 10px;
	margin: 10px 5px 5px 5px;
}
.rightbtn {
	float: right;
}

.rightbtn::after {
	clear: both;
}

section {
	background-color: #96d04a6e;
	padding: 10px 5px 10px 5px;
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
	        <div class="container">
	            <div class="form-group">
	                <label for="fname">제목:</label>
	                <div>${dto.title }</div>
	            </div>
	            <div class="form-group">
	                <label for="lname">모집기한:</label>
	                <div>${dto.period }</div>
	            </div>
	            <div><label id="nn">온/오프라인: </label>
	                <div class="form-group form-check">
	                <c:if test="${dto.onoff == 'on'}">
	                <div>온라인</div>
	                </c:if>
	                <c:if test="${dto.onoff == 'off'}">
	                 <div>오프라인</div>
	                </c:if>
	                </div>
	            </div>
	            <div class="form-group">
	                <label>모집위치:</label>
	                <div>${dto.place }</div>
	            </div>
	             <div class="form-group">
	                <label>요일:</label>
	                ${dto.weekend }
			    </div>
	            <div class="form-group">
	                <label>시간:</label>
	                <div>
	             	${dto.time }
	            	</div>
	            </div>
	            <div class="form-group">
	                <label>가격:</label>
	                <div>${dto.price }</div>
	            </div>
	            <div class="form-group">
	                <label>내용:</label>
	                <div>${dto.content }</div>
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
	            <c:if test="${id != dto.id}">
		            <button type="button"  class="rightbtn" onclick="location.href='/wood/teach/signup.do?teachseq=${dto.teachseq}';">
		                <span class="material-symbols-outlined">list_alt_add</span>
		               신청하기
		            </button>
	            </c:if>
				<c:if test="${id == dto.id}">
					<button type="button" class="rightbtn" onclick="location.href='/wood/teach/edit.do?teachseq=${dto.teachseq}';">
						<span class="material-symbols-outlined">edit</span>
						수정하기
					</button>
					<button type="button" class="rightbtn" onclick="location.href='/wood/teach/del.do?teachseq=${dto.teachseq}';">
						<span class="material-symbols-outlined">delete</span>
						삭제하기
					</button>
				</c:if>
			</div>
	    </form>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		
	</script>
</body>
</html>