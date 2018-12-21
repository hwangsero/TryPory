<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<section class="mag-posts-area d-flex flex-wrap">

   <div class="mag-posts-content mt-30 mb-30 p-30 box-shadow">
       <!-- Trending Now Posts Area -->
       <div class="trending-now-posts mb-30 posts">
           <!-- Section Title -->
           <div class="section-heading">
               <h5>인기 다이어리</h5>
           </div>

           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-post single-post diary-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                   		<a href="${pageContext.request.contextPath}/jsp/diary/detail_diary_page.jsp" class="post-title">오사카 여행</a>
                   		<p class="post-date">2018.10.05 ~ 2018.10.10</p>
                       <a href="#" class="post-cata">#일본</a>
                       <a href="#" class="post-cata">#오사카</a>
                   </div>
               </div>

               <div class="single-trending-post single-post diary-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                   		<p class="post-title">오사카 여행</p>
                   		<p class="post-date">2018.10.05 ~ 2018.10.10</p>
                       <a href="#" class="post-cata">#일본</a>
                       <a href="#" class="post-cata">#오사카</a>
                   </div>
               </div>

               <div class="single-trending-post single-post diary-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg" alt="">
                   <div class="post-content">
                   		<p class="post-title">오사카 여행</p>
                   		<p class="post-date">2018.10.05 ~ 2018.10.10</p>
                       <a href="#" class="post-cata">#일본</a>
                       <a href="#" class="post-cata">#오사카</a>
                   </div>
               </div>
               
               <div class="single-trending-post single-post diary-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content">
                   		<p class="post-title">오사카 여행</p>
                   		<p class="post-date">2018.10.05 ~ 2018.10.10</p>
                       <a href="#" class="post-cata">#일본</a>
                       <a href="#" class="post-cata">#오사카</a>
                   </div>
               </div>
           </div>
       </div>
       <div class="trending-now-posts mb-30 posts">
           <!-- Section Title -->
           <div class="section-heading">
               <h5>인기 태그</h5>
           </div>

           <div class="trending-posts bestTag">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-tag single-post" >
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">#일본</a>
                   </div>
               </div>

               <div class="single-trending-tag single-post" >
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">#유럽</a>
                   </div>
               </div>

               <div class="single-trending-tag single-post" >
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">#대만</a>
                   </div>
               </div>
               
               <div class="single-trending-tag single-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">#알프스</a>
                   </div>
               </div>
           </div>
       </div>
       
       <div class="trending-now-posts mb-30 posts">
           <!-- Section Title -->
           <div class="section-heading">
               <h5>인기 다이어리</h5>
           </div>

           <div class="trending-posts">
<!--            <div class="trending-post-slides owl-carousel"> -->
               <div class="single-trending-post single-post" >
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">일본</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post single-post" >
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">유럽</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>

               <div class="single-trending-post single-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">대만</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
               
               <div class="single-trending-post single-post">
                   <img class="picture" src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg" alt="">
                   <div class="post-content">
                       <a href="#" class="post-cata">알프스</a>
                       <a href="video-post.html" class="post-title">여행 다이어리</a>
                   </div>
               </div>
           </div>
           <div style="width:25%; float:left;" > 
           <img src="${pageContext.request.contextPath}/assets/img/heart.png" alt="" style="width:20px; height:20px">
            <img src="${pageContext.request.contextPath}/assets/img/speechbubble.png" alt="" style="width:20px; height:20px">
           </div>
           <div style="width:25%; float:left;"> 
           <img src="${pageContext.request.contextPath}/assets/img/heart.png" alt="" style="width:20px; height:20px">
            <img src="${pageContext.request.contextPath}/assets/img/speechbubble.png" alt="" style="width:20px; height:20px">
           </div>
           <div style="width:25%; float:left;"> 
           <img src="${pageContext.request.contextPath}/assets/img/heart.png" alt="" style="width:20px; height:20px">
            <img src="${pageContext.request.contextPath}/assets/img/speechbubble.png" alt="" style="width:20px; height:20px">
           </div>
           <div style="width:25%; float:left; "> 
           <img src="${pageContext.request.contextPath}/assets/img/heart.png" alt="" style="width:20px; height:20px">
            <img src="${pageContext.request.contextPath}/assets/img/speechbubble.png" alt="" style="width:20px; height:20px">
           </div>
       </div>
    </div>

</section>