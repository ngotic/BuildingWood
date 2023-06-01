<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
	  border-color: #cccccc;
	  border-width: 0.5px;
	  border-radius: 30px;
	  background-color: rgba(255, 255, 255, 1);
	}
	.frame-mappin {
	  top: 7px;
	  left: 32px;
	  width: 26px;
	  height: 28px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
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
	.frame-text15 {
	  top: 9px;
	  left: 65px;
	  color: rgba(255, 95, 95, 1);
	  height: auto;
	  position: absolute;
	  font-size: 17px;
	  font-style: Medium;
	  text-align: left;
	  font-family: Inter;
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
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
    top: 100px;
    left: 180px;
    width: 320px;
    height: 480px;
    display: inline-block;
    padding: 20px;
    margin: 15px 11px;
    position: relative;
    box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.15000000596046448);
    align-items: center;
    border-radius: 20px;
    justify-content: center;
    background-color: rgba(255, 255, 255, 1);
}
.frame1-rectangle12 {
  	width: 280px;
    height: 195px;
    border-radius: 20px;
    text-align: center;
    padding-left: 0px;
    object-fit: fill;
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
  
}
.frame1-frame13 {
  gap: 20px;
  display: flex;
  align-items: flex-start;
  margin: 10px 0px;
}
.frame1-frame12 {
  gap: 4px;
  display: flex;
  align-items: flex-start;
}
.frame1-group {
  width: 17px;
  height: 17.045473098754883px;
  display: flex;
  position: relative;
  align-items: flex-start;
  flex-shrink: 1;
}
.frame1-star {
  top: 0px;
  left: 0px;
  width: 17px;
  height: 17px;
  position: absolute;
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
}
.frame1-frame11 {
  gap: 10px;
  display: flex;
  align-items: flex-start;
  margin: 10px 0px;
}
.frame1-text23 {
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
}
.frame1-frame10 {
  gap: 11px;
  display: flex;
  align-items: center;
  margin: 10px 0px;
}
.frame1-group34 {
  width: 28px;
  height: 28px;
  display: flex;
  position: relative;
  align-items: flex-start;
  flex-shrink: 1;
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
    margin-right: 10px;
    font-size: 20px;
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
	<section class="container">
		<h1>맛집 추천<small> </small></h1>
		
		<!-- 위치 -->
		<div class="frame-group1222">
           <div class="frame-mappin">
             <span class="material-symbols-outlined">location_on</span>
           </div>
           <span class="frame-text15"><span>강남구 역삼동</span></span>
         </div>
	</section>
	
	<main>
	
	
	
	<div class="frame1-propertycardbig1">
            <img
              src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/a6678233-f9fe-40a4-84a5-9d2d1fe31607/d7f1a4ef-0f7b-4408-9a54-e1a6e7bf8f62?org_if_sml=183525"
              alt="Rectangle121081"
              class="frame1-rectangle12"
            />
            <div class="frame1-frame14">
              <span class="frame1-text17">
                <span>Fully Furnished Smart Studio Apartment</span>
              </span>
              <div class="frame1-frame13">
                <div class="frame1-frame12">
                  <div class="frame1-group">
                    <!-- <img
                      src="public/external/star1081-bwku.svg"
                      alt="Star1081"
                      class="frame1-star"
                    /> -->
                    <span class="material-symbols-outlined" id="recommend-star">grade</span>
                  </div>
                  <span class="frame1-text19"><span>4.8</span></span>
                </div>
                <span class="frame1-text21"><span>Mercedes Vito</span></span>
              </div>
              <div class="frame1-frame11">
                <span class="frame1-text23">
                  <span>2 guests | 1 bedroom | 2 bathroom</span>
                </span>
              </div>
              <div class="frame1-frame10">
                <div class="frame1-group34">
                  <img
                    src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/a6678233-f9fe-40a4-84a5-9d2d1fe31607/69f38428-8c40-47dc-9c3b-77b8002674de?org_if_sml=1516"
                    alt="Ellipse21081"
                    class="frame1-ellipse2"
                  />
                  <div class="frame1-group33">
                    <img
                      src="public/external/vector1081-0mf8.svg"
                      alt="Vector1081"
                      class="frame1-vector"
                    />
                  </div>
                </div>
                <span class="frame1-text25">
                  <span>Entire Studio Apartment</span>
                </span>
              </div>
              <div class="frame1-frame1401">
                <img
                  src="public/external/svgiconheart1101-u5e.svg"
                  alt="SVGiconheart1101"
                  class="frame1-s-giconheart"
                />
              </div>
            </div>
          </div>
          
	
	</main>
	
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
<script>

</script>
</body>
</html>









