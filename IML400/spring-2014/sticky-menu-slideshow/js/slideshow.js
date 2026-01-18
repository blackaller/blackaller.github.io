var	slideLoop,
	slideDur = 3000,
	fadeSpeed = 700;

$(document).ready(init);

function init() {
	setTimeout(function() {
		window.scrollTo(0, 1);
	}, 100);
	initSlides();
}

function initSlides() {

	function clearCurrentSlide() {
		$('.bgs img').removeClass('current');
		$('.bullet').removeClass('current');
	}
	
	function setCurrentSlide(n) {
		$('.bgs img#'+n).addClass('current');
		$('#'+n+'.bullet').addClass('current');
	}
	function chgCurrentSlide(i) {
		n=i;
		$('.bgs').fadeOut(fadeSpeed,function(){
			$.when( clearCurrentSlide() ).then(function(){
				$.when( setCurrentSlide(n) ).then(function(){
					$('.bgs').css('background-image','url('+$('.bgs img.current').attr('src')+')').fadeIn(fadeSpeed);
				});
			});
		});
	}
		
	var n=0;
	var slideLimit = $('.bgs img').length;
	slideLoop = setInterval(function(){ nextSlide() },slideDur);
	function prevSlide()
	{
		n--; if(n<0) { n=slideLimit-1; }
		chgCurrentSlide(n);
	}
	function nextSlide()
	{
		n++; if(n==slideLimit) { n=0; }
		chgCurrentSlide(n);
	}
	function stopSlideshow()
	{
		clearInterval(slideLoop);
	}
	
	$(window).resize(function(){
		$('.bgs').height($(window).height()).width($(window).width());
	});


	$('.bgs').height($(window).height()).width($(window).width());
	$('.bullet:first-child').addClass('current');
	$('.bgs img:first-child').addClass('current');//.fadeIn();
	
	$('.bullet').click(function(){
		i = $(this).attr('id'); stopSlideshow();
		chgCurrentSlide(i);
		slideLoop = setInterval(function(){ nextSlide() },slideDur);
	});

	$('.bgs').click(function(){
		stopSlideshow(); nextSlide();
		slideLoop = setInterval(function(){ nextSlide() },slideDur);
	});

	$('.bgs img#0').addClass('current');
	$('.bgs').css('background-image','url('+$('.bgs img.current').attr('src')+')').fadeIn(fadeSpeed);
	
}