<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.mainbackground {
	height: 100%;
	background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4)),
		url(/wood/asset/img/고화질메인배경.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	opacity: 0.85;
	display: flex;
	font-weight: bold;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	font-weight: 700;
	font-style: normal;
}

.register_container {
	font-family: Pretendard-Regular;
	height: 100vh; 
	width: 600px;
	padding: 50px;
	background-color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
}

.register_input {
	font-size: 14px;
	padding: 6px;
	border: 1px solid #777;
	width: 500px;
	margin: 5px;
	border-radius: 5px;
	font-weight: bold;
}

.register_input.default_btn {
	border: 1px solid #00CD3C;;
	color: white;
	background-color: #00CD3C;
	border-radius: 5px;
	font-weight: bold;
}

.register_input.register_btn {
	border: 1px solid #4285F4;;
	color: white;
	background-color: #4285F4;
	border-radius: 5px;
	font-weight: bold;
}

.register_input.register_btn:hover {
	box-sizing: border-box;
	border: 1px solid #4285F4;
	color: #4285F4;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
}

.register_input.default_btn:hover {
	box-sizing: border-box;
	border: 1px solid #00CD3C;;
	color: #00CD3C;;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
}

.register_input.google_btn {
	border: 1px solid #999;
	color: #777;
	background-color: white;
	border-radius: 5px;
}

.register_input.naver_btn {
	border: 1px solid #999;
	color: #777;
	background-color: white;
	border-radius: 5px;
}

.register_input.google_btn:hover {
	border: 1px solid #eee;
	color: #555;
	background-color: #eee;
	border-radius: 5px;
}

.register_input.naver_btn:hover {
	border: 1px solid #eee;
	color: #555;
	background-color: #eee;
	border-radius: 5px;
}

.block_title {
	margin-bottom: 0px;
}

.register_container .register_link_text {
	font-size: 14px;
	margin: 3px 0 3px 0;
	width: 100%;
}

.form-label {
	font-weight: bold;
	color: #333;
	margin-bottom: 0px;
	margin-top: 0.5rem;
}

.register_container div {
	font-size: 12px;
}

.error {
	color: red;
}

</style>
</head>
<body>
	<section class="mainbackground">
		<div class="register_container">
			<div>
				<div class="block_title d-flex justify-content-center mb-2 mt-10">
					<img src="/wood/asset/img/logo.png" width=100>
				</div>
				<p style="font-size: 26px; font-weight: bold; text-align: center;">함께해요!</p>
				<p style="font-size: 20px; font-weight: bold; text-align: center;">나머지
					정보도 채워주세요!</p>
			</div>
			<form id="form1" action="/wood/user/socialregister.do" method="POST">

				<div class="mb-1">
					<label for="nickname" class="form-label">닉네임*</label> <input
						type="text" class="register_input" id="nickname" name="nickname"
						placeholder="닉네임을 입력해주세요.">
				</div>

				<div class="form-group">
					<label for="my_year">생년월일*</label>
					<div class="input-group ms-1"
						style="display: flex; flex-direction: row">

						<input type="number" min=1900 class="col-md-4" name="year"
							value="2000" id="year" maxlength="4" placeholder="년도"
							style="width: 150px; height: 30px; border-radius: 5px 0 0 5px; text-align: center; font-size: 14px; outline: none;">
						<label class="input-group-text" for="year" style="height: 30px; ">년</label> <select
							name="month" id="month" class="custom-select"
							style="width: 120px; text-align: center; font-size: 14px;">
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> <label class="input-group-text" for="month" style="height: 30px;">월</label> <select
							name="day" id="day" class="custom-select"
							style="width: 120px; text-align: center; font-size: 14px;">
							<option value="1" selected="selected">1</option>
							<c:forEach var="i" begin="2" end="31" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> <label class="input-group-text" for="day" style="height: 30px;">일</label>
					</div>
				</div>

				<div class="register_link_text mb-1" style="float: left;">
					<label class="form-label">성별*</label>
					<div>
						<input class="align-middle" type="radio" name="gender" value="M" id="gender"
							checked id="man"><label for="man">남자</label> <input
							class="align-middle" type="radio" name="gender" value="F"
							id="woman"><label for="woman">여자</label>
					</div>
				</div>

				<select class="register_input form-select mt-2" id="building_select"
					name='building'>
					<option value="0" selected>빌딩선택*</option>
					<c:forEach var="dto" items="${buildinglist}">
						<option value="${dto.buildingseq}">${dto.building}</option>
					</c:forEach>
				</select>

				<div>
					<label for="tel" class="form-label">전화번호*</label> <input
						type="text" class="register_input" id="tel" name="tel"
						placeholder="전화번호를 입력해주세요.">
				</div>
				
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" id="email" value="${email}">
				<input type="hidden" id="name" value="${name}">
				<input type="hidden" id="profile" value="${profile}">
			</form>

			<div class="register_link_text mb-3">
				<input type="checkbox" class="custom-control-input" id="agree"
					name="agree" required> <label class="custom-control-label"
					for="agree">개인정보 수집 및 이용에 동의합니다.</label>
			</div>

			<div>
				<button class="register_input register_btn" id="register_btn"
					type="button">회원가입</button>
			</div>
			<div>
				<button class="register_input default_btn">로그인</button>
			</div>
			
		</div>
	</section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>

	<script>
	$(document).ready(function(){
		// id 중복 체크
		$("#form1").validate({
	        rules: {
	            nickname: {
	            	required: true,
	            	remote : {
	                	url:"/wood/user/checknickname.do",
	                	type:"post",
	                	data: {
	                		nickname: function(){
	                			return $("#nickname").val();
	                		}
	                	}
	                }
	            },
	            tel : {
	            	required: true,
	            	phone:true
	            },
	            agree: "required" 
	        },
	        messages: {
	            nickname: {
	            	required: "닉네임은 필수 입력입니다.",
	            	remote : "이미 사용중입니다."
	            },
	            tel: { 
					required: "연락처를 입력하세요.",
					phone: "형식이 잘못되었습니다. 000-0000-0000 형식입니다."
				},
				agree: "약관 동의에 체크해주세요."
	        },
	        submitHandler: function(form){
	        	
	        	if( $('#agree')[0].checked == false){
					alert('약관에 동의해주세요.');
					return;
	        	}
	        	if( $('#building_select').val()==0 ){
	        		alert('빌딩을 선택해주세요.');
					return;
	        	} 
	        	
	        	$.ajax({
	    			type: 'POST',
	    			url : '/wood/user/socialregister.do',
	    			dataType: 'json',
	    			data: {
	    				id: $('#id').val(),
	    				pw:"xxxxxxxxxx",
	    				name: $('#name').val(),
	    				gender : $('#gender').val(),
	    				nickname : $('#nickname').val(),
	    				year : $('#year').val(),
	    				month : $('#month').val(),
	    				day : $('#day').val(),
	    				email : $('#email').val(),
	    				tel : $('#tel').val(),
	    				profile : $('#profile').val(),
	    				building : $('#building_select').val()
	    			},
	    			success: (result) => {
	    				if(result.result == 1){
	    					new Swal('회원가입 성공', '메인 페이지로 이동합니다.','success').then(function() {
	    						location.href="/wood/index.do";
	    					});
	    					
	    				}  else {
	    					new Swal('회원가입 실패', '회원가입이 실패하였습니다.','error').then(function() {
	    						location.href="/wood/user/login.do";
	    					});
	    					
	    				}
	    			},
	    			error : (a, b, c)=> console.log(a, b, c) 				
	    		});  
	            
	        }
	    });
		
		
		$.validator.addMethod("phone", function(phone_number, element) {
			phone_number = phone_number.replace(/\s+/g, ""); 
			return this.optional(element) || phone_number.length > 9 &&
				phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
		}, "형식이 잘못되었습니다. 000-0000-0000 형식입니다.");
		
		$('#register_btn').click(function(){
			$("#form1").submit();
		});
	
		$('.default_btn').click(function(){
			location.href = "/wood/index.do";
		});
	});
</script>
</body>
</html>