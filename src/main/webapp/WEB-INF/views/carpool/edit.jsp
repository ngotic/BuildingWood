<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
    </script>
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
	    
	    <h2 class="text-center">수정하기</h2> 
	    
	    <div class="container" style="width:65%;">
        <form action="#">
        
            <div class="form-group">
                <label for="fname">출발지</label>
                <div class="sort">
	                <div>
	                	<select name="departureRegion" id="departureRegion" class="option02 select2-hidden-accessible form-control" 
	                		required data-select2-id="select2-data-departureRegion" tabindex="-1" aria-hidden="true" 
	                		style="width: 60px; text-align: center;">
	                                        <option value="" data-select2-id="select2-data-6-k4qz">시/도</option>
	                                        <option value="서울" selected>서울</option>	<!-- selected 나중에 지워야함 -->
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
	                	<input type="text" class="form-control" id="departures" placeholder="출발지를 입력하세요." name="departures"
	                		value="한독빌딩">
	                		<!-- value 나중에 지워야함 -->
	                </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="lname">도착지</label>
                <div class="sort">
	                <div>
	                	<select name="arrivalRegion" id="arrivalRegion" class="option02 select2-hidden-accessible form-control" 
	                		required data-select2-id="select2-data-arrivalRegion" tabindex="-1" aria-hidden="true" 
	                		style="width: 60px; text-align: center;">
	                                        <option value="" data-select2-id="select2-data-6-k4qz">시/도</option>
	                                        <option value="서울" selected>서울</option>	<!-- selected 나중에 지워야함 -->
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
	                	<input type="text" class="form-control" id="arrivals" placeholder="도착지를 입력하세요." name="arrivals"
	                		value="고속터미널">
	                		<!-- value 나중에 지워야함 -->
	                </div>
                </div>   
            </div>
            
            <div class="sort">
	            <div class="form-group block-size">
	                <label for="date">날짜</label>
	                <input type="date" class="form-control" id="date" placeholder="날짜" name="date" value="2023-06-05">
	            </div>
            
	            <div class="form-group block-size">
	                <label for="time">시간</label>
	                <input type="time" class="form-control" id="time" placeholder="시간" name="time" value="17:30">
	            </div>
            </div>
            
            <div class="sort">
            	<div class="form-group block-size">
	                <label for="count">인원</label>
	                <!-- <input type="number" class="form-control" id="count" placeholder="인원을 선택하세요." name="count"> -->
	                <select name="count" id="count" class="form-control" tabindex="-1" aria-hidden="true">
                                        <option value="" data-select2-id="select2-data-8-at93">인원을 선택하세요.</option>
                                        <option value="1">1</option>
                                        <option value="2" selected>2</option>	<!-- selected 나중에 지워야함 -->
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                    </select>
	            </div>
	            
	            <!-- 요금 10원 단위, 0 미만 불가능하게 설정 -->
	            <div class="form-group block-size">
	                <label for="price">희망가격</label>
	                <input type="number" class="form-control" id="price" placeholder="희망가격을 입력하세요." name="price" min="0" step="10"
	                		value="5000">
	                		<!-- value 나중에 지워야함 -->
	                		
	            </div>
            </div>
            
            <div class="form-group">
	            <label for="content">상세내용</label>
	            <textarea name="content" id="content" class="form-control" rows="8" placeholder="상세 내용을 설명해 주세요.">테스트123</textarea>
	        </div>                       

            <!-- <div class="form-group form-check" style="padding-top: 13px; padding-bottom: 3px;">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember">
                    Remember me
                </label>
            </div> -->
            
            <!-- <button type="submit" class="btn" style="background-color: #2db400; color: white;">
                확인
            </button>
            
          	<button class="btn" style="border: 1px solid #777; color: #777;">
	            뒤로가기
	       	</button> -->
	       	
	       	<button class="add-frame" onclick="location.href='/wood/carpool/view.do';">  
	            <div class="add-box">
	              <span class="add">
	                <span style="color: white;">수정하기</span>
	              </span>
	            </div>
	        </button>

			<button class="back-frame">
	 			<div class="back-box" onclick="history.back();">
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