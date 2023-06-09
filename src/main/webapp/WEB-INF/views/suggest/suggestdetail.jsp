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
	.container-xl {
		width: 80%
	}
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
	#table-root > tbody td {
		color: #777;
	}
	.table-title {
		width: 30px;
		text-align: center;
		height: 55px;
		border-right: 1px solid;
	}
	.table-content {
		width: 125px;
	}
	.table-content-mid {
		border-right: 1px solid;
	}
	table.table tr th, table.table tr td {
		border-color: #ccc !important;
	}
	.table>tbody {
		border-top: 1px solid #ccc;
	}
	.table-content-bold {
		font-family: 'Pretendard';
	}
	.table-content-real {
		color: #222 !important;
		text-align: justify;
		height: 160px;
	}
	
	
	/* 하단 버튼 */
	.searchdiv {
		text-align: center;
		width: fit-content;
	    margin: 10px auto;
	    /* border: 1px solid #aaa; */
	    border-radius: 5px;
	    font-family: 'Pretendard-Regular';
	    margin-bottom: 20px;
	}
	
	#ori-icon2 {
		font-size: 20px;
    	margin-top: 3px;
   }
	
	
	 .searchdiv .btn {
    	padding-left: 33px;
   	}

</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>건의 게시판<small> 상세보기</small></h1>
	</section>
	
	
	<div class="container-xl">
	<div class="table-responsive">
			<table class="table table-striped" id="table-root">
				<tbody>
					<tr>
						<td class="table-title">글번호</td>
						<td class="table-content table-content-mid">${dto.suggestseq}</td>
						<td class="table-title ">조회수</td>
						<td class="table-content">${dto.readcount}</td>
					</tr>
					<tr>
					
						<td class="table-title">작성자</td>
						<td class="table-content table-content-mid table-content-bold">${dto.nickname}</td>
						<td class="table-title">작성일</td>
						<td class="table-content">${dto.editdate}</td>
					</tr>
					<tr>
						<td class="table-title">제목</td>
						<td colspan="4" class="table-content table-content-bold">[${dto.category}] ${dto.title}</td>
					</tr>
					<tr>
						<td class="table-title">내용</td>
						<td colspan="4" class="table-content table-content-real">${dto.content}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>        
	
	<div class="searchdiv">
		<c:if test="${not empty id && (id == dto.id || lv == '0')}">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='';"><span class="material-symbols-outlined" id="ori-icon2">edit</span>수정</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='';"><span class="material-symbols-outlined" id="ori-icon2">delete</span>삭제</button>
		</c:if>
   	    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/wood/suggest/suggest.do';"><span class="material-symbols-outlined" id="ori-icon2">format_list_bulleted</span>목록보기</button>
	</div>	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>

















