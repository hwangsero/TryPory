<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<!--공지사항 목록페이지 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
<!--공지사항 목록페이지 모바일 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice_mobile.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!--fontaswesome 아아콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<!--네이버 글쓰기 폼 편집 툴-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/naver_editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<!--스마트에디터에서 쓴글을 textarea로 가져오는 코드-->
<script type="text/javascript">
window.onload = function(){
	//버튼을 누를 때 실행
	var btn = document.getElementById("writebtn");
	btn.onclick = function(){
		submitContents(btn);
	}
}

//저장 버튼을 누른 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj){
	//에디터의 내용이 textarea에 적용된다.
	oEditors.getById["notice-write-content1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	//에디터의 내용에대한 값 검증은 이곳에서
	//document.getElemntById("notice-write-content1").value를 이용하여 처리한다.
	
	try{
		//해당 오브젝트가 위치한 form이 submit됨
		elClickedObj.form.submit();
	}catch(e){
		
	}
}
</script>

</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>

	<!--1. 공지사항 글 등록 전체영역 -->
	<div class="notice-write-container">

		<!--2. 공지사항 글 등록 페이지 머리말-->
		<div class="notice-write-type1">
			<h1>공지사항 등록</h1>
		</div>
		<!--END 2. 공지사항 글 등록 페이지 머리말-->

		<!--3. 공지사항 글 등록 폼 -->
		<div class="notice-write-type2">
			<form method="post"
				action="${pageContext.request.contextPath }/notice/write"
				onsubmit="return checkForm()" name="wForm" class="write_form">

				<!--제목-->
				<input id="notice-write-title" name="title"></input>

				<!--데스크탑 글쓰기폼(네이버 폰트에디터가 포함됨)-->
				<div class="notice-write-content-box1">
					<textarea id="notice-write-content1" name="content"></textarea>
					<script type="text/javascript" class="naver-writeForm-editor">
						var oEditors = [];
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : oEditors,
									elPlaceHolder : "notice-write-content1",
									sSkinURI : "${pageContext.request.contextPath}/naver_editor/SmartEditor2Skin.html",
									fCreator : "createSEditor2"
								});
					</script>
				</div>

				<!--모바일 글쓰기폼(네이버 폰트에디터가 포함되지 않은 글쓰기 폼)-->
				<div class="notice-write-content-box2">
					<textarea id="notice-write-content2" name="content"></textarea>
				</div>


				<!--첨부파일-->
				<div class="notice-write-attachFile">
					<button>찾아보기...</button>
					<input></input>
					<h2 class="file-attach-icon">
						첨부파일 <i class="fas fa-folder-open"></i>
					</h2>
				</div>
				<!--4. 공지사항 글등록 버튼 -->
				<div class="notice-write-type2-btn">
					<input type="submit" value="등록" name="writebtn" id="writebtn"> 
					<input type="button" value="초기화" onclick="history.go(-1)">
				</div>
				<!--END 4. 공지사항 글등록 버튼 -->
			</form>
		</div>
		<!--END 3. 공지사항 글 등록 폼 -->

		
	</div>
	<!--END 1. 공지사항 글 등록 전체영역 -->

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>