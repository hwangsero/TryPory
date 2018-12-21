<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<script>
		
	<%session.setAttribute("login_id", request.getParameter("email"));%>
		location.href = "${pageContext.request.contextPath}";
	</script>
</body>
</html>