<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script> -->
<%@ include file="/WEB-INF/views/include/asset.jsp" %>



     
     
<style >  
     html {

     }

      body {


     }
     
     .tagify {
		border: 1px solid #BBB;
		border-radius: 3px;
 		width: 100%; 
	}
	
     h1 {
        margin-top: 30px;
    }

    h2 {
        margin-bottom: 30px;
    }
    
  
	
	

	 .modal-dialog {
	    margin: auto;
	}  
    
    
     .modal-content {
     	margin: auto; 
    	display:flex;
    	justify-content: center;
    	align-items: center;

    }
    
    .modal-body {
     	margin: auto; 
	    margin-top: 50px;
	    margin-bottom: 50px;
        padding: 10px;
        border-radius: 10px;

        width: 700px; 
    }
    
    .modal-footer {
    	justify-content: space-evenly;
    } 
    
    .board-name > span {
    	font-size: 40pt;
    	text-align: center;
    	margin-top: 30px;
    	margin-bottom: 30px;
    }
    
    .list-container {
    	margin-top: 100px;
    }
    
    .date {
    	margin-left: 20px;
    }
    
    	#hashtag {
 			display:flex;
			justify-content: flex-end;  
			padding: 10px;
		}
		
		.hashtag {
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
        
        .card {
        	width: 340px;
        	height: 310px;
        	border: 1px solid transparent;
		    padding: 30px 19px 25px 19px;
		    border-radius: 5px;
		    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
		
		    transition: 0.1s linear;
		    
		    cursor: pointer;
        }
        
        .card:hover {
		    box-shadow: #8dffbd 0px 5px 15px;
		} 
		
		li {
			list-style-type: none;
		}
		
		.endspan {
			border:2px solid gray;
			display: inline-block;
			float:right;
			color:tomato;
		}
		
		.end {
			background-color: gray;
		}
		
		.numstate {
			background-color: tomato;
			color:white;
			border-radius:none;
		}



    
   </style>
   
   
   <link
     rel="stylesheet"
     href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
     data-tag="font"
   />
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet" href="/wood/asset/css/tagify.css">

   <link rel="stylesheet" href="/wood/asset/css/searchbar_ahyun.css" />
   <link rel="stylesheet" href="/wood/asset/css/promiselist_ahyun.css" />
   
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
	
</head>
<body>

	
	
<form method="POST" action="/wood/promise/add.do">
	<!-- Modal -->
     <div class="modal fade" id="exampleModalPromise" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="promise-modal-dialog modal-dialog modal-lg modal-dialog-centered ">
          <div class="promise-modal-dialog modal-content">
            <div class="modal-header">
                  <h1 class="text-success text-center">
                      약속 등록
                  </h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
             <div class="form-group">
                      <label class="modal-label">제목</label>
                      <input type="text" class="form-control" name="title" placeholder="글 제목을 입력하세요" >
                  </div>
                  <div class="form-floating">
                      <label class="modal-label">소개글</label>
                      <textarea class="form-control" placeholder="소개글을 작성하세요" id="floatingTextarea2" style="height: 100px" name="content"></textarea>
                    </div>
                    <div class="form-group">
                      <label class="modal-label">글머리</label>
                      <select class="form-control" name="category">
                        <option>밥약속</option>
                        <option>술약속</option>
                        <option>단합회</option>
                        <option>기타</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label class="modal-label">해쉬태그</label>
                      <input type="text" class="form-control" id="hashtag" placeholder="해쉬태그를 입력하세요" name="hashtag" >
                  </div>
                  <div class="form-outline" style="width: 10rem;">
                      <label class="form-label" for="typeNumber">모집인원</label>
                      <input min="1" max="100" type="number" id="typeNumber" class="form-control" name="num" />
                  </div>
                  </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="submit" class="btn btn-primary" id="promise-add">등록</button>
            </div>
          </div>
        </div>
      </div>	 
   
</form>








	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
<section class="container">
	

		
		
	<div class="upperside2">
		<div class="upperside ">
		    <div class="place-bg rounded-5 ">
		        <span class="place-icon material-symbols-outlined">location_on</span>
		        <span class="place-text">강남구 역삼동</span>
		    </div>
		
		    <div class="searchbar-bg rounded-5">
		        <input type="text" class="searchbar-input" placeholder="검색어를 입력해주세요" onfocus="this.placeholder = ''" >
		    </div>
		
		
		    <button class="btn-search  rounded-5">Search</button>
		</div>
	
		<div>
		    <button class="btn-add rounded-5"  data-bs-toggle="modal" data-bs-target="#exampleModalPromise" id="promise-add">글쓰기</button>
		</div>
	</div>
		
		
		
		

    <div class="list-container">
        <div class="row">
        
		<c:forEach items="${list}" var="dto" varStatus="status">	
            <div class="col-lg-4 col-md-6 col-sm-6">
                    
	             <div class="category mb-30">
	                
	                <div class="card" <c:if test="${dto.adminnum == dto.num }"> style="pointer-events:none;"</c:if>>
	                    <div id="job" class="job" onclick="location.href='/wood/promise/view.do?promiseseq=${dto.promiseseq}'">
	                    	<div>
	                        	<span class="colors1 mb-4">${dto.category}</span>
	                        	<c:if test="${dto.adminnum == dto.num }">
	                        		<span class="endspan">모집종료</span>
	                        	</c:if>
	                        </div>
	                        <span class="title">${dto.title}</span>
	                        <ul class="writer">
	                            <li>
	                                <img class="profile" src="/wood/asset/img/루피.jpg" width="40" class="rounded-circle mr-3">
	                            </li>
	                            <li>
	                                <p style="padding-left:10px;">${dto.nickname}</p>
	                            </li>
	                        </ul>
	                        <div class="d-flex align-items-center justify-content-between">
	                        	<span class="numstate">${dto.adminnum} / ${dto.num}</span>
	                        	<p class="date">${dto.regdate}</p>
	                        </div>                  
								
	                    </div>
	                    <div id="hashtag${status.count}" class="hashtag">
							<c:forEach items="${dto.tags}" var="tag">
		                       <button type="submit" class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>
		                    </c:forEach>
						</div>
						
	           		 </div>
	            </div>
            <input type="hidden" name="promiseseq" value="${dto.promiseseq}">
            
<!--             <script>

			var temp = '';
			
			<c:forEach items="${dto.tags}" var="tag">
			
				temp = `<button type="submit" class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>`;
			
				$('#hashtag${status.count}').append(temp);
				
			</c:forEach> 
			
			</script> -->
			
			
			</div>
</c:forEach>
            
            </div>
            </div>
            
           




            <div class="col-12 d-flex align-items-center justify-content-center">
                <button id="morelist" class="btn mb-30 mt-30" >
                    더보기
                    <span class="icon material-symbols-outlined">
                        keyboard_double_arrow_down
                        </span>
                </button>
            </div>





		
	

		
	</section>
	
	
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
</script>	
<script src="/toy/asset/js/jQuery.tagify.min.js"></script>
<script>



$('input[name=hashtag]').tagify();


$(function() {
	$('.tag').click(function() {
		$('.tag').val()
	})
}); 
    

var n = 7;
   
$('#morelist').on('click',function() {
	
	
	
    $.ajax({
        type: 'GET',
        url: '/wood/promise/list.do',
        data: {
           n:n
        },
        dataType: 'json',//밑에 추가될 10개 데이터 돌려받
        success: (result)=>{
        	
        	
        	
           //밑에 추가될 10개 내용
           $(result).each((index,item)=>{

        	   
        	   let temp = '';
        	   

            	temp +=	`<div class="col-lg-4 col-md-6 col-sm-6">
			             <div class="category mb-30">
			                <div class="card"`;
			     
			    if (item.adminnum == item.num) {
			    	temp += ' style="pointer-events:none;"';
			    }
			    
			    
			    temp += `>
                    <div id="job" class="job" onclick="location.href='/wood/promise/view.do?promiseseq=\${item.promiseseq}'">
	                <div>
                    	<span class="colors1 mb-4">\${item.category}</span>
                    	`;
                    	
                if (item.adminnum == item.num) {
                	
                	temp += `<span class="endspan" style="border:2px solid gray; display: inline-block; float: right; color: tomato;">모집종료</span>`;
                
                }
			    
                temp += `</div>
                    <span class="title">\${item.title}</span>
                    <ul class="writer">
                        <li>
                            <img class="profile" src="/wood/asset/img/루피.jpg" width="40" class="rounded-circle mr-3">
                        </li>
                        <li>
                            <p style="padding-left:10px;">\${item.nickname}</p>
                        </li>
                    </ul>
                    <div class="d-flex align-items-center justify-content-between">
                    	<span class="numstate">\${item.adminnum} / \${item.num}</span>
                    	<p class="date">\${item.regdate}</p>
                    </div>                  
                </div>
                <div id="hashtag" style="padding:0px;">`;
                
                
                for (let i=0; i<item.tags.length; i++) {
                	
                	temp +=`<button type="submit" class="tag" onclick="location.href='/wood/promise/list.do?tag=\${item.tags[i]}';">\${item.tags[i]}</button>`;
                	
                }
			    
	                        
			    temp += `</div>
	           		 </div>
		            </div>
	            <input type="hidden" name="promiseseq" value="\${item.promiseseq}">
				</div>`;
             		 
             		 
             		 
   
           	$('.row').append(temp);
           
           
              
           });
           
           n += 7;
           
           
           //console.log(result.length);
           
           
           //가져올 데이터가 없을때 
               if(result.length < 1) {
         	  //더이상 버튼을 누를 수 없도록 조치
         	  $('#morelist').attr('disabled',true);
           } 
           
           
           if(result.length == 0) {
         	  alert('더 이상 게시물이 없습니다.');
         	  $('#morelist').attr('disabled',true);            	  	  
           }
           
        },
        error: (a,b,c)=>console.log(a,b,c)
     });
	
	
	//n+=7;
	
});     
   
   
/*    var temp = '';
	
	<c:forEach items="${dto.tags}" var="tag">
	
		temp = `<button type="submit" class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>`;
	
		$('#hashtag${status.count}').append(temp);
		
	</c:forEach> */
    
    
</script>
</body>
</html>