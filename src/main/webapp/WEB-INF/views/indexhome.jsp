<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
.banner-container {
	position: relative;
	width: 100%;
	height: 400px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.banner-container img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: auto;
	object-fit: cover;
}

.banner-text {
	font-size: 36px;
	color: white;
	text-align: center;
	margin-bottom: 20px;
	z-index: 1;
}

.banner-button {
	padding: 10px 20px;
	background-color: #333;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
	<div class="banner-container">
		<img
			src="https://cdn.pixabay.com/photo/2020/11/05/23/16/city-5716456_1280.jpg"
			alt="Banner Image">
		<h1 class="banner-text">한독 빌딩입니다.</h1>
		<button class="banner-button">더보기</button>
	</div> -->
	<%@ include file="/WEB-INF/views/mainheader.jsp" %>  
	<section class="container"></section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$(document).ready(function() {
			var slides = $('.banner-slide');
			var currentIndex = 0;

			// Show the first slide
			$(slides[currentIndex]).addClass('active');

			// Start the slide show
			setInterval(function() {
				$(slides[currentIndex]).removeClass('active');
				currentIndex = (currentIndex + 1) % slides.length;
				$(slides[currentIndex]).addClass('active');
			}, 3000); // Change slide every 3 seconds
		});
	</script>
</body>
</html>