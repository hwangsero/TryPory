<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <style>
	.mag-posts-content {
	max-width: calc(100% - 1000px);
	}
</style> 
<section class="mag-posts-area d-flex flex-wrap">

   <div class="mag-posts-content mt-30 mb-30 p-30 box-shadow">
   <div align="center" style="font-size: 20px">
  <span style="border: 1px solid gray; border-radius:50px; font-size: 20px">${msg }</span>로 검색한 결과입니다<br>
  </div><br>
       <!-- Trending Now Posts Area -->
           <div class="section-heading">
               <h5>전체 다이어리
               <c:forEach items="${diary }" var="data">
             	<c:out value="${data.title }"></c:out>
               </c:forEach>
               
               </h5>
           </div>
           
       <div class="trending-now-posts mb-30">
       		<div style="margin-bottom : 10px; font-size:20px;">2017/01/02 ~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
           <!-- Section Title -->
		
           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-post" style="width: 50%; height:400px; float:left; ">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">일본</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post" style="width:25%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">유럽</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post" style="width: 25%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">대만</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
               
               <div class="single-trending-post" style="width: 25%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">알프스</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
               
               <div class="single-trending-post" style="width: 25%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content" style="text-align: center">
                       <a href="video-post.html" class="post-title" style="font-size: 50px; line-height: 3">+3</a>
                   </div>
               </div>
               
           </div>
           <div style= "padding-top:30px; clear: both;">
				
           </div>
       </div>
       
       
       <div class="trending-now-posts mb-30">
       		<div style="margin-bottom : 10px; font-size:20px">2017/01/02 ~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
           <!-- Section Title -->
		
           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-post" style="width: 50%; height:400px; float:left; ">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">일본</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post" style="width:50%; height:400px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">유럽</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

              	 <div style= "padding-top:30px; clear: both;">
				
           </div>
       </div>

       </div>
       
       <div class="trending-now-posts mb-30">
       		<div style="margin-bottom : 10px; font-size:20px">2017/01/02 ~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
           <!-- Section Title -->
		
           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-post" style="width: 100%; height:auto; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">일본</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               
           </div>
            <div style= "padding-top:30px; clear: both;">
           </div>
       </div>


		<div class="trending-now-posts mb-30">
			<div style="margin-bottom: 10px; font-size: 20px;">2017/01/02 ~
				2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
			<!-- Section Title -->

			<div class="trending-posts">
				<!--            <div class="trending-post-slides owl-carousel"> -->
				<div class="single-trending-post"
					style="width: 50%; height: 400px; float: left;">
					<img
						src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
						alt="">
					<div class="post-content">
						<a href="#" class="post-cata">일본</a> <a href="video-post.html"
							class="post-title">여행 다이어리</a>
					</div>
				</div>

				<div class="single-trending-post"
					style="width: 50%; height: 200px; float: left;">
					<img
						src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg"
						alt="">
					<div class="post-content">
						<a href="#" class="post-cata">유럽</a> <a href="video-post.html"
							class="post-title">여행 다이어리</a>
					</div>
				</div>

				<div class="single-trending-post"
					style="width: 50%; height: 200px; float: left;">
					<img
						src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg"
						alt="">
					<div class="post-content">
						<a href="#" class="post-cata">대만</a> <a href="video-post.html"
							class="post-title">여행 다이어리</a>
					</div>
				</div>



			</div>
			<div style="padding-top: 30px; clear: both;">

			</div>
		</div>


		<div class="trending-now-posts mb-30">
       		<div style="margin-bottom : 10px; font-size:20px;">2017/01/02 ~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
           <!-- Section Title -->
		
           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->

               <div class="single-trending-post" style="width:50%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">유럽</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post" style="width: 50%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">대만</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
               
               <div class="single-trending-post" style="width: 50%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">알프스</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
               
               <div class="single-trending-post" style="width: 50%; height:200px; float:left;">
                   <img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content" style="text-align: center">
                       <a href="video-post.html" class="post-title" style="font-size: 50px; line-height: 3">+3</a>
                   </div>
               </div>
               
           </div>
          <div style= "padding-top:30px; clear: both;">
           		
           </div>
       </div>

   </div>

</section>