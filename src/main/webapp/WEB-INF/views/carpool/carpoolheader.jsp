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
	
	.move{
		font-size:60px;
		animation-name: arrow-move;
	    animation-iteration-count: infinite;
	    animation-duration: 1.5s;
	}
	
	@keyframes arrow-move {
    from { transform : translate(0, 0px); } 
    to   { transform : translate(0, 10px);} 
}
</style>


<body>
	<div class ="cropping">
			<img src="/wood/asset/img/carpool-image.jpg" 
			class="img-fluid " alt="..." 
				style=" ">
	
	<div class= "page-title">
		<p>카풀 게시판<span class="material-symbols-outlined move"><a href="#carpool-moving" style="text-decoration:none; color:white;">expand_more</a></span></p>
		
	</div>
</div> 
</body>







