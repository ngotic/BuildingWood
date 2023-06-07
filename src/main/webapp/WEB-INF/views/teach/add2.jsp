<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
table {
	background-color: #99D685;
	margin-bottom: 20px;
}

input {
	border: 0px;
	outline: none;
	margin: 15px;
	padding: 10px;
}
th,td{
	border: 1px solid #74a065;
	color: black;
	font-size: 20px;
}
th{
text-align: center;
}

#content {
	width: 600px;
	height: 500px;
}
.d{
padding:0px 10px;
padding-bottom: 5px;
color:#777;
font-size: 13px;
}
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
    <h1>1:1과외 신청<small>페이지</small></h1>
    <form method="POST" action="/wood/teach/add.do">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" required name="title"></td>
            </tr>
            <tr>
                <th>모집기간</th>
                <td><input type="date" required name="period"></td>
            </tr>
            <tr>
                <th>모집위치</th>
                <td><input type="text" required name="place"></td>
            </tr>
            <tr>
                <th>온/오프라인</th>
                <td>
                    &nbsp;&nbsp;온라인<input type="radio" name="onoff" checked value="on">
                    오프라인<input type="radio" name="onoff" value="off">
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td>&nbsp;&nbsp;1시간당 <input type="number" step="1000" min="9620" max="1000000" required name="price"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><input type="text" required id="content" required name="content"></td>
            </tr>
            <tr>
                <td class="d">작성날짜: <span name="regdate">[2023-06-01]</span></td>
                <td align="right" class="d">수정날짜: <span name="editdate">[2023-06-02]</span></td>
            </tr>
        </table>
        <div>
            <button type="button" onclick="location.href='/wood/teach/view.do';">
                <span class="material-symbols-outlined">undo</span>
                돌아가기
            </button>
            <button type="submit">
                <span class="material-symbols-outlined">post_add</span>
                글쓰기
            </button>
        </div>
    </form>
</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>