jQuery(document).ready(function($){
	//open popup
	$('.profileImgBtn').on('click', function(event){
		event.preventDefault();
		$('.cd-popup').addClass('is-visible');
	});
	
	//close popup
	$('.cd-popup').on('click', function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.cd-popup').removeClass('is-visible');
	    }
    });
});


jQuery(document).ready(function($){
	//open popup
	$('.backImgBtn').on('click', function(event){
		event.preventDefault();
		$('.cd-popup02').addClass('is-visible');
	});
	
	//close popup
	$('.cd-popup02').on('click', function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.cd-popup02').removeClass('is-visible');
	    }
    });
});


$(document).ready(function() {
	function img_layout_init(){
		var divs = $j(".img_wrap");
		
		for (var i = 0; i < divs.length; ++i) {
			var div = divs[i];
			var img_contents = $j(div).find('.img_content');
			$j(div).addClass('ic-' + img_contents.length);
		}
	}
	
	function img_init(){
		var divs = $j(".img_wrap .img_content");
		for (var i = 0; i < divs.length; ++i) {
			var div = divs[i];
			var divAspect = $j(div).height() / $j(div).width()

			var img = $j(div).find('img');
			var imgAspect = $j(img).height() / $j(img).width()

			if (imgAspect <= divAspect) {
				// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
				var imgWidthActual = div.offsetHeight / imgAspect;
				var imgWidthToBe = div.offsetHeight / divAspect;
				var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
				$j(img).css({
					'width' : 'auto',
					'height' : '100%',
					'margin-left' : marginLeft + 'px'
				});
			} else {
				// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
				$j(img).css({
					'width' : '100%',
					'height' : 'auto',
					'margin-left' : '0'
				});
			}
		}
	}
	
	img_layout_init();
	img_init();
});