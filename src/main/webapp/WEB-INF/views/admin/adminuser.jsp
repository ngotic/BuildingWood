<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	    	
	   <div class="row">
        	
        <!-- Feature Unable /Disable Order Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                  	<h2 style="font-weight:900; margin-bottom:20px;">신규가입자 확인</h2>
                    <span style="font-size:20px;">최근 가입한 신규 가입자의 정보를 확인합니다.</span>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="display" id="basic-2">
                        <thead>
                          <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>소속빌딩</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>가입일시</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                         <tr>
                           <td>Tiger Nixon</td>
                           <td>System Architect</td>
                           <td>Edinburgh</td>
                           <td>61</td>
                           <td>2011/04/25</td>
                           <td>$320,800</td>
                           <td>61</td>
                           <td>2011/04/25</td>
                           <td>$320,800</td>
                         </tr>
                    

                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>	
        	
        	
      	 <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <!-- Zero Configuration  Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h2 style="font-weight:900; margin-bottom:20px;">이용자 관리</h2>
                    <span style="font-size:20px;">유저의 개인정보 확인 및 이용 제재를 합니다.</span>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive" style="overflow: auto">
                      <table class="display" id="basic-1">
                        <thead>
                          <tr>
                          	<th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>소속빌딩</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>&nbsp;등급&nbsp;</th>
                            <th>글수</th>
                            <th>댓글수</th>
                            <th>제재여부</th>
                            <th>제재하기</th>
                          </tr>
                          
                        </thead>
                        <tbody>
                        <c:forEach items="${ulist}" var="user">
                       	<tr>
                          	<td width="120">${fn:substring(user.id, 0,10)}</td>
                            <td>${user.name}</td>
                            <td>${user.nickname}</td>
                            <td>${user.buildingname}</td>
                            <td>${user.birth}</td>
                            <td>${user.gender}</td>
                            <td>${user.email}</td>
                            <td>${user.tel}</td>
                            <td>${user.lv}</td>
                            <td>${user.boardcnt}</td>
                            <td>${user.replycnt}</td>
                            <td>${user.ban}</td>
                            <c:if test="${user.ban=='아니요'}">
                            	<td><button onclick="banUser('${user.id}');">차단</button></td>
                            </c:if>
                            <c:if test="${user.ban=='예'}">
                            	<td><button onclick="recoveryUser('${user.id}');">복구</button></td>
                            </c:if>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
             </div>
             
             <!-- Todo: 신고기능 > Zero Configuration  Ends-->
             <!-- 
             <div class="row">
		 	 <div class="email-right-aside bookmark-tabcontent contacts-tabs">
                    <div class="card email-body radius-left">
                      <div class="ps-0">
                        <div class="tab-content">
                          <div class="tab-pane fade active show" id="pills-personal" role="tabpanel" aria-labelledby="pills-personal-tab">
                            <div class="card mb-0">
                              <div class="card-header d-flex">
                                <h2 style="font-weight:900;">신고가 들어온 이용자</h2><span class="f-14 pull-right mt-0">5 Contacts</span>
                              </div>
                              <div class="card-body p-0">
                                <div class="row list-persons" id="addcon">
                                  <div class="col-xl-4 xl-50 col-md-5 box-col-6">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical"><a class="contact-tab-0 nav-link active" id="v-pills-user-tab" data-bs-toggle="pill"  href="#v-pills-user" role="tab" aria-controls="v-pills-user" aria-selected="true">
                                    
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle update_img_0" src="../assets/images/user/2.png" alt="">
                                          <div class="media-body">
                                            <h6> <span class="first_name_0">Bucky </span><span class="last_name_0">Barnes</span></h6>
                                            <p class="email_add_0">barnes@gmail.com</p>
                                          </div>
                                        </div></a><a class="contact-tab-1 nav-link" id="v-pills-profile-tab" data-bs-toggle="pill"  href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                                         
                                        <div class="media"><img class="img-50 img-fluid m-r-20 rounded-circle update_img_1" src="../assets/images/user/8.jpg" alt="">
                                          <div class="media-body">
                                            <h6> <span class="first_name_1">Comeren </span><span class="last_name_1">Diaz</span></h6>
                                            <p class="email_add_1">comeren@gmail.com</p>
                                          </div>
                                        </div></a><a class="contact-tab-2 nav-link" id="v-pills-messages-tab" data-bs-toggle="pill"  href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                                        </a>
                                        </div>
                                  </div>
                                  
                                  
                                  <div class="col-xl-8 xl-50 col-md-7 box-col-6">
                                    <div class="tab-content" id="v-pills-tabContent">
                                    
                                    
                                      <div class="tab-pane contact-tab-0 tab-content-child fade show active" id="v-pills-user" role="tabpanel" aria-labelledby="v-pills-user-tab">
                                        <div class="profile-mail">
                                        
                                          <div class="media align-items-center"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_0" src="../assets/images/user/2.png" alt="">
                                            <input class="updateimg" type="file" name="img" onchange="readURL(this,0)">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_0">Bucky </span><span class="last_name_0">Barnes</span></h5>
                                              <p class="email_add_0">barnes@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="editContact(0)">제재</a></li>
                                                <li><a href="javascript:void(0)" onclick="deleteContact(0)">봐줌</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6 class="mb-3">인적사항</h6>
                                            <ul>
                                              <li>이름<span class="font-primary first_name_0">Bucky</span></li>
                                              <li>성별<span class="font-primary">Male</span></li>
                                              <li>생년월일<span class="font-primary"> <span class="birth_day_0">18</span><span class="birth_month_0 ms-1">May</span><span class="birth_year_0 ms-1">1994</span></span></li>
                                              <li>소속빌딩<span class="font-primary personality_0">Cool</span></li>
                                              <li>전화번호<span class="font-primary city_0">moline acres</span></li>
                                              <li>이메일<span class="font-primary mobile_num_0">+0 1800 76855</span></li>
                                              <li>신고한 사람<span class="font-primary url_add_0">www.test.com</span></li>
                                              <li>신고한 이유<span class="font-primary interest_0">photography</span></li>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>
                                      
                                      
                                      <div class="tab-pane contact-tab-1 tab-content-child fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                        <div class="profile-mail">
                                          <div class="media"><img class="img-100 img-fluid m-r-20 rounded-circle update_img_1" src="../assets/images/user/8.jpg" alt="">
                                            <input class="updateimg" type="file" name="img" onchange="readURL(this,1)">
                                            <div class="media-body mt-0">
                                              <h5><span class="first_name_1">Comeren </span><span class="last_name_1">Diaz</span></h5>
                                              <p class="email_add_1">comeren@gmail.com</p>
                                              <ul>
                                                <li><a href="javascript:void(0)" onclick="editContact(1)">Edit</a></li>
                                                <li><a href="javascript:void(0)" onclick="deleteContact(1)">Delete</a></li>
                                                <li><a href="javascript:void(0)" onclick="history(1)">History</a></li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="email-general">
                                            <h6 class="mb-3">General</h6>
                                            <ul>
                                              <li>Name <span class="font-primary first_name_1">Comeren</span></li>
                                              <li>Gender <span class="font-primary">Female</span></li>
                                              <li>Birthday<span class="font-primary"> <span class="birth_day_1">7</span><span class="birth_month_1 ms-1">Feb</span><span class="birth_year_1 ms-1">1995</span></span></li>
                                              <li>Personality<span class="font-primary personality_1">Cool</span></li>
                                              <li>City<span class="font-primary city_1">Delhi</span></li>
                                              <li>Mobile No<span class="font-primary mobile_num_1">+0 1800 55812</span></li>
                                              <li>Email Address <span class="font-primary email_add_1">comeren@gmail.com</span></li>
                                              <li>Website<span class="font-primary url_add_1">www.cometest@.com</span></li>
                                              <li>Interest<span class="font-primary interest_1">sports</span></li>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>
                                
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
             </div>
          </div> -->
         </div>
        </div>

		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
         <%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
    	
	   	 <!-- Sidebar jquery-->
	    <script src="/wood/adminasset/js/sidebar-menu.js"></script>
	    <script src="/wood/adminasset/js/config.js"></script>
	    <!-- Bootstrap js-->
	    
	    <!-- Plugins JS start-->
	   
	    <script src="/wood/adminasset/js/tooltip-init.js"></script>
	   
	    
	    <!-- feather icon js-->
	    <!-- <script src="/wood/adminasset/js/bootstrap/bootstrap.min.js"></script> -->
	    <script src="/wood/adminasset/js/icons/feather-icon/feather.min.js"></script>
	    <script src="/wood/adminasset/js/icons/feather-icon/feather-icon.js"></script>
	     <script src="/wood/adminasset/js/datatable/datatables/jquery.dataTables.min.js"></script>
	    <script src="/wood/adminasset/js/datatable/datatables/datatable.custom.js"></script>
	    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	    <!-- Sidebar jquery-->
	    <script src="/wood/adminasset/js/sidebar-menu.js"></script>
	    <script src="/wood/adminasset/js/config.js"></script>
	    <!-- Bootstrap js-->
	    <!-- Theme js-->
	    <script src="/wood/adminasset/js/script.js"></script>
	    
	    
	    <!-- Plugins JS Ends-->
 <script>
 
 

 
 
 function banUser(id){
	 
	 $.ajax({
		 type:'POST',
		 url: '/wood/admin/adminuserban.do',
		 data : {
			id : id
		 },
		 dataType: 'json',
		 success: (result)=> {
			 if(result.result == 1){
				new Swal('제재', '해당 유저를 제재하였습니다.','success').then(function() {
					location.href="/wood/admin/adminuser.do";
				});	
			 } else {
				 new Swal('제재', '실패하였습니다.','error').then(function() {
						location.href="/wood/admin/adminuser.do";
				 });	
			 }
		 },
		 error: (a, b, c) => console.log(a, b, c) 
	});
 }
 
 function recoveryUser(id){
	 
	 $.ajax({
		 type:'POST',
		 url: '/wood/admin/adminuserrecovery.do',
		 data : {
			id : id
		 },
		 dataType: 'json',
		 success: (result)=> {
			 if(result.result == 1){
				new Swal('복구', '해당 유저를 복구시켰습니다.','success').then(function() {
						location.href="/wood/admin/adminuser.do";
				});	
			 } else {
				new Swal('복구실패', '복구 실패','error').then(function() {
						location.href="/wood/admin/adminuser.do";
				});	
			 }
		 },
		 error: (a, b, c) => console.log(a, b, c) 
	  });
 }
 
 
 
 </script> 	
  </body>
</html>