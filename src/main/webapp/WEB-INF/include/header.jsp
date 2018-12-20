<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-area">
	<!-- Navbar Area -->
	<div class="mag-main-menu" id="sticker">
	    <div class="classy-nav-container breakpoint-off">
	        <!-- Menu -->
	        <nav class="classy-navbar justify-content-between" id="magNav">
	
	            <!-- Nav brand -->
	            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-brand">
	            	<!-- <img src="img/core-img/logo.png" alt=""> -->
	            	메인로고
	            </a>
	
	            <!-- Navbar Toggler -->
	            <div class="classy-navbar-toggler">
	                <span class="navbarToggler"><span></span><span></span><span></span></span>
	            </div>
	
	            <!-- Nav Content -->
	            <div class="nav-content d-flex align-items-center">
	                <div class="classy-menu">
	
	                    <!-- Close Button -->
	                    <div class="classycloseIcon">
	                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
	                    </div>
	
	                    <!-- Nav Start -->
	                    <div class="classynav">
	                        <ul>
	                            <li><a href="${pageContext.request.contextPath}/jsp/diary/my_map.jsp">나의 여행지도</a></li>
	                            <li><a href="contact.html">다이어리 목록</a></li>
	                        </ul>
	                    </div>
	                    <!-- Nav End -->
	                </div>
	
	                <div class="top-meta-data d-flex align-items-center">
	                    <!-- Top Search Area -->
	                    <div class="top-search-area">
	                        <form action="index.html" method="post">
	                            <input type="search" name="top-search" id="topSearch" placeholder="#오사카여행 #유럽여행 #바다">
	                            <button type="submit" class="btn"><i class="fa fa-search" aria-hidden="true"></i></button>
	                        </form>
	                    </div>
	                    <!-- Login -->
	                    <a href="${pageContext.request.contextPath}/jsp/mypage/mypage.jsp" class="login-btn">
	                    	<!-- <i class="fa fa-user" aria-hidden="true"></i> -->
	                    	마이페이지
	                    </a>
	                    <a href="${pageContext.request.contextPath}/jsp/diary/write_diary_page.jsp" class="submit-video"><span><i class="fa fa-cloud-upload"></i></span> <span class="video-text">다이어리 등록</span></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>