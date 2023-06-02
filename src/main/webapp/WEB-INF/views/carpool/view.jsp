<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	  padding: 50px 16px 0;
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
	  display: flex;
	  position: relative;
	  align-items: center;
	  flex-shrink: 0;
	}
	
	.profile-frame {
	  top: 12px;
	  left: 193px;
	  width: 140px;
	  height: 140px;
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
	  width: 140px;
	  height: 140px;
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
	  top: 220px;
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
	  font-size: 15px;
	  align-self: stretch;
	  font-style: Medium;
	  text-align: center;
	  /* font-family: Roboto; */
	  font-weight: 500;
	  line-height: 32px;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.rating {
	  gap: 5px;
	  top: 270px;
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
	}
	
	.carpool-info-frame {
	  top: 330px;
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
	
	.start-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.start {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  font-size: 16px;
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
	
	.end-frame {
	  gap: 8px;
	  display: flex;
	  align-self: stretch;
	  align-items: flex-start;
	  flex-direction: column;
	}
	
	.end {
	  color: var(--dl-color-grays-gray950);
	  height: auto;
	  font-size: 16px;
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
	
	.apply-frame {
	  top: 615px;
	  left: 36.5%;
	  width: 142px;
	  height: 50px;
	  display: flex;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  background-color: rgba(45, 180, 0, 1);
	  border-radius: 15px;
	  border: none;
	}
	
	.apply-box {
	  top: 13px;
	  left: 0px;
	  width: 142px;
	  height: 24px;
	  display: flex;
	  position: absolute;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.apply {
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
	  top: 0px;
	  left: 0px;
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
	

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">
		
	<div class="carpool-view-card">
      <div class="carpool-view-frame">
      
        <div class="info-frame">
        
          <div class="profile-frame">
            <img
              src="https://blog.kakaocdn.net/dn/bz3MnR/btshKQsi5R3/Jn6ha5hed0yM6xE7P3iUik/img.gif"
              alt="프로필사진"
              class="profile"
            />
          </div>
          
          <div class="nickname-frame">
            <span class="nickname">
              <span>닉네임</span>
            </span>
          </div>
          
          <!-- 성별, 레벨(?) -->
          <div class="user-info-frame">
            <span class="user-info">
              <span>성별</span>
              <span> | </span>
              <span>LV. 25</span>
            </span>
          </div>
          
          <!-- ex) ★ 4.7 (30)  -->
          <div class="rating">
            <img
              src="/wood/asset/img/star.png"
              alt="RatingStar"
              class="rating-star"
            />
            <span>5.0</span>
            <span> (99)</span>
          </div>
          
          <!-- 출발지, 도착지, 날짜시간, 가격 -->
          <div class="carpool-info-frame"> 
            <div class="carpool-info-box">
              <div class="carpool-info">
              
                <div class="start-frame">
                  <span class="start">
                    <span>출발지</span>
                  </span>
                </div>
                
                <div class="narrow-frame">
                  <img
                    src="/wood/asset/img/narrow.png"
                    alt="화살표"
                    class="narrow"
                  />
                </div>
                
                <div class="end-frame">
                  <span class="end">
                    <span>도착지</span>
                  </span>
                </div>
                
                <div class="datetime-frame">
                	<span class="datetime">
                		<span>05.30(화) 오후 5시 30분</span>
                	</span>
                </div>       
                
                <div class="price-frame">
                  <span class="price">
                    <span style="color: rgba(45, 180, 0, 1);">20000원</span>
                  </span>
                </div>
              </div>
            </div>
          </div>
          
          <button class="apply-frame">  
            <div class="apply-box">
              <span class="apply">
                <span style="color: white;">신청</span>
              </span>
            </div>
          </button>
          
          <button class="edit-frame" onclick="location.href='/wood/carpool/edit.do';">
 			<div class="edit-box">
              <span class="edit">
              	<span>수정</span>
              </span>
            </div>
          </button>
          
          <!-- <button class="del-frame" onclick="location.href='/wood/carpool/del.do';"> -->
          <button class="del-frame" onclick="salert();">
 			<div class="del-box">
              <span class="del">
              	<span>삭제</span>
              </span>
            </div>
          </button>
          
          <button class="back-frame" onclick="location.href='/wood/carpool/list.do';">
 			<div class="back-box">
              <span class="back">
              	<span>이전</span>
              </span>
            </div>
          </button>
          
          
		<!-- Add the library (only one file) -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
		    function salert() {
		      new Swal({
		        title: "확인",
		        text: "정말 선택하신 항목으 삭제하시겠습니까?",
		        icon: "warning",
		        confirmButtonText: "Yes",
		        confirmButtonColor: '#2db400',
		        showCancelButton: true,
		        cancelButtonText: "No",
		        cancelButtonColor: '#999'
		      }).then((result) => {
		        if(result.value){
		            new Swal("삭제", "성공적으로 삭제되었습니다", "success")
		            .then(function(){
		            	location.href='/wood/carpool/list.do';
		            	/* 삭제 시 list로 이동 */
		            });
		        } else if (result.dismiss == "cancel"){
		            new Swal({
				        title: "취소",
				        text: "삭제 취소",
				        icon: "error",
				        /* confirmButtonText: "Yes",
				        confirmButtonColor: '#2db400',
				        showCancelButton: true,
				        cancelButtonText: "No", */
				        confirmButtonColor: '#2db400'
				      });
		        }
		      });
		    }
		</script>
          
        </div>
      </div>
    </div>
		
	</section>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>