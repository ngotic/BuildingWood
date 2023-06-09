<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <body>

    <!-- Loader starts-->
    <div class="loader-wrapper">
      <div class="theme-loader"></div>
    </div> 
    <!-- Loader ends-->
    <!-- page-wrapper Start-->
    <div class="page-wrapper compact-wrapper" id="pageWrapper">
      <!-- Page Header Start-->
      <div class="page-main-header">
  <div class="main-header-right row m-0">
    <div class="main-header-left">
      <div class="logo-wrapper">
      	<a href="/wood/indexhome.do">
      		<img class="img-fluid" src="/wood/adminasset/세로logo.PNG" alt="" width=120px style="border-radius:10%;">
      	</a>
      </div>
      <div class="dark-logo-wrapper"><a href="https://laravel.pixelstrap.com/viho/dashboard"><img class="img-fluid" src="/wood/adminasset/세로logo.PNG" alt="" width=120px style="border-radius:10%;"></a></div>
      <div class="toggle-sidebar"><i class="status_toggle middle" data-feather="align-center" id="sidebar-toggle">    </i></div>
    </div>
    <div class="left-menu-header col">
      <ul>
        <li>
          <form class="form-inline search-form">
            <div class="search-bg">
            <span class="material-symbols-outlined">
				search
			</span>
              <input class="form-control-plaintext" placeholder="Search here.....">
            </div>
          </form>
          <span class="d-sm-none mobile-search search-bg">
          <span class="material-symbols-outlined">
			arrow_forward_ios
		  </span>
          </span>
        </li>
      </ul>
    </div>
    <div class="nav-right col pull-right right-menu p-0">
      <ul class="nav-menus">
        <li><a class="text-dark" href="#!" onclick="javascript:toggleFullScreen()"><i data-feather="maximize"></i></a></li>
        <li class="onhover-dropdown">
          <div class="bookmark-box"><i data-feather="star"></i></div>
          <div class="bookmark-dropdown onhover-show-div">
            <div class="form-group mb-0">
              <div class="input-group">
                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-search"></i></span></div>
                <input class="form-control" type="text" placeholder="Search for bookmark...">
              </div>
            </div>
            <ul>
              <li class="add-to-bookmark"><i class="bookmark-icon" data-feather="inbox"></i>Email<span class="pull-right"><i data-feather="star"></i></span></li>
              <li class="add-to-bookmark"><i class="bookmark-icon" data-feather="message-square"></i>Chat<span class="pull-right"><i data-feather="star"></i></span></li>
              <li class="add-to-bookmark"><i class="bookmark-icon" data-feather="command"></i>Feather Icon<span class="pull-right"><i data-feather="star"></i></span></li>
              <li class="add-to-bookmark"><i class="bookmark-icon" data-feather="airplay"></i>Widgets<span class="pull-right"><i data-feather="star">   </i></span></li>
            </ul>
          </div>
        </li>
        <li class="onhover-dropdown">
        
          <div class="notification-box"><i data-feather="bell"></i><span class="dot-animated"></span></div>
          <ul class="notification-dropdown onhover-show-div">
            <li>
              <p class="f-w-700 mb-0">You have 3 Notifications<span class="pull-right badge badge-primary badge-pill">4</span></p>
            </li>
            <li class="noti-primary">
              <div class="media">
                <span class="notification-bg bg-light-primary"><i data-feather="activity"> </i></span>
                <div class="media-body">
                  <p>Delivery processing </p>
                  <span>10 minutes ago</span>
                </div>
              </div>
            </li>
            <li class="noti-secondary">
              <div class="media">
                <span class="notification-bg bg-light-secondary"><i data-feather="check-circle"> </i></span>
                <div class="media-body">
                  <p>Order Complete</p>
                  <span>1 hour ago</span>
                </div>
              </div>
            </li>
            <li class="noti-success">
              <div class="media">
                <span class="notification-bg bg-light-success"><i data-feather="file-text"> </i></span>
                <div class="media-body">
                  <p>Tickets Generated</p>
                  <span>3 hour ago</span>
                </div>
              </div>
            </li>
            <li class="noti-danger">
              <div class="media">
                <span class="notification-bg bg-light-danger"><i data-feather="user-check"> </i></span>
                <div class="media-body">
                  <p>Delivery Complete</p>
                  <span>6 hour ago</span>
                </div>
              </div>
            </li>
          </ul>
          
          
        </li>
        <li>
            <div class="mode"><span class="material-symbols-outlined mt-1">dark_mode</span></div>
        </li>
        <li class="onhover-dropdown">
          <i data-feather="message-square"></i>
          <ul class="chat-dropdown onhover-show-div">
            <li>
              <div class="media">
                <img class="img-fluid rounded-circle me-3" src="/wood/adminasset/images/user/4.jpg" alt="">
                <div class="media-body">
                  <span>Ain Chavez</span>
                  <p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
                </div>
                <p class="f-12">32 mins ago</p>
              </div>
            </li>
            <li>
              <div class="media">
                <img class="img-fluid rounded-circle me-3" src="/wood/adminasset/images/user/1.jpg" alt="">
                <div class="media-body">
                  <span>Erica Hughes</span>
                  <p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
                </div>
                <p class="f-12">58 mins ago</p>
              </div>
            </li>
            <li>
              <div class="media">
                <img class="img-fluid rounded-circle me-3" src="/wood/adminasset/images/user/2.jpg" alt="">
                <div class="media-body">
                  <span>Kori Thomas</span>
                  <p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
                </div>
                <p class="f-12">1 hr ago</p>
              </div>
            </li>
            <li class="text-center"> <a class="f-w-700" href="javascript:void(0)">See All     </a></li>
          </ul>
        </li>
        <li class="onhover-dropdown p-0">
          <button class="btn btn-primary-light" type="button" onclick="location.href='/wood/user/logout.do';"><i data-feather="log-out"></i>로그아웃</button>
        </li>
      </ul>
    </div>
    <div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
  </div>
</div>
      <!-- Page Header Ends -->
      <!-- Page Body Start-->
      <div class="page-body-wrapper sidebar-icon">
        <!-- Page Sidebar Start-->
        <header class="main-nav">
    <div class="sidebar-user text-center">
        <a class="setting-primary" href="javascript:void(0)"><i data-feather="settings"></i></a><img class="img-90 rounded-circle" src="/wood/adminasset/images/dashboard/1.png" alt="" />
        <div class="badge-bottom"><span class="badge badge-primary">
		<c:if test="${lv==0}">
           관리자
		</c:if>
		<c:if test="${lv > 0}">
           유저
		</c:if>
        </span></div>
        <a href="user-profile"> <h6 class="mt-3 f-14 f-w-600">
        <c:if test="${not empty id}">
                         	${nickname}
		</c:if>
		</h6></a>
        <p class="mb-0 font-roboto">
        
        <c:if test="${lv==0}">
           관리자
		</c:if>
		<c:if test="${lv > 0}">
           유저
		</c:if>
        </p>
   <!--      <ul>
            <li>
                <span><span class="counter">19.8</span>k</span>
                <p>Follow</p>
            </li>
            <li>
                <span>2 year</span>
                <p>Experince</p>
            </li>
            <li>
                <span><span class="counter">95.2</span>k</span>
                <p>Follower</p>
            </li>
        </ul> -->
    </div>
    <nav>
        <div class="main-navbar">
            <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
            <div id="mainnav">
                <ul class="nav-menu custom-scrollbar">
                
	                    <li class="back-btn">
	                        <div class="mobile-back text-end"><span>Back</span>
	                        <span class="material-symbols-outlined">
								arrow_forward_ios
			  				</span>
	                        </div>
	                    </li>
	                    
                  		<li class="sidebar-main-title">
	                        <div>
	                             <c:if test="${lv==0}">
						           <h6>관리자 페이지</h6>
								</c:if>
								<c:if test="${lv > 0}">
						           <h6>마이 페이지</h6>
								</c:if>
	                        </div>
                    	</li>
                    	
	                    <c:if test="${lv==0}">
		                    <li>
		                        <a class="nav-link menu-title link-nav" href="/wood/admin/adminbuilding.do"><i data-feather="home"></i><span>건물관리</span></a>                  
		                    </li>
	                    </c:if>
                    
	                    <li>
	                    	<c:if test="${lv == 0}">
						       <a class="nav-link menu-title link-nav" href="/wood/admin/adminuser.do"><i data-feather="users"></i><span>이용자 관리</span></a>
							</c:if>
							<c:if test="${lv > 0}">
						       <a class="nav-link menu-title link-nav" href="/wood/mypage/mypage.do"><i data-feather="users"></i><span>이용자 정보</span></a>
							</c:if>
	                    </li>
	                    
                    	<li>
                    		<c:if test="${lv > 0}">
	                    		<a class="nav-link menu-title link-nav" href="/wood/mypage/service.do"><i data-feather="airplay"></i><span>서비스 이용 관리</span></a>
	                    	</c:if>
	                    	<c:if test="${lv==0}">
	                    		<a class="nav-link menu-title link-nav" href="/wood/admin/adminservice.do"><i data-feather="airplay"></i><span>서비스 이용 관리</span></a>
	                    	</c:if>
	                    </li>
	                    
	                    
                   		<li>
							<c:if test="${lv>0}">
								<a class="nav-link menu-title link-nav " href="/wood/mypage/question.do"><i data-feather="help-circle"></i><span>공지 및 건의사항</span></a>
							</c:if>
							<c:if test="${lv==0}">
	                        	<a class="nav-link menu-title link-nav " href="/wood/admin/adminquestion.do"><i data-feather="help-circle"></i><span>공지 및 건의사항</span></a>
	                        </c:if>		                         
                    	</li>
	                    
                   </ul>
            </div>
            <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
        </div>
    </nav>
</header>
        <!-- Page Sidebar Ends-->
       <div class="page-body">
          <!-- Container-fluid starts-->
          <!-- Container-fluid starts-->
      	<div class="container-fluid dashboard-default-sec">