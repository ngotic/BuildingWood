<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>빌딩숲</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
    </script>
    <link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
    
        <script src="dist/js/datepicker.min.js"></script>

        <!-- Include English language -->
        <script src="dist/js/i18n/datepicker.en.js"></script>
        
	<%@ include file="/WEB-INF/views/include/asset.jsp" %>
	
<style>
	
	.form-control {font-size: 0.9rem}
	
	.sort {
		display: flex;
		justify-content: space-between;
	}
	
	.block-size {
		display: inline-block;
		width: 285px;
	}
	
	textarea {
	    width: 100%;
	    height: 6.25em;
	    border: none;
	    resize: none;
  	}
  	
  	.add-frame {
	  /* top: 615px; */
	  left: 41%;
	  width: 102px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  /* box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); */
	  align-items: flex-start;
	  flex-shrink: 0;
	  background-color: rgba(45, 180, 0, 1);
	  border-radius: 15px;
	  border: none;
	}
	
	.add-box {
	  top: 13px;
	  left: 0px;
	  width: 100px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.add {
	  /* left: 24px; */
	  color: rgba(98, 98, 98, 1);
	  width: 100px;
	  height: auto;
	  position: absolute;
	  font-size: 1rem;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.back-frame {
	  /* top: 615px; */
	  right: 41%;
	  width: 102px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  /* box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); */
	  align-items: flex-start;
	  flex-shrink: 0;
	  border-radius: 15px;
	  background-color: rgba(255, 255, 255, 1);
	  border: 1px solid #777;
	}
	
	.back-box {
	  top: 13px;
	  left: 0px;
	  width: 100px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.back {
	  /* left: 24px; */
	  color: rgba(255, 255, 255, 1);
	  width: 100px;
	  height: auto;
	  position: absolute;
	  font-size: 1rem;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	}
  	

</style>

</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">
	
		<h1 class="text-success text-center">
        카풀 게시판
	    </h1>
	    
	    <h2 class="text-center">글쓰기</h2> 
	    
	    <div class="container" style="width:65%;">
        
        
        <form method="POST" action="/wood/carpool/add.do">
            <div class="form-group">
                <label for="fname">출발지</label>
                <div class="sort">
	                <div>
	                	<select name="departurescity"  class="option02 select2-hidden-accessible form-control" 
	                		required data-select2-id="select2-data-departureRegion" tabindex="-1" aria-hidden="true" 
	                		style="width: 60px; text-align: center;">
	                                        <option value="" data-select2-id="select2-data-6-k4qz">시/도</option>
	                                        <option value="서울">서울</option>
	                                        <option value="경기">경기</option>
	                                        <option value="인천">인천</option>
	                                        <option value="강원">강원</option>
	                                        <option value="부산">부산</option>
	                                        <option value="대구">대구</option>
	                                        <option value="광주">광주</option>
	                                        <option value="대전">대전</option>
	                                        <option value="울산">울산</option>
	                                        <option value="세종">세종</option>
	                                        <option value="충북">충북</option>
	                                        <option value="충남">충남</option>
	                                        <option value="전북">전북</option>
	                                        <option value="전남">전남</option>
	                                        <option value="경북">경북</option>
	                                        <option value="경남">경남</option>
	                                        <option value="제주">제주</option>
	                                        <option value="기타">기타</option>
	                	</select>
	                </div>
	                <div style="width: 545px;">
	                	<input type="text" class="form-control" name="departures" id="departures" placeholder="상세 출발지를 입력해주세요." name="departures">
	                </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="lname">도착지</label>
                <div class="sort">
	                <div>
	                	<select name="arrivalscity" id="arrivalscity" class="option02 select2-hidden-accessible form-control" 
	                		required data-select2-id="select2-data-arrivalRegion" tabindex="-1" aria-hidden="true" 
	                		style="width: 60px; text-align: center;">
	                                        <option value="" data-select2-id="select2-data-6-k4qz">시/도</option>
	                                        <option value="서울">서울</option>
	                                        <option value="경기">경기</option>
	                                        <option value="인천">인천</option>
	                                        <option value="강원">강원</option>
	                                        <option value="부산">부산</option>
	                                        <option value="대구">대구</option>
	                                        <option value="광주">광주</option>
	                                        <option value="대전">대전</option>
	                                        <option value="울산">울산</option>
	                                        <option value="세종">세종</option>
	                                        <option value="충북">충북</option>
	                                        <option value="충남">충남</option>
	                                        <option value="전북">전북</option>
	                                        <option value="전남">전남</option>
	                                        <option value="경북">경북</option>
	                                        <option value="경남">경남</option>
	                                        <option value="제주">제주</option>
	                                        <option value="기타">기타</option>
	                	</select>
	                </div>
	                <div style="width: 545px;">
	                	<input type="text" class="form-control" name="arrivals" id="arrivals" placeholder="상세 도착지를 입력해주세요." name="arrivals">
	                </div>
                </div>   
            </div>
            
            <div class="sort">
            	
	            <div class="form-group block-size">
	                <label for="date">날짜</label>
	                <input name="date" type="date" id="dateField" class="form-control" placeholder="날짜">
	            </div>
            
	            <div class="form-group block-size">
	                <label for="time">시간</label>
	                <input name="time" type="time" id="timeField" class="form-control" placeholder="시간">
	            </div> 
	           
            </div>
            
            <div class="sort">
            	<div class="form-group block-size">
	                <label for="count">인원</label>
	                <!-- <input type="number" class="form-control" id="count" placeholder="인원을 선택하세요." name="count"> -->
	                <select name="recruit" class="form-control" tabindex="-1" aria-hidden="true">
                                        <option value="">인원을 선택하세요.</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                    </select>
	            </div>
	            
	            <!-- 요금 10원 단위, 0 미만 불가능하게 설정 -->
	            <div class="form-group block-size">
	                <label for="price">희망가격</label>
	                <input type="number" class="form-control" name="fee" placeholder="0" name="price"
	                		min="0" step="500">
	            </div>
            </div>
            
            <div class="form-group">
	            <label for="content">상세내용</label>
	            <textarea name="content" id="content" class="form-control" rows="8" placeholder="상세 내용을 설명해 주세요."></textarea>
	        </div>                       

	       	
	       	<button class="add-frame">  
	            <div class="add-box">
	              <span class="add">
	                <span style="color: white;">등록하기</span>
	              </span>
	            </div>
	        </button>

			<button class="back-frame" onclick="location.href='/wood/carpool/list.do';">
	 			<div class="back-box">
	              <span class="back">
	              	<span>뒤로가기</span>
	              </span>
	            </div>
	        </button>
	        
			
	        
        </form>
    	</div>
    	
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	

	
</script>
</body>
</html>
