$(document).ready(function(){
	$("div.single-trending-tag").hover({
		function(){
			$(this).addClass("on");
		}, function(){
			$(this).removeClass("on");
		}
	})
});
