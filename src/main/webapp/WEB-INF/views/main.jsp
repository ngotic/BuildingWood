<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
.mainbackground {
	height: 100vh;
	width: 100vw;
	background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4)),
		url(/wood/asset/img/고화질메인배경.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	opacity: 0.9;
	display: flex;
	font-weight: bold;
}

.login_container {
	font-family: Pretendard-Regular;
	width: 400px;
	height: 100vh;
	padding: 50px;
	background-color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.login_input {
	font-size: 14px;
	padding: 6px;
	border: 1px solid #777;
	width: 300px;
	margin: 5px;
	/* outline: none; */
	border-radius: 5px;
	font-weight: bold;
}

.login_input.default_btn {
	border: 1px solid #00CD3C;;
	color: white;
	background-color: #00CD3C;
	border-radius: 5px;
	font-weight: bold;
}

.login_input.default_btn:hover {
	box-sizing: border-box;
	border: 1px solid #00CD3C;;
	color: #00CD3C;;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
}

.login_input.google_btn {
	border: 1px solid #999;
	color: #777;
	background-color: white;
	border-radius: 5px;
}

.login_input.naver_btn {
	border: 1px solid #999;
	color: #777;
	background-color: white;
	border-radius: 5px;
}

.login_input.google_btn:hover {
	border: 1px solid #eee;
	color: #555;
	background-color: #eee;
	border-radius: 5px;
}

.login_input.naver_btn:hover {
	border: 1px solid #eee;
	color: #555;
	background-color: #eee;
	border-radius: 5px;
}

.block_title {
	margin-bottom: 0px;
}

.login_container .login_link_text {
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

.homeintro {
	font-size: 68px;
	width: 100%;
	align-items: center;
	text-align: center;
	position: relative;
}

.intro-text {
	width: 800px;
	color: white;
	height: 50px;
	/* 상하좌우 정중앙 정렬하기 */
	position: absolute;
	top: 20%;
	left: 50%;
	transform: translate(-50%, 0);
	font-weight: bold;
}

#naverlogo {
	border: 1px solid #00CD3C;
	border-radius: 50%;
}

.login_link_text input[type="checkbox"] {
	position: relative;
	top: 2px;
}

.projectname_f {
	font-size: 68px;
}

.projectname {
	font-size: 100px;
}

.projectname_sub {
	font-size: 80px;
}

.typing-text {
	color: white;
	animation: blink .5s, typing1 1s steps(20);
	animation-iteration-count: 1; /* 반복 횟수 */
	animation-fill-mode: forwards;
	width: 0;
	white-space: nowrap;
	overflow: hidden;
}

.typing-text2 {
	color: white;
	animation: blink .5s, typing2 1s steps(19);
	animation-iteration-count: 1; /* 반복 횟수 */
	animation-fill-mode: forwards;
	width: 100px;
	white-space: nowrap;
	overflow: hidden;
}

@keyframes blink { 50% {
	border-color: transparent;
}

}
@keyframes typing1 {from { width:0;
	
}

to {
	width: 800px;
}

}
@keyframes typing2 {from { width:100px;
	
}

to {
	width: 800px;
}

}
.typing-text3 {
	color: white;
	animation: appear 1.2s;
	animation-iteration-count: 1; /* 반복 횟수 */
	animation-fill-mode: forwards;
	white-space: nowrap;
}

@keyframes appear {from { opacity:0.1;
	
}

to {
	opacity: 1;
}

}
a.link-hover span {
	color: #FF6060;
	text-decoration: none;
}

a.link-hover span:hover {
	color: #962D2D;
	text-decoration: none;
}
</style>
</head>
<body>

	<!--  -->
	<section class="mainbackground">
		<div class="homeintro">
			<div class="intro-text">
				<!-- 여기에 문구가 추가됨 -->
			</div>
		</div>
		<div class="login_container">
			<div class="block_title d-flex justify-content-center mb-1">
				<img src="/wood/asset/img/logo.png" width="70%">
			</div>
			<form id="form1" action="/wood/user/login.do" method="POST">
				<div>
					<label for="formIdInput" class="form-label">아이디</label> <input
						type="text" class="login_input" id="formIdInput" name="id"
						placeholder="아이디를 입력해주세요." value="${cookie.id.value}" required>
				</div>
				<div>
					<label for="formPwInput" class="form-label">비밀번호</label> <input
						type="password" class="login_input" id="formPwInput"
						name="password" placeholder="비밀번호를 입력해주세요." required>
				</div>

				<div class="login_link_text mt-2 mb-1" style="float: left;">
					<input type="checkbox" name="remember" id="remember"
						${empty cookie.id.value ? "":"checked"}> <label
						for="remember">아이디 기억</label> <a href="/wood/user/findpw.do"
						style="text-decoration: none;" class="link-hover"> <span
						style="float: right;">비밀번호가 기억이 안나요?</span>
					</a>
				</div>
			</form>
			<div class="login_link_text mb-4">
				<span>계정이 없나요?</span> <a href="/wood/user/register.do"
					class="me-2 link-hover"> <span style="float: right;">회원가입</span>
				</a>
			</div>

			<div>
				<button class="login_input default_btn">로그인</button>
			</div>
			<div>
				<button class="login_input google_btn">
					<img src="/wood/asset/img/googlelogo.png" height="20"
						style="margin-right: 5px;">구글 로그인
				</button>
			</div>
			<div>
				<button class="login_input naver_btn">
					<img src="/wood/asset/img/naverlogo.png" id="naverlogo" height="25"
						style="margin-right: 5px;">네이버 로그인
				</button>
			</div>

			<div>
				<h4>아래 버튼은 테스트 용도</h4>
				<!-- 버튼하나 눌러버리면 hidden 태그에 담긴 것이 서버로 넘어가서 로그인이 된다.  -->
				<form method="POST" action="/wood/user/login.do">
					<input type="hidden" name="id" value="owFSkN242"> <input
						type="hidden" name="password" value="OIQetu252"> <input
						type="submit" value="일반유저">
				</form>

				<form method="POST" action="/wood/user/login.do">
					<input type="hidden" name="id" value="admin"> <input
						type="hidden" name="password" value="0000"> <input
						type="submit" value="관리자">
				</form>

				<a class="dropdown-item" href="/wood/user/logout.do">로그아웃</a>
			</div>
		</div>


	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	<script>
	
	let msg  = "${msg}";
	
	if ( msg == "LOGIN_ERR") 
		new Swal('로그인 실패', '아이디나 비밀번호가 틀렸습니다.','error');
	
	 function formCheck(){
		let id = $('#formIdInput');
		if( id.val()=='' ) { 
			alert("아이디를 입력해 주세요.");
			id.focus();
			return false;
		}
		let pw = $('#formPwInput');
		if( pw.val()=='' ) { 
			alert("비밀번호를 입력해 주세요.");
			pw.focus();
			return false;
		}	
		return true;
	}
	
	$('.default_btn').click(function(){
		if(formCheck())
			$('#form1').submit();
	});
	
	$('.google_btn').click(function(){
		location.href = "${googleUrl}";
	});
	
	$('.naver_btn').click(function(){
		location.href = "${naverUrl}";
	});
	
    const text = [ `<p class="projectname_f typing-text">&nbsp가까운 이웃들을 연결하는</p>`,
     `<p class='projectname_sub typing-text2'>&nbsp;새로운 소셜 네트워크</p>`,
     `<p class='projectname typing-text3'>빌딩숲.</p>`];

    let i = 0;

    const printString = (i, callback) => {
    setTimeout(
        () => {
            $('.intro-text').append(text[i]);
            callback(); //setTimeout 내에서 순차적 콜백 실행
        }, 
        1000
      )
    }

    const printAll = () => {
        printString(i, () => { 
            printString(i+1, () => { 
                printString(i+2, () => {}) 
            })
        })
    } 
    
	printAll();
</script>
</body>
</html>
</html>
