<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/notice/notice-detail.css">
</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<div class="notice-write-container">
		<div class="notice-write-type1">
			<h1>공지사항 등록</h1>
		</div>

		<div class="notice-write-type2">
			<form method="post"
				action="<%= request.getContextPath() %>/board/write.do?proNo=${ param.proNo }&type=${ param.type }"
				onsubmit="return checkForm()" name="wForm" class="write_form">

				<%-- 			<!--제목-->
				<div class="form_group">
					<h3>제목을 입력해주세요</h3>
					<input type="text" class="form_control" name="boardTitle"
						id="formTitle">
				</div>

				<!-- 작성자 -->
				<div class="form_group">
					<label>글쓴이</label> <span class="get_form">${ userVO.id }</span>
				</div>

				<!--글 쓰기-->
				<div class="form_group">
					<label for="formCon">내용</label>
					<textarea class="form_control" name="contents" id="formCon"
						rows="15"></textarea>
				</div> --%>

				<div class="notice-write-type2-table">
					<table border="1" summary="">
						<tr class="first">
							<th scope="row">날짜</th>
							<td><input type="text" class="form_control"
								name="boardTitle" id="formTitle"></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" class="form_control"
								name="boardTitle" id="formTitle"></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td><textarea></textarea></td>
						</tr>
					</table>

					<!--버튼-->
					<div class="notice-write-type2-btn">
						<input type="button" value="초기화" onclick="history.go(-1)">
						<input type="submit" value="등록">
					</div>
				</div>

			</form>
		</div>
	</div>
	<!-- // end w_form -->

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>