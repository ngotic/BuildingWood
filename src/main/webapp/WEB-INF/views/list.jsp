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
		width: 1000px;
		margin: auto;
	}
	
	.narrow {
		font-size: 1.5rem;
		padding-top: 5px;
	}
	
	.group1243-container {
	  width: 100%;
	  height: 250px;
	  display: flex;
	  overflow: auto;
	  align-items: center;
	  flex-direction: column;
	  font-size: 0.8rem;
	}
	.group1243-group1243 {
	  width: 360px;
	  height: 205.2798614501953px;
	  display: flex;
	  position: relative;
	  align-items: flex-start;
	  flex-shrink: 1;
	}
	.group1243-vertcard {
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
	}
	.group1243-top {
	  gap: 38px;
	  display: flex;
	  padding: 0 0 0 19px;
	  align-self: stretch;
	  align-items: center;
	  flex-shrink: 0;
	}
	.group1243-avatar {
	  width: 48px;
	  height: 48px;
	}
	.group1243-text {
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
	.group1243-frameiconarrowright {
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
	}
	.group1243-text02 {
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
	.group1243-text04 {
	  gap: 4px;
	  width: 328px;
	  display: flex;
	  padding: 0 0 0 12px;
	  align-items: flex-start;
	  flex-shrink: 0;
	}
	.group1243-text05 {
	  color: var(--dl-color-default-gray7);
	  width: 44px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	.group1243-text07 {
	  color: var(--dl-color-default-gray7);
	  width: 89px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	.group1243-text09 {
	  color: rgba(0, 0, 0, 1);
	  width: 182px;
	  height: auto;
	  text-align: left;
	  line-height: normal;
	}
	.group1243-bottom {
	  gap: 37px;
	  display: flex;
	  padding: 0 0 0 19px;
	  align-self: stretch;
	  align-items: center;
	  flex-shrink: 0;
	  justify-content: flex-end;
	}
	.group1243-text11 {
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
	.group1243-frame30152 {
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
	.group1243-text13 {
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
		<a>글쓰기</a>
		</div>	
	
	</section>	
	
	<table id="table">
	<tbody>	
	<tr>
	
	<td style="border: none;">
	<div class="group1243-container">
      <div class="group1243-group1243">
        <div class="group1243-vertcard">
          <div class="group1243-top">
            <img
              src="wood/asset/images/cat01.jpg"
              alt="프로필"
              class="group1243-avatar"
            />
            <span class="group1243-text">
              <span>출발지</span>
            </span>
           <span class="narrow"> → </span>
            <span class="group1243-text02">
              <span>도착지</span>
            </span>
          </div>
          <div class="group1243-text04">
            <span class="group1243-text05 Title1">
              <span>닉네임</span>
            </span>
            <span class="group1243-text07 Title1">
              <span>(성별)</span>
            </span>
            <span class="group1243-text09 Body2">
              <span>05.30 (화) 오후 5시</span>
            </span>
          </div>
          <div class="group1243-bottom">
            <span class="group1243-text11">
              <span>10000원</span>
            </span>
          </div>
        </div>
        <div class="group1243-frame30152">
          <span class="group1243-text13">
            <span>모집 종료</span>
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