<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp" %>
 <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/feather-icon.css">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/datatables.css">
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/style.css">
    <link id="color" rel="stylesheet" href="/wood/adminasset/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/responsive.css">
<head>
<style>
</style>
</head>
        <!-- template.jsp > index.jsp -->
	    <%@ include file="/WEB-INF/views/admininclude/header.jsp" %>
	    
		
      	 <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <!-- Zero Configuration  Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h2 style="font-weight:900; margin-bottom:20px;">건물관리 페이지</h2>
                    <span style="font-size:20px;">이 페이지에서 빌딩숲 관리자가 건물을 관리합니다.</span>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="display" id="basic-1">
                        <thead>
                          <tr>
                          	<th>번호</th>
                            <th>건물이름</th>
                            <th>동</th>
                            <th>주소</th>
                            <th>위도</th>
                            <th>경도</th>
                          </tr>
                        </thead>
                        <tbody>
                         <c:forEach items="${blist}" var="dto">
                        	<tr>
	                          	<td>${dto.buildingseq}</td>
	                            <td><a href="/wood/admin/adminbuildingdetail.do?buildingseq=${dto.buildingseq}">${dto.name}</a></td>
	                            <td>${dto.dong}</td>
	                            <td>${dto.address}</td>
	                            <td>${dto.lat}</td>
	                            <td>${dto.lng}</td>
                           </tr>
                         </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
             </div>
            </div>
              <!-- Zero Configuration  Ends-->
		
    
         <%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
         <script src="/wood/adminasset/js/jquery-3.5.1.min.js"></script>
    	 <!-- feather icon js-->
    	<script src="/wood/adminasset/js/icons/feather-icon/feather.min.js"></script>
    	<script src="/wood/adminasset/js/icons/feather-icon/feather-icon.js"></script>
	   	 <!-- Sidebar jquery-->
	    <script src="/wood/adminasset/js/sidebar-menu.js"></script>
	    <script src="/wood/adminasset/js/config.js"></script>
	    <!-- Bootstrap js-->
	    <script src="/wood/adminasset/bootstrap/popper.min.js"></script>
	    <script src="/wood/adminasset/js/bootstrap/bootstrap.min.js"></script>
	    <!-- Plugins JS start-->
	    <script src="/wood/adminasset/js/datatable/datatables/jquery.dataTables.min.js"></script>
	    <script src="/wood/adminasset/js/datatable/datatables/datatable.custom.js"></script>
	    <script src="/wood/adminasset/js/tooltip-init.js"></script>
	    <!-- Plugins JS Ends-->
 <script>
 
 
 
 </script> 	
  </body>
</html>