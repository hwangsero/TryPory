<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my_map.css">
	<%@ include file="/WEB-INF/include/head.jsp" %>
	<script>
	$j(document).ready(function(){
		$j(".close_icon").click(function(){
			var map_wrap = $j("#map_info_container");
			if(map_wrap.css("display") == "none"){
				map_wrap.show();
			}else{
				map_wrap.hide();
			}
		});
	});
	</script>
</head>

<body>
    <!-- Preloader -->
    <%@ include file="/WEB-INF/include/preload.jsp" %>

    <!-- ##### Header Area Start ##### -->
    <%@ include file="/WEB-INF/include/header.jsp" %>
	<!-- ##### Header Area End ##### -->
	
    <%@ include file="/jsp/diary/map.jsp" %>
    <%@ include file="/jsp/diary/map_info.jsp" %>
    
    <%@ include file="/WEB-INF/include/footer.jsp" %>
    
</html>