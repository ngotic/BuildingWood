<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <link rel="stylesheet" href="/wood/asset/css/clubBtn.css"> -->

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
    
    .modal-backdrop {
		z-index:0;
	}
	
	.modal-dialog {
	    max-width: var(--bs-modal-width);
	    margin-right: auto;
	    margin-top: 80px;
	}
	/* .modal-content {
	    transform: translate(250px, 10px) !important;
	} */
	.custom-card{
		border : 1px solid #eee;
		border-radius: 5px;
		background-color:#F2F4FC;
		font-size:14px;
	}
	.btn-close{
		font-size:12px;
	}
	span.material-symbols-outlined {
    margin-top: 1px;
    color: tomato;
	}
</style>
<body>
<header class="header-area navbar-fade" id="header">
		<nav id="navbar">
			<div id="brand-logo">
				<a class="navbar-brand" id="navbarBrand"><img width=60px src="/wood/asset/img/logo.png"></a>
			</div>
			<a class="navbar-toggler" id="toggleBtn"><i class="fa fa-bars"></i></a>
			<div class="navbar-menu" id="menu">
				<!-- <div class="nav-item dropdown"><a href = "#" class="nav-link">홈</a></div> -->
                <div class="nav-item"><a href = "" class="nav-link" >SNS</a></div>
				<div class="nav-item"><a href = "/wood/carpool/list.do" class="nav-link" >카풀</a></div>
				<!-- <div class="nav-item"><a href = "" class="nav-link" >스터디/과외</a></div> -->
				<div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                        스터디/과외
                    </a>
                    <ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/wood/study/list.do">스터디게시판</a></li>
						<li><a class="dropdown-item" href="">과외게시판</a></li>
                    </ul>
                </div>

				<!-- <div class="nav-item"><a href = "" class="nav-link" >약속/동호회/맛집</a></div>  -->
				<div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true" >
                        약속/동호회/맛집
                    </a>
                    <ul class="dropdown-menu" >
                        <li><a class="dropdown-item" href="/wood/promise/list.do">약속게시판</a></li>
						<li><a class="dropdown-item" href="/wood/club/club.do">동호회게시판</a></li>
						<li><a class="dropdown-item" href="">맛집게시판</a></li>
						        
                    </ul>
                </div>

				<div class="nav-item"><a href = "/wood/suggest/suggest.do" class="nav-link" >고객지원</a></div> 
				<!-- <div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                        고객지원
                    </a>
                    <ul class="dropdown-menu">
						<li><a class="dropdown-item" href="">공지사항</a></li>  
						<li><a class="dropdown-item" href="">건의게시판</a></li>        
                    </ul>
                </div>  -->
				<c:if test="${empty id}">
					<div class="nav-item"><a href = "" class="nav-link" >회원가입</a></div>
				</c:if>
			
                <div class="nav-item dropdown" >
                    <a href = "" id="" class="nav-link dropdown-toggle icon-color" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                    	<c:if test="${empty id}">
                         	로그인
                        </c:if>
                        <c:if test="${not empty id}">
                         	${nickname}
                        </c:if>
						 <span class="material-symbols-outlined align-middle icon-color" style="border-radius: 50%;background-color: #fff">
                            person
                        </span>
                    </a>
                    <c:if test="${not empty id}">
                     <ul class="dropdown-menu" >
                        <li><a class="dropdown-item" href="/wood/user/logout.do">로그아웃</a></li>
                        <c:if test="${lv == 0}">
							<li><a class="dropdown-item" href="/wood/admin/admin.do">마이페이지</a></li>
                    	</c:if>
                    	<c:if test="${lv > 0 }">
                    		<li><a class="dropdown-item" href="/wood/mypage/mypage.do">마이페이지</a></li>
                    	</c:if>
                    </ul>
                    </c:if>
                </div> 
               	<c:if test="${not empty id}">
					<div class="nav-item">
						<a href = "" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">알림
							<span class="material-symbols-outlined align-middle" style="border-radius: 50%;background-color: #fff; font-size:18px;" >favorite</span>
							<span class="badge rounded-pill" style="background-color: #FF5B5B; font-size:8px;" >0</span>
						</a>
					</div>
				</c:if>
			</div>
			
			
			
			<!-- Modal -->
			<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림창</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
   		<div class="card custom-card" >
		  <div class="card-body">
		    <h5 class="card-title mb-3">
		    	<span class="material-symbols-outlined align-middle">check_circle</span> <span class="align-middle">알림</span>
		    	<button type="button" class="btn-close float-end" data-bs-dismiss="alert" aria-label="Close"></button>
		    </h5>
		    <h6 class="card-subtitle mb-2 text-muted">동호회 게시판</h6>
		    
		    <p class="card-text">
		    	동호회 개설이 승인되었습니다.
		    </p>
		    
		    <div class="text-end">
				<button class="forward pinkcolor" onclick="location.href='/wood/club/addclub.do';">게시판으로 이동</button>
				<button class="search-check greencolor" onclick="location.href='/wood/club/add.do';">확인하기</button>
			</div>
		  </div>
		</div>
		
		<div class="card custom-card" >
		  <div class="card-body">
		    <h5 class="card-title mb-3">
		    	<span class="material-symbols-outlined align-middle">check_circle</span> <span class="align-middle">알림</span>
		    	<button type="button" class="btn-close float-end" data-bs-dismiss="alert" aria-label="Close"></button>
		    </h5>
		    
		    <h6 class="card-subtitle mb-2 text-muted">동호회 게시판</h6>
		    
		    <p class="card-text">
		    	동호회 개설이 승인되었습니다.
		    </p>
		    
		    <div class="text-end">
				<button class="forward pinkcolor" onclick="location.href='/wood/club/addclub.do';">게시판으로 이동</button>
				<button class="search-check greencolor" onclick="location.href='/wood/club/add.do';">확인하기</button>
			</div>
		  </div>
		</div>
		
		<div class="card custom-card" >
		  <div class="card-body">
		    <h5 class="card-title mb-3">
		    	<span class="material-symbols-outlined align-middle">check_circle</span> <span class="align-middle">알림</span>
		    	<button type="button" class="btn-close float-end" data-bs-dismiss="alert" aria-label="Close"></button>
		    </h5>
		    <h6 class="card-subtitle mb-2 text-muted">동호회 게시판</h6>
		    
		    <p class="card-text">
		    	동호회 개설이 승인되었습니다.
		    </p>
		    
		    <div class="text-end">
				<button class="forward pinkcolor" onclick="location.href='/wood/club/addclub.do';">게시판으로 이동</button>
				<button class="search-check greencolor" onclick="location.href='/wood/club/add.do';">확인하기</button>
			</div>
		  </div>
		</div>
		
      </div>
    </div>
  </div>
</div>
			
			
		</nav>

</header>
    