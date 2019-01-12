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




<script>
 $(document).ready(function() {
   $('#updateBtn').click(function() {
      //스마트에디터에서 값을 가져오는 코드
      oEditors.getById["notice-write-content1"].exec("UPDATE_CONTENTS_FIELD", []);
      
      //확인 코드 
      //document.getElementById("notice-write-content1").value
      
       if(document.updateForm.title.value == "") {
         alert('제목을 입력하세요');
         $('input[name=title]').focus();
         return false;
      } 
      
       if(document.getElementById("notice-write-content1").value == "") {
         alert('내용을 입력하세요');
         console.log(document.updateForm.content.value);
         $('textarea[name=content]').focus();
         return false;
      }  
      
      var data = {
            no : ${notice.no},
            title : document.updateForm.title.value,
            content: document.getElementById("notice-write-content1").value
      };
      
      $.ajax({
         url : "${pageContext.request.contextPath}/notice/update",
         type : "put",
         dataType : "json",
         data : JSON.stringify(data),
         contentType: 'application/json',
         
         success : function(data) {
            alert(data);
            location.href="${pageContext.request.contextPath}/notice/detail/${notice.no}/0"
         }, error : function(error) {
            alert('error');
         }         
      }) 
   })   
}) 

</script>
</head>

<body>
   <%@ include file="/WEB-INF/include/header.jsp"%>

   <!--1. 공지사항 글 등록 전체영역 -->
   <div class="notice-write-container">

      <!--2. 공지사항 글 등록 페이지 머리말-->
      <div class="notice-write-type1">
         <h1>공지사항 수정</h1>
      </div>
      <!--END 2. 공지사항 글 등록 페이지 머리말-->

      <!--3. 공지사항 글 등록 폼 -->
      <div class="notice-write-type2">
         <form name="updateForm" class="write_form">

            <input type="hidden" value="${notice.no }" name="no"> 

            <!--제목-->
            <input id="notice-write-title" name="title" value="${notice.title }"></input>

            <!--데스크탑 글쓰기폼(네이버 폰트에디터가 포함됨)-->
            <div class="notice-write-content-box1">
               <textarea id="notice-write-content1" name="content" style='width:100%; min-width:260px; height:300px; display:none;'>${notice.content}</textarea>
               <script type="text/javascript" class="naver-writeForm-editor">
                      var oEditors=[];
                     nhn.husky.EZCreator.createInIFrame({
                     oAppRef:oEditors,
                     elPlaceHolder:"notice-write-content1",
                     sSkinURI:"${pageContext.request.contextPath}/naver_editor/SmartEditor2Skin.html",
                     fCreator : "createSEditor2",
                     htParams : {
                    	
                    	 bUseModeChanger : false
                     }
                  });
            	</script>
            </div>

            <!--모바일 글쓰기폼(네이버 폰트에디터가 포함되지 않은 글쓰기 폼)-->
<%--             <div class="notice-write-content-box2">
               <textarea id="notice-write-content2" name="content">${notice.content}</textarea>
               <script type="text/javascript" class="naver-writeForm-editor">
                      var oEditors=[];
                     nhn.husky.EZCreator.createInIFrame({
                     oAppRef:oEditors,
                     elPlaceHolder:"notice-write-content2",
                     sSkinURI:"${pageContext.request.contextPath}/naver_editor/SmartEditor2Skin.html",
                     fCreator : "createSEditor2",
                     htParams : {
                    	 bUseToolbar : false,
                    	 bUseVerticalResizer : false,
                    	 bUseModeChanger : false
                     }
                  });
            </script>
            </div> --%>



            <!--첨부파일-->
            <div class="notice-write-attachFile">
               <button>찾아보기...</button>
               <input></input>
               <h2 class="file-attach-icon">
                  첨부파일 <i class="fas fa-folder-open"></i>
               </h2>
            </div>
            <!--4. 공지사항 글수정 버튼 -->
            <div class="notice-write-type2-btn">
               <input type="button" value="수정" id="updateBtn" name="updateBtn"> 
               <input type="button" value="취소" onclick="history.go(-1)">
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