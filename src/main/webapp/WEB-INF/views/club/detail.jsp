<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<link rel="stylesheet" href="/wood/asset/css/clubBtn.css">
<style>
.starR {
	display: inline-block;
	width: 30px;
	height: 30px;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
	font-size: 1.8em;
	box-sizing: border-box;
	cursor: pointer;
}

/* 별 이모지에 마우스 오버 시 */
.starR:hover {
	text-shadow: 0 0 0 #ccc;
}

/* 별 이모지를 클릭 후 class="on"이 되었을 경우 */
.starR.on {
	text-shadow: 0 0 0 #ffbc00;
}

table tr th {
	
}
</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section class="container">
		<h1  style="margin-bottom: 30px;">동호회 모집글 상세보기</h1>
		<input type="hidden" name="clubseq" value="123">
		<table class="table table-bordered col-md-8 justify-content-center align-middle" style="font-size:14px;">
			<tbody>
				<tr>
					<th>동호회 이름</th>
					<td><c:if test="${cbdto!=null}">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="${cbdto.name}">
						</c:if></td>
					<td colspan="2" class="text-center"><img
						src="/wood/clubupload/${cbdto.clubpic}" width="300px"></td>
				</tr>
				<tr>
					<th>동호회장</th>
					<td>${cbdto.nickname}</td>
					<th>건물명</th>
					<td>${cbdto.buildingname}</td>
				</tr>
				<tr>
					<th>동호회 소개글</th>
					<td colspan="3">
						<div class="mb-3">

							<textarea class="form-control" rows="7" name="content" readonly>${cbdto.content}</textarea>
						</div>
					</td>
				</tr>

				<tr>
					<th>최근 글 수정 날짜</th>
					<td>${cbdto.editdate}</td>
					<th>동호회 평점</th>
					<td><span class="starR on">⭐</span>&nbsp;<span id="clubscore">(없음)</span></td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>
						<div class="input-group input-group-sm">
							<input type="number" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-sm" min="0" max="20" value=5
								name="recruits" readonly> <span class="input-group-text"
								id="inputGroup-sizing-sm" style="width: 3rem;">명</span>
						</div>
					</td>
					<th>개설날짜</th>
					<td>${fn:substring(cbdto.opendate,0,10)}</td>
				<tr>
				<tr>
					<th>모집시작</th>
					<td>
						<input type="text" class="form-control" id="startdate" name="openregdate" readonly value="${fn:substring(cbdto.openregdate,0,10)}"/>
					</td>
					<th>모집마감</th>
					<td>
						<input type="text" class="form-control" id="enddate" name="closeregdate" readonly value="${fn:substring(cbdto.closeregdate,0,10)}"/>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="text-end">
			<button class="back basecolor"
				onclick="location.href='/wood/club/club.do';">돌아가기</button>
			<c:if test="${id == cbdto.id and cbdto.openregdate != cbdto.closeregdate}">
				<button class="group basecolor" onclick="location.href='/wood/club/edit.do?hseq=${cbdto.hobbyclubseq}';">수정하기</button>
				<button class="delete basecolor" onclick="closeRecruit('${cbdto.hobbyclubseq}');">모집종료</button>
			</c:if>
		</div>

		<c:if test="${id == cbdto.id}">
			<h2>신청자 현황</h2>
			<c:set var="cnt" value="${0}" />
			<table class="table table-bordered justify-content-center align-middle">
				<c:forEach items="${crlist}" var="crdto">
					<c:if test="${crdto.status == '미가입'}">
					<tr>
						<th>신청자</th>
						<td>${crdto.nickname}</td>
						<th>연락처</th>
						<td>${crdto.tel}</td>
						<th>상태 : ${crdto.status} </th>
						<td width="180px;" style="text-align: center;">
							<button class="cancel basecolor" onclick="denyRegister(this);">거절</button>&nbsp;
							<button class="search-check basecolor" onclick="approveRegister(this);">승인</button>
							<input type="hidden" value="${crdto.clubregisterseq}">
							<input type="hidden" value="${crdto.hobbyclubseq}">
							<input type="hidden" value="${cnt=cnt+1}">
						</td>
						
					</tr>
					</c:if>
				</c:forEach>
			</table>
			<c:if test="${cnt==0}">
			<table class="table table-bordered justify-content-center align-middle">
				<tr>
					<td style="text-align:center;">신청자가 없습니다.</td>
				</tr>
			</table>
			</c:if>	
		</c:if>
		
		<c:if test="${id != cbdto.id}">
			<h2>평점 작성하기</h2>
			<form>
				<table
					class="table table-bordered justify-content-center align-middle">
					<tr>
						<th style="background-color:#eee; width:140px;">작성자</th>
						<td colspan="2"><input class="form-control input-sm"
							id="newReplyWriter" type="text" value="${nickname}" readonly></td>
						<td width="240px">
							<div id="reply" class="starRev"
								style="display: inline; margin-right: 20px;">
								<span class="starR on">⭐</span> <span class="starR">⭐</span> <span
									class="starR">⭐</span> <span class="starR">⭐</span> <span
									class="starR">⭐</span>
							</div>
						</td>
						<td width="120px">
							<button id="addreview" class="edit basecolor">작성하기</button>
						</td>
					</tr>
					<tr>
						<th style="background-color:#eee;">댓글내용</th>
						<td colspan="4"><textarea class="form-control" rows="2"
								name="content" id="replycontent" required></textarea></td>
					</tr>
				</table>
			</form>
		</c:if>
		
		
		<h2>등록된 평점</h2>
		
			<table class="table table-bordered justify-content-center align-middle" style="font-size:14px;">
				<tbody id="review-holder">
			
				</tbody>
			</table>
		
		
				<!-- <tr>
						<th style="background-color:#eee;  width:140px;">작성자</th>
						<td colspan="2"><input class="form-control input-sm"
							id="newReplyWriter" type="text" value="nickname" readonly></td>
						<td width="80px" style="text-align:center">
							<div id="reply" class="starRev" style="display: inline; margin-right: 20px; ">
								<span class="starR on">⭐(4)</span> 
							</div>
						</td>
						<td width="220px">
							<button id="addreview" class="edit basecolor">수정하기</button>
							<button id="addreview" class="cancel basecolor">삭제하기</button>
						</td>
					</tr>
					<tr>
						<th style="background-color:#eee;">댓글내용</th>
						<td colspan="4">
						<textarea class="form-control" rows="2" name="content" id="replycontent" required readonly></textarea></td>
					</tr> -->
		
	</section>	
	<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	
	loadreview();
	
	function closeRecruit(hobbyclubseq){
		$.ajax({
			type:'POST',
			url:'/wood/club/delete.do',
			data: {
				hobbyclubseq : hobbyclubseq
			},
			dataType:'json',
			success: (result) => {
				if(result.result==1){ 
					new Swal("동호회글", "모집을 종료하였습니다.", "success").then(function() {
						location.href="/wood/club/club.do";
					});
				} else {
					new Swal("동호회글", "변경실패", "error").then(function() {
						location.href="/wood/club/club.do";
					});
				}
			}, error : (a, b, c) => console.log(a, b, c)
		});
	}

	$('#addreview').click(function(){
		
		let hobbyclubseq= '${cbdto.hobbyclubseq}';
		let clubseq = '${cbdto.clubseq}';
		let id = '${id}';
		
		if($('#replycontent').val()==''){
			
			alert('댓글내용을 작성해주세요.');
			return;
		}
		$.ajax({
			type:'POST',
			url:'/wood/club/addreview.do',
			data: {
				clubseq: clubseq,
				id : id,
				score :  $('#reply .starR.on').length,
				review:  $('#replycontent').val()
			},
			dataType:'json',
			success: (result) => {
				if(result.result==1) location.href="/wood/club/detail.do?hseq="+hobbyclubseq;
			}, error : (a, b, c) => console.log(a, b, c)
		});
	});
	
	
	
	
	function delreview(clubassessmentseq, reviewid){
		let hobbyclubseq= '${cbdto.hobbyclubseq}';
		
		let id='${id}';
		if(id!=reviewid) {
			new Swal("삭제 실패", "자신의 댓글만 삭제할 수 있습니다.", "error");
			return;
		}
			
		
		confirmEx('정말로 삭제 하실건가요?', function() {
		 	$.ajax({
				type:'POST',
				url:'/wood/club/delreview.do',
				data: {
					clubassessmentseq : clubassessmentseq
				},
				dataType:'json',
				success: (result) => {
				   if(result.result==1) {
					   new Swal("삭제", "댓글이 삭제되었습니다.", "success").then(function() {
						   location.href="/wood/club/detail.do?hseq="+hobbyclubseq;
						});
					   
				   } else {
					   new Swal("삭제실패", "댓글삭제 실패", "error").then(function() {
						   location.href="/wood/club/detail.do?hseq="+hobbyclubseq;
						});
					   
				   }
				}, error : (a, b, c) => console.log(a, b, c)
			}); 
		   console.log('User clicked "OK"');
		}, function() {
		   console.log('User clicked "Cancel"');
		});
	}
	
	
	function loadreview(){
		
		let clubseq ='${cbdto.clubseq}';
		let reviewCnt=0;
		let reviewScoreSum=0;
		$.ajax({
			
			type:'GET',
			url:'/wood/club/listreview.do',
			data: {
				clubseq : clubseq
			},
			dataType:'json',
			success: (result) => {
				
				$('#review-holder').html('');
				
				let id ='${id}';
				
				$(result).each((index, item)=>{
					
					$('#review-holder').append(
					`<tr>
						<th style="background-color:#eee;  width:140px;">작성자</th>
						<td colspan="2"><input class="form-control input-sm"
							id="newReplyWriter" type="text" value="\${item.nickname}" readonly></td>
						<td width="80px" style="text-align:center">
							<div class="starRev" style="display: inline; margin-right: 20px; ">
								<span class="starR on">⭐(\${item.score})</span> 
							</div>
						</td>
						<td width="120px">
							<button id="delreview" class="cancel basecolor" onclick="delreview(\${item.clubassessmentseq}, '\${item.id}');">삭제하기</button>
							<input type="hidden" value="\${item.clubassessmentseq}">
						</td>
					</tr>
					<tr>
						<th style="background-color:#eee;">댓글내용</th>
						<td colspan="4">
						<textarea class="form-control" rows="2" name="content" id="replycontent" required readonly>\${item.review}</textarea></td>
					</tr>
					`);
					reviewCnt++;
					reviewScoreSum=reviewScoreSum+parseInt(item.score);
				});
				
				if( reviewScoreSum != 0){
					let totalstar = (reviewScoreSum/reviewCnt).toFixed(2);
					$('#clubscore').html("("+totalstar+")");
				} else $('#clubscore').html("(리뷰없음)");
				
			}, error : (a, b, c) => console.log(a, b, c)
		}); 
	}
	
	
	var alertEx = function (message, callback) {
		  Swal.fire({
		    text: message,
		    allowOutsideClick: false,
		  }).then(function () {
		    if (callback) { callback(); }
		  });
	};

	var confirmEx = function (message, callback, fallback) {
	  Swal.fire({
	    text: message,
	    showCancelButton: true,
	    allowOutsideClick: false,
	  }).then(function (result) {
	    if (result.isConfirmed) {
	      if (callback) { callback(); }
	    } else if (result.isDismissed) {
	      if (fallback) { fallback(); }
	    }
	  });
	};

	
	
	function denyRegister(e){

		let clubregisterseq = $(e).next().next().val();
		let hobbyclubseq = $(e).next().next().next().val();
		let status = 'F';
		
		confirmEx('거절하실건가요?', function() {
			$.ajax({
				type:'POST',
				url:'/wood/club/denyregister.do',
				data: {
					clubregisterseq : clubregisterseq,
					hobbyclubseq : hobbyclubseq,
					status : status
				},
				dataType:'json',
				success: (result) => {
					new Swal("가입거절", "가입이 거절되었습니다.", "error");
					location.href="/wood/club/detail.do?hseq="+hobbyclubseq;
				}, error : (a, b, c) => console.log(a, b, c)
			});
			console.log('User clicked "OK"');
		}, function() {
			  console.log('User clicked "Cancel"');
		});
		
	} 
	
	function approveRegister(e){
		let clubregisterseq = $(e).next().val();
		let hobbyclubseq = $(e).next().next().val();
		let status = 'T';
		confirmEx('승인하실건가요?', function() {
			$.ajax({
				type:'POST',
				url:'/wood/club/approveregister.do',
				data: {
					clubregisterseq : clubregisterseq,
					hobbyclubseq : hobbyclubseq,
					status : status
				},
				dataType:'json',
				success: (result) => {
					new Swal("가입승인", "가입이 승인되었습니다.", "success");
					
					location.href="/wood/club/detail.do?hseq="+hobbyclubseq;
					
				}, error : (a, b, c) => console.log(a, b, c)
			});
			console.log('User clicked "OK"');
		}, function() {
			  console.log('User clicked "Cancel"');
		});

	}
	
	
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});

	//alert($('#reply .starR.on').length);
	



	
</script>
</body>
</html>