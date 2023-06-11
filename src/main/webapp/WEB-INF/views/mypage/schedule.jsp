<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp" %>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<head>
<style>
button.close{
	border-radius:5px;
	outline:none;
	border : 1px solid #eee;
}

.mybtn{
	border-radius:3px;
	margin-left:5px;
}

.myscheduleitem{
	display:flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	border-radius: 5px;
	background-color : #F6FFDE;
	color: #666;
}

.myscheduleitem:hover{
	padding: 15px;
	border-radius: 5px;
	background-color: #E3F2C1;

}

.mybtncolor{
	width:100px;
	font-size:12px;
	background-color: #2C3E50;
	color: white;
}
.mybtncolor:hover{
	width:100px;
	font-size:12px;
	background-color: #727F8C;
	color: white;
}

</style>
</head>	
        <!-- template.jsp > index.jsp -->
	    <%@ include file="/WEB-INF/views/admininclude/header.jsp" %>
		<div class="row">
      	<!-- 드래그 박스 -->
      	<div class="col-2"  style="padding-top:55px;">
      	<div class="card" style="padding:10px;">
      		<h2 style="text-align:center; font-weight:bold; padding:10px; color:#333;">나의 일정들</h2>
	      	<ul id="scheduleholder">
	      		
	      	</ul>
      	</div>
      	</div>
      	<div class="col-10">
      		 <div id="calendarBox">
        		<div id="calendar"></div>
    		</div>
		</div>
      </div>
  
    <!-- Container-fluid Ends-->

    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" s>
                	<select class="form-select" style="width:100px;" id="category">
                		<option selected>분류</option>
                		<option value='약속'>약속</option>
                		<option value='스터디'>스터디</option>
                		<option value='동호회'>동호회</option>
                	</select>
                    <h5 class="modal-title" id="exampleModalLabel" style="margin-right:20px;">일정입력</h5>
                    <button id="xbutten" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">날짜</label>
                        <input type="datetime-local" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="datetime-local" class="form-control" id="calendar_end_date" name="calendar_end_date">
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn mybtncolor" id="addCalendar">추가</button>
                    <button type="button" class="btn mybtncolor" data-dismiss="modal"
                        id="ModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
      	
  
<%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
  
 <script>
 

 
 (function(){
	
	    $(function(){
	      // calendar element 취득
	      var calendarEl = $('#calendar')[0];
	      // full-calendar 생성하기
	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        height: '700px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev,next today,addEventButton',
	          center: '',
	          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	        },
	        customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : '일정추가' , // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                    	$("#calendarModal").modal("show"); // modal 나타내기
                    	$("#calendar_content").val('');
                    	$("#calendar_start_date").val('');
                    	$("#calendar_end_date").val('');
                    	
                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                        	
                        	
                            var title = $("#calendar_content").val();
                            var start_date = $("#calendar_start_date").val().replace("T", " ");
                            var end_date = $("#calendar_end_date").val().replace("T", " ");
                            var category = $('#category').val();
                            // 유효성 체크
                            if(category  == "분류"){
                            	alert("분류를 선택하세요.");
                            	return;
                            }
                            else if(title == null || title == ""){
                                alert("내용을 입력하세요.");
                                return;
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                                return;
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            	return;
                            }
                            let id = '${id}';
                            // ajax 처리
							$.ajax({
								type:'POST',
								url : '/wood/mypage/addschedule.do',
								dataType: 'json',
								data : {
									category: category,
									id : id,
									title: title,
									startdate : start_date,
									enddate: end_date
								},
								success : (result) => {
									if(result.result==1){
										location.href="/wood/mypage/schedule.do";
									}
								},
								error : (a, b, c)=> console.log(a, b, c) 		
							});
                       		// alert(title+',' + start_date+','+end_date)
                            
                            $("#calendarModal").modal("hide"); // modal 나타내
                            event.preventdefault();
                        });
                    	
                        $("#ModalClose").on("click",function(){ 
                        	$("#calendarModal").modal("hide"); // modal 나타내
                            event.preventdefault();
                        });
                    	
                        $("#xbutten").on("click",function(){ 
                        	$("#calendarModal").modal("hide"); // modal 나타내
                            event.preventdefault();
                        });
                    }
                }
            },
            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	        editable: false, // 수정 가능?
	        selectable: false, // 달력 일자 드래그 설정가능
	        nowIndicator: true, // 현재 시간 마크
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	        locale: 'ko', // 한국어 설정
	        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	          console.log(obj);
	        },
	        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	          console.log(obj);
	        },
	        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	          console.log(obj);
	        },
	        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	          var title = prompt('Event Title:');
	          if (title) {
	            calendar.addEvent({
	              title: title,
	              start: arg.start,
	              end: arg.end,
	              allDay: arg.allDay
	            })
	          }
	          calendar.unselect()
	        },
	        googleCalendarApiKey : "AIzaSyBDw61eDA00aNzvQngxlg0_HBeifQ8DiC4",
	        eventSources :[ 
	            {
	                googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
	                , color: '#0B8043'   // an option!
	                , textColor: 'white' // an option!
	            } 
	        ],
	        events: function(info, successCallback, failureCallback) {
	        	// ajax처리로 여기서 받아서 데이터 셋팅
	        		const colorMap = new Map([
					  ['약속', '#FF78C4'],
					  ['동호회', '#116D6E'],
					  ['스터디', '#00DFA2'],
					]);
	        	
	        		let id = '${id}';
	        		$.ajax({
						type:'GET',
						url : '/wood/mypage/schedulelist.do',
						dataType: 'json',
						data : {
							id : id
						},
						success : (result) => {
							let newevent=[];
							$('#scheduleholder').html('');// 달력 넘길 때 리스트 추가되는 것 수정
							$(result).each((index, item)=>{
								contents = {};
								contents.title = item.title;
								contents.start = item.start;
								contents.end   = item.end;
								contents.color  = colorMap.get(item.category);
								
								$('#scheduleholder').append(`
									<li style="text-align:center;margin:5px;">
										<div class="myscheduleitem">
											<span>\${item.title}</span>
											<button type="button" class="btn mybtncolor" onclick="delschedule(\${item.scheduleseq});">삭제</button>
										</div>
						      		</li>
								`);
								
								newevent.push(contents);
							});
							successCallback(newevent);
						},
						error : (a, b, c)=> console.log(a, b, c) 		
					});
	        	
	        	//successCallback(myevents);
	        }
	      });
	      // 캘린더 랜더링
	      calendar.render();
	    });
	  })();
 
 	
 
 function delschedule(scheduleseq){
	 $.ajax({
			type:'GET',
			url : '/wood/mypage/delschedule.do',
			dataType: 'json',
			data : {
				scheduleseq : scheduleseq
			},
			success : (result) => {
				if(result.result==1)
					location.href="/wood/mypage/schedule.do";
			},
			error : (a, b, c)=> console.log(a, b, c) 		
		});
 }
 
 
 
 </script> 	
  </body>
</html>