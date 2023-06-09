<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 검색 -->
<style>

		.search-box-frame {
		  width: 1030px;
		  height: 83px;
		  display: flex;
		  position: relative;
		  align-items: flex-start;
		  flex-shrink: 0;
		}

		.component-container1 {
		  gap: 112px;
		  top: 21px;
		  left: 211px;
		  /* width: 665px; */
		  height: 38px;
		  display: flex;
		  position: absolute;
		  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
		  align-items: center;
		  flex-shrink: 0;
		  justify-content: center;
		  border-radius: 5px;
		}
		
		.component-search {
		  gap: 8px;
		  width: 601px;
		  display: flex;
		  flex-grow: 1;
		  align-items: flex-start;
		  flex-shrink: 0;
		  flex-direction: column;
		}

		.search-text-input {
		  width: 100%;
		  gap: 8px;
		  display: flex;
		  padding: 11px;
		  overflow: hidden;
		  flex-grow: 1;
		  align-items: center;
		  background-color: var(--dl-color-base-white);
		}
		
		.search-select {
			border: none;
		}
		
		.search-icon {
		  width: 20px;
		  height: 20px;
		}
		
		input[type="text"]:focus, .search-select:focus {
      		outline: none;
    	}
		
		.search-text-area {
		  color: rgba(117, 117, 117, 1);
		  height: auto;
		  flex-grow: 1;
		  text-align: left;
		  line-height: 22px;
		  width: 100%;
		}
		
		.search-button-frame {
		  top: 21px;
		  left: 826px;
		  width: 100px;
		  height: 40px;
		  display: flex;
		  position: absolute;
		  align-items: flex-start;
		  flex-shrink: 1;
		  background-color: #2db400;
		  border-radius: 50px;
		}
		
		.search-button {
		  top: 8px;
		  left: 27px;
		  height: auto;
		  position: absolute;
		  font-size: 17px;
		  font-style: Medium;
		  text-align: center;
		  font-family: Inter;
		  font-weight: 500;
		  line-height: 24px;
		  font-stretch: normal;
		  text-decoration: none;
		}
	

</style>


<!-- 글쓰기 -->
<style>

	.add-button-frame {
		width: 100px;
		height: 38px;
		border: 1px solid #999;
		border-radius: 12px;
		display: flex;
		justify-content: center;
		margin-left: 995px;
		margin-bottom: -10px;
	}
	
	.add-button {
		background: none;
		border: none;
	}

</style>


<!-- 카풀 카드 리스트 -->
<style>

	div.col-4 {
		padding-bottom: 30px;
	}

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
		font-size: 1.4rem;
		top: 2px;
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
		<h1><small>카풀 게시판</small></h1>
	
	
		<!-- 검색 -->
		<form id="searchForm" action="/wood/carpool/list.do" method="GET">
		<div class="search-box-frame">
		
	        <div class="component-container1">
	          <div class="component-search">
	          	
	            
	              <div class="search-text-input">
		          	  <select class="search-select" name="column">
							<option value="">선택</option>
							<option value="departures">출발지</option>
							<option value="arrivals">도착지</option>
					  </select>
	                <img
	                  src="/wood/asset/img/search-icon.png"
	                  alt="search-icon"
	                  class="search-icon"
	                />
	                <span class="search-text-area TextMMedium">
	                  <input type="text" name="word" class="long" required placeholder="Search someting here..."
	                  		 style="width: 100%; border: none;">
	                </span>
	              </div>

	            
	          </div>
	        </div>

	        <div class="search-button-frame" style="border: none;">
	          <input type="submit" value="Search" class="search-button" 
	          		 style="color: white; background: none; border: none;">
	    	</div>
	    	
	    </div>
	    </form>
		
		

		
		<!-- 글쓰기 버튼 -->
		<div class="add-button-frame">
			<button type="button" class="add-button"
				onclick="location.href='/wood/carpool/add.do?mode=new';">글쓰기</button>
		</div>	

	

		

		<!-- 카풀 카드 리스트 -->
		<div class="container">
	      <div class="row">
		<c:forEach items="${list}" var="dto">
	      
	      	<!-- 테스트1 -->
	      	<div class="col-4">
	          <div class="card" onclick="location.href='/wood/carpool/view.do?carpoolseq=${dto.carpoolseq}';">
	          
	            <div class="card-header">
	              <img
	              src="https://www.studiopeople.kr/common/img/default_profile.png"
	              alt="프로필"
	              class="profile"
	              />
	              <div class="user-info" style="margin-left: 10px;">
	              	<div>
		              <span class="nickname">${dto.nickname}</span>
		              <span class="gender">
		              		<c:if test = "${dto.gender eq 'M'}">
		              			(남)
		              		</c:if>
		              		<c:if test = "${dto.gender eq 'F'}">
		              			(여)
		              		</c:if>
		              </span>
		            </div>
		            <div class="rating">
		              <img
			            src="/wood/asset/img/star.png"
			            alt="RatingStar"
			            class="rating-star"
			          />
		              <span class="rating-score">${dto.score} (${dto.count})</span>
		            </div>
	              </div>
	            </div>
	            
	            <div class="card-body" style="border-bottom: 1px solid #EBEBEB">
	              <div class="card-text">
		            <div class="datetime">${dto.ttime}</div>
	              </div>
	            </div>
	            
	            <div class="card-body">
	            	<div class="card-text" style="padding-top: 6px; margin-bottom: -5px;">
		            	<div>
		            		<span class="departure-region">${dto.departurescity}</span>
		            		<span class="departures">${dto.departures}</span>
		            	</div>
		              	<div>
							<span class="arrival-region">${dto.arrivalscity}</span>
		            		<span class="arrivals">${dto.arrivals}</span>
						</div>
		            </div>
	            </div>
	            
	            <div class="card-body">
	            	<div class="card-text bottom-frame">
	            		<span class="count-frame">
	            			<span>0/${dto.recruit}명 모집</span>
	            		</span>
		              	<span class="price">${dto.fee}원</span>
		            </div>
	            </div>
	          </div>
	        </div>
	     

	        
			  <!--모집 종료
	          <div class="end">
	          		<div class="end-frame">
	          			<span>모집 종료</span>
	          		</div>
		      </div> -->
		      
	        
    	</c:forEach>
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