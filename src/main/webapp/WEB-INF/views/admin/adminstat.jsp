<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>

<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp" %>
 <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/feather-icon.css">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/datatables.css">
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/style.css">
    <link id="color" rel="stylesheet" href="/wood/adminasset/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="/wood/adminasset/css/responsive.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<head>
<style>
</style>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart1);
google.charts.setOnLoadCallback(drawChart2);

function drawChart1() {
	
	
  $.ajax({
		 
  });
	
	
  var data = google.visualization.arrayToDataTable([
    ['연령대', '수'],
    ['10대',     11],
    ['20대',      2],
    ['30대',  2],
    ['40대', 2],
    ['50대',    7],
    ['60대이상',    7]
  ]);

  var options = {
    title: '남성 연령대별 회원'
  };

  var chart = new google.visualization.PieChart(document.getElementById('manpiechart'));

  chart.draw(data, options);
}


function drawChart2() {

  var data = google.visualization.arrayToDataTable([
    ['연령대', '수'],
    ['10대',     11],
    ['20대',      2],
    ['30대',  2],
    ['40대', 2],
    ['50대',    7],
    ['60대이상',    7]
  ]);

  var options = {
    title: '여성 연령대별 회원'
  };

  var chart = new google.visualization.PieChart(document.getElementById('womanpiechart'));

  chart.draw(data, options);
  
  }
</script>
</head>
        <!-- template.jsp > index.jsp -->
	    <%@ include file="/WEB-INF/views/admininclude/header.jsp" %>
	    
      	 <!-- Container-fluid starts-->
         <div class="container-fluid">
           	
           <div class="row">
              <!-- Zero Configuration  Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h2 style="font-weight:900; margin-bottom:20px;">사이트통계</h2>
                    <span style="font-size:20px;">글 작성수를 조회하여 통계치를 구하였습니다.</span>
                  </div>
                  <div class="card-body">
               		<div style="display:flex; border:1px solid #777;">
				      <div id="manpiechart" style="width: 500px; height: 500px;"></div>
				      <div id="womanpiechart" style="width: 500px; height: 500px;"></div>
				    </div>
                  </div>
                </div>
              </div>
             </div>
             
             <div class="row">
              <!-- Zero Configuration  Starts-->
              <div class="col-sm-12">
                <div class="card">
                 <div class="card-header">
                    <h2 style="font-weight:900; margin-bottom:20px;">게시판 이용 통계</h2>
                    <span style="font-size:20px;">통계정보를 이용하여 유저들의 성향을 파악합니다.</span>
                  </div>
                  <div class="card-body">
               		<div style="display:flex; border:1px solid #777;">
  						<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
				    </div>
                  </div>
                </div>
              </div>
             </div>
             
             <div class="row">
              <!-- Zero Configuration  Starts-->
              <div class="col-sm-12">
                <div class="card">
                 <div class="card-header">
                    <h2 style="font-weight:900; margin-bottom:20px;">빌딩별 게시판 글 작성수</h2>
                    <span style="font-size:20px;">통계정보를 이용하여 유저들의 성향을 파악합니다.</span>
                  </div>
                  <div class="card-body">
               		<div style="display:flex; border:1px solid #777;">
  						<div id="container"></div>
				    </div>
                  </div>
                </div>
              </div>
             </div>
             
             
         </div>

		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
         <%@ include file="/WEB-INF/views/admininclude/footer.jsp" %>
    	
	   	 <!-- Sidebar jquery-->
	    <script src="/wood/adminasset/js/sidebar-menu.js"></script>
	    <script src="/wood/adminasset/js/config.js"></script>
	    <!-- Bootstrap js-->
	    
	    <!-- Plugins JS start-->
	   
	    <script src="/wood/adminasset/js/tooltip-init.js"></script>
	   
	    
	    <!-- feather icon js-->
	    <!-- <script src="/wood/adminasset/js/bootstrap/bootstrap.min.js"></script> -->
	    <script src="/wood/adminasset/js/icons/feather-icon/feather.min.js"></script>
	    <script src="/wood/adminasset/js/icons/feather-icon/feather-icon.js"></script>
	     <script src="/wood/adminasset/js/datatable/datatables/jquery.dataTables.min.js"></script>
	    <script src="/wood/adminasset/js/datatable/datatables/datatable.custom.js"></script>
	    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
	    <!-- Sidebar jquery-->
	    <script src="/wood/adminasset/js/sidebar-menu.js"></script>
	    <script src="/wood/adminasset/js/config.js"></script>
	    <!-- Bootstrap js-->
	    <!-- Theme js-->
	    <script src="/wood/adminasset/js/script.js"></script>
	    <script src="https://code.highcharts.com/highcharts.js"></script>
	    <!-- Plugins JS Ends-->
 <script>
 
 Highcharts.chart('container', {
	  chart: {
	    type: 'column'
	  },
	  title: {
	    text: 'World\'s largest cities per 2021'
	  },
	  subtitle: {
	    text: 'Source: <a href="https://worldpopulationreview.com/world-cities" target="_blank">World Population Review</a>'
	  },
	  xAxis: {
	    type: 'category',
	    labels: {
	      rotation: -45,
	      style: {
	        fontSize: '13px',
	        fontFamily: 'Verdana, sans-serif'
	      }
	    }
	  },
	  yAxis: {
	    min: 0,
	    title: {
	      text: 'Population (millions)'
	    }
	  },
	  legend: {
	    enabled: false
	  },
	  tooltip: {
	    pointFormat: 'Population in 2021: <b>{point.y:.1f} millions</b>'
	  },
	  series: [{
	    name: 'Population',
	    colors: [
	      '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
	      '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
	      '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
	      '#03c69b',  '#00f194'
	    ],
	    colorByPoint: true,
	    groupPadding: 0,
	    data: [
	      ['Tokyo', 37.33],
	      ['Delhi', 31.18],
	      ['Shanghai', 27.79],
	      ['Sao Paulo', 22.23],
	      ['Mexico City', 21.91],
	      ['Dhaka', 21.74],
	      ['Cairo', 21.32],
	      ['Beijing', 20.89],
	      ['Mumbai', 20.67],
	      ['Osaka', 19.11],
	      ['Karachi', 16.45],
	      ['Chongqing', 16.38],
	      ['Istanbul', 15.41],
	      ['Buenos Aires', 15.25],
	      ['Kolkata', 14.974],
	      ['Kinshasa', 14.970],
	      ['Lagos', 14.86],
	      ['Manila', 14.16],
	      ['Tianjin', 13.79],
	      ['Guangzhou', 13.64]
	    ],
	    dataLabels: {
	      enabled: true,
	      rotation: -90,
	      color: '#FFFFFF',
	      align: 'right',
	      format: '{point.y:.1f}', // one decimal
	      y: 10, // 10 pixels down from the top
	      style: {
	        fontSize: '13px',
	        fontFamily: 'Verdana, sans-serif'
	      }
	    }
	  }]
	});    
 
 
 // 전체 지역기준
 // SNS, 건의공지, 약속, 동호회, 카풀, 스터디, 과외 
 var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
 var yValues = [55, 49, 44, 24, 15];
 var barColors = ["red", "green","blue","orange","brown"];

 new Chart("myChart", {
   type: "bar",
   data: {
     labels: xValues,
     datasets: [{
       backgroundColor: barColors,
       data: yValues
     }]
   },
   options: {
     legend: {display: false},
     title: {
       display: true,
       text: "World Wine Production 2018"
     }
   }
 });
					 
 
 </script> 	
  </body>
</html>