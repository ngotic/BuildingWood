<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 

	<script>
		/* HEADER EVENT*/
		/* window.onload = function() { scrollFunction()};
		window.onscroll = function() { scrollFunction()};

		function scrollFunction() {
			var header = document.getElementById('header');
			if(document.documentElement.scrollTop > 70) {
				if(!header.classList.contains('navbar-fixed')) {
					header.classList.add('navbar-fixed');
					document.getElementsByTagName('body')[0].style.marginTop = '70px';
					header.style.display = 'none';
					setTimeout(function(){
						header.style.display = 'block';
					}, 40);
				}
			} else {
				if(header.classList.contains('navbar-fixed')) {
					header.classList.remove('navbar-fixed');
					document.getElementsByTagName('body')[0].style.marginTop = '0';
				}
			}
		} */
		function menuToggle() {
			document.getElementById('menu').classList.toggle('show');
		}
		document.getElementById('toggleBtn').addEventListener('click', menuToggle);

		 $('#toggleBtn').click(function(){

			if( $('#menu').hasClass('show'))
				$('#menu').hide();
			else 
				$('#menu').show();

    	});

		$(window).resize(function (){
			var width_size = window.outerWidth;
			// 800 이하인지 if문으로 확인
			if (width_size >= 992) {
				$('#menu').show();
			} else
				$('#menu').hide();
		});

	</script>
</body>
</html>
