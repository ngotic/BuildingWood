<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	body {
		color: #566787;
		font-family: 'Pretendard-Regular';
	}
	
	/* 본문 테이블 */
	.table-responsive {
	    margin: 40px 0;
	}
	.table-wrapper {
		background: #fff;
		padding: 20px 25px;
		border-radius: 3px;
		min-width: 900px;
		box-shadow: 0 1px 1px rgba(0,0,0,.05);
	}
	.table-title {        
		padding-bottom: 15px;
		background: #435d7d;
		color: #fff;
		padding: 16px 30px;
		min-width: 100%;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
		font-family: 'Pretendard-Regular';
	}
	.table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
		font-family: 'Pretendard-Regular';
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
	table.table tr th, table.table tr td {
		border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
	}
	table.table tr th:first-child {
		width: 91px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
	table.table-striped tbody tr:nth-of-type(odd) {
		background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
	table.table th i {
		font-size: 13px;
		margin: 0 5px;
		cursor: pointer;
	}	
	table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
		margin: 0 5px;
	}
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
		color: #FFC107;
	}
	table.table td a.delete {
		color: #F44336;
	}
	table.table td i {
		font-size: 19px;
	}
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.hint-text {
		float: left;
		margin-top: 10px;
		font-size: 13px;
	}    

	
	#table-root {
		width: 75%;
		margin: 0 auto;
		font-size: 16px;
	}
	#table-con {
		width: 75%;
    	margin: 0 auto;
    	min-width: auto;
	}
	.table-center {
		text-align:center;
	}
	#table-head {
		background: rgb(126 211 33 / 72%);
	}
	#table-head-tr {
		color: #fff;
		border-radius: 3px 3px 0 0;	
	}
	.head-th {
		color: #fff !important;		
	}
	.table-striped {
	}
	.table {
		--bs-table-striped-bg: rgb(162 162 162 / 5%);
		--bs-table-hover-bg: rgb(91 91 91 / 8%);
	}	
	.table-content > span:nth-child(1) {
		margin-left: 20px;
		color: #212529;
	}
	#table-root > tbody td {
		color: #777;
	}
	#table-root > tbody td:nth-child(3) {
		color: #212529;
		font-family: 'Pretendard';
	}
	#table-root > tbody td:nth-child(4) {
		font-family: 'Pretendard';
	}
	#table-head-tr > th {
		font-family: 'Pretendard';
	}
	
	
	/* 서치바, 목록 버튼들 */
	#searchForm {
	text-align: center;
	}
	.searchdiv {
		text-align: center;
		width: fit-content;
	    margin: 10px auto;
	    /* border: 1px solid #aaa; */
	    border-radius: 5px;
	    font-family: 'Pretendard-Regular';
	    margin-bottom: 20px;
	}
	
	
	/* 페이징 */
	.page-link.active {
		background-color: rgb(126 211 33 / 72%); !important;
		border-color: rgb(126 211 33 / 72%); !important;
		font-family: 'Pretendard-Regular';
		color: #fff !important;
	}
	.disabled>.page-link, .page-link.disabled {
		background-color: #f5f5f5 !important;
		font-family: 'Pretendard-Regular';
	}
	.page-link {
		color: #444444 !important;
	}

	/* 버튼 */
	.rec-btn {
		padding: 5px;
		border-radius: 0 4px 4px 0;
	    height: 38px;
		
	}

	input, textarea, button, select {
		border: hidden !important;
	}
	
	
	#ori-icon2 {
	font-size: 20px;
    margin-top: 3px;
   
   }
   
   
   /* new 아이콘 */
   .isnew img {
 	width: 15px;
    margin: 0 0 2px 0px;
   }
   

</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<%@ include file="/WEB-INF/views/suggest/sugheader.jsp" %>
		
	<div id="suggest" style="height: 100px; margin-top: -100px;"></div>
	
	<section class="container">
		<h1>건의 게시판<small> 목록</small></h1>
	</section>
	
	
	<div class="container-xl">
	<div class="table-responsive">
		<!-- <div class="table-wrapper">
			<div class="table-title" id="table-con">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Employees</b></h2>
					</div>
				</div>
			</div> -->
			<table class="table table-striped table-hover" id="table-root">
				<thead id="table-head">
					<tr id="table-head-tr">
						<th class="table-center head-th" style="width:70px">번호</th>
						<th class="table-center head-th" style="width:105px">공지/건의</th>
						<th class="table-center head-th" style="width:350px">제목</th>
						<th class="table-center head-th" style="width:150px">닉네임</th>
						<th class="table-center head-th" style="width:110px">작성날짜</th>
						<th class="table-center head-th" style="width:70px">추가?</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="6">게시물이 없습니다.</td>
					</tr>
					</c:if>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td class="table-center">${dto.suggestseq}</td>
						<td class="table-center">[${dto.category}]</td>
						
						<td class="table-content">
							<span>
								<a href="/wood/suggest/suggestdetail.do?suggestseq=${dto.suggestseq}&column=${map.column}&word=${map.word}&search=${map.search}">${dto.title}</a>
							</span>
							<!-- new 표시 -->
							<c:if test="${dto.isnew < 30 / 24 / 60 }">
								<span class="isnew"><img src="/wood/asset/suggest_img/new.png" alt="new"></span>
							</c:if>
							
						</td>
						
						<td class="table-center"><span>${dto.nickname}</span></td>
						<td class="table-center">${dto.regdate}</td>
						<td class="table-center">${dto.readcount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>        


	<!-- 검색바 -->
	<div class="searchdiv" style="border: 1px solid #aaa;">
	<form id="searchForm" action="/wood/suggest/suggest.do" method="GET">
		<select name ="column">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="nickname">닉네임</option>
		</select>
		<input type="text" name="word" required style="outline:none;">
		<input type="submit" value="검색하기" class="rec-btn">
	</form>
	</div>
	
	<!-- 페이징 -->
	<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success" style="text-align: center; margin-bottom:20px; font-family: 'Pretendard-Regular';">${pagination}</ul>
		
	<div class="searchdiv">
		<c:if test="${not empty id }">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/wood/suggest/suggestadd.do';" style="border: 1px solid #aaa !important;"><span class="material-symbols-outlined" id="ori-icon2" >add_ad</span>글쓰기</button>
		</c:if>
   	    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/wood/suggest/suggest.do';" style="border: 1px solid #aaa !important;"><span class="material-symbols-outlined" id="ori-icon2" style="border-left: 1px soild #aaa">format_list_bulleted</span>목록보기</button>
	</div>

	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	
	//검색중일때만
	<c:if test="${map.search == 'y'}">
	$('select[name=column]').val('${map.column}');
	$('select[name=word]').val('${map.word}');
	</c:if>
	
</script>
</body>
</html>

















