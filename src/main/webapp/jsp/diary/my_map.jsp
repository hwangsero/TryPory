<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/head.jsp" %>
</head>

<body>
    <!-- Preloader -->
    <%@ include file="/WEB-INF/include/preload.jsp" %>

    <!-- ##### Header Area Start ##### -->
    <%@ include file="/WEB-INF/include/header.jsp" %>
	<!-- ##### Header Area End ##### -->
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

	<p>Date: <input type="text" id="datepicker"></p>

    <%@ include file="/WEB-INF/include/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-3.3.1.min.js"></script>
    <script>var $j = jQuery.noConflict(true);</script>
    
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/assets/js/active.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
</html>