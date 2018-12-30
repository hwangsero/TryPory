$j(document).ready(function(){
	var file_input = $j("input[id=cover_image]");
	var tag_input = $j("div.tag_input input");
	var date = new Date();
	
	$j("div.content_datebox span").text(date.getFullYear() + '.' + (date.getMonth()+1) + '.' + date.getDate() );
	
	file_input.change(function(e){	// 커버사진 미리보기
		var img_url = URL.createObjectURL(e.target.files[0]);
		$j("div#write_page_header").css("background-image", "url(" +  img_url+ ")");
	});
	
	function tag_remove_init(){ // 태그 삭제 버튼 이벤트 설정
		$j(".tag_list li button.tag_remove").click(function(e){
			$(e.target).closest("li").remove();
//			$j(".tag_list li:last-child").css("display","list-item");
			$j(".tag_list li:last-child input").prop("readonly",null);
		});
	}
	
    function image_resize(imageContent){
    	var div = imageContent;
		var divAspect = $j(div).height() / $j(div).width();

		var img = $j(div).find('img');
		var imgAspect = $j(img).height() / $j(img).width();
		console.log('resize');
		console.log(img);

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
//			var marginTop = Math.round((div.height() - $(img).height()) / 2);
			$j(img).css({
				'width' : '100%',
				'height' : 'auto',
				'margin-top' : marginTop + 'px'
			});
		}
    }
    
	function content_event_init(){
		var content_input = $j("div.content_editbox textarea").unbind('keyup');
		$j(content_input).on('keyup', function(event){ // 내용입력 부분
			
			if(event.keyCode == 13 ) { // 스페이스바 입력시
				var target = $j(event.target);
				var content_box = target.closest("div.content_box");
				var content_box_clone = content_box.clone();
				
				content_box_clone.find("textarea.autosize").val("");
				content_box_clone.find("div.img_wrap *").remove();
				content_box_clone.find("div.tool_box").css("display","none");
				content_box.after(content_box_clone);
				
				content_event_init();
			}
		});
		
		$j(".tool_wrap").on('click', function(e) {	// 내용에 +버튼 클릭
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
		
		$j(".tool_box i.fa-image").click(function(e){ // 내용에 사진등록 버튼 클릭
	    	$(e.target).closest(".tool_box").find("input[type=file]").trigger('click');
	    });
		
		$j("textarea.autosize").on('keydown', function (e) { // 내용에 Textarea 높이 조절
//			e.preventDefault();
			$j(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	    });
		
		$j(".tool_box input[type=file]").change(function(e){
			var files = e.target.files;
			var img_wrap = $j(e.target).closest(".content_editbox").find("div.img_wrap");
			console.log(files);
			
			files = files_sort(files, img_wrap);
			
			console.log(files);
//			files_view(files, e);
			
		});
		
		function files_sort(files, img_wrap){
			var count = 0;
			var init_count = 0;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var dataurl_reader = new FileReader();
				
				dataurl_reader.onloadend = function(img) {
					file_init(atob(this.result.replace(/^.*?,/,'')), img, count, this.result );
					count++;
				}
				
				function file_init(data, img, count, src) {
					console.log("file init");
					var file = files[count];
				    var jpeg = new this.JpegMeta.JpegFile(data, img);
				    
				    file.src = src;
//				    console.log(jpeg);

				    if( jpeg.tiff != undefined && jpeg.tiff.Orientation != undefined ) {
				    	file.orientation = jpeg.tiff.Orientation.value;
				    }
				    
				    if( jpeg.tiff != undefined && jpeg.gps != undefined ) {
				    	if (jpeg.gps.GPSLatitude) {
				    	    var latitude;
				    	    latitude = jpeg.gps.GPSLatitude.value[0].asFloat() +
				    		(1 / 60) * jpeg.gps.GPSLatitude.value[1].asFloat() +
				    		(1 / 3600) * jpeg.gps.GPSLatitude.value[2].asFloat();
				    	    if (jpeg.gps.GPSLatitudeRef.value === "S") {
				    	    	latitude = -latitude;
				    	    }
				    	    file.latitude = latitude;
				    	}
				    	if (jpeg.gps.GPSLongitude) {
				    	    var longitude;
				    	    longitude = jpeg.gps.GPSLongitude.value[0].asFloat() +
				    		(1 / 60) * jpeg.gps.GPSLongitude.value[1].asFloat() +
				    		(1 / 3600) * jpeg.gps.GPSLongitude.value[2].asFloat();
				    	    if (jpeg.gps.GPSLongitudeRef.value === "W") {
				    	    	longitude = -longitude;
				    	    }
				    	    file.longitude = longitude;
				    	}
				    	
				    }
				    if( jpeg.tiff.DateTime) {
				    	var dateTime = jpeg.tiff.DateTime.value;

				    	var parts = dateTime.replace(' ', ':').split(':');
				        file.dateTime = new Date(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
				        
				    }
				    
				    init_count++;
				    
				    if( init_count == files.length){ // init 완료
				    	var array = [].slice.call(files);
						files = array.sort(sortFunction);
						console.log(files);
						files_view(files, img_wrap);
				    }
				}

				dataurl_reader.readAsDataURL(file);
			}
			return files;
		}
		function sortFunction(a,b){  
		    var dateA = a.dateTime;
		    var dateB = b.dateTime;
		    return dateA > dateB ? 1 : -1;  
		}; 

		function files_view(files, img_wrap){
			console.log('files_view');
			console.log(files);
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				
				function display(file, img){
					switch(file.orientation) {
						case 2: img.addClass('flip'); break;
						case 3: img.addClass('rotate-180'); break;
						case 4: img.addClass('flip-and-rotate-180'); break;
						case 5: img.addClass('flip-and-rotate-270'); break;
						case 6: img.addClass('rotate-90'); break;
						case 7: img.addClass('flip-and-rotate-90'); break;
						case 8: img.addClass('rotate-270'); break;
					}
				}
				img_wrap.append(
					"<div class='img_row'>" +
						"<div class='img_content'>" +
							"<img class='picture' src='" + file.src + "' alt=''>" +
						"</div>" +
					"</div>"
				);
				var img = img_wrap.find(".img_row:last-child img");
				console.log(img);
				display(file, img);
				$j(img).bind('load', function() {
					image_resize($j(this).parent() );
				});
			}
		}
	}
	
	function tag_event_init(){
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
	    		// 	$j(".tag_list li:last-child").css("display","none");
	    			$j(".tag_list li:last-child input").attr("readonly","true");
	    		}
	    		tag_remove_init();
	    	}
	    });

		tag_remove_init();
	}
    
    content_event_init();
    tag_event_init();
});