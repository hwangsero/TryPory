<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <script>
 	$(document).ready(function(){
 		$("form[name=search]").submit(function(event){
 			event.preventDefault();
 			var tag = $("#topSearch").val();
 			location.href='${pageContext.request.contextPath}/diary/search/' + tag;
 		});
 		
 		$(".nav-content a#logout").click(function(event){
 			$j.ajax({
				url : '<%=request.getContextPath()%>/logout',
				type :'post',
				success : function ( msg ){
					alert(msg);
					location.href="<%= request.getContextPath() %>";
				}
			});
 		});
 	})
</script> 
<header class="header-area">
	<!-- Navbar Area -->
	<div class="mag-main-menu" id="sticker">
	    <div class="classy-nav-container breakpoint-off">
	        <!-- Menu -->
	        <nav class="classy-navbar justify-content-between" id="magNav">
	
	            <!-- Nav brand -->
	            <a href="${pageContext.request.contextPath}" id="site_logo_title" class="nav-brand">Tripory</a>
	
	            <!-- Navbar Toggler -->
	            <div class="classy-navbar-toggler">
	                <span class="navbarToggler"><span></span><span></span><span></span></span>
	            </div>
	
	            <!-- Nav Content -->
	            <div class="nav-content d-flex align-items-center">
	                <div class="classy-menu">
	
	                    <!-- Logo -->
	                    <div class="classyLogo">
	                        <a href="${pageContext.request.contextPath}/index.jsp" id="site_logo_title" class="nav-brand">Tripory</a>
	                    </div>
	                    <!-- Close Button -->
	                    <div class="classycloseIcon">
	                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
	                    </div>
	
	                    <!-- Nav Start -->
	                    <div class="classynav">
	                        <ul>
	                            <li><a href="${pageContext.request.contextPath}/diary/myMap">나의 여행지도</a></li>
	                            <li><a href="${pageContext.request.contextPath}/diary">다이어리 목록</a></li>
	                            <li><a href="${pageContext.request.contextPath}/notice/1">공지사항</a></li>
	                        </ul>
	                    </div>
	                    <!-- Nav End -->
	                </div>
	
	                <div class="top-meta-data d-flex align-items-center">
	                    <!-- Top Search Area -->
	                    <div class="top-search-area">
	                         <form action="${pageContext.request.contextPath }/jsp/diary/search/" name="search"> 
	                            <input type="search" name="top-search" id="topSearch" placeholder="#바다 #여행">
	                            <button onclick="search()" class="btn">
	                            <i class="fa fa-search" aria-hidden="true"></i>
	                            </button>
	                         </form> 
	                    </div>
	                    <c:if test="${userVO.email eq 'admin' }">
	                     <a class="login-btn" id="logout">
	                    	로그아웃
	                    </a>
	                     <a href="${pageContext.request.contextPath}/jsp/main/adminPage.jsp" class="login-btn">
	                    	관리자페이지
	                    </a>
	                    </c:if>
	                    <c:if test="${empty userVO }">
	                     <a href="${pageContext.request.contextPath}/login" class="login-btn">
	                    	로그인
	                    </a>
	                     <a href="${pageContext.request.contextPath}/join" class="login-btn">
	                    	회원가입
	                    </a>
	                    </c:if>
						<c:if test="${not empty userVO and userVO.email ne 'admin'}">
	                     <a class="login-btn" id="logout">
	                    	로그아웃
	                    </a>
	                    <a href="${pageContext.request.contextPath}/mypage" class="login-btn">
	                    	마이페이지
	                    </a>
	                    </c:if>
	                    
	                    <a href="${pageContext.request.contextPath }/diary/writeForm" class="submit-video"><span>
	                    	<i class="far fa-edit"></i>
	                    </span> <span class="video-text">다이어리 등록</span></a>
                    </div>
                    
                </div>
            </nav>
        </div>
    </div>
</header>