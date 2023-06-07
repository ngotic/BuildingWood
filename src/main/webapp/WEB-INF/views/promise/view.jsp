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


        .category .job span {
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

        .category .job .colors5 {
            font-weight: 800;
            color: #F162BC;
            background: rgba(241, 98, 188, 0.07);
        }

        .category .job .colors2 {
            font-weight: 800;
            color: #4294F2;
            background: rgba(66, 148, 255, 0.26);
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

        margin-top: 30px;
        margin-left: 80px;

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
		padding: 10px;
		min-height: 80px;
		border: 1px solid #ccc;
		border-radius: 20px;
	}
	
	.comment-upper {
		padding: 10px;
	}
	
	.promise-accept {
	
	}
	
	/* 신청 내역 */
	
	.application-word {
		text-align: center;
		padding: 5px;
		border-bottom: 1px solid #ccc;
	}
	
	.application-box {
		margin: 0 auto;
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
            <span class="colors2 mb-4">${dto.category}</span>
            <h5 class="title">${dto.title}</a></h5>
        </div>
        <div class="writer">
            <img src="/wood/asset/img/루피.jpg" width="40" class="rounded-circle mr-3">
            <span>${dto.nickname}</span>
        </div>
            <div class="content">
                <p>${dto.content}</p>
            </div>
            <div class="pricing d-flex justify-content-between align-items-center">
                <div class="left">
                    <p class="ml-2">모집인원: ${dto.num }</p>
                </div>
                <span class="time">${dto.regdate}</span>
            </div>
            <div id="hashtag">
            
			</div>
			      <c:if test="${not empty id && (id == dto.id)}">
	                  <div id="promise-accept" class="promise-accept d-flex flex-row user-feed" style="float:right;">
	                  	<button >수락취소</button>
	                  	<button type="submit" style="float:right; margin-left:10px;">신청내역보기</button>
	                  </div>
                  </c:if> 
        </div>

    </div>
		
 <div class="category mb-30">
	<div class="job">
		<div class="application-box">
			<div class="application-word colors1">신청내역</div>
		</div>
		<c:forEach items="${acceptnickname}" var="nickname">
			<div>${nickname}</div>
		</c:forEach>
	</div>
</div> 	
	
	
	
	
	
	<div class="container mt-5 mb-5">

        <div class="row height d-flex justify-content-center align-items-center">

          <div class="">

            <div class="card ">

              <div class="p-sm-1">

                <h6>Comments</h6>
                
              </div>


<form method="POST" action="/wood/promise/reply.do">
              <div id="addcomment" class="mt-3 d-flex flex-row align-items-center p-3 form-color">

                <img src="https://i.imgur.com/zQZSWrt.jpg" width="50" class="rounded-circle mr-2">
                <input type="text" style="width:500px;"class="form-control ml-2" placeholder="댓글을 입력하세요" name="content" >
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
                        <div class=" d-flex flex-row align-items-center">
                          <span class="mr-2">${rdto.nickname}</span>
                        </div>
                        <small>${rdto.regdate}</small>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


<script>


let temp = '';

<c:forEach items="${dto.tag}" var="tag">

	temp = `<button class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>`;

	$('#hashtag').append(temp);
	
</c:forEach>


/* $('.tag').on('click',function(e) {
	
	location.href = '/wood/promise/list.do?tag=' + e.detail.data.value;
	
}); */

/* $(function() {
	
	$('#promise-accept').click(function(){
		
		if ()
		
	});
	
}); */





</script>
</body>
</html>