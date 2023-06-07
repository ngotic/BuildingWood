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
        <form method="POST" action="/wood/carpool/edit.do">
        
            <div class="form-group">
                <label for="fname">출발지</label>
                <div class="sort">
	                <div>
	                	<select name="departurescity" id="departurescity" class="option02 select2-hidden-accessible form-control" 
	                		required data-select2-id="select2-data-departureRegion" tabindex="-1" aria-hidden="true" 
	                		style="width: 60px; text-align: center;">
	                                        <option value="" data-select2-id="select2-data-6-k4qz">시/도</option>
	                                        <option value="서울" ${dto.departurescity.equals("서울") ? "selected" : ""}>서울</option>
	                                        <option value="경기" ${dto.departurescity.equals("경기") ? "selected" : ""}>경기</option>
	                                        <option value="인천" ${dto.departurescity.equals("인천") ? "selected" : ""}>인천</option>
	                                        <option value="강원" ${dto.departurescity.equals("강원") ? "selected" : ""}>강원</option>
	                                        <option value="부산" ${dto.departurescity.equals("부산") ? "selected" : ""}>부산</option>
	                                        <option value="대구" ${dto.departurescity.equals("대구") ? "selected" : ""}>대구</option>
	                                        <option value="광주" ${dto.departurescity.equals("광주") ? "selected" : ""}>광주</option>
	                                        <option value="대전" ${dto.departurescity.equals("대전") ? "selected" : ""}>대전</option>
	                                        <option value="울산" ${dto.departurescity.equals("울산") ? "selected" : ""}>울산</option>
	                                        <option value="세종" ${dto.departurescity.equals("세종") ? "selected" : ""}>세종</option>
	                                        <option value="충북" ${dto.departurescity.equals("충북") ? "selected" : ""}>충북</option>
	                                        <option value="충남" ${dto.departurescity.equals("충남") ? "selected" : ""}>충남</option>
	                                        <option value="전북" ${dto.departurescity.equals("전북") ? "selected" : ""}>전북</option>
	                                        <option value="전남" ${dto.departurescity.equals("전남") ? "selected" : ""}>전남</option>
	                                        <option value="경북" ${dto.departurescity.equals("경북") ? "selected" : ""}>경북</option>
	                                        <option value="경남" ${dto.departurescity.equals("경남") ? "selected" : ""}>경남</option>
	                                        <option value="제주" ${dto.departurescity.equals("제주") ? "selected" : ""}>제주</option>
	                                        <option value="기타" ${dto.departurescity.equals("기타") ? "selected" : ""}>기타</option>
	                	</select>
	                </div>
	                <div style="width: 545px;">
	                	<input type="text" class="form-control" id="departures" placeholder="출발지를 입력하세요." name="departures"
	                		value="${dto.departures}">
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
	                                        <option value="서울" ${dto.arrivalscity.equals("서울") ? "selected" : ""}>서울</option>
	                                        <option value="경기" ${dto.arrivalscity.equals("경기") ? "selected" : ""}>경기</option>
	                                        <option value="인천" ${dto.arrivalscity.equals("인천") ? "selected" : ""}>인천</option>
	                                        <option value="강원" ${dto.arrivalscity.equals("강원") ? "selected" : ""}>강원</option>
	                                        <option value="부산" ${dto.arrivalscity.equals("부산") ? "selected" : ""}>부산</option>
	                                        <option value="대구" ${dto.arrivalscity.equals("대구") ? "selected" : ""}>대구</option>
	                                        <option value="광주" ${dto.arrivalscity.equals("광주") ? "selected" : ""}>광주</option>
	                                        <option value="대전" ${dto.arrivalscity.equals("대전") ? "selected" : ""}>대전</option>
	                                        <option value="울산" ${dto.arrivalscity.equals("울산") ? "selected" : ""}>울산</option>
	                                        <option value="세종" ${dto.arrivalscity.equals("세종") ? "selected" : ""}>세종</option>
	                                        <option value="충북" ${dto.arrivalscity.equals("충북") ? "selected" : ""}>충북</option>
	                                        <option value="충남" ${dto.arrivalscity.equals("충남") ? "selected" : ""}>충남</option>
	                                        <option value="전북" ${dto.arrivalscity.equals("전북") ? "selected" : ""}>전북</option>
	                                        <option value="전남" ${dto.arrivalscity.equals("전남") ? "selected" : ""}>전남</option>
	                                        <option value="경북" ${dto.arrivalscity.equals("경북") ? "selected" : ""}>경북</option>
	                                        <option value="경남" ${dto.arrivalscity.equals("경남") ? "selected" : ""}>경남</option>
	                                        <option value="제주" ${dto.arrivalscity.equals("제주") ? "selected" : ""}>제주</option>
	                                        <option value="기타" ${dto.arrivalscity.equals("기타") ? "selected" : ""}>기타</option>
	                	</select>
	                </div>
	                <div style="width: 545px;">
	                	<input type="text" class="form-control" id="arrivals" placeholder="도착지를 입력하세요." name="arrivals"
	                		value="${dto.arrivals}">
	                </div>
                </div>   
            </div>
            
            <div class="sort">
	            <div class="form-group block-size">
	                <label for="date">날짜</label>
	                <input name="ttime" type="date" class="form-control" id="dateField" placeholder="날짜" value="">
	            </div>
            
	            <div class="form-group block-size">
	                <label for="time">시간</label>
	                <input name="ttime" type="time" class="form-control" id="timeField" placeholder="시간" value="">
	            </div>
            </div>
            
            <div class="sort">
            	<div class="form-group block-size">
	                <label for="count">인원</label>
	                <!-- <input type="number" class="form-control" id="count" placeholder="인원을 선택하세요." name="count"> -->
	                <select name="recruit" class="form-control" tabindex="-1" aria-hidden="true">
                                        <option value="" data-select2-id="select2-data-8-at93">인원을 선택하세요.</option>
                                        <option value="1" ${dto.recruit.equals("1") ? "selected" : ""}>1</option>
                                        <option value="2" ${dto.recruit.equals("2") ? "selected" : ""}>2</option>
                                        <option value="3" ${dto.recruit.equals("3") ? "selected" : ""}>3</option>
                                        <option value="4" ${dto.recruit.equals("4") ? "selected" : ""}>4</option>
                    </select>
	            </div>
	            
	            <!-- 요금 10원 단위, 0 미만 불가능하게 설정 -->
	            <div class="form-group block-size">
	                <label for="price">희망가격</label>
	                <input type="number" class="form-control" placeholder="희망가격을 입력하세요." name="fee" min="0" step="500"
	                		value="${dto.fee}">
	                		
	            </div>
            </div>
            
            <div class="form-group">
	            <label for="content">상세내용</label>
	            <textarea name="content" id="content" class="form-control" rows="8" placeholder="상세 내용을 설명해 주세요.">${dto.content}</textarea>
	        </div>                       


           
	       	<button class="add-frame"> 
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
	        
	        <input type="hidden" name="ttime" id="ttimeField">
            
        </form>
    	</div>
    	
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

	var ttime = new Date("${dto.ttime}");
	
	var year = ttime.getFullYear();
	var month = ("0" + (ttime.getMonth() + 1)).slice(-2);
	var day = ("0" + ttime.getDate()).slice(-2);
	var hours = ("0" + ttime.getHours()).slice(-2);
	var minutes = ("0" + ttime.getMinutes()).slice(-2);
	var seconds = ("0" + ttime.getSeconds()).slice(-2);


	document.getElementById("dateField").value = year + "-" + month + "-" + day;
	document.getElementById("timeField").value = hours + ":" + minutes + ":" + seconds;

	
	
	 
</script>
</body>
</html>