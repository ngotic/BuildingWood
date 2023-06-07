<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>






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
        padding: 50px;
        border-radius: 10px;

        width: 600px; 
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
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-lg modal-dialog-centered ">
          <div class="modal-content">
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
	
	

	<div class="board-name"> 
		
		<span>약속 게시판</span>
	
	</div>
		
		
	<div class="upperside2">
		<div class="upperside ">
		    <div class="place-bg rounded-5 ">
		        <span class="place-icon material-symbols-outlined">location_on</span>
		        <span class="place-text">강남구 역삼동</span>
		    </div>
		
		    <div class="searchbar-bg rounded-5">
		        <input type="text" class="searchbar-input" placeholder="검색어를 입력해주세요">
		    </div>
		
		
		    <button class="btn-search  rounded-5">Search</button>
		</div>
	
		<div>
		    <button class="btn-add rounded-5"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="promise-add">글쓰기</button>
		</div>
	</div>
		
		
		
		

    <div class="list-container">
        <div class="row">
        
		<c:forEach items="${list}" var="dto" varStatus="status">	
            <div class="col-lg-4 col-md-6 col-sm-6">
                    
	             <div class="category mb-30">
	                
	                <div class="card">
	                    <div id="job" class="job" onclick="location.href='/wood/promise/view.do?promiseseq=${dto.promiseseq}'">
	                        <span class="colors1 mb-4">${dto.category}</span>
	                        <span class="title">${dto.title}</span>
	                        <ul class="writer">
	                            <li>
	                                <img class="profile" src="/wood/asset/img/루피.jpg" width="40" class="rounded-circle mr-3">
	                            </li>
	                            <li>
	                                <p>${dto.nickname}</p>
	                            </li>
	                        </ul>
	                        <div class="d-flex align-items-center justify-content-between">
	                        	<p>모집인원 : ${dto.num}</p>
	                        	<p class="date">${dto.regdate}</p>
	                        </div>                  
								
	                    </div>
	                    <div id="hashtag${status.count}">
							
						</div>
						
	           		 </div>
	            </div>
            <input type="hidden" name="promiseseq" value="${dto.promiseseq}">
            
            <script>

			var temp = '';
			
			<c:forEach items="${dto.tags}" var="tag">
			
				temp = `<button type="submit" class="tag" onclick="location.href='/wood/promise/list.do?tag=${tag}';">${tag}</button>`;
			
				$('#hashtag${status.count}').append(temp);
				
			</c:forEach> 
			
			</script>
			
			
			</div>
</c:forEach>
            
            </div>
            </div>
            
           




            <div class="col-12 d-flex align-items-center justify-content-center">
                <button class="btn mb-30 mt-30" >
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
    
    
    
</script>
</body>
</html>