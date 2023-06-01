<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	   .navbar-menu .nav-item:hover{
        border-bottom: 3px solid #7ED321;
        background-color: #eee;
    }

	.dropdown-menu.show {
    	width:95%;
		border-radius: 0px;
	}
	#navbar {
		display: flex;
		justify-content: space-between;
	}
	a .icon-color:hover {
        color : #FF5B5B;
    }
    .icon-color {
        color : #FF5B5B;
    }
	
</style>
<body>
<header class="header-area navbar-fade" id="header">
		<nav id="navbar">
			<div id="brand-logo">
				<a class="navbar-brand" id="navbarBrand"><img width=60px src="asset/img/logo.png"></a>
			</div>
			<a class="navbar-toggler" id="toggleBtn"><i class="fa fa-bars"></i></a>
			<div class="navbar-menu" id="menu">
				<!-- <div class="nav-item dropdown"><a href = "#" class="nav-link">홈</a></div> -->
                <div class="nav-item"><a href = "" class="nav-link" >SNS</a></div>
				<div class="nav-item"><a href = "" class="nav-link" >카풀</a></div>
				<!-- <div class="nav-item"><a href = "" class="nav-link" >스터디/과외</a></div> -->
				<div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                        스터디/과외
                    </a>
                    <ul class="dropdown-menu">
						<li><a class="dropdown-item" href="">스터디게시판</a></li>
						<li><a class="dropdown-item" href="">과외게시판</a></li>
                    </ul>
                </div>

				<!-- <div class="nav-item"><a href = "" class="nav-link" >약속/동호회/맛집</a></div>  -->
				<div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true" >
                        약속/동호회/맛집
                    </a>
                    <ul class="dropdown-menu" >
                        <li><a class="dropdown-item" href="">약속게시판</a></li>
						<li><a class="dropdown-item" href="">동호회게시판</a></li>
						<li><a class="dropdown-item" href="">맛집게시판</a></li>
						        
                    </ul>
                </div>

				<div class="nav-item"><a href = "" class="nav-link" >고객지원</a></div> 
				<!-- <div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                        고객지원
                    </a>
                    <ul class="dropdown-menu">
						<li><a class="dropdown-item" href="">공지사항</a></li>  
						<li><a class="dropdown-item" href="">건의게시판</a></li>        
                    </ul>
                </div>  -->

				<div class="nav-item"><a href = "" class="nav-link" >회원가입</a></div>
                <div class="nav-item" >
                    <a href = "" class="nav-link" id="">
                         로그인
						 <span class="material-symbols-outlined align-middle icon-color" style="border-radius: 50%;background-color: #fff">
                            person
                        </span>
                    </a>
                </div> 
			</div>
		</nav>

</header>
    