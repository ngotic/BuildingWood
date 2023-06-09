
 	var content = '<div class="overlaybox">' +
    '    <div class="boxtitle">${buildinginfo.name}</div>' +
    '    <div class="first">' +
    '        <div class="movietitle text">${buildinginfo.name}</div>' +
    '    </div>' +
    '</div>'; 

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${buildinginfo.lat}, ${buildinginfo.lng}), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도),
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	let m  = null;
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${buildinginfo.lat}, ${buildinginfo.lng}); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    
	    
	});
	/* var customOverlay = new kakao.maps.CustomOverlay({
	    position: markerPosition,
	    content: content,
	}); */
	// 마커가 지도 위에 표시되도록 설정합니다
	//customOverlay.setMap(map);
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	$(document).ready(function(){
		
		<c:forEach items="${blist}" var="dto" varStatus="status">
		
		let p${status.count} = new kakao.maps.LatLng(${dto.lat},${dto.lng});
		
		let m${status.count} = new kakao.maps.Marker({
			position: p${status.count},
		});
		
		
		m${status.count}.setMap(map);
		
		ms.push(m${status.count});
		
		$('#list td').css('background-color','transparent');
		$(this).css('background-color','gold');
		
		</c:forEach>
	});
	 
	
	
	const ms = [];
	/* 	function dongchange(){
		alert($('#ddong option:selected').data("ddong"));
	}
	 */
	//클릭이벤트
	kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {        
		 
		alert('hi');
		console.log(m1);
		
		m = new kakao.maps.Marker({
			position: p
			//content:content,

		});
		m.setMap(map);
	
	});
		/* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			marker.setMap(map);
			$('.overlaybox').hide();
		});
	 */
	function change(){
		
		//alert($(this).data('lat'));
		//alert($('#blist option:selected').data('buildingseq'));
		
		 $.ajax({
	            url:"/wood/snsmain.do",
	            type: "get", // GET 방식
//	             data: "id=abc&pw=123",
	            data:{buildingseq:$('#blist option:selected').data('buildingseq')},// json 방식으로 서블릿에 보낼 데이터
	            success:function(data){
	            	location.href='/wood/snsmain.do?buildingseq='+$('#blist option:selected').data('buildingseq');
	            },
	            error:function(){
	                alert("error");
	            }
	            
	        });
		 
/* 		
		let p = new kakao.maps.LatLng($('#blist option:selected').data('lat'),$('#blist option:selected').data('lng'));
		
		
		m = new kakao.maps.Marker({
			position: p,
			//content:content,

		});
		alert(m);
		m.setMap(map);
		
		$('#blist td').css('background-color','transparent');
		$(this).css('background-color','gold'); */
		
	};
	
	
	

	
	