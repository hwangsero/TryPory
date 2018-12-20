<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/diary/write_diary_page.css">
	
    <script>
    $j(document).ready(function(){
    	var file_input = $j("input[id=cover_image]");
    	
    	file_input.change(function(e){
    		var img_url = URL.createObjectURL(e.target.files[0]);
    		$j("div#write_page_header").css("background-image", "url(" +  img_url+ ")");
    	});
    	
    	$j("textarea.autosize").on('keydown keyup', function () {
    		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
    	});
  
    	$j(".tool_wrap").on('click', function(e) {
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
    });
    </script>
</head>

<body>
    <%@ include file="/WEB-INF/include/preload.jsp" %>

    <%@ include file="/WEB-INF/include/header.jsp" %>
    <%@ include file="/jsp/diary/write_diary.jsp" %>
    <%@ include file="/WEB-INF/include/footer.jsp" %>

 
</html>