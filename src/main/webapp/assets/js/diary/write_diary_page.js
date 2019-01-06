$j(document).ready(function(){
	var file_input = $j("input[id=cover_image]");
	var tag_input = $j("div.tag_input input");
	var date = new Date();
	var first_date;
	var diary_data = new Object();
	
	var upload_data = [];
	var post_data = new Object();
	
	
	var date_data = [];
	
	var date_cell = new Object(); // 일별데이터
	date_cell.content = []; // 일별 컨텐츠

	var date_cell_data = new Object(); // 첫번쨰 컨텐츠
	date_cell_data.images = [];		// 첫번쨰 컨텐츠의 이미지
	date_cell_data.text = '';		// 첫번쨰 컨텐츠의 텍스트
	date_cell.content[0] = date_cell_data;

	date_data[0] = date_cell;
	
	date_data[1] = date_cell;
	
	console.log(date_data);
	
	var default_date_str = date.getFullYear() + '.' + (date.getMonth()+1) + '.' + date.getDate();
	
	post_data.start_date = post_data.end_date = default_date_str; 
	$j("div.content_datebox span").text(default_date_str );
	
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
	
	$j("button.save").click(function(){
		var title = $j("textarea#input_diary_title").val();
		if( title == ''){
			alert("여행일지의 제목을 입력하세요");
			return false;
		}
		post_data.title = title;
		diary_data.post_data = post_data;
		
		var date_list = $j("div#date_wrap");
		for (var i = 0; i < date_list.length; i++) {
			var date_wrap = date_list[i];
			var content_box_list = $j(date_wrap).find("div.content_box");
			for (var j = 0; j < content_box_list.length; j++) {
				var content_box = content_box_list[j];
				var text = $j(content_box).find("textarea").val();
				date_data[i].content[j].text = text;
			}
		}
		diary_data.date_data = date_data;
		
		console.log(JSON.stringify(diary_data));
		
		$j.ajax({
			url : window.ctx + '/diary',
			type: 'POST',
			contentType: 'application/json',
			dataType : 'json',
			data : JSON.stringify(diary_data),
			success : function(response) {
				console.log(response);
			},
			error : function(jqXHR) {
				console.log(jqXHR);
				console.log('error');
			}

		});
	});
	
    function image_resize(imageContent) {
    	var div = imageContent;
		var divAspect = $j(div).height() / $j(div).width();

		var img = $j(div).find('img');
		var imgAspect = $j(img).height() / $j(img).width();

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
				
				var date_count = target.parent().parent().prevAll('.content_datebox').length;
				var content = new Object();
				date_data[date_count-1].content.push(content);
				
				console.log(date_data);
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
			var date_wrap = $j(e.target).closest("#date_wrap");
			var date_count = date_wrap.prevAll('#date_wrap').length;
			var upload_form_count = $j(e.target).closest(".content_box").prevAll(".content_box").length; 
			
			formdata = new FormData();
			if (files.length != 0) {
	            for (var i = 0; i < files.length; i++) {
	                formdata.append(files[i].name, files[i]);
	            }

				$j.ajax({
					url : window.ctx + '/upload',
					data : formdata,
					processData : false,
					contentType : false,
					type : 'POST',
					async : false,
					success : function(response) {
						var data = JSON.parse(response);
						upload_data = upload_data.concat(data);
//						console.log(data);

//						date_data[date_count][upload_form_count].images = data;
					},
					error : function(jqXHR) {
						console.log('error');
					}
	
				});
			}
//			console.log(files);
			
//			files = files_sort(files, img_wrap);
			files_sort(files, 0, img_wrap);
//		    setup_reader(files, 0);
//			console.log(files);
		});
		
	}
	
	function files_sort(files, index, img_wrap){
		var init_count = 0;
//		for (var i = 0; i < files.length; i++) {
			var file = files[index];
		    var reader = new FileReader();
			
		    reader.onload = function() {
				file_init(atob(this.result.replace(/^.*?,/,'')), files, index, this.result, img_wrap );
			}
			
		    reader.readAsDataURL(file);
//		}
//		return files;
	}
	
	function file_init(data, files, i, src, img_wrap) {
		var file = files[i];
		
		var jpeg = new this.JpegMeta.JpegFile(data, file);
		console.log(file);
		file.src = src;
		
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
		console.log(file);
//		init_count++;
		
		if (i < files.length - 1) {
			files_sort(files, i+1, img_wrap);
	    } else {
//		if( init_count == files.length){ // init 완료
	    	console.log(files);
			var array = [].slice.call(files);
			files = array.sort(sortFunction);
			console.log(files);
			files_view(files, img_wrap);
		}
	}
	
	function sortFunction(a,b){  
		var dateA = a.dateTime;
		var dateB = b.dateTime;
		return dateA > dateB ? 1 : -1;  
	}; 
	
	function files_view(files, img_wrap){
		var write_con = $j("div#write_wrap .container.C");
		var tag_con = $j(write_con).find(".tag_container");
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			
			if( i == 0){ // 첫번째 사진
				start_date = first_date = file.dateTime;
				var start_date_str = first_date.getFullYear() + '.' + (first_date.getMonth()+1) + '.' + first_date.getDate();
				write_con.find("div.content_datebox").first().find("span").text(start_date_str);
				
				date_data[0].date = post_data.start_date = start_date_str; // 정보 등록
			}
			
			if(file.dateTime.getDate() - start_date.getDate() > 0){
				var date_box_clone = write_con.find("div.content_datebox").first().clone();
				var content_box_clone = write_con.find("div.content_box").first().clone();
				
				date_box_clone.find("h4").text( (file.dateTime.getDate() - first_date.getDate() + 1) +"일차");
				start_date = file.dateTime;
				date_box_clone.find("span").text(start_date.getFullYear() + '.' + (start_date.getMonth()+1) + '.' + start_date.getDate() );
				
				content_box_clone.find("textarea.autosize").val("");
				content_box_clone.find("div.img_wrap *").remove();
				content_box_clone.find("div.tool_box").css("display","none");
				var div = $("<div id='date_wrap'>").append(date_box_clone).append(content_box_clone);
				
				tag_con.before(div);
				img_wrap = content_box_clone.find(".img_wrap");
				
				// 정보 등록
				var cell_data = new Object();
				cell_data.content = [];
				
				var content_data = new Object();
				cell_data.content[0] = content_data;
				cell_data.content[0].images = [];
				
				var file_date = file.dateTime;
				var end_date_str = file_date.getFullYear() + '.' + (file_date.getMonth()+1) + '.' + file_date.getDate();
				cell_data.date = post_data.end_date = end_date_str; // 일차 날짜

				var cells = cell_data;
				date_data[div.prevAll("#date_wrap").length] = cells;
			}
			
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
			var date_wrap_cnt = $j(img).closest("#date_wrap").prevAll("#date_wrap").length;
			var img_row_cnt = $j(img).closest("div.content_box").prevAll("div.content_box").length;
			
			for (var j = 0; j < upload_data.length; j++) {
				var upload_img = upload_data[j];
				if(file.name == upload_img.origName){
					if(date_data[date_wrap_cnt].content[img_row_cnt] == undefined){
						date_data[date_wrap_cnt].content[img_row_cnt] = new Object();
						date_data[date_wrap_cnt].content[img_row_cnt].images = [];
					}
					date_data[date_wrap_cnt].content[img_row_cnt].images.push(upload_img);
					break;
				}
			}
			
			display(file, img);
			$j(img).bind('load', function() {
				image_resize($j(this).parent() );
			});
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