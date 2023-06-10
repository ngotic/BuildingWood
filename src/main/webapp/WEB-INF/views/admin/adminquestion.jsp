<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp" %>
<head>
<style>

	#btn1 {
		margin: 5px;
    	position: relative;
    	left: 88%;
	}
	.dataTables_paginate {
		margin: 10px 0 !important; 
	}
	.card .card-header {
		padding: 30px 30px 0 30px !important;
	}

</style>
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/datatables.css">
	<link rel="icon" href="/wood/adminasset/images/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="/wood/adminasset/images/favicon.png" type="image/x-icon">
    <title>viho - Premium Admin Template</title>
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/feather-icon.css">
    <!-- Plugins css start-->
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/style.css">
    <link id="color" rel="stylesheet" href="/wood/adminasset/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/responsive.css">
</head>
        <!-- template.jsp > index.jsp -->
	    <%@ include file="/WEB-INF/views/admininclude/header.jsp" %>
	    
      	 <div class="col-lg-6">
          <h3>공지 및 건의사항 관리</h3>
          <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="https://laravel.pixelstrap.com/viho/dashboard">Home</a></li>
                <li class="breadcrumb-item">마이페이지</li>
				<li class="breadcrumb-item active">공지 및 건의사항</li>
          </ol>
        </div>
        
        
         <div class="container-fluid">
            <div class="row">
              <!-- Individual column searching (select inputs) Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h5>내가 쓴 공지 게시글 내역</h5>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="display" id="API-3">
                        <thead>
                          <tr>
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>작성날짜</th>
                            <th>조회수</th>
                          </tr>
                        </thead>
                        
                        <c:forEach items="${myslist}" var="sdto" varStatus="status">
                        <tbody>
                          <tr>
                            <td>${sdto.suggestseq}</td>
                            <td>[${sdto.category}]</td>
                            <td><a href="/wood/suggest/suggestdetail.do?suggestseq=${sdto.suggestseq}&column=&word=&search=">${sdto.title}</a></td>
                            <td>${sdto.regdate}</td>
                            <td>${sdto.readcount}</td>
                          </tr>
                        </tbody>
                        </c:forEach>
                        
                      </table>
                      <a id="btn1" class="btn btn-primary" href="/wood/suggest/suggestadd.do" title="btn btn-primary" role="button">공지 쓰기</a>
                    </div>
                  </div>
                </div>
              </div>
             </div>
           </div>
        
         
		
         <%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
<!-- latest jquery-->
<script src="/wood/adminasset/js/jquery-3.5.1.min.js"></script>
<!-- feather icon js-->
<script src="/wood/adminasset/js/icons/feather-icon/feather.min.js"></script>
<script src="/wood/adminasset/js/icons/feather-icon/feather-icon.js"></script>
<!-- Sidebar jquery-->
<script src="/wood/adminasset/js/sidebar-menu.js"></script>
<script src="/wood/adminasset/js/config.js"></script>
<!-- Bootstrap js-->
<script src="/wood/adminasset/js/bootstrap/popper.min.js"></script>
<script src="/wood/adminasset/js/bootstrap/bootstrap.min.js"></script>
<!-- Plugins JS start-->
	<script src="/wood/adminasset/js/datatable/datatables/jquery.dataTables.min.js"></script>
    <script src="/wood/adminasset/js/datatable/datatables/datatable.custom.js"></script>
	<!-- Plugins JS Ends-->
<!-- Theme js-->
<script src="/wood/adminasset/js/script.js"></script>

 <script>
 </script> 	
 </body>
</html>










