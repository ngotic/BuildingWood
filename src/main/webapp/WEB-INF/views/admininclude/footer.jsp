<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Container-fluid Ends-->
    </div>     <!-- Container-fluid Ends-->
      </div>
        <!-- footer start-->
     
      </div>
    </div>
    <!-- latest jquery-->
    <script type="text/javascript">
        // localStorage.clear();
        var div = document.querySelector("div.page-wrapper")
        if(div.classList.contains('compact-sidebar')){
            div.classList.remove("compact-sidebar");
        }
        if(div.classList.contains('modern-sidebar')){
            div.classList.remove("modern-sidebar");
        }
        localStorage.setItem('page-wrapper', 'page-wrapper compact-wrapper');
        localStorage.setItem('page-body-wrapper', 'sidebar-icon');    
    </script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- feather icon js-->
<script src="/wood/adminasset/js/icons/feather-icon/feather.min.js"></script>
<script src="/wood/adminasset/js/icons/feather-icon/feather-icon.js"></script>
<!-- Sidebar jquery-->
<script src="/wood/adminasset/js/sidebar-menu.js"></script>
<script src="/wood/adminasset/js/config.js"></script>
<!-- Bootstrap js-->
<script src="/wood/adminasset/js/bootstrap/popper.min.js"></script>
<script src="/wood/adminasset/js/bootstrap/bootstrap.min.js"></script>
<!-- Plugins JS start-->
<script src="/wood/adminasset/js/chart/chartist/chartist.js"></script>
<script src="/wood/adminasset/js/chart/chartist/chartist-plugin-tooltip.js"></script>
<script src="/wood/adminasset/js/chart/knob/knob.min.js"></script>
<script src="/wood/adminasset/js/chart/knob/knob-chart.js"></script>
<script src="/wood/adminasset/js/chart/apex-chart/apex-chart.js"></script>
<script src="/wood/adminasset/js/chart/apex-chart/stock-prices.js"></script>
<script src="/wood/adminasset/js/prism/prism.min.js"></script>
<script src="/wood/adminasset/js/clipboard/clipboard.min.js"></script>
<script src="/wood/adminasset/js/counter/jquery.waypoints.min.js"></script>
<script src="/wood/adminasset/js/counter/jquery.counterup.min.js"></script>
<script src="/wood/adminasset/js/counter/counter-custom.js"></script>
<script src="/wood/adminasset/js/custom-card/custom-card.js"></script>
<script src="/wood/adminasset/js/notify/bootstrap-notify.min.js"></script>
<script src="/wood/adminasset/js/vector-map/jquery-jvectormap-2.0.2.min.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-world-mill-en.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-us-aea-en.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-uk-mill-en.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-au-mill.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-chicago-mill-en.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-in-mill.js"></script>
<script src="/wood/adminasset/js/vector-map/map/jquery-jvectormap-asia-mill.js"></script>
<script src="/wood/adminasset/js/dashboard/default.js"></script>
<script src="/wood/adminasset/js/datepicker/date-picker/datepicker.js"></script>
<script src="/wood/adminasset/js/datepicker/date-picker/datepicker.en.js"></script>
<script src="/wood/adminasset/js/datepicker/date-picker/datepicker.custom.js"></script>
<!-- Plugins JS Ends-->
<!-- Theme js-->
<script src="/wood/adminasset/js/script.js"></script>
<!-- <script src="/wood/adminasset/js/theme-customizer/customizer.js"></script> -->
<!-- Plugin used-->  
