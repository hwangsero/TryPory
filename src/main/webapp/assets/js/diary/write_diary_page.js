$j(document).ready(function(){
	var file_input = $j("input[id=cover_image]");
	var tag_input = $j("div.tag_input input");
	
	file_input.change(function(e){	// 커버사진 미리보기
		var img_url = URL.createObjectURL(e.target.files[0]);
		$j("div#write_page_header").css("background-image", "url(" +  img_url+ ")");
	});
	
	$j("textarea.autosize").on('keydown keyup', function () { // Textarea 높이 조절
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
    });
  
	$j(".tool_wrap").on('click', function(e) {	// +버튼 클릭
		var content_editbox = $j(e.target).parent().parent();
		var tool_box = content_editbox.find('.tool_box');
		if(tool_box.css("display") == "none"){
			tool_box.show();
			//content_editbox.find("textarea").css("visibility", "hidden");
		}else{
			tool_box.hide();
			//content_editbox.find("textarea").css("visibility", "visible");
		}
	});
	
	function tag_remove_init(){ // 태그 삭제 버튼 이벤트 설정
		$j(".tag_list li button.tag_remove").click(function(e){
			$(e.target).closest("li").remove();
//			$j(".tag_list li:last-child").css("display","list-item");
			$j(".tag_list li:last-child input").prop("readonly",null);
		});
	}
    	
    $j(tag_input).on('keyup', function(event){
    	
    	if(event.keyCode == 32 && tag_input.val().trim() != '') { // 스페이스바 입력시
    		event.preventDefault();
    		var last_tag = $j(".tag_list li:last-child"); 
    		last_tag.before("<li>" +
    				"<div class='tag_info'>" +
    					"<div class='link_tag'>" +
    					tag_input.val().trim() +
    						"<button class='tag_remove'>" +
    						"<i class='fas fa-times'></i>" +
    						"</button>" +
    						"</div>" +
    					"</div>" +
    				"</li>");
    		tag_input.val('');
    		if( $j(".tag_list li").length -1 > 4 ){
//    			$j(".tag_list li:last-child").css("display","none");
    			$j(".tag_list li:last-child input").attr("readonly","true");
    		}
    		tag_remove_init();
    	}
    });
    
    $j(".tool_box i.fa-image").click(function(e){
    	$(e.target).closest(".tool_box").find("input[type=file]").trigger('click');
    });
    $j(".tool_box input[type=file]").change(function(e){	// 커버사진 미리보기
//		console.log(e.target.files);
    	var files = e.target.files;
    	for (var i = 0; i < files.length; i++) {
			var file = files[i];
			var img_url = URL.createObjectURL(file);
			var img_wrap = $(e.target).closest(".content_editbox").find("div.img_wrap");
			img_wrap.append("<div class='img_content'>" +
						"<img class='picture' src='' alt=''>" +
					"</div>");
			img_wrap.find(".img_content:last-child img").attr("src", img_url);
			img_wrap.find(".img_content:last-child img").load(function(){
				image_resize(img_wrap.find(".img_content:last-child") );
			})
		}
//		$j("div#write_page_header").css("background-image", "url(" +  img_url+ ")");
	});
    
    function image_resize(imageContent){
    	var div = imageContent;
		var divAspect = $j(div).height() / $j(div).width()

		var img = $j(div).find('img');
		var imgAspect = $j(img).height() / $j(img).width()

		if (imgAspect <= divAspect) {
			// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
			var imgWidthActual = div.outerHeight() / imgAspect;
			var imgWidthToBe = div.outerHeight() / divAspect;
			var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
			$j(img).css({
				'width' : 'auto',
				'height' : '100%',
				'margin-left' : marginLeft + 'px'
			});
		} else {
			// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
			var imgHeightActual = div.outerWidth() / imgAspect;
			var imgHeightToBe = div.outerWidth() / divAspect;
			var marginTop = Math.round((imgHeightActual - imgHeightToBe) / 2);
			$j(img).css({
				'width' : '100%',
				'height' : 'auto',
				'margin-top' : marginTop + 'px'
			});
		}
    	
    }
    	
    tag_remove_init();
});