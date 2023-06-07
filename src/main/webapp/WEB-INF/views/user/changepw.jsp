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
               <form id="form1" action="/wood/user/changepw.do" method="POST">
	                <div class="row">
	                	<div class="col">
		                    <label for="pw" class="form-label">새 비밀번호*</label> 
		                    <input type="password" class="findpw_input is-valid" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		                    <div class="valid-feedback"></div>
	                    </div>
	                    <div class="col">
		                    <label for="pwcheck" class="form-label">새 비밀번호 확인*</label>
		                    <input type="password" class="findpw_input is-valid mb-3" id="pwcheck" name="pwcheck" placeholder="비밀번호를 한번 더 입력해주세요.">
		                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
	                    </div>
	                </div>
           			<input type="hidden" name="email" id="email" value="${email}">
           			<input type="hidden" name="authnum" id="authnum" value="${authnum}">
                </form>
               
                <div>
                    <button class="findpw_input register_btn" id="findpw_btn" type="button">비밀번호 변경!</button>
                </div>
            </div>
    </section>	

	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
	
<script>
$(document).ready(function(){
	
	$("#form1").validate({
	        rules: {
	            pw : {
	            	required: true,
	            	minlength: 8
	            },
	            pwcheck : {
	            	required: true,
	                minlength: 8,
	                equalTo: "#pw"
	            } 
	        },
	        messages: {
	            pw: {
	                required: "암호를 입력해 주세요",
	                minlength: "암호는 8자 이상이어야 합니다."
	            },
	            pwcheck : {
	                required: "암호를 한 번 더 입력해 주세요",
	                minlength: "암호는 8자 이상이어야 합니다.",
	                equalTo: "암호가 일치하지 않습니다."
	            }
	        },
	        submitHandler: function(form){
	        	// 비밀번호 변경 ajax처리
	    	  	$.ajax({
	    			type: 'POST',
	    			url : '/wood/user/changepw.do',
	    			dataType: 'json',
	    			data: {
	    				authnum: $('#authnum').val(),
	    				email: $('#email').val(),
	    				pw: $('#pw').val()
	    			},
	    			success: (result) => {
	    				if(result.result == 1){
	    					new Swal('성공', '비밀번호 변경에 성공하였습니다. 다시 로그인해주세요.','success').then(function() {
	    						location.href = "/wood/index.do";
	    					});
	    				}  else {
	    					new Swal('실패', '비밀번호 변경에 실패하였습니다.','error').then(function() {
	    						location.href = "/wood/index.do";
	    					});
	    				}
	    			},
	    			error : (a, b, c)=> console.log(a, b, c) 				
	    		});  
	        	
	        }
	    });
		
	$('#findpw_btn').click(function(e){
		$("#form1").submit();
		e.preventDefault();
	});
});	

</script>
</body>
</html>