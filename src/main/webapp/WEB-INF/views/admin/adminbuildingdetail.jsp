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
.banner-wrraper{

}
#map {
            width:   500px;
            height : 100%;
}
#buildingImg{
		height : 100%;
}
#imgmapholder{
	height : 410px;
}


</style>
</head>
        <!-- template.jsp > index.jsp -->
	    <%@ include file="/WEB-INF/views/admininclude/header.jsp" %>
	    
		
		<div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>건물상세</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/wood/admin/admin.do">관리자</a></li>
                    <li class="breadcrumb-item"><a href="/wood/admin/adminbuilding.do">건물정보관리</a></li>
                    <li class="breadcrumb-item active">건물상세</li>
                  </ol>
                </div>
   
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->


          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="blog-single">
                  <div class="blog-box blog-details">
                    <div class="card">
                      <div class="card-body">
                      	  <div class="banner-wrraper">
                    			<div id="imgmapholder" style="display:flex; flex-direction: row; justify-content: space-evenly; align-items:center;">
		                    		<img id="buildingImg" class="img" src="/wood/asset/img/buildingImg/${bdto.name}.jpg" alt="building-image">
		                    		<div id="map"></div>
                    			</div>
                  		  </div>
                      </div>
                      <div class="card-body pt-0">
                        <div class="blog-details">
                          <div class="single-blog-content-top ">
                            <p>빌딩전경 및 지도</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    
                <div class="card">
                  <div class="card-header pb-0">
                    <h5>건물정보</h5>
                  </div>
                  
                    <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="name">빌딩이름</label>
                            <input class="form-control" id="buildingseq" type="hidden" value="${bdto.buildingseq}">
                            <input class="form-control" id="name" type="text" value="${bdto.name}">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="dong">동</label>
                            <input class="form-control" id="dong" type="text" value="${bdto.dong}" readonly>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label class="form-label" for="address">주소</label>
                            <input class="form-control" id="address" type="button" value="${bdto.address}" onclick="sample5_execDaumPostcode();" style="text-align:left;">
                            
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                       		<label class="form-label" for="lat">위도</label>
                            <input class="form-control" id="lat" type="text"  value="${bdto.lat}">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                        	<label class="form-label" for="lng">경도</label>
                            <input class="form-control" id="lng" type="text" value="${bdto.lng}">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-end">
                      <button id="modiBtn" class="btn btn-primary">수정하기</button>
                      <input class="btn btn-light" type="reset" value="뒤로가기" onclick="location.href='/wood/admin/adminbuilding.do'">
                    </div>
                </div>
                
                  </div>
                  <div class="card comment-box">
                    <div class="card-body">
                      <h5  style="font-weight:bold; margin-bottom:20px;">${bdto.name}엔 이런 분들이 계세요~! </h5>
                      
                      <ul>
                       <c:forEach items="${mlist}" var="mdto">
                        <li>
                          <div class="media align-self-center">
                          <img class="align-self-center mr-0" style="width:40px;height:40px; padding :2px; object-fit: cover; margin-right:20px;" src="/wood/asset/img/profile.jpg">
                            <div class="media-body">
                              <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-md-10">
                                <a href="#">
                                    <h6 class="mb-0"><span style="font-size:16px;">( ${mdto.nickname} )</span> 이메일(${mdto.email}) | 전화번호(${mdto.tel}) | 생년월일(${mdto.birth})</h6>
                                </a>
                                </div>
                                <div class="col-md-2 " style="font-size:16px; color: #777; font-weight:bold;">
                                  <ul class="comment-social">
                                    <li>게시글 ( ${mdto.boardcnt})개</li>
                                  </ul>
                                  <ul class="comment-social">
                                    <li>댓글 ( ${mdto.replycnt})개</li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                         </c:forEach>
                        
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid Ends-->
	
         <%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ef66b24f93bbb959f9b59dc1f2b78a&libraries=services"></script>
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
	    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	    <!-- Plugins JS Ends-->

 <script>
 
 $('#modiBtn').click(function(){

	 let buildingseq = $('#buildingseq').val();
	 let name = $('#name').val();
	 let address = $('#address').val();
	 let blat = $('#lat').val();
	 let blng = $('#lng').val();
	 $.ajax({
		 type:'POST',
		 url: '/wood/admin/adminbuildingdetail.do',
		 data : {
			buildingseq : buildingseq,
			name : name ,
			address: address,
			lat : blat,
			lng : blng
		 },
		 dataType: 'json',
		 success: (result)=> {
			 if(result.result == 1){
				new Swal('건물정보', '정보가 수정되었습니다.','success').then(function() {
						location.href="/wood/admin/adminbuilding.do";
				});	
			 } else {
				 new Swal('건물정보', '변경이 실패하였습니다.','error');
			 }
			 
		 },
		 error: (a, b, c) => console.log(a, b, c) 
 	});
 });	 
	 

 var geocoder = new daum.maps.services.Geocoder();
 
 function sample5_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             var addr = data.address; // 최종 주소 변수
             // 주소 정보를 해당 필드에 넣는다.
             document.getElementById("address").value = addr;
             geocoder.addressSearch(data.address, function(results, status) {
                 // 정상적으로 검색이 완료됐으면
                 if (status === daum.maps.services.Status.OK) {
                     var result = results[0]; //첫번째 결과의 값을 활용
					 // alert(result.y+", "+result.x);
                     // 해당 주소에 대한 좌표를 받아서
                     // var coords = new daum.maps.LatLng(result.y, result.x);
                     $('#lat').val(result.y);
                     $('#lng').val(result.x);
                 }
             }); 
         }
     }).open();
 }
 
 var container = document.getElementById('map');
 
 let lat = '${bdto.lat}';
 let lng = '${bdto.lng}';
 
 const point = new kakao.maps.LatLng(lat, lng);
 
 var options = {
		 
			// center: new kakao.maps.LatLng(33.450701, 126.570667), 
        center: point, 
         // 위도와 경도다. 제주도 본사임 
         // level은 확대 수준이다. 
		level: 1 // 1로 주면 확대로 크게 나온다. 최소가 13이나 14 레벨정도 있다.
 };
 
 var map = new kakao.maps.Map(container, options); 

//map.setCenter(point); // 이동하는 메서드가 하나 더 있다. 
map.panTo(point); // panTo는 이동하는 메서드다.
 
const marker = new kakao.maps.Marker({
     position : point
});

marker.setMap(map);
 
 </script> 	
  </body>
</html>