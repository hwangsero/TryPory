<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<!--공지사항 목록페이지 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
<!--공지사항 목록페이지 모바일 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice_mobile.css">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/blog-post.css" rel="stylesheet">


<!--네이버 글쓰기 폼 편집 툴-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/naver_editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	
	
<script>
function updateNotice() {
	
	location.href="${pageContext.request.contextPath}/notice/update/${noticeNo}";
}



function noticeList() {
	location.href="${pageContext.request.contextPath}/notice/1"
}


$j(document).ready(function() {
		$j('#deleteBtn').click(function() {
			
			//스마트에디터에서 값을 가져오는 코드
			//oEditors.getById["notice-write-content1"].exec("UPDATE_CONTENTS_FIELD", []);
			
			//확인 코드 
			//document.getElementById("notice-write-content1").value
			console.log("삭제하기 ajax로 넘긴다.")
			if(confirm('삭제하사겠습니까?')) {
			$j.ajax({
				url : "${pageContext.request.contextPath}/notice/${noticeNo}",
				type : "delete",
				success : function(data) {
					alert(data);
					location.href="${pageContext.request.contextPath}/notice/1";
				},
				error : function() {
					alert('삭제에 실패했습니다');
				}
			})
			}
		})
})


/*모바일에서 삭제한 경우*/
$j(document).ready(function() {
		$j('#deleteBtn2').click(function() {
			
			//스마트에디터에서 값을 가져오는 코드
			//oEditors.getById["notice-write-content1"].exec("UPDATE_CONTENTS_FIELD", []);
			
			//확인 코드 
			//document.getElementById("notice-write-content1").value
			console.log("삭제하기 ajax로 넘긴다.")
			if(confirm('삭제하사겠습니까?')) {
			$j.ajax({
				url : "${pageContext.request.contextPath}/notice/${noticeNo}",
				type : "delete",
				success : function(data) {
					alert(data);
					location.href="${pageContext.request.contextPath}/notice/1";
				},
				error : function() {
					alert('삭제에 실패했습니다');
				}
			})
			}
		})
		
	
})


</script>
</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<!-- Navigation -->


	<!-- 1. 공지사항 상세페이지 전체영역 -->
	<div class="notice-detail-container">

		<!--2. 공지사항 머리말 -->
		<div class="notice-detail-type1">
			<h1>공지사항</h1>
		</div>
		<!--END 2. 공지사항 머리말 -->
		
		
		<!-- 3.공지사항 머리말 하단부분  -->
		<div class="notice-detail-type1-1">
			<span>
				<h3 id="notice-detail-title">${notice.title }</h3>
			</span>			
			<span onclick="updateNotice()">
				<a href="#"><h3>수정</h3></a>
			</span>
			<span id="deleteBtn">
				<a href="#"><h3>삭제</h3></a>
			</span>
			<span>
				<h5>${notice.registerDate }</h5>
			</span>
		</div>
		<!--모바일 화면에만 나타나게-->
		<div class="notice-detail-type1-2">
			<span onclick="updateNotice()">
				<a href="#">
				<img src="<%=request.getContextPath()%>/assets/img/notice-img/notice-detail-modify-button.PNG"></a>
			</span>
			<span id="deleteBtn2">
				<a href="#">
				<img src="<%=request.getContextPath()%>/assets/img/notice-img/notice-detail-delete-button.PNG"></a>
			</span>
		</div>
		<!-- END 3.공지사항 머리말 하단부분  -->



		<!--4. 공지사항 글 상세내용 -->
		<div class="notice-detail-type2-2">
			<p>${notice.content }</p>
		</div>
		<!--END 4. 공지사항 글 상세내용 -->
		
		<!--5. 이전, 다음, 목록 버튼-->
		<div class="notice-buttons">
			<input class="back-btn" type="button" value="이전"> 
			<input class="list-btn" type="button" value="목록" onclick="noticeList()">
			<input class="next-btn" type="button" value="다음">
		</div>
		<!--END 5. 이전, 다음, 목록 버튼-->

	</div>
	<!--END 1. 공지사항 상세페이지 전체영역 -->



	<!-- Bootstrap core JavaScript -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
