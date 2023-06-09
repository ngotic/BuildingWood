<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/wood/asset/css/clubBtn.css">

<style>
.card {
	margin-bottom: 5px;
	/* margin-right: 10px;
	border-radius:0px;
	width:230px; */
	border-radius:0px;	
}

	.container{
		width:1100px;
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
	  border:1px solid #eee;
	  
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
	  /* left: 65px; */
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
	
	.frame-text15 > span {
	color: tomato;
	}
	
.banner-container {
  position: relative;
  width: 100%;
  height: 400px;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url(https://cdn.pixabay.com/photo/2021/12/10/17/42/camp-6861087_1280.jpg);
  background-size: cover;
  background-position: center center;
}


.banner-content {
  position: relative;
  z-index: 1;
  text-align: center;
}

.banner-text {
  font-size: 36px;
  color: white;
  text-align: center;
  margin-bottom: 20px;
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
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<%@ include file="/WEB-INF/views/club/clubheader.jsp" %>  
	<!-- <div class="banner-container">
  	<div class="banner-content">
    	<h1 class="banner-text">메인 제목</h1>
    	<button class="banner-button">버튼</button>
  		</div>
	</div> -->
	
	<section class="container" id="club">
		<h1 class="text-center" style="margin: 20px 0 20px 0;">동호회 게시판</h1>
		<div class="text-start" id="search" style="display:inline; transform: translate(0, -10px);">
			
		</div>
		<div class="text-end">
			<select id="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input class = "textbox" type="text" name = "name" id="keyword" placeholder ="검색어를 입력하세요."  >
			<input class ="button"  type ="submit" id="keywordbtn" value ="검색" style="border-radius:0px; font-weight:bold;">
			<button class="group bluecolor" onclick="location.href='/wood/club/addclub.do';">동호회 개설</button>
			<button class="note_add greencolor" onclick="location.href='/wood/club/add.do';">동호회 모집</button>
		</div>
		<hr style="margin-bottom:50px;">
		<div class="row" id="holder">
			<c:if test="${cblist==null}">
			<div class="col-md-12 col-sm-12 mb-3 mb-sm-0 mt-2">
					<div class="card mb-12" >
					 	 <div class="card-body" style="text-align:center">
					  		게시된 글이 없음
						</div>
				</div>
			</div>
			</c:if>
			<c:forEach items="${cblist}" var="cbdto">
				<div class="col-md-3 col-sm-6 mb-3 mb-sm-0 mt-2">
					<div class="card mb-6" >
					  <div class="card-body">
					    <h5 class="card-title">${cbdto.name} 
					    	<c:if test="${cbdto.openregdate != cbdto.closeregdate}">
					    		<span class="badge bg-success" style="float:right;">모집중</span>
					    	</c:if>
					    	<c:if test="${cbdto.openregdate == cbdto.closeregdate}">
					    		<span class="badge bg-danger" style="float:right;">모집마감</span>
					    	</c:if>
					    </h5>
					    <h6 class="card-subtitle mb-2 text-body-secondary mt-1">${cbdto.buildingname}</h6>
					    <p class="card-text">${cbdto.content}</p>
					    <hr>
					    	<div class="text-center">
					    		<div><span>모집시작 : ${cbdto.openregdate}  </span></div>
					    		<div><span>모집마감 : ${cbdto.closeregdate} </span></div>
					    		<div><span>모집인원 : ${cbdto.recruits}     </span></div>
					    	</div>
					    	<hr>
					    	<div class="d-flex justify-content-evenly mt-3">
					    		<button class="detail bluecolor" onclick="location.href='/wood/club/detail.do?hseq=${cbdto.hobbyclubseq}'">상세</button>
					    		<c:if test="${cbdto.openregdate != cbdto.closeregdate}">
						    		<button class="edit greencolor" onclick="salert('${cbdto.clubseq}',
						    		'${cbdto.name}', '${id}', '${cbdto.hobbyclubseq}');">신청</button>
					    		</c:if>
					    	</div>
					  </div>
					</div>
				 </div>
				 
			 </c:forEach>
		</div>
		
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>


$('#keyword').keydown(function(){
	
	console.log($('#keyword').val());
	var pattern = /^[가-힣a-zA-Z0-9]{1,}$/;
	
	if($('#keyword').val() != '') {
		if (!pattern.test($('#keyword').val())){
			return
		};
	}
	
	$.ajax({
		type:'POST',
		url: '/wood/club/club.do',
		data : {
			type : $('#type').val(),
			keyword : $('#keyword').val().trim()
		},
		dataType: 'json',
		success: (result)=> {
			$('#holder').html('');
			let id ='${id}';
			$(result).each((index, item)=>{
				console.log(item.hobbyseq);
				$('#holder').append(
					`
					<div class="col-md-3 col-sm-6 mb-3 mb-sm-0 mt-2">
						<div class="card mb-6" >
						  <div class="card-body">
						    <h5 class="card-title">\${item.name}</h5>
						    <h6 class="card-subtitle mb-2 text-body-secondary mt-1"> \${item.buildingname}</h6>
						    
						    <p class="card-text">\${item.content}</p>
						    <hr>
						    	<div class="text-center">
						    		<div><span>모집시작 : \${item.openregdate}  </span></div>
						    		<div><span>모집마감 : \${item.closeregdate}  </span></div>
						    		<div><span>모집인원 : \${item.recruits}  </span></div>
						    	</div>
						    <hr>
							<div class="d-flex justify-content-evenly mt-3">
				    			<button class="detail bluecolor" onclick="location.href='/wood/club/detail.do?hseq=\${item.hobbyclubseq}'">상세</button>
				    			<button class="edit greencolor" onclick="salert('\${item.clubseq}',
				    			'\${item.name}', '\${id}', '\${item.hobbyclubseq}');">신청</button>
				    		</div>
						  </div>
						</div>
					 </div>
					`
				);
			});
			
		},
		error: (a, b, c) => console.log(a, b, c)
	});  
});



/* $(window).scroll(()=>{
	
	if( window.innerHeight + window.scrollY >= document.body.offsetHeight ){
		
		
	 	$.ajax({
			type:'POST',
			url: '/ajax/ex14data.do',
			data : {
				n:n
			},
			dataType: 'json',
			success: (result)=> {
				$(result).each((index, item)=>{
					
					$('table tbody').append(
						`
						<tr>
							<td>\${item.seq}</td>
							<td>\${item.name}</td>
							<td>\${item.price}</td>
							<td>\${item.color}</td>
						</tr>
						`
					);
					
				});
				n += 10; // 어느 순간은 데이터가 없다. > 결국에 0이 나온다.
				console.log(result.length);
				
	
				if(result.length == 0) {
					alert(' 더 이상 게시물이 없습니다.');
					$('#btn').attr('disabled', true); 
					
				}
				
			},
			error: (a, b, c) => console.log(a, b, c)
		});  
		
		
	}
}); */





// 이미 신청했는지 알려줘야 함
function salert(seq, name, id, hseq) {
	
    new Swal({
      title: name,
      text: "가입 신청을 하시겠습니까?",
      icon: "warning",
      confirmButtonText: "Yes",
      showCancelButton: true,
      cancelButtonText: "No",
    }).then((result) => {
      if(result.value){
    	  // 등록 게시글 번호, 회원 아이디, 날짜, 상태
         // tuddse

		$.ajax({
			type: 'POST',
			url : 'http://localhost:8090/wood/club/register.do',
			dataType: 'json',
			data: 'seq='+seq+'&id='+id+'&hseq='+hseq,
			success: (ajaxresult) => {
				if(ajaxresult.result == 1){
					new Swal("가입신청", "가입이 신청되었습니다.", "success");			
				} else if(ajaxresult.result == -1){
					new Swal("가입실패", "이미 신청하셨거나 가입하셨습니다.", "error");
				} else {
					new Swal("실패", "가입에 실패하였습니다.", "error");
				}
			},
			error : (a, b, c)=> console.log(a, b, c) 				
		});        

      } else if (result.dismiss == "cancel"){
          new Swal("취소", "신청이 최소 되었어요", "error");
          
      } 
    });
  }

// 동호회를 개설한 사람만 등록할 수 있다. 현재 세션을 확인하고 id와 가져온 
// 동호회 list에 일치하는 id가 있으면 모집글 작성가능

// 동호회 개설 > 모달창
// 신청        > 모달창
// 상세는 따로 페이지 
// 신청중 따로 표시 


</script>
</body>
</html>