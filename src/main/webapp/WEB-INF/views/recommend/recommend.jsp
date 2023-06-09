<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<style data-tag="reset-style-sheet">
 html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
</style>
<style data-tag="default-style-sheet">

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);

      }
     .frame-group1222 {
	  top: 162px;
	  /* left: 156px; */
	  width: 194px;
	  height: 43px;
	  display: flex;
	  align-items: flex-start;
	  flex-shrink: 1;
	  border-color: #cccccc;
	  border-width: 0.5px;
	  border-radius: 30px;
	  background-color: rgba(255, 255, 255, 1);
	}
	.frame-mappin {
	  top: 8px;
	  left: 30px;
	  width: 26px;
	  height: 28px;
	  display: flex;
	  align-items: flex-start;
	  flex-shrink: 1;
	  position: relative;
	}
	.frame-text15 {
	  top: 9px;
	  left: 36px;
	  color: rgba(255, 95, 95, 1);
	  height: auto;
	  font-size: 17px;
	  font-style: Medium;
	  text-align: left;
	  font-family: Inter;
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	  position: relative;
	  font-family: 'Pretendard-Regular';
	}
	.frame-pin-stroke {
	  top: 0px;
	  left: 0px;
	  width: 26px;
	  height: 28px;
	  position: absolute;
	}
	.frame-pin {
	  top: 1.7142906188964844px;
	  left: 1.857421875px;
	  width: 22px;
	  height: 25px;
	  position: absolute;
	}
	.frame-circle {
	  top: 7.428572654724121px;
	  left: 8.047615051269531px;
	  width: 10px;
	  height: 9px;
	  position: absolute;
	}
	span.material-symbols-outlined {
    margin-top: 1px;
    color: tomato;
	}
	.frame-text15 > span {
	color: tomato;
	}
	
	
	.frame1-propertycardbig1 {
    gap: 11px;
    /* top: 100px; */
    left: 180px;
    width: 320px;
    height: 400px;
    display: inline-block;
    padding: 30px;
    margin: 15px 11px;
    position: relative;
    box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.15000000596046448);
    align-items: center;
    border-radius: 20px;
    justify-content: center;
    background-color: rgba(255, 255, 255, 1);
    font-family: 'Pretendard-Regular';
}
.frame1-propertycardbig1:hover {
 transform: translateY(-3px);
  box-shadow: 0px 10px 20px 2px rgba(0, 0, 0, 0.25); 
  transition: 0.3s ease-out;
  cursor: pointer;
}
.frame1-rectangle12 {
    width: 260px;
    height: 195px;
    border-radius: 5px;
    text-align: center;
    padding-left: 0px;
    object-fit: cover;
    margin-bottom: 20px;
}
}
.frame1-frame14 {
  gap: 14px;
  width: 267px;
  display: flex;
  padding: 10px;
  align-items: flex-start;
  flex-shrink: 0;
  flex-direction: column;
  font-family: 'Pretendard-Regular';
}
.frame1-text17 {
  color: rgba(62, 73, 88, 1);
  width: 246px;
  height: auto;
  font-size: 18px;
  font-style: ExtraBold;
  text-align: left;
  font-family: Gilroy;
  font-weight: 800;
  line-height: 136.00000143051147%;
  font-stretch: normal;
  text-decoration: none;
  margin: 10px 0px;
  font-family: 'Pretendard-Regular';
  
}
.frame1-frame13 {
  gap: 20px;
  display: flex;
  align-items: flex-start;
  margin: 10px 0px;
  font-family: 'Pretendard-Regular';
}
.frame1-frame12 {
  gap: 4px;
  display: flex;
  align-items: flex-start;
  font-family: 'Pretendard-Regular';
}
.frame1-group {
  /* width: 17px; */
  height: 17.045473098754883px;
  display: flex;
  position: relative;
  align-items: flex-start;
  flex-shrink: 1;
  font-family: 'Pretendard-Regular';
}
.frame1-love {
	right:16px;
}
.frame1-star {
  top: 0px;
  left: 0px;
  width: 17px;
  height: 17px;
  position: absolute;
  font-family: 'Pretendard-Regular';
}
.frame1-text19 {
  color: rgba(62, 73, 88, 1);
  width: 26px;
  height: auto;
  font-size: 15px;
  font-style: Light;
  text-align: left;
  font-family: Gilroy;
  font-weight: 300;
  line-height: 136.00000143051147%;
  font-stretch: normal;
  text-decoration: none;
  font-family: 'Pretendard-Regular';
}
.frame1-text21 {
  color: rgba(62, 73, 88, 1);
  width: 137px;
  height: auto;
  font-size: 15px;
  font-style: Light;
  text-align: left;
  font-family: Gilroy;
  font-weight: 300;
  line-height: 136.00000143051147%;
  font-stretch: normal;
  text-decoration: none;
  font-family: 'Pretendard-Regular';
}
.frame1-frame11 {
  gap: 10px;
  display: flex;
  align-items: flex-start;
  margin: 10px 0px;
  margin-top: 18px;
}
.frame1-text23 {
  color: rgba(62, 73, 88, 1);
  height: auto;
  font-size: 16px;
  font-style: Light;
  text-align: left;
  font-family: Gilroy;
  font-weight: 300;
  line-height: 136.00000143051147%;
  font-stretch: normal;
  text-decoration: none;
  font-family: 'Pretendard-Regular';
}
.frame1-frame10 {
  gap: 5px;
  display: flex;
  align-items: center;
  margin: 10px 0px;
  font-family: 'Pretendard-Regular';
}
.frame1-group34 {
  width: 28px;
  height: 28px;
  display: flex;
  position: relative;
  align-items: flex-start;
  flex-shrink: 1;
  font-family: 'Pretendard-Regular';
}
.frame1-ellipse2 {
  top: 0px;
  left: 0px;
  width: 28px;
  height: 28px;
  position: absolute;
}
.frame1-group33 {
  top: 2.977294921875px;
  left: 5px;
  width: 18px;
  height: 18.732694625854492px;
  display: flex;
  position: absolute;
  align-items: flex-start;
  flex-shrink: 1;
}
.frame1-vector {
  top: 0px;
  left: 0px;
  width: 18px;
  height: 19px;
  position: absolute;
}
.frame1-text25 {
  color: rgba(62, 73, 88, 1);
  height: auto;
  font-size: 15px;
  font-style: Light;
  text-align: left;
  font-family: Gilroy;
  font-weight: 300;
  line-height: 136.00000143051147%;
  font-stretch: normal;
  text-decoration: none;
  font-family: 'Pretendard-Regular';
}
.frame1-frame1401 {
  gap: 11px;
  width: 237px;
  display: flex;
  align-items: center;
  flex-shrink: 0;
  margin: 10px 0px;
}
.frame1-s-giconheart {
  width: 237px;
  height: 25px;
}
#recommend-star {
	color: gold;
    font-size: 20px;
    padding-right: 2px;
}
#recommend-like {
	color: tomato;
	font-size: 17px;
	padding-left: 10px;
	padding-right: 2px;
	margin-top: 4px;
}
.recommend-quote {
	color: tomato !important;
	font-size: 20px;
}
#recommend-map {
	color: #1BC060;
	font-size: 19px;
}


/* main */
	main {
		width: 1400px;
    	margin: 0 auto;
		padding: 10px;
		padding-left: 12px;
	}
	main::after {
		content: '';
		display: block;
		clear: both;
	}
	
/* 검색바, 목록보기 */
#searchForm {
	text-align: center;
}
.searchdiv {
	text-align: center;
	width: fit-content;
    margin: 10px auto;
    border: 1px solid #aaa;
    border-radius: 5px;
    font-family: 'Pretendard-Regular';
    margin-bottom: 20px;
}

/* 페이징 */
.page-link.active {
	background-color: #1BC060 !important;
	border-color: #1BC060 !important;
	font-family: 'Pretendard-Regular';
	color: #fff !important;
}
.disabled>.page-link, .page-link.disabled {
	background-color: #f5f5f5 !important;
	font-family: 'Pretendard-Regular';
}
.page-link {
	color: #444444 !important;
}

	/* 버튼 */
	.rec-btn {
		padding: 5px;
		border-radius: 0 4px 4px 0;
	    height: 38px;
		
	}

	input, textarea, button, select {
		border: hidden !important;
	}
	
	 .searchdiv .btn {
    	/* padding-left: 33px; */
   	}
	
	#ori-icon2 {
	font-size: 20px;
    /* margin-top: 3px; */
   }
   
   #ori-icon2 > span {
   	
   }
   
   
   #container-loc {
   height: 130px;
   width: 980px;
   }

</style>
<link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
		<!-- template.jsp > index.jsp -->
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
		<%@ include file="/WEB-INF/views/recommend/recheader.jsp" %>
		
		<div id="recommend" style="height: 100px; margin-top: -100px;"></div>
		
		<section class="container" id="container-loc">
			<h1>맛집 추천
				<c:if test="${map.search == 'n'}">
				<small>목록</small>
				</c:if>
				<c:if test="${map.search == 'y'}">
				<small>검색</small>
				</c:if>
			</h1>
			
			<!-- 위치 -->
			<div class="frame-group1222">
	           <div class="frame-mappin">
	             <span class="material-symbols-outlined">location_on</span>
	           </div>
	           <span class="frame-text15"><span><%= (String)session.getAttribute("location") %></span></span>
	         </div>
		</section>
		
		<c:if test="${map.search == 'y'}">
			<div style="text-align: center; font-family: 'Pretendard-Regular';">
				'${map.word}'(으)로 검색한 결과 ${totalCount}건이 있습니다.
			</div>
		</c:if>
		<c:if test="${list.size() == 0}">
			<div>
				게시물이 없습니다.
			</div>
		</c:if>
		
		
		<main>
		<c:forEach items="${list}" var="dto">
		<div class="frame1-propertycardbig1" onclick="location.href='/wood/recommend/recommenddetail.do?recommendseq=${dto.recommendseq}&column=${map.column}&word=${map.word}&search=${map.search}&restaurantseq=${dto.restaurantseq}';">
		        <img src="/wood/asset/rec_img/${dto.image}" alt="image" class="frame1-rectangle12"/>
		        
		        <div class="frame1-frame14">
		        
		          <!-- 제목, 댓글 -->
		          <span class="frame1-text17">
		            <span>${dto.title}</span>
		            
				  <c:if test="${dto.ccnt > 0}">
				 	 <span class="comment-count">(${dto.ccnt})</span>
				  </c:if>
		
		          </span>
		          
		          <!-- 별점, 좋아요 -->
		          <div class="frame1-frame13">
		            <div class="frame1-frame12">
		              <div class="frame1-group">
		                <span class="material-symbols-outlined" id="recommend-star">grade</span><span class="recommend-score">${dto.avgscore}</span>
		              </div>
		            </div>
		              <%-- <div class="frame1-group frame1-love">
		                <span class="material-symbols-outlined" id="recommend-like">favorite</span><span class="recommend-score">${dto.love}</span>
		              </div> --%>
		            </div>
		          </div>
		          
		          <!-- 한줄평 -->
		          <div class="frame1-frame11">
		            <span class="frame1-text23">
		              <span class="material-symbols-outlined recommend-quote">format_quote</span><span> ${dto.content} </span><span class="material-symbols-outlined recommend-quote">format_quote</span>
		            </span>
		          </div>
		          
		          <!-- 주소 -->
		          <div class="frame1-frame10">
		              <span class="material-symbols-outlined" id="recommend-map">map</span><span>${dto.fulladdress}</span>
		          </div>
	    </div>
		</c:forEach>
		
		
		</main>
	
		<!-- 검색바 -->
		<div class="searchdiv">
		<form id="searchForm" action="/wood/recommend/recommend.do" method="GET">
			<select name ="column">
				<option value="title">제목</option>
			</select>
			<input type="text" name="word" required style="outline:none;">
			<input type="submit" value="검색하기" class="rec-btn">
		</form>
		</div>
		
		<!-- 페이징 -->
		<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success" style="text-align: center; margin-bottom:20px; font-family: 'Pretendard-Regular';">${pagination}</ul>
			
		<div class="searchdiv">
			<!-- 관리자만 글쓰기 가능 -->
			<%-- <% if (session.getAttribute("lv").toString().equals("0")) { %>
			<button type="button" class="add primary" onclick="location.href='/toy/board/add.do?mode=new';">글쓰기</button>
			<% } %>	 --%>
    	     <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/wood/recommend/recommend.do';"><span class="material-symbols-outlined" id="ori-icon2">format_list_bulleted</span>목록보기</button>
		</div>
	
<%-- 	<form method="POST" action="/recommend/recommenddetail.do">
		<input type="hidden" name="recommendseq" id="recommendseq" value="${dto.recommendseq}">
		<input type="hidden" name="lat" id="lat" value="${dto.lat}">
		<input type="hidden" name="lng" id="lng" value="${dto.lng}">
	</form> --%>
	
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
<script>
		
	//검색중일때만
	<c:if test="${map.search == 'y'}">
	$('select[name=column]').val('${map.column}');
	$('select[name=word]').val('${map.word}');
	</c:if>
	
</script>
</body>
</html>









