<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.cropping{
	 position: auto;
    width: auto; 
    height: 500px;
     overflow: hidden; 
        margin:auto;
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
		background-color: rgb(192, 200, 222);
	}
	
	.page-title > p {
	
	color:white;
	font-weight 1rem;
	font-size: 25px;
    margin: 0px 0px 0px 20%;
    padding: 14px 0px 1px 0px;
	}
	
	btn1{
	 	width:100px;
        margin:auto;
        display:block;
	}
	.cropping > button{
		align-content: center;
	}
</style>


<body>
	<div class ="cropping">
			<img src="/wood/asset/img/studymainimg.jpg" 
			class="img-fluid " alt="..." 
				style=" ">
			<input type="button" class="btn1" value ="스터디 게시판">
	</div> 


</body>







