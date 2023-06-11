<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<!-- 카드 info -->
<style>

	.carpool-view-card {
	  width: 100%;
	  display: flex;
	  overflow: auto;
	  min-height: 100vh;
	  align-items: center;
	  flex-direction: column;
	  padding-top: 30px;
	}
	
	.carpool-view-frame {
	  gap: 12px;
	  width: 656px;
	  height: auto;
	  display: flex;
	  box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: center;
	  flex-shrink: 0;
	  border-color: rgba(255, 255, 255, 1);
	  border-style: solid;
	  border-width: 1px;
	  border-radius: 12px;
	  flex-direction: column;
	  background-color: #F2F2F2;
	  padding-left: 30px;
      padding-right: 30px;
      /* padding-bottom: 30px; */
	}
	
	.info-frame {
	  width: 656px;
	  position: relative;
	  align-items: center;
	  flex-shrink: 0;
	  padding: 30px;
	}
	
	
 	.info-top-frame {
	  display: flex;
	  align-items: center;
	  margin-right: 30px;
	}
	
	
	.user-info {
		padding-left: 4px;
	}
	
	.profile {
		width: 70px;
		height: 70px;
		border-radius: 50%;
		box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.25);
	}
	
	.nickname {
		font-size: 1.2rem;
	}
	
	.gender {
		font-size: 1.2rem;
	}
	
	.rating {
		display: flex;
  		align-items: center;
	}
	
	.rating-star {
		width: 20px;
		height: 20px;
		margin-right: 5px;
	}
	
	.rating-score {
		font-size: 1rem;
	}
	
	.apply-list-check {
		right: 40px;
    	position: absolute;
	}
	
	.apply-list-view {
		padding: 10px;
		background-color: rgba(255, 255, 255, 1);
	  	border-radius: 15px;
	  	border: none;
	}
	
	
	.carpool-info-box {
	  display: flex;
	  padding: 24px 24px 24px;
	  align-items: flex-start;
	  border-color: rgba(232, 234, 234, 1);
	  border-style: solid;
	  border-width: 1px;
	  border-radius: 16px;
	  flex-direction: column;
	  background-color: rgba(255, 255, 255, 1);
	}
	
	.carpool-info {
	  gap: 16px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.departures-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.departures {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  font-size: 20px;
	  align-self: stretch;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 28px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.narrow-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: center;
	  flex-direction: column;
	}
	
	.narrow {
	  width: 30px;
	  height: 13px;
	}
	
	.arrivals-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	  border-bottom: 1px solid #d8d8d8;
      padding-bottom: 15px;
	}
	
	.arrivals {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  font-size: 20px;
	  align-self: stretch;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 28px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.datetime-frame {
	  gap: 8px;
	  right: 0px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.datetime {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  font-size: 1.1rem;
	  align-self: stretch;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 28px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	/* .line {
	  width: 247px;
	  height: 1px;
	  align-self: stretch;
	} */
	
	.price-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.price {
	  color: rgba(45, 180, 0, 1);
	  height: auto;
	  font-size: 2rem;
	  align-self: stretch;
	  font-style: Regular;
	  text-align: right;
	  font-weight: 400;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	  padding-top: 15px;
	  padding-bottom: 10px;
	}
	
	.content-frame {
		display: flex;
		border-bottom: 1px solid #d8d8d8;
		padding-bottom: 15px;	
		align-self: stretch;
    	align-items: flex-start;
    	flex-direction: column;
	}
	
	.content {
		font-size: 1rem;
		padding-left: 50px;
    	padding-right: 50px;
    	text-align: center;
    	align-self: stretch;
	}
	
	
	
	/* 버튼 */

	.apply {
	  width: 142px;
	  height: 50px;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
	  background-color: rgba(45, 180, 0, 1);
	  border-radius: 15px;
	  border: none;
	  font-size: 20px;
	}
	
	.edit {
	  width: 142px;
	  height: 50px;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
	  border-radius: 15px;
	  border: none;
	  font-size: 20px;
	  color: rgba(98, 98, 98, 1);
	  background-color: rgba(255, 255, 255, 1);
	}
	
	.del {
	  width: 142px;
	  height: 50px;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
	  border-radius: 15px;
	  border: none;
	  font-size: 20px;
	  color: rgba(98, 98, 98, 1);
	  background-color: rgba(255, 255, 255, 1);
	}
	
	
	.back-button {
	  width: 40px;
	  height: 40px;
	  border: none;
	  margin-bottom: 100px;
	  margin-right: 30px;
	  position: relative;
	  z-index: 1;
	  background: none;
	}
	
	.back-box {
	  top: 13px;
	  left: 0px;
	  width: 142px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.back {
	  color: rgba(98, 98, 98, 1);
	  width: 50px;
	  height: auto;
	  position: absolute;
	  font-size: 20px;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.back-icon {
		width: 20px;
		height: 20px;
	}
	
	

</style>	
	
	
<!-- 모집 종료 시 --> 
<style>	

	.end {
		position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0,0,0,0.70);
	    justify-content: center;
	    align-items: center;
	    display: flex;
	    flex-direction: column;
	    border-radius: 0.25rem;
	    box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.25);
	}
	
	.end-frame {
		color: white;
		border: 1px solid white;
		border-radius: 90px;
		padding: 10px;
	}
	
	.end-frame span {color: white;}
	
</style>	


<!-- 신청내역보기 버튼 눌렀을때 -->
<style>

	.carpool-applylist {
		padding: 30px 30px 20px 30px;
    	margin-top: 30px;
    	margin-bottom: 30px;
    	background-color: #F2F2F2;
	    border-color: rgba(255, 255, 255, 1);
	    border-style: solid;
	    border-width: 1px;
	    border-radius: 12px;
	    width: 656px;
	    box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.25);
	}
	
	.apply-list {
		font-size: 1.3rem;
    	padding-bottom: 25px;
	}
	
	.apply-list-detail {
		font-size: 0.9rem;
	    background: white;
	    border-radius: 12px;
	    padding: 7px 15px 7px 15px;
	    margin-bottom: 10px;
	    display: flex;
    	justify-content: space-between;
	}
	
	.applyuserinfo {
		display: flex;
		align-items: center;
	}
	
	.applybutton-ok {
		padding: 1px;
	    border: none;
	    background: #2db400;
	    color: white;
	    border-radius: 10px;
    	width: 50px;
	}
	
	.applybutton-no {
		padding: 1px;
	    border: 1px solid #2db400;
	    background: white;
	    color: #2db400;
	    border-radius: 10px;
    	width: 50px;
	}


</style>


</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">
		
	<div class="carpool-view-card">
	
	
	
      <div class="carpool-view-frame">
        
     	<div class="info-frame">
        
        <div class="info-top-frame">
          
			<button class="back-button" 
		            		onclick="location.href='/wood/carpool/list.do';">
			 			<img class="back-icon" alt="뒤로가기" 
			 				 src="/wood/asset/img/back-icon.png">
			</button>
				
			<img
	        src="https://www.studiopeople.kr/common/img/default_profile.png"
	        alt="프로필"
	        class="profile"
	        />
	        
	        <div class="user-info" style="margin-left: 10px;">
	        	<div>
		        	<span class="nickname">${dto.nickname}</span>
		        	<span class="gender">
			            <c:if test = "${dto.gender eq 'M'}">
			            	(남)
			            </c:if>
			            <c:if test = "${dto.gender eq 'F'}">
			            	(여)
			            </c:if>
		            </span>
		        </div>
		        
		        <div class="rating">
			        <img
				    src="/wood/asset/img/star.png"
				    alt="RatingStar"
				    class="rating-star"
				    />
		        	<span class="rating-score">${dto.score} (${dto.count})</span>
		        </div>
		    </div>
		    
		    <c:if test="${(id == dto.id)}">
		        <div id="carpool-apply" class="apply-list-check">
	            	<button id="carpool-apply-button" class="apply-list-view" type="submit">신청내역보기</button>
	        	</div>  
        	</c:if>        

       	</div>
          
          <!-- 출발지, 도착지, 날짜시간, 가격 -->
            <div class="carpool-info-box">
              <div class="carpool-info">
              
                <div class="datetime-frame">
                	<span class="datetime">
                		<span>${dto.ttime}</span>
                	</span>
                </div>    
                
                
                <div class="departures-frame">
                  <span class="departures">
                  	<span style="color: #2db400">${dto.departurescity}</span>
                    <span> ${dto.departures}</span>
                  </span>
                </div>
                
                <div class="narrow-frame">
                  <img
                    src="/wood/asset/img/narrow.png"
                    alt="화살표"
                    class="narrow"
                  />
                </div>
                
                <div class="arrivals-frame">
                  <span class="arrivals">
                    <span style="color: #2db400">${dto.arrivalscity}</span>
                    <span> ${dto.arrivals}</span>
                  </span>
                </div>
                
                
                <!-- 내용 -->      
		          <div class="content-frame">
		          	<span class="content">
						${dto.content} <br>
						글이 두줄이상일때 <br>
						어떻게나오는지
					</span>
		          </div>
       
                
                <div class="price-frame">
                  <span class="price">
                    <span style="color: rgba(45, 180, 0, 1);">${dto.fee}원</span>
                  </span>
                </div>
              </div> 
            </div>
          
          <c:if test="${(id == dto.id)}">
        	<div style="padding-top: 25px; display: flex; justify-content: space-between;">
	      	<button class="edit" onclick="location.href='/wood/carpool/edit.do?carpoolseq=${dto.carpoolseq}';">
	      		<span>수정하기</span>
	      	</button>
                    
	      	<button class="del" onclick="del();">
	      		<span>삭제하기</span>
	      	</button>
        	</div>
          </c:if>
        
          <c:if test="${(id != dto.id)}">
        	<div style="padding-top: 25px; display: flex; justify-content: center;">
	      	<button class="apply" style="color: white;" onclick="apply('${dto.carpoolseq}', '${id}');">
	      		<c:choose>
	      			<c:when test = "${applystatus eq null}">신청하기</c:when>
	      			<c:when test = "${applystatus eq '신청 중'}">신청 중</c:when>
	      			<c:when test = "${applystatus eq '신청 완료'}">신청 완료</c:when>
	      		</c:choose>
	      	</button>
        	</div>
          </c:if>
          
          
      <c:if test="${dto.recruitstatus eq '모집 종료'}">
	       <div class="end">
	          	<div class="end-frame">
	          		<span>모집 종료</span>
	          	</div>
		   </div>
	  </c:if>
	  
	  
      </div>
	  
      </div>
      

	<div  id="carpool-applylist" class="carpool-applylist" style="display:none; ">
		<div class="accept-job">
		
			<!-- 현재 접속중인 id가 게시글 작성자의 id와 같고, recruitstatus(모집 상태)가 '모집 종료'가 아닐 시 표시함 -->
			<c:if test="${id eq dto.id && dto.recruitstatus ne '모집 종료'}">
				<div class="apply-list-box">
					<div class="apply-list">신청 내역</div>
				</div>
				
				
				<c:forEach items="${apply}" var="adto">
				<div class="apply-list-detail">
			    	<span class="applyuserinfo">${adto.applynickname}
			    		<c:if test = "${dto.gender eq 'M'}">
		              		(남)
		              	</c:if>
		              	<c:if test = "${dto.gender eq 'F'}">
		              		(여)
		              	</c:if>
			    	</span>
			    	<span>
				    	<button onclick = "applyok()" class="applybutton-ok">승인</button>
				    	<button onclick = "applyno()" class="applybutton-no">거절</button>
			    	</span>
		    	</div>
		    	</c:forEach>
		    	
		    	<%-- tblCarpoolApply 테이블에서 carpoolseq = ${dto.carpoolseq}이고 applystatus = '신청 중'인 사람의 nickname과 gender를 출력하는 코드를 작성 --%>
		    	
		
		    </c:if>
			
		</div>
	</div> 
    

    </div>
		
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	
	 
        
        <!-- Add the library (only one file) -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<!-- 카풀 신청 승인 applyok() -->
		<script>
			function applyok() {
				
				new Swal ({
			        title: "",
			        text: "카풀 신청을 승인하시겠습니까?",
			        icon: "success",
			        confirmButtonText: "Yes",
			        confirmButtonColor: '#2db400',
			        showCancelButton: true,
			        cancelButtonText: "No",
			        cancelButtonColor: '#D8D8D8'
			    })
				
				.then(function(){
					new Swal({
				        title: "",
				        text: "카풀 신청이 승인되었습니다.",
				        icon: "success",
				        confirmButtonColor: '#2db400'
				    });
	            });
			}
		</script>
		
		<!-- 카풀 신청 거절 applyno() -->
		<script>
			function applyno() {
				
				new Swal ({
			        title: "",
			        text: "카풀 신청을 거절하시겠습니까?",
			        icon: "error",
			        confirmButtonText: "Yes",
			        confirmButtonColor: '#2db400',
			        showCancelButton: true,
			        cancelButtonText: "No",
			        cancelButtonColor: '#D8D8D8'
			    })
				
				.then(function(){
					new Swal({
				        title: "",
				        text: "카풀 신청이 거절되었습니다.",
				        icon: "error",
				        confirmButtonColor: '#2db400'
				    });
	            });
			}
		</script>
		
		<!-- 카풀 신청 apply() -->
		<script>
		    function apply(carpoolseq, applyid) {
		    	
		    	/* alert('carpoolseq='+carpoolseq
    					+'&applyid='+applyid); */
		    	
			  new Swal ({
		        title: "",
		        text: "카풀 신청을 하시겠습니까?",
		        icon: "success",
		        confirmButtonText: "Yes",
		        confirmButtonColor: '#2db400',
		        showCancelButton: true,
		        cancelButtonText: "No",
		        cancelButtonColor: '#D8D8D8'
		      })
			  
			  .then((result) => { //new Swal
		    	  
		        	if(result.value) {
		        	
			        	$.ajax ({
			    			type: 'POST',
			    			url : 'http://localhost:8090/wood/carpool/apply.do',
			    			dataType: 'json',
			    			data: 'carpoolseq='+carpoolseq
			    					+'&applyid='+applyid,
			    					
			    			success: (ajaxresult) => {
			    				if(ajaxresult.result == 1){
			    					new Swal ({
			    						title: "",
			    				        text: "카풀 신청이 완료되었습니다.",
			    				        icon: "success"
			    				        /* confirmButtonColor: '#2db400' */
			    					});
			    				} else if(ajaxresult.result == -1){
			    					new Swal ({
			    						title: "",
			    				        text: "이미 신청중이거나 신청이 완료되었습니다.",
			    				        icon: "error"
			    				        /* cancelButtonColor: '#D8D8D8' */
			    					});
			    				} else {
			    					new Swal ({
			    						title: "",
			    				        text: "카풀 신청에 실패했습니다.",
			    				        icon: "error"
			    				        /* cancelButtonColor: '#D8D8D8' */
			    					});
			    				}
			    			}, //success
			    			
			    			error : (a, b, c)=> console.log(a, b, c) 				
			    		}); //$.ajax     	

		        	} else if (result.dismiss == "cancel"){ //if
			          	new Swal({
					        title: "",
					        text: "신청이 취소되었습니다.",
					        icon: "error",
					        confirmButtonColor: '#2db400'
				  		});
		        	} //else if
		      }); //then
		    } //function
		</script>  
          
		<!-- 게시글 삭제 del() -->
		<script>
		    function del() {
		      new Swal({
		        title: "확인",
		        text: "게시글을 정말 삭제하시겠습니까? 삭제한 게시물은 복구할 수 없습니다.",
		        icon: "warning",
		        confirmButtonText: "Yes",
		        confirmButtonColor: '#2db400',
		        showCancelButton: true,
		        cancelButtonText: "No",
		        cancelButtonColor: '#D8D8D8'
		      }).then((result) => {
		        if(result.value){
		            new Swal({
				        title: "삭제",
				        text: "게시글이 삭제되었습니다.",
				        icon: "success",
				        confirmButtonColor: '#2db400'
				      })
		            .then(function(){
		            	location.href='/wood/carpool/list.do';
		            	/* 삭제 시 list로 이동 */
		            });
		        } else if (result.dismiss == "cancel"){
		            new Swal({
				        title: "취소",
				        text: "게시글 삭제가 취소되었습니다.",
				        icon: "error",
				        confirmButtonColor: '#2db400'
				    });
		        }
		      });
		    }
		</script>
	
	
<script>

		$('#carpool-apply-button').on('click', function() {
			
			if($("#carpool-applylist").css("display") == "none"){
			     $("#carpool-applylist").slideDown('slow');
			} else {
			    $("#carpool-applylist").slideUp('slow');
			}
			
		});

</script>
</body>
</html>