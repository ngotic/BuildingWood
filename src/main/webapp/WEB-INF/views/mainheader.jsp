<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	
	.slide {
        /* layout */
        position: relative;
        width: 100%;
        height: 308px;
        display: flex;
        
	  flex-wrap: nowrap;
        overflow: hidden;
    }

    .slide_item {
        /* layout */
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 300px;
        flex-shrink: 0;
        opacity: 0;
        transition: opacity 1s ease;
        
        display: flex;
        justify-content: center;
    }

    .slide_item.active {
        opacity: 1;
    }

    .slide_prev_button,
    .slide_next_button {
        /* layout */
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 30px;
        height: 30px;
        background-color: rgb(252 252 252 / 30%);
        border-radius: 50%;
        cursor: pointer;
    }

    .slide_prev_button {
        left: 10px;
    }

    .slide_next_button {
        right: 10px;
    }

    .slide_pagination {
        /* layout */
        position: absolute;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .slide_pagination_item {
        /* layout */
        display: flex;
        justify-content: center;
        align-items: center;
        /* size */
        width: 10px;
        height: 10px;
        /* style */
        background-color: #aaaa;
        border-radius: 100%;
        /* cursor */
        cursor: pointer;
        margin: 4px;
    }

    .slide_pagination_item.active {
        background-color: #333;
    }
    .material-symbols-outlined {
    	color: #565656 !important;
    	margin: 3px !important;
    }
	
</style>
<body>
	
	<div class="slide">
    <div class="slide_item active">
        <img src="/wood/asset/img/메인1.jpg" alt="Image 1" >
    </div>
    <div class="slide_item">
        <img src="/wood/asset/img/메인2.jpg" alt="Image 2" >
    </div>
     <!-- 슬라이드 이전 버튼 -->
    <div class="slide_button slide_prev_button"><span class="material-symbols-outlined">navigate_before</span></div>

    <!-- 슬라이드 다음 버튼 -->
    <div class="slide_button slide_next_button"><span class="material-symbols-outlined">navigate_next</span></div>

    <!-- 페이지네이션 -->
    <ul class="slide_pagination">
        <li class="slide_pagination_item"></li>
        <li class="slide_pagination_item"></li>
    </ul>
</div>

<script>
	
document.addEventListener("DOMContentLoaded", function () {
    // 슬라이드 요소들을 가져온다.
    const slideContainer = document.querySelector(".slide");
    const slideItems = Array.from(document.querySelectorAll(".slide_item"));
    const prevButton = document.querySelector(".slide_prev_button");
    const nextButton = document.querySelector(".slide_next_button");
    const paginationItems = Array.from(document.querySelectorAll(".slide_pagination_item"));

    // 현재 슬라이드 인덱스
    let currentSlide = 0;

    // 슬라이드 이동 함수
    const goToSlide = function (slideIndex) {
        // 현재 슬라이드 비활성화
        slideItems[currentSlide].classList.remove("active");
        paginationItems[currentSlide].classList.remove("active");

        // 다음 슬라이드 활성화
        slideItems[slideIndex].classList.add("active");
        paginationItems[slideIndex].classList.add("active");

        // 현재 슬라이드 인덱스 갱신
        currentSlide = slideIndex;
    };

    // 이전 버튼 클릭 이벤트 핸들러
    prevButton.addEventListener("click", function () {
        const prevSlideIndex = (currentSlide - 1 + slideItems.length) % slideItems.length;
        goToSlide(prevSlideIndex);
    });

    // 다음 버튼 클릭 이벤트 핸들러
    nextButton.addEventListener("click", function () {
        const nextSlideIndex = (currentSlide + 1) % slideItems.length;
        goToSlide(nextSlideIndex);
    });

    // 페이지네이션 클릭 이벤트 핸들러
    paginationItems.forEach(function (paginationItem, index) {
        paginationItem.addEventListener("click", function () {
            goToSlide(index);
        });
    });

    // 첫 번째 슬라이드 활성화
    slideItems[0].classList.add("active");
    paginationItems[0].classList.add("active");

    // 슬라이드 자동 전환 함수
    const autoSlide = function () {
        const nextSlideIndex = (currentSlide + 1) % slideItems.length;
        goToSlide(nextSlideIndex);
    };

    // 3초마다 슬라이드 자동 전환
    setInterval(autoSlide, 4300);
});
	
	
</script>
	

</body>







