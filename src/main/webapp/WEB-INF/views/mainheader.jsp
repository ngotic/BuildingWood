<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>
	.cropping{
	 position: auto;
    width: auto; 
    height: 500px;
     overflow: hidden; 
	}

	.cropping img{
	 object-fit: cover;
	 position: absolute; 
      top: 2000; 		 
      left: 0;
      width: 5000px;  
      height: 500px;
        z-index: -1;
	}
	
	.page-title{
		width: auto;
		height: 70px;
		
		margin-top: 18%;
	}
	
	.page-title > p {
	
	color:white;
	font-weight 1rem;
	   font-size: 100px;
   
    margin: -10% 5% 0px 16%;
    padding: 14px 0px 1px 0px;
    font-family: 'Nanum Brush Script', cursive;
        text-align: right;
	}
	
</style>

<body>
	<div class ="cropping">
			<img src="/wood/asset/img/그림1.png" 
			class="img-fluid " alt="..." 
				style=" ">
	
	<div class= "page-title">
		<p>여기는 한독빌딩</p>
	</div>
</div> 
</body>







