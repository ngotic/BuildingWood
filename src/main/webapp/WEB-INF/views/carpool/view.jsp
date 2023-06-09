<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
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
	  /* padding: 50px 16px 0; */
	  box-shadow: 0px 3px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: center;
	  flex-shrink: 0;
	  border-color: rgba(255, 255, 255, 1);
	  border-style: solid;
	  border-width: 1px;
	  border-radius: 12px;
	  flex-direction: column;
	  background-color: #F2F2F2;
	}
	
	.info-frame {
	  gap: 24px;
	  width: 526px;
	  height: 704px;
	 /*  display: flex; */
	  position: relative;
	  align-items: center;
	  flex-shrink: 0;
	}
	
	.card-header {
		display: flex; 
		align-items: center;
	}
	
	.user-info {
		padding-left: 4px;
	}
	
	.profile {
	  width: 48px;
	  height: 48px;
	  border-radius: 50%;
	}
	
	.nickname {
	
	}
	
	.gender {
	
	}
	
	.rating {
		display: flex;
  		align-items: center;
	}
	
	.rating-star {
		width: 18px;
		height: 18px;
		margin-right: 5px;
	}
	
	.rating-score {
		font-size: 0.9rem;
	}
	
/* 	.top-frame {
	  display: flex;
	  align-items: center;
	}
	
	.profile-frame {
	  top: 12px;
	  left: 193px;
	  width: 80px;
	  height: 80px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
	  background-color: rgba(196, 196, 196, 1);
	  border-radius: 50%;
	}
	
	.profile {
	  top: 0px;
	  left: 0px;
	  width: 80px;
	  height: 80px;
	  position: absolute;
	  box-shadow: 0px 4px 20px 0px rgba(0, 0, 0, 0.25);
	  border-radius: 50%;
	}
	
	.nickname-frame {
	  top: 177px;
	  left: 0px;
	  width: 526px;
	  display: flex;
	  position: absolute;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.nickname {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  align-self: stretch;
	  text-align: center;
	  line-height: 32px;
	  font-size: 2rem;
	}
	
	.user-info-frame {
	  top: 210px;
	  left: 0px;
	  width: 526px;
	  height: 32px;
	  display: flex;
	  position: absolute;
	  align-self: stretch;
	  align-items: flex-start;
	}
	
	.user-info {
	  color: var(--dl-color-grays-gray950);
	  width: 526px;
	  height: auto;
	  position: absolute;
	  font-size: 20px;
	  align-self: stretch;
	  font-style: Medium;
	  text-align: center;
	}
	
	.rating {
	  gap: 5px;
	  top: 268px;
	  left: 205px;
	  width: auto;
	  display: flex;
	  position: absolute;
	  align-items: center;
	  font-size: 1.2rem;
	}
	
	.rating-star {
	  width: 30px;
	  height: 30px;
	  margin-right: 3px;
	} */
	
	
	
	.carpool-info-frame {
	  /* top: 330px; */
	  left: 115px;
	  width: 295px;
	  height: 212.71192932128906px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 1;
	}
	
	.carpool-info-box {
	  top: 0px;
	  left: 0px;
	  width: 295px;
	  display: flex;
	  padding: 24px 24px 24px;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
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
	  font-size: 15px;
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
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 400;
	  line-height: 24px;
	  font-stretch: normal;
	  text-decoration: none;
	  padding-top: 10px;
	  padding-bottom: 10px;
	}
	
	.content-frame {
		display: flex;
		position: absolute;
	}
	
	
	
	/* 버튼 */

	.apply {
	  top: 615px;
	  left: 36.5%;
	  width: 142px;
	  height: 50px;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
	  background-color: rgba(45, 180, 0, 1);
	  border-radius: 15px;
	  border: none;
	  font-size: 20px;
	}
	
	.edit-frame {
	  top: 615px;
	  left: 0px;
	  width: 142px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  background-color: rgba(255, 255, 255, 1);
	  border-radius: 15px;
	  border: none;
	}
	
	.edit-box {
	  top: 13px;
	  left: 0px;
	  width: 142px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.edit {
	  left: 24px;
	  color: rgba(98, 98, 98, 1);
	  width: 94px;
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
	
	.del-frame {
	  top: 615px;
	  right: 0px;
	  width: 142px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  border-radius: 15px;
	  background-color: rgba(255, 255, 255, 1);
	  border: none;
	}
	
	.del-box {
	  top: 13px;
	  left: 0px;
	  width: 142px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.del {
	  left: 24px;
	  color: rgba(255, 255, 255, 1);
	  width: 94px;
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
	
	.back-frame {
	  left: 240px;
      top: 150px;
	  width: 50px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  background-color: rgba(255, 255, 255, 1);
	  border-radius: 15px;
	  border: none;
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
		width: 656px;
		height: 766px;
		background: rgba(0,0,0,0.70);
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 0.25rem;
	}
	
	.end-frame {
		color: white;
		border: 1px solid white;
		border-radius: 90px;
		padding: 10px;
	}
	
	.end-frame span {color: white;}
	
</style>	


</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">
		
	<div class="carpool-view-card">
	
      <div class="carpool-view-frame">
      
		<button class="back-frame" onclick="location.href='/wood/carpool/list.do';">
	 			<div class="back-box">
	              <span class="back">
	              	<img class="back-icon" alt="뒤로가기" src="/wood/asset/img/back-icon.png">
	              </span>
	            </div>
	    </button>
      
          <div class="card-header">
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
	       </div>
	       
        <div class="info-frame">
        
        
          <%-- <div class="profile-frame">
            <img
              src="https://www.studiopeople.kr/common/img/default_profile.png"
              alt="프로필사진"
              class="profile"
            />
          </div>
          
          <div class="nickname-frame">
            <span class="nickname">
              <span>${dto.nickname}</span>
            </span>
          </div>
          
          <!-- 성별, 레벨(?) -->
          <div class="user-info-frame">
            <span class="user-info">
              <span>
              		<c:if test = "${dto.gender eq 'M'}">
		        		(남)
		        	</c:if>
		        	<c:if test = "${dto.gender eq 'F'}">
		        		(여)
		        	</c:if></span>
            </span>
          </div>
          
          <!-- ex) ★ 4.7 (30)  -->
          <div class="rating">
            <img
              src="/wood/asset/img/star.png"
              alt="RatingStar"
              class="rating-star"
            />
            <span>${dto.score}</span>
            <span> (${dto.count})</span>
          </div> --%>
          
          <!-- 출발지, 도착지, 날짜시간, 가격 -->
          <div class="carpool-info-frame"> 
            <div class="carpool-info-box">
              <div class="carpool-info">
              
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
                
                <div class="datetime-frame">
                	<span class="datetime">
                		<span>${dto.ttime}</span>
                	</span>
                </div>       
                
                <div class="price-frame">
                  <span class="price">
                    <span style="color: rgba(45, 180, 0, 1);">${dto.fee}원</span>
                  </span>
                </div>
              </div> 
            </div>
          </div>
          
          <!-- 내용 -->      
          <div class="content-frame">
          	${dto.content} view 디자인변경해야함나중에
          </div>
    
          
          <c:if test="${(id == dto.id)}">
          <button class="edit-frame" onclick="location.href='/wood/carpool/edit.do?carpoolseq=${dto.carpoolseq}';">
 			<div class="edit-box">
              <span class="edit">
              	<span>수정하기</span>
              </span>
            </div>
          </button>
          </c:if>
          
          <c:if test="${(id != dto.id)}">
	      	<button class="apply" style="color: white;" 
	      			onclick="apply('${dto.carpoolseq}', '${dto.applyid}', '${dto.carpoolapplyseq}');">신청하기</button>
          </c:if>
          
          
          <c:if test="${(id == dto.id)}">
          <button class="del-frame" onclick="del();">
 			<div class="del-box">
              <span class="del">
              	<span>삭제하기</span>
              </span>
            </div>
          </button>
          </c:if>
          
      </div>
      
      
      <c:if test="${dto.recruitstatus eq '모집 종료'}">
	       <div class="end">
	          	<div class="end-frame">
	          		<span>모집 종료</span>
	          	</div>
		   </div>
	  </c:if>
	  
	  
      </div>
      
    <!-- 현재 접속중인 id가 게시글 작성자의 id와 같고, recruitstatus(모집 상태)가 '모집 종료'가 아닐 시 표시함 -->
	<c:if test="${id eq dto.id && dto.recruitstatus ne '모집 종료'}">
    	<h4>신청승인하는거</h4>
    	<span>닉네임 성별 
    	
    	<button>승인</button>
    	
    	<button>거절</button>
    	</span>
    	
    	<span>테스트닉네임 성별</span>
    	
    	<c:forEach items="${list}" var="dto">
    		<span>${dto.nickname} ${dto.gender}</span>
    	</c:forEach>
    	
    </c:if>
    
    </div>
		
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	
	 
        
        <!-- Add the library (only one file) -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
		    function apply(carpoolseq, applyid, carpoolapplyseq) {
		    	
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
			    			data: 'carpoolapplyseq='+carpoolapplyseq
			    					+'&carpoolseq='+carpoolseq
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
          
		<!-- Add the library (only one file) -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

</script>
</body>
</html>