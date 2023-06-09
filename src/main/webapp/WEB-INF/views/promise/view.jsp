<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>

		.category .job {
			margin: auto;
			width: 800px;
            min-height: 420px;
            border: 1px solid transparent;
            padding: 30px 19px 25px 19px;
            border-radius: 5px;
            box-shadow: rgba(108, 108, 108, 0.35) 0px 			5px 15px;
        }


        .category .job  span {
            padding: 6px 20px;
            font-weight: 400;
            border-radius: 26px;
            display: inline-block;
        }

        .category .job .colors1 {
            font-weight: 800;
            color: #F27E42;
            background: #f27e4242;
        }

        .category .job .colors2 {
            font-weight: 800;
            color: #4294F2;
            background: rgba(66, 148, 255, 0.26);
        }

        .category .job .colors3 {
            font-weight: 800;
            color: #2EB98D;
            background: rgba(46, 185, 141, 0.03);
        }

        .category .job .colors4 {
            font-weight: 800;
            color: #6A42F2;
            background: rgba(106, 66, 242, 0.07);
        }

        a {
            text-decoration: none;
            font-size: 20px;
            font-weight: 600;
            color: #071112;
            text-transform: capitalize;
            margin-bottom: 17px;
            display: block;
        }

        .place {
            display: flex;
            align-items: center;
            font-size: 12px;
            padding-left: 0px;
            color: #76787A;
        }

        .left {
            font-weight: 800;
        }

        .category .job span.time {
            font-weight: 900;
        }

        .btn.btn-primary {
            width: 150px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }


        .mt-30 {
            margin-top: 30px;
        }

        .mb-30 {
            margin-bottom: 30px;

        }
        
    .comment-btn {
        color: black;
        background-color: #a6ffe3;
        border: solid 1px #a6ffe3;
        
        width: 70px;
        height: 35px;
		
		margin-left:20px;
		margin-right:20px;

        font-size: 13px;

        transition: all 0.1s linear;


    }

    .comment-btn:hover {

        transform: scale(1.1);

    }
	










/* --------------------------------- */


        .card{
            margin: auto;
            width: 800px;
            min-height: 420px;
            border: 1px solid transparent;
            padding: 30px 19px 25px 19px;
            border-radius: 5px;
            box-shadow: rgba(108, 108, 108, 0.35) 0px 5px 15px;
        }

        .form-color{

        background-color: #fafafa;

        }

        .form-control{

        height: 48px;
        border-radius: 25px;
        }

        .form-control:focus {
        color: #495057;
        background-color: #fff;
        border-color: #35b69f;
        outline: 0;
        box-shadow: none;
        text-indent: 10px;
        }

        .c-badge{
        background-color: #35b69f;
        color: white;
        height: 20px;
        font-size: 11px;
        width: 92px;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 2px;
        }

        .comment-text{
        font-size: 13px;
        }

        .wish{

        color:#35b69f;
        }


        .user-feed{

            font-size: 14px;
            margin-top: 12px;
        }

		.title {
			color:black;
			font-weight: 600;
			margin: 10px;
		}
		
		.writer {
			padding: 10px;
			margin-bottom: 5px;
		}
		
		.content{
			padding: 5px;
			margin-top: 10px;
			margin-bottom: 10px;
			min-height: 150px;
			display: flex;
			justify-content:center;
			align-items:center;
			font-size: 13pt;
		}
		
		#hashtag {
			display:flex;
			justify-content: flex-end;
			padding: 10px;
		}
		
		
		.tag {
            background-color: #a6ffe3;
            color:#343434;

            border: none;
            padding: 5px;
            padding-left: 8px;
            padding-right: 8px;

            border-radius: 50px;

            transition: all 0.1s linear;
            
            margin-top: 10px;
            margin-left: 8px;
		}

        .tag:hover {
            transform: scale(1.1);
        }
		
		
	/* 댓글 */
	
	.comment-text {
		padding: 15px;
		min-height: 80px;
		border: 1px solid #ccc;
		border-radius: 20px;
		font-size: 13pt;
	}
	
	.comment-upper {
		padding: 10px;
	}
	
	.promise-accept {
	
	}
	
	/* 신청 내역 */
	
	.accept-job {
			margin: auto;
			width: 800px;
            min-height: 370px;
            border: 1px solid transparent;
            padding: 30px 19px 25px 19px;
            border-radius: 5px;
            box-shadow: rgba(108, 108, 108, 0.35) 0px 			5px 15px;
	}
	
	#promise-acceptlist {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.application-word {
		font-size: 16px;
	    font-weight: 800;
        color: #08a976;
        background: #b0ffe6;
		text-align: center;
		padding: 10px;
		border-bottom: 1px solid #ccc;
		margin-bottom: 25px;
		border-radius: 20px;
	}
	
	.application-box {
		padding: 5px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	
	.accept-nickname-box {
		margin: 0 auto;
		padding: 10px;
		width: 700px;
		height: 200px;
		overflow-y: scroll;
	}
	
	
	/* 스크롤바 */
	.accept-nickname-box::-webkit-scrollbar {
   		width: 16px;
	}
	.accept-nickname-box::-webkit-scrollbar-track {
	    background-color: #e4e4e4;
	    border-radius: 100px;
	}
	.accept-nickname-box::-webkit-scrollbar-thumb {
	    background-color: #d4aa70;
	    border-radius: 100px;
	}
	.accept-nickname-box {
	    scrollbar-color: #D4AA70 #e4e4e4;
	}
	.accept-nickname-box::-webkit-scrollbar-thumb {
	    background-image: linear-gradient(180deg, #D0368A 0%, #708AD4 99%);
	    box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
	    border-radius: 100px;
	}
	
	
	
	
	.accept-nickname {
 		margin: 0 auto; 
		border: none;
		border-radius: 20px;
		font-size: 17px;
		width: 650px;
		height: 50px;
		padding-left: 30px;
		padding-right: 30px;
		margin-top: 5px;
		margin-bottom:10px;
		display:flex;
		justify-content: space-between;
		align-items:center;	
		
		
		background-color: #eee;
		
		
	}
	
	.accept-nickname-span {
		/* margin: 0 auto; */
		vertical-align: middle;
		color:  #3f3f3f;
	}
	
	.accept-btn {
		display:flex;
		justify-content: space-between;
		padding: 5px;
		padding-left:10px;
		padding-right:10px;
		border:none;
		border-radius: 15px;
		background-color: #ff5a5a;
		color: white;
		
		 transition: all 0.1s linear;
	}
	
	.accept-btn:hover {
		
		transform: scale(1.1);
		
	}
	
			.numstate {
			background-color: tomato;
			color:white;
			border-radius:none;
		}
	
	.nickname {
		font-weight: 600;
		font-size: 16px;
	}
	
	.pricing {
		padding-left: 15px;
		padding-right: 10px;
	}
	
	#promise-accept-btn {
		background-color: white;
		color:tomato;
		font-weight: bold;
		padding: 5px;
		border-radius: 10px;
	}
	
	.comment-input {
		margin-left: 20px;
	}

	.comment-img {
		margin-left: 10px;
	}	
	
	.comment-nick {
		background-color: #e2e2e2;
		border: none;
		border-radius: 20px;
		padding: 5px;
		margin-bottom:5px;
	}
	
	
	
	


</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		
<div class="category mb-30">
        	<div class="job">
		  		<div>
		  			<div>
		            	<span class="colors1 mb-3">${dto.category}</span>
		            <c:if test="${id == dto.id}">
                           <div id="promise-accept" class="promise-accept d-flex flex-row user-feed" style="float:right;">
                              <button id="promise-accept-btn" type="submit" style="float:right; margin-left:10px;">신청내역보기</button>
                           </div>
                    </c:if> 
		            </div>

		        </div>    
		        <div>
		            <h5 class="title">${dto.title}</h5>
		        </div>
		        <div class="writer">
		            <img src="/wood/asset/img/루피.jpg" width="40" class="rounded-circle mr-3">
		            <span class="nickname">${dto.nickname}</span>
		        </div>
		            <div class="content">
		                <p>${dto.content}</p>
		            </div>
		            <div class="pricing d-flex justify-content-between align-items-center">
		                <div class="left">
		                    <span class="ml-2 numstate">${adminnum} / ${dto.num}</span>
		                </div>
		                <span class="time">${dto.regdate}</span>
		            </div>
		            <div id="hashtag">
					
					</div>

        	</div>
        	
    </div>
		
 <div  id="promise-acceptlist" class="category mb-30" style="display:none; ">
	<div class="accept-job">
		<div class="application-box">
			<div class="application-word colors1">신청내역</div>
		</div>
		<div class="accept-nickname-box">
			<c:forEach items="${acceptnickname}" var="rdto">
			<c:if test="${rdto.checkstate == 'F'}" >
				<div class="accept-nickname" <c:if test="${adminnum == dto.num }">style="display:none;"</c:if>>
					<span class="accept-nickname-span">${rdto.checknickname}</span>
					<button class="accept-btn" data-bs-toggle="modal" data-bs-target="#exampleModalAccept" onclick="accept('${rdto.checknickname}')">수락</button>
				</div>
			</c:if>
			</c:forEach>
			<c:if test="${adminnum == dto.num }">
				<div style="font-size:30px;">
					모집 완료
				</div>
			</c:if>
		</div>
	</div>
</div> 	
	


<!-- Modal -->
<div class="modal fade" id="exampleModalAccept" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border:none;">
      <div class="modal-header" style="border:none;">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="border:none; height: 300px; display:flex; justify-content:center; align-items:center; font-size: 20px;">
        약속신청을 수락하시겠습니까?
      </div>
      <div class="modal-footer" style="border:none; display:flex; justify-content: space-between;">
        <button type="button" class="btn" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn" onclick="$('#acceptForm').submit();">수락</button>
      </div>
    </div>
  </div>
</div>

<form id="acceptForm" action="/wood/promise/accept.do">
	<input type="hidden" name="nickname">
	<input type="hidden" name="promiseseq" value="${promiseseq}">
</form>



	
	
	
	
	<div class="container mt-5 mb-5">

        <div class="row height d-flex justify-content-center align-items-center">

          <div class="">

            <div class="card ">

              <div class="p-sm-1">

                <h6>Comments</h6>
                
              </div>


<form method="POST" action="/wood/promise/reply.do">
              <div id="addcomment" class="mt-3 d-flex flex-row align-items-center p-3 form-color" style="height: 100px;">

                <img src="https://i.imgur.com/zQZSWrt.jpg" width="50" class="comment-img rounded-circle mr-2">
                <input type="text" style="width:670px;"class="comment-input form-control ml-2" placeholder="댓글을 입력하세요" name="content" >
                <button type="submit" class="comment-btn rounded-5">확인</button>
              </div>
              <input type="hidden" name="promiseseq" value="${dto.promiseseq}">
</form>


		
       <div class="mt-2">
       <c:forEach items="${rlist }" var="rdto">
                <div class="d-flex flex-row p-3">
                  <img src="https://i.imgur.com/zQZSWrt.jpg" width="40" height="40" class="rounded-circle mr-3">
                  <div class="w-100">
                    <div class="comment-upper d-flex justify-content-between align-items-center">
                        <div class=" d-flex flex-row align-items-center mr-2">
                          <span class="comment-nick ml-3 mr-2" style="font-size:14px;">${rdto.nickname}</span>
                        </div>
                        <span style="font-size:14px;">${rdto.regdate}</span>
                  </div>

                  	<p class="text-justify comment-text mb-0"> ${rdto.content }</p>

                </div>
              </div>
              </c:forEach>



              
            </div>
          </div>
        </div>
        </div>
        
      </div>
		
		
		
		
		
		
		
		
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>


<script src="/toy/asset/js/jQuery.tagify.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script> -->


<script>





let temp = '';

<c:forEach items="${dto.tag}" var="tag">

	temp = `<button class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>`;

	$('#hashtag').append(temp);
	
</c:forEach>



/* $(function() {
	
	$('#promise-accept').click(function(){
		
		$('#promise-acceptlist').show();
		
	});
	
}); */

$('#promise-accept-btn').on('click', function() {
	
	if($("#promise-acceptlist").css("display") == "none"){
	     $("#promise-acceptlist").slideDown('slow');
	} else {
	    $("#promise-acceptlist").slideUp('slow');
	}
	
});


function accept(nickname) {
	$('input[name=nickname]').val(nickname);
}



</script>
</body>
</html>