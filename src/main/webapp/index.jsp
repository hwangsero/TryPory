<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="include/head.jsp" %>
</head>

<body>
    <!-- Preloader -->
    <%@ include file="include/preload.jsp" %>

    <!-- ##### Header Area Start ##### -->
    <%@ include file="include/header.jsp" %>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <%@ include file="main/carousel.jsp" %>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Mag Posts Area Start ##### -->
    <%@ include file="main/section.jsp" %>
    <!-- ##### Mag Posts Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <%@ include file="include/footer.jsp" %>

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-3.3.1.min.js"></script>
    <script>var $j = jQuery.noConflict(true);</script>
    <script src="js/main.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    
</body>

</html>