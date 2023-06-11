<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp"%>
<head>
<style>

	
	
	.profile-title {
		border-bottom: none;
	}


	.media {
		margin-top: 20px;
		margin-bottom: 20px;
	}

	.media > img {
		width: 210px;
		height: 210px;
		margin: 0 auto;
	}
	
	.page-body {
	 			display:flex;
		justify-content:center;
		align-items:center;
	
	}
	
	
	.edit-profile {
 			display:flex;
		justify-content:center;
		align-items:center;
	}
	


	.card {
		width:580px;
		border-radius:10px;
		margin-left: 20px;
		margin-right:20px;
	}
	
	.card-body {
		border-radius: 10px;
	}
	
	.card-header {
		border-radius: 10px;
		text-align:center;
		padding: 10px;
		margin-top: 20px;
	}
	
	.form-label {
		margin-left: 5px;
	}
	
	.form-control {
		margin-bottom:15px;
	}
	
	.form-footer {
		margin-top:10px;
	}
	
	.span {
		background-color: #bebebe;
		color: white;
		padding: 7px;
		border-radius: 15px;
	}
	
	.building {
		font-weight:bold;
	}
	

	
	




</style>
</head>
<!-- template.jsp > index.jsp -->
<%@ include file="/WEB-INF/views/admininclude/header.jsp"%>



<div class="container-fluid">
	

	    <div class="edit-profile">
	   			<div class="profile-block">
	   			
	   			
	   			
	   			
	   				<div class="card" style="width: 600px; height:350px;margin-bottom:40px;">
	              		<div class="card-body">
	                       
	                            <div class="row mb-2">
	                                <div>
	                                	<div style="margin-bottom:10px;">
	                                		<span class="span" style="font-size:16px">My Profile</span>
	                                	</div>
			                            <div class="row mb-2">
			                                <div>
			                                    <div class="media">
			                                        <img class="rounded-circle" alt="" src="/wood/asset/profilepic_ah/${dto.profile }">
			                                    </div>
			                                </div>
			                            </div>

	                                </div>
	                            </div>
	                        
	                     </div>
	              	</div>
	   			
	   			
	   			
	   			
	   			
	   			
	   			
	    			<div class="card" style="width: 600px; height:380px;">
	              		<div class="card-body">
	  
	                            <div class="row mb-2">
	                                <div>
	                                	<div style="margin-bottom:10px;">
	                                		<span class="span" style="font-size:16px">My Building</span>
	                                	</div>
	                                    <div class="media" >
	                                        <img style="width:300px; height:200px; border-radius:10px; box-shadow: 5px 5px 5px #e2e2e2; margin-top:5px; margin-bottom:5px;" alt="" src="/wood/asset/img/포스코타워 역삼.png">
	                                    </div>
	                                    <div style="text-align:center;">
	                                    	<span class="building">${dto.bname } </span>
	                                    	<span> : ${dto.baddress }</span>
	                                    </div>
	                                </div>
	                            </div>
	                        
	                     </div>
	              	</div>
	              	
	

	            </div>
	            
	            
	                <div class="card" style="width: 650px;height: 780px;">
	                    <div class="card-header pb-0">
	                        <h4 class="card-title mb-0">이용자 정보</h4>
	                    </div>
	                    
	                    <div class="card-body">
	                        
<form method="POST" action="/wood/mypage/mypage.do" enctype="multipart/form-data">
								<div class="mb-3">
	                                <label class="form-label">프로필사진</label>
	                                <input type="file" class="form-control" name="pic">
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">이름</label>
	                                <input class="form-control" type="text" value="${dto.name }" name="name">
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">닉네임</label>
	                                <input class="form-control" type="text" value="${dto.nickname }" name="nickname">
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">아이디</label>
	                                <input class="form-control" type="text" value="${dto.id }" readonly>
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">Password</label>
	                                <input class="form-control" type="password" value="${dto.password }" readonly>
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">전화번호</label>
	                                <input class="form-control" type="text" value="${dto.tel }" readonly>
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">이메일</label>
	                                <input class="form-control" type="text" value="${dto.email }" readonly>
	                            </div>
	                            <div class="form-footer" style="float:right;">
	                                <button type="submit" class="btn btn-primary btn-block">수정</button>
	                            </div>
</form>	                        
	                    </div>
	                </div>

	     </div>
	            
		</div>
	
	

	
	
	




<%@ include file="/WEB-INF/views/admininclude/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
let msg = "${msg}";


if (msg == "editfail") 
	new Swal('정보 수정 실패','동일한 닉네임이 있습니다.', 'fail');

</script>



</body>
</html>