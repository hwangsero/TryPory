<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/head.jsp" %>
	<style>
	body {
		background-color:white !important;
	}
	section div.box-shadow.mag-posts-content {
		box-shadow: none !important;
	}
	</style>
	<script src="assets/js/diary/image_resize.js"></script>
</head>


<body>
    <%@ include file="/WEB-INF/include/preload.jsp" %>

    <!-- ##### Header Area Start ##### -->
    <%@ include file="/WEB-INF/include/header.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <%@ include file="jsp/main/carousel.jsp" %>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Mag Posts Area Start ##### -->
    <%@ include file="jsp/main/section.jsp" %>
    <!-- ##### Mag Posts Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@ include file="/WEB-INF/include/footer.jsp" %>
    
</body>

</html>