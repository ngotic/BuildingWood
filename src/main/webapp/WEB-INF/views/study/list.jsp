<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
#search-textbox {
	width: 100%;
	height: 100px;
	border: solid 5px black;
	align-content: flex;
	margin-bottom: 80px;
}

#search-textbox>input {
	align-self: center;
}

#calender-content {
	width: 300PX;
	height: 500PX;
	border: solid 5px black;
	display: inline-flex;
	margin-left: 50px;
	margin-right: 100px;
	position: fixed;
	top: 300px;
}

.study-content-black {
	width: 100%;
	height: auto;
	/* border: solid 5px black; */
	display: block;
	justify-content: center;
	align-content: center;
}

.study-content {
	width: 300px;
	height: 450px;
	border: solid 1px black;
	margin: 40px;
}

.study-content-img {
	width: auto;
	height: 200px;
}

.study-content-div {
	width: 100%;
	height: 698px;
}

.menu {
	text-align: right;
	padding: 20px;
	border-bottom: solid 1px #333;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
	display: inline-block;
}

.button {
	width: 100px;
	height: 50px;
	border-radius: 25px;
	    margin: 0px 10px;
}

.textbox {
	width: 300px;
	height: 50px;
	border-radius: 25px;
}

.title {
	font-size: 30px;
}

a {
	display: inline-block;
}

.content-card {
	border: 0px;
	margin: -2px 13px 0px 0px;
	width: 21%;
	text-decoration-line: none;
}

.content-card-body {
	width: 100%;
	height: 100%;
}

.row {
	padding-top: 50px;
}

.content-card-body {
	text-align: center;
}

.content-card-body:nth-child(2) {
	text-align: left;
}
.modal{
	z-index: 1500;
}
$zindex-modal:1055;
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/study/studyheader.jsp"%>

	<form action="./list.do" method="post">

		<div
			style="display: flex; justify-content: center; align-items: center; min-height: 100vh; margin-top: 30px;">
			<div class="study-content-black">
				<div class="menu"
					style="display: inline-flex; justify-content: center;">


					<select class="button" name="ck">

						<option value="name" selected="selected">스터디명</option>
						<option value="content">모집 내용</option>

					</select> <input class="textbox" type="text" name="name"
						placeholder="검색어를 입력하세요."
						style="align-self: right; align-content: left; padding: 10px;">
					<input class="button" type="submit" value="검색"
						style="align-content: left;"> <a href="./add.do"> <input
						class="button" type="button" max="30" value="스터디 등록"
						style="margin-left: 30px;">
					</a>
				</div>
				<div class="row" style="margin-left: 57px; padding-left: 5%;">

					<table class="table">
						</form>
							
					</table>
					<div class="modal" tabindex="-1">

						<div class="menu"
							style="display: flex; text-align: center; flex-direction: column-reverse; align-items: stretch; border-bottom: 0px;">



							<div class="">
								<div class="mb-3">
									<div
										style="display: flex; flex-direction: row; align-items: flex-end; justify-content: space-between;">
										<div>
											<input type="image" class="profile"
												src="/wood/asset/img/img.jpg">작성자이름
										</div>
										<div class="content-margin ">
											<span>${odto.status}</span>
										</div>

									</div>
									<div class="mb-3">
										<span style="font-size: 35px;">${odto.name}</span>
									</div>

									<div style="display: block; font-size: 23px; margin-top: 16px;">
										<label for="exampleFormControlTextarea1" class="form-content"
											placeholder="내용">${odto.intro }</label>

									</div>
									<div style="margin-top: 14px;">
										<span class="content-margin"> 모집 종료 기간 :
											${odto.period}</span>
									</div>
									<div style="margin-top: 14px;">
										<span class="content-margin">시작 날짜 : ${odto.startdate}
											종료 날짜 : ${odto.enddate }</span>
										<p style="margin-top: 14px;">모집인원 : ${odto.recruit }</p>
										<p>${odto.onoff }</p>
										<p>주소 : ${odto.address}</p>
									</div>

								</div>


							</div>



						</div>




					</div>
					<c:forEach items="${list}" var="dto">
						<div
							style=" border: 5px solid #d2ddf2;
								    z-index: 0;
								    width: 250px;
								    display: flex;
								    flex-direction: column;
								    padding: 4px;
								    align-items: stretch;
								    margin: 8px;
								    height: 325px;
								    margin-bottom: 50px;
								    margin-top: 27px;">
								    
							<a type="button" style="    width: 100%;
													    z-index: 0;
													    margin: 0px;
													    height: 304px;"
								href="view.do?openstudyseq=${dto.openstudyseq}"
								class="card col-2 content-card shadow p-3 mb-5 bg-body rounded">

								<div>
									<span value="모집중"
										style="z-index: 1 color: black; background: #d2ddf2; border: 2px solid #d2ddf2; border-radius: 11px; position: absolute; margin-left: 12px; margin-top: 6px;">${dto.status}</span>
									<img src="/wood/asset/img/img.jpg" style="margin-top: -7px;"
										class="card-img-top" alt="...">
									<div class="content-card-body" style="height: 139px;">
										<div style="display: none" name="addlist" vlaues="off"></div>
										<span class="card-title title nametxt" name="name">${dto.name}
										</span>


										<p class="card-text introtxt" name="intro"
											style="height: 50px; margin: 0px; text-align: left;">${dto.intro}</p>
										<div style="display: none;" name="openstudyseq">${dto.openstudyseq}</div>
										
									</div>
										
							
					</div>

	

							</a>

							
				<a ="button" href="list.do?openstudyseq=${dto.openstudyseq}&studyjoin=join" 
							style="margin-bottom: 27px;
						    bottom: 95px;
						    position: relative;
						    left: 0px;
						    z-index: 2;
						    width: 100%;
						    border: 4px solid;
						    text-align: center;
						    border-radius: 25px;
						    text-decoration: none;
						    color: white;
						    background: #27271a;
						    margin-bottom:0px;
						    font-size: 23px;"		
   							 >등록하기</a>
   							 
   					<!-- 		
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onclik="href='./list.do$studylist=ok'">
								등록하기
								</button> -->
						</div>


					
					</c:forEach>
					
						
						</div>
					
					

				</div>
				<!-- div class row -->


			</div>
		</div>
		
		<!-- Modal -->

<!-- Button trigger modal -->




		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<script>
	$('.introtxt').each((index, item)=>{
		
		$(item).text(clipstring($(item).text()));
		
	});
	
	$('.nametxt').each((index, item)=>{
		$(item).text(clipstring2($(item).text()));
	});
	//$('.introtxt').each()

	
	
	function clipstring(str){
		return str.substring(0, 20);
	}
/* 	$('#introtxt').text(clipstring($('#introtxt').text()));
	$('#nametxt').text(clipstring2($('#nametxt').text())); */
	
	function clipstring2(str){
		return str.substring(0,6);
	}

	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})

/* 	
	$('.btn').click(function(){

		    var form = document.getElementByclassName(".btn");

		    form.action = "./view.do";

		    form.method = "get";

		    form.submit();

		});
	 */
</script>
	

		
	
</body>
</html>




