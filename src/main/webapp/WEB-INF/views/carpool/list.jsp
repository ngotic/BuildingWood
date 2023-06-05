<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>list 수정 중</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>

	div.card {
		cursor: pointer;
		font-size: 1rem;
	}
	
	.card-header {
		display: flex; 
		align-items: center;
	}
	
	.user-info {
		padding-left: 4px;
	}
	
	.profile {
	  width: 48px;
	  height: 48px;
	  border-radius: 50%;
	}
	
	.nickname {
	
	}
	
	.gender {
	
	}
	
	.rating {
		display: flex;
  		align-items: center;
	}
	
	.rating-star {
		width: 18px;
		height: 18px;
		margin-right: 5px;
	}
	
	.rating-score {
		font-size: 0.9rem;
	}
	
	.datetime {
		/* text-align: center; */
	}
	
	.card-body {
		padding-top: 0.5rem;
		padding-bottom: 0.5rem;
	}
	
	.arrival-region, .departure-region {
		color: #2db400;
		padding-right: 3px;
	}
	
	.content-area {
		height: 90px;
	}
	
	.content {
		/* overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap; */
	}
	
	.count-frame {
		text-align: center;
		font-size: 0.8rem;
		border: 1px solid #d8d8d8;
		border-radius: 40px;
		padding: 4px;
	}
	
	.bottom-frame {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	
	.price {
		padding: 2px;
		text-align: right;
		color: #2db400;
		font-size: 1.2rem;
	}
	
	
	/* 모집 종료 시 */
	.end {
		position: absolute;
		top: 0;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.70);
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 0.25rem;
	}
	
	.end-frame {
		color: white;
		border: 1px solid white;
		border-radius: 90px;
		padding: 10px;
	}
	
	.end-frame span {color: white;}

</style>

</head>

<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1><small>carpool.list2</small></h1>
		
		
		<div id="search">
		<a>강남구 역삼동</a>
		<a>Search</a>
		<button type="button" class="add primary"
				onclick="location.href='/wood/carpool/add.do?mode=new';">글쓰기</button>
		</div>	
		

		<br><br><br>
		<table>
			<h2>ㅇㅇ</h2>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.carpoolseq}</td>
				<td>${dto.regdate}</td>
				<td>${dto.departures}</td>
				<td>${dto.arrivals}</td>
			</tr>
			</c:forEach>
		</table>
		<br><br><br>

		

		<div class="container">
	      <div class="row">
	      
	      	<!-- 테스트1 -->
	      	<div class="col-4">
	          <div class="card" onclick="location.href='/wood/carpool/view.do';">
	            <div class="card-header">
	              <img
	              src="https://www.studiopeople.kr/common/img/default_profile.png"
	              alt="프로필"
	              class="profile"
	              />
	              <div class="user-info" style="margin-left: 10px;">
	              	<div>
		              <span class="nickname">닉네임</span>
		              <span class="gender">(성별)</span>
		            </div>
		            <div class="rating">
		              <img
			            src="/wood/asset/img/star.png"
			            alt="RatingStar"
			            class="rating-star"
			          />
		              <span class="rating-score">4.7 (3)</span>
		            </div>
	              </div>
	            </div>
	            
	            <div class="card-body" style="border-bottom: 1px solid #d8d8d8">
	              <div class="card-text">
		            <div class="datetime">06/05(화) 17:30</div>
	              </div>
	            </div>
	            <div class="card-body">
	            	<div class="card-text">
		            	<div>
		            		<span class="departure-region">시/도</span>
		            		<span class="departures">출발지: ${dto.departures}</span>
		            	</div>
		              	<div>
							<span class="arrival-region">시/도</span>
		            		<span class="arrivals">도착지</span>
						</div>
		            </div>
	            </div>
	            <!-- <div class="card-body content-area">
	            	<div class="card-text">
		              	<div class="content">내용적는칸 생략</div>
		            </div>
	            </div> -->
	            <div class="card-body">
	            	<div class="card-text bottom-frame">
	            		<span class="count-frame">
	            			<span>0/2명 모집</span>
	            		</span>
		              	<span class="price">내용생략</span>
		            </div>
	            </div>
	          </div>
	        </div>
	     
	     
			<!-- 테스트2 -->
	        <div class="col-4">
	          <div class="card" onclick="location.href='/wood/carpool/view.do';">
	            <div class="card-header">
	              <img
	              src="https://www.studiopeople.kr/common/img/default_profile.png"
	              alt="프로필"
	              class="profile"
	              />
	              <div class="user-info" style="margin-left: 10px;">
	              	<div>
		              <span class="nickname">닉네임</span>
		              <span class="gender">(성별)</span>
		            </div>
		            <div class="rating">
		              <img
			            src="/wood/asset/img/star.png"
			            alt="RatingStar"
			            class="rating-star"
			          />
		              <span class="rating-score">4.7 (3)</span>
		            </div>
	              </div>
	            </div>
	            
	            <div class="card-body" style="border-bottom: 1px solid #d8d8d8">
	              <div class="card-text">
		            <div class="datetime">06/05(화) 17:30</div>
	              </div>
	            </div>
	            <div class="card-body" style="border-bottom: 1px solid #d8d8d8">
	            	<div class="card-text">
		            	<div>
		            		<span class="arrival-region">시/도</span>
		            		<span class="arrivals">출발지</span>
		            	</div>
		              	<div>
							<span class="departure-region">시/도</span>
		            		<span class="departures">도착지</span>
						</div>
		            </div>
	            </div>
	            <div class="card-body content-area">
	            	<div class="card-text">
		              	<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </div>
		            </div>
	            </div>
	            <div class="card-body">
	            	<div class="card-text bottom-frame">
	            		<span class="count-frame">
	            			<span>0/2명 모집</span>
	            		</span>
		              	<span class="price">희망가격</span>
		            </div>
	            </div>
	          </div>
	        </div>
	        
	        
	        <!-- 테스트3 -->
	        <div class="col-4">
	          <div class="card" onclick="location.href='/wood/carpool/view.do';">
	            <div class="card-header">
	              <img
	              src="https://www.studiopeople.kr/common/img/default_profile.png"
	              alt="프로필"
	              class="profile"
	              />
	              <div class="user-info" style="margin-left: 10px;">
	              	<div>
		              <span class="nickname">닉네임</span>
		              <span class="gender">(성별)</span>
		            </div>
		            <div class="rating">
		              <img
			            src="/wood/asset/img/star.png"
			            alt="RatingStar"
			            class="rating-star"
			          />
		              <span class="rating-score">4.7 (3)</span>
		            </div>
	              </div>
	            </div>
	            
	            <div class="card-body" style="border-bottom: 1px solid #d8d8d8">
	              <div class="card-text">
		            <div class="datetime">06/05(화) 17:30</div>
	              </div>
	            </div>
	            <div class="card-body" style="border-bottom: 1px solid #d8d8d8">
	            	<div class="card-text">
		            	<div>
		            		<span class="arrival-region">시/도</span>
		            		<span class="arrivals">출발지</span>
		            	</div>
		              	<div>
							<span class="departure-region">시/도</span>
		            		<span class="departures">도착지</span>
						</div>
		            </div>
	            </div>
	            <div class="card-body content-area">
	            	<div class="card-text">
		              	<div class="content">Lorem ipsum dolor sit amet,</div>
		            </div>
	            </div>
	            <div class="card-body">
	            	<div class="card-text bottom-frame">
	            		<span class="count-frame">
	            			<span>0/2명 모집</span>
	            		</span>
		              	<span class="price">희망가격</span>
		            </div>
	            </div>
	            
	          <!-- 모집 종료 -->
	          <div class="end">
	          		<div class="end-frame">
	          			<span>모집 종료</span>
	          		</div>
		          </div>
		      </div>
	        
	        </div> 
	        
	        
	      </div>
	    </div>
    
	    
    
	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
<script>

</script>
</body>
</html>