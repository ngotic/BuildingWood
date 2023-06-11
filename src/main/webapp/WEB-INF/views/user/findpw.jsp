<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  		.mainbackground{
             height: 100%; 
            /* width: 100vw; */
            background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4) ),url(/wood/asset/img/고화질메인배경.jpg);
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

        :root {
            --main-color : #EF151E;
        }
        .findpw_container{
            font-family: Pretendard-Regular;
            width: 600px;
            height: 100vh; 
            padding: 50px;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items:center;
            margin:auto;
        }

        .findpw_input{ 
        	/* position: relative; */
            font-size: 14px;
            padding: 6px;
            border: 1px solid #777;
            width: 500px;
            margin: 5px;
            /* outline: none; */
            border-radius: 5px;
            font-weight: bold;
        }
        .findpw_input.default_btn{
            border: 1px solid #00CD3C;;
            color: white;
            background-color: #00CD3C;
            border-radius: 5px;
            font-weight: bold;
        }
		
		  .findpw_input.authnum_btn{
            border: 1px solid #AAAAAA;
            color: white;
            background-color: #AAAAAA;
            border-radius: 5px;
            font-weight: bold;
        }
        

        .findpw_input.authnum_btn:hover{
            box-sizing: border-box;
            border: 1px solid #AAAAAA;
            color: #AAAAAA;
            background-color :white; 
            border-radius: 5px;
            font-weight: bold;
        }
		
        .findpw_input.register_btn{
            border: 1px solid #4285F4;;
            color: white;
            background-color: #4285F4;
            border-radius: 5px;
            font-weight: bold;
        }
        .findpw_input.register_btn:hover{

            box-sizing: border-box;
            border: 1px solid #4285F4;
            color: #4285F4;
            background-color :white; 
            border-radius: 5px;
            font-weight: bold;
        }

        .findpw_input.default_btn:hover{
            box-sizing: border-box;
            border: 1px solid #00CD3C;;
            color: #00CD3C;;
            background-color :white; 
            border-radius: 5px;
            font-weight: bold;
        }

        .findpw_input.google_btn{
            border: 1px solid #999;
            color: #777;
            background-color: white;
            border-radius: 5px;
        }
        .findpw_input.naver_btn {
            border: 1px solid #999;
            color: #777;
            background-color: white;
            border-radius: 5px;
        }

        .findpw_input.google_btn:hover{
            border: 1px solid #eee;
            color: #555;
            background-color: #eee;
            border-radius: 5px;
        }
        .findpw_input.naver_btn:hover{
            border: 1px solid #eee;
            color: #555;
            background-color: #eee;
            border-radius: 5px;
        }
        .block_title{ 
            margin-bottom: 0px;
        }
        .findpw_container .register_link_text{
            font-size: 14px;
            margin : 3px 0 3px 0;
            width: 100%;
        }
        .form-label{
            font-weight: bold;
            color: #333;
            margin-bottom: 0px;
            margin-top: 0.5rem;
        }
        .findpw_container div{
        	font-size:12px;
        }
        .error{
        	color: #E64033;
        } 
        #year-error{
        	display:block;
        	transform: translate(50px,100px);
        }
         .success{
         	border:1px solid #26D459;
        } 
        
</style>
</head>
<body>
    <section class="mainbackground">
            <div class="findpw_container">
                <div>
                	<div class="block_title d-flex justify-content-center mb-2 mt-10">
                    	<img src="/wood/asset/img/logo.png" width=100>
                    </div>
                     <p style="font-size: 26px; font-weight: bold; text-align:center;">비밀번호 변경!</p>
                </div>
               <form id="form1" action="" method="POST">
	                <div>
	                    <label for="id" class="form-label">아이디*</label>
	                    <input type="text" class="findpw_input" id="id" name="id" placeholder="아이디를 입력해주세요.">
	                </div>
	                <div>
	                    <label for="email" class="form-label">이메일*</label>
	                    <input type="text"  class="findpw_input" id="email" name="email" placeholder="이메일을 입력해주세요.">
	                </div>
					 <div>
                    <button class="findpw_input authnum_btn" >인증메일받기</button>
                    <div>
	                    <label for="email" class="form-label">인증번호*</label>
	                    <input type="text" class="mb-3 findpw_input" id="authnum" name="authnum" placeholder="인증번호를 입력하세요.">
	                </div>
                </div> 
	
                </form>
               
                <div>
                    <button class="findpw_input register_btn" id="findpw_btn" type="button">비밀번호 변경!</button>
                </div>
                <div>
                    <button class="findpw_input default_btn" >로그인</button>
                </div> 
            </div>
    </section>	

	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
	
<script>
$(document).ready(function(){
	// alert($('#building_select').val());
	// id 중복 체크
	
	
	$("#form1").validate({
		validClass: "success",
        rules: {
        	id : {
                required: true,
                remote : {
                	url:"/wood/user/checkid.do",
                	type:"post",
                	data: {
                		id: function(){
                			return $("#id").val();
                		},
                		flip : 1
                	}
                }
            },
            email: {
                required: true,
                email: true,
            	remote : {
                	url:"/wood/user/checkidandemail.do",
                	type:"post",
                	data: {
                		id: function(){
                			return $("#id").val()
                		}, email: function(){
                			return $("#email").val()
                		}
                	}
                }
            }
        },
        messages: {
        	id: {
                required: "아이디는 필수 입력입니다.",
                remote : "아이디가 일치하지 않습니다."
            },
            email: {
                required: "이메일은 필수 입력입니다.",
                email: "이메일 형식을 확인하세요.",
            	remote : "이메일이 일치하지 않습니다."
            }
        },
        submitHandler: function(form) {
        	
        	const formData = new FormData(document.getElementById('form1'));
        	
        	new Swal('인증', '인증번호가 발송됩니다.','success');
        	
        	$.ajax({
    			type: 'POST',
    			url : '/wood/user/authnum.do',
    			dataType: 'json',
    			data: {
    				email: $('#email').val()
    			},
    			success: (result) => {
    				if(result.result == 1){
    					$.time(179);
    				}  else {
    					new Swal('인증번호 발송실패', '인증메일을 확인하세요.','error');
    				}
    			},
    			error : (a, b, c)=> console.log(a, b, c) 				
    		});   
        }
	});
	
	$('.default_btn').click(function(){
		location.href = "/wood/index.do";
	});
	
	let countTime = 0;
    let intervalCall=0;

    $.time = function(time){
        countTime = time;
        if(intervalCall==0) {
        	intervalCall = setInterval(alertFunc, 1000);
        }
    }

    $.closeTime = function(){
        clearInterval(intervalCall);
    }

    function alertFunc() {
        let min = Math.floor(countTime/60);
        let sec = countTime - (60 * min);
        if(sec > 9){
        	$('#authnum').attr('placeholder', min + ':' + sec + '');
        }else {
            $('#authnum').attr('placeholder', min + ':0' + sec + '');
        }
        if(countTime <= 0){
            clearInterval(intervalCall);
        }
        countTime--;
    };
    
    
	 $('#findpw_btn').on("click",function(){
		 	$.ajax({
    			type: 'GET',
    			url : '/wood/user/authnum.do',
    			dataType: 'json',
    			data: {
    				authnum: $('#authnum').val()
    			},
    			success: (result) => {
    				if(result.result == 1){
    					location.href="/wood/user/changepw.do?authnum="+$('#authnum').val()+"&email="+$('#email').val();
    				}  else {
    					new Swal('비정상 접근', '인증메일을 통해 접근해주세요.','error').then(function() {
    						location.href="/wood/user/findpw.do";
    					});
    					
    					
    					
    				}
    			},
    			error : (a, b, c)=> console.log(a, b, c) 				
    		});  
	 }); 
	
    
    
    // 버튼을 누르면 3분 카운트 다운...
	
});	

</script>
</body>
</html>