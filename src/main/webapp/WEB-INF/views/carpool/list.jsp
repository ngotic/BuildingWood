<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
	
	#search {
		padding-top: 50px;
		padding-bottom: 50px;
		text-align: center;
	}
	
	#table {
		width: 1300px;
		margin: auto;
	}
	
	.narrow {
		font-size: 1.5rem;
		padding-top: 5px;
	}
	
	.carpool-list {
	  width: 100%;
	  height: 250px;
	  display: flex;
	  overflow: auto;
	  align-items: center;
	  flex-direction: column;
	  font-size: 0.8rem;
	}
	
	.carpool-card {
	  width: 360px;
	  height: 205.2798614501953px;
	  display: flex;
	  position: relative;
	  align-items: flex-start;
	  flex-shrink: 1;
	}
	
	.info-frame {
	  gap: 12px;
	  top: 15.276639938354492px;
	  left: 0px;
	  height: 190.0032196044922px;
	  display: flex;
	  padding: 47px 16px 0;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  border-radius: 12px;
	  flex-direction: column;
	  background-color: var(--dl-color-default-gray2);
	  cursor: pointer;
	}
	
	.info-frame-top {
	  gap: 38px;
	  display: flex;
	  padding: 0 0 0 19px;
	  align-self: stretch;
	  align-items: center;
	  flex-shrink: 0;
	}
	
	.profile {
	  width: 48px;
	  height: 48px;
	  border-radius: 50%;
	}
	
	.start {
	  color: rgba(0, 0, 0, 1);
	  height: auto;
	  font-size: 18px;
	  font-style: Semi Bold;
	  text-align: center;
	  /* font-family: Inter; */
	  font-weight: 700;
	  line-height: normal;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	/* .group1243-frameiconarrowright {
	  width: 17px;
	  height: 15px;
	  display: flex;
	  position: relative;
	  align-items: flex-start;
	  flex-shrink: 1;
	}
	
	.group1243-vector {
	  top: 0px;
	  left: 0px;
	  width: 17px;
	  height: 15px;
	  position: absolute;
	} */
	
	.end {
	  color: rgba(0, 0, 0, 1);
	  height: auto;
	  font-size: 18px;
	  font-style: Semi Bold;
	  text-align: center;
	  font-family: Inter;
	  font-weight: 700;
	  line-height: normal;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.info-frame-bottom {
	  gap: 4px;
	  width: 328px;
	  display: flex;
	  padding: 0 0 0 12px;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	
	.nickname {
	  color: var(--dl-color-default-gray7);
	  width: 44px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	
	.gender {
	  color: var(--dl-color-default-gray7);
	  width: 89px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	
	.datetime {
	  color: rgba(0, 0, 0, 1);
	  width: 182px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	
	.price-frame {
	  gap: 37px;
	  display: flex;
	  padding: 0 0 0 19px;
	  align-self: stretch;
	  align-items: center;
	  flex-shrink: 0;
	  justify-content: flex-end;
	}
	
	.price {
	  color: rgba(45, 180, 0, 1);
	  height: auto;
	  font-size: 32px;
	  font-style: Semi Bold;
	  text-align: center;
	  font-family: Inter;
	  font-weight: 700;
	  line-height: normal;
	  font-stretch: normal;
	  text-decoration: none;
	}
	
	.status-frame {
	  gap: 10px;
	  top: 0px;
	  left: 272.968505859375px;
	  width: 72.806640625px;
	  height: 30.553281784057617px;
	  display: flex;
	  padding: 6px;
	  position: absolute;
	  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25) ;
	  align-items: flex-start;
	  flex-shrink: 0;
	  background-color: rgba(255, 121, 121, 1);
	  justify-content: space-around;
	}
	
	.status {
	  color: rgba(255, 255, 255, 1);
	  position: absolute;
	  font-size: 14px;
	  font-style: Semi Bold;
	  font-family: Inter;
	  font-weight: 700;
	  line-height: normal;
	  font-stretch: normal;
	  text-decoration: none;
	}

</style>
</head>
<body>
	<!-- template.jsp > index.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section>
	
		<div id="search">
		<a>강남구 역삼동</a>
		<a>Search</a>
		<button type="button" class="add primary"
				onclick="location.href='/wood/carpool/add.do?mode=new';">글쓰기</button>
		</div>	
	
	</section>	
	
	<table id="table">
	<tbody>	
	<tr>
	
	<td style="border: none;">
	<div class="carpool-list">
	
      <div class="carpool-card">
      
        <div class="info-frame" onclick="location.href='/wood/carpool/view.do';">
        
          <div class="info-frame-top">
            <img
              src="https://blog.kakaocdn.net/dn/bz3MnR/btshKQsi5R3/Jn6ha5hed0yM6xE7P3iUik/img.gif"
              alt="프로필"
              class="profile"
            />
            <span class="start">
              <span>출발지</span>
            </span>
           <span class="narrow"> → </span>
            <span class="end">
              <span>도착지</span>
            </span>
          </div>
          
          <div class="info-frame-bottom">
            <span class="nickname">
              <span>닉네임</span>
            </span>
            <span class="gender">
              <span>(여)</span>
            </span>
            <span class="datetime">
              <span>05.30 (화) 오후 5시</span>
            </span>
          </div>
          
          <div class="price-frame">
            <span class="price">
              <span style="color: rgba(45, 180, 0, 1);">10000원</span>
            </span>
          </div>
          
        </div>
        
        <div class="status-frame">
          <span class="status">
            <span style="color: white;">모집 중</span>
          </span>
        </div>
        
      </div>
      
    </div>
    </td>

	<td style="border: none;">
	<div class="carpool-list">
	
      <div class="carpool-card">
      
        <div class="info-frame">
        
          <div class="info-frame-top">
            <img
              src="https://blog.kakaocdn.net/dn/bz3MnR/btshKQsi5R3/Jn6ha5hed0yM6xE7P3iUik/img.gif"
              alt="프로필"
              class="profile"
            />
            <span class="start">
              <span>출발지</span>
            </span>
           <span class="narrow"> → </span>
            <span class="end">
              <span>도착지</span>
            </span>
          </div>
          
          <div class="info-frame-bottom">
            <span class="nickname">
              <span>닉네임</span>
            </span>
            <span class="gender">
              <span>(여)</span>
            </span>
            <span class="datetime">
              <span>05.30 (화) 오후 5시</span>
            </span>
          </div>
          
          <div class="price-frame">
            <span class="price">
              <span style="color: rgba(45, 180, 0, 1);">10000원</span>
            </span>
          </div>
          
        </div>
        
        <div class="status-frame">
          <span class="status">
            <span style="color: white;">모집 중</span>
          </span>
        </div>
        
      </div>
      
    </div>
    </td>

	<td style="border: none;">
	<div class="carpool-list">
	
      <div class="carpool-card">
      
        <div class="info-frame">
        
          <div class="info-frame-top">
            <img
              src="https://blog.kakaocdn.net/dn/bz3MnR/btshKQsi5R3/Jn6ha5hed0yM6xE7P3iUik/img.gif"
              alt="프로필"
              class="profile"
            />
            <span class="start">
              <span>출발지</span>
            </span>
           <span class="narrow"> → </span>
            <span class="end">
              <span>도착지</span>
            </span>
          </div>
          
          <div class="info-frame-bottom">
            <span class="nickname">
              <span>닉네임</span>
            </span>
            <span class="gender">
              <span>(여)</span>
            </span>
            <span class="datetime">
              <span>05.30 (화) 오후 5시</span>
            </span>
          </div>
          
          <div class="price-frame">
            <span class="price">
              <span style="color: rgba(45, 180, 0, 1);">10000원</span>
            </span>
          </div>
          
        </div>
        
        <div class="status-frame" style="background-color:#CCC">
          <span class="status">
            <span style="color: white;">모집 완료</span>
          </span>
        </div>
        
      </div>
      
    </div>
    </td>
	
	
	</tr>
	</tbody>
	</table>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

</script>
</body>
</html>