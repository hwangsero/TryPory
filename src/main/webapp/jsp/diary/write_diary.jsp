<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="write_page_header" class="C">
	<div class="lnb">
		<div class="button_box">
			<!-- <button type="button" class="cancel ">나가기</button> -->
			 <a href="${pageContext.request.contextPath}/jsp/diary/detail_diary_page.jsp">
				<button type="button" class="save">
	                저장하기
		         </button>
             </a>
		</div>
	</div>
	<div id="header_content">
		<div class="content_top_in">
			<div class="content_left">
				<ul class="control_box C clr">
					<li><i class="fas fa-image fa-3x"></i><br>
						<label for="cover_image">커버 사진</label>
						<input type="file" class="none" id="cover_image">
						</li>
						
					<li><i class="fas fa-unlock-alt fa-3x"></i>
						<p>공개 / 비공개</p></li>
				</ul>
			</div>
			<div class="content_right">
				<!-- <input type="text" placeholder="여행일지 제목" id="input_diary_title"> -->
				<div class="textarea_box">
					<textarea placeholder="여행일지 제목" id="input_diary_title"></textarea>
				</div>
				<div class="date_box">
					<i class="far fa-calendar-check fa-2x"></i> <span>2018.12.15
						~ 2018.12.18</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="write_wrap">
	<div class="container C">
		<div class="div_pdt"></div>
		
		<div class="content_datebox">
			<h4>1일차</h4>
			<span></span>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="tool_wrap">
					<i class="fas fa-plus-circle fa-2x"></i>
				</div>
				<div class="tool_box" style="display:block">
					<ul>
						<li><i class="fas fa-image fa-3x"></i></li>
						<li><i class="fas fa-map-marker-alt fa-3x"></i></li>
					</ul>
					<input type="file" multiple="multiple" style="display:none;">
				</div>
				<div class="img_wrap">
				</div>
				<textarea class="autosize" placeholder="문단 내에서 줄바꿈을 하려면 shift + enter를 누르세요"></textarea>	
			</div>
		</div>
		
<!-- 		<div class="content_datebox">
			<div><h4>1일차</h4></div>
			<div>2018.12.19</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="tool_wrap" style="display:none">
					<i class="fas fa-plus-circle fa-2x"></i>
				</div>
				<div class="tool_box">
					<ul>
						<li><i class="fas fa-image fa-3x"></i></li>
						<li><i class="fas fa-map-marker-alt fa-3x"></i></li>
						<li><i class="fas fa-route fa-3x"></i></li>
					</ul>
				</div>
				<div class="img_wrap">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/bg-img/19.jpg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/bg-img/19.jpg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/bg-img/19.jpg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/bg-img/19.jpg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/bg-img/19.jpg" alt="">
					</div>
				</div>
				<textarea class="autosize" placeholder="문단 내에서 줄바꿈을 하려면 shift + enter를 누르세요"></textarea>	
			</div>
		</div> -->

		<!-- 
		<div class="content_datebox">
			<div><h4>2일차</h4></div>
			<div>2018.12.20</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="tool_wrap">
					<i class="fas fa-plus-circle fa-2x"></i>
				</div>
				<div class="tool_box">
					<ul>
						<li>
							<i class="fas fa-image fa-3x"></i>
						</li>
						<li><i class="fas fa-map-marker-alt fa-3x"></i></li>
						<li><i class="fas fa-route fa-3x"></i></li>
					</ul>
					<input type="file" multiple="multiple" style="display:none;">
				</div>
				<div class="img_wrap">
				</div>
				<textarea class="autosize" placeholder="문단 내에서 줄바꿈을 하려면 shift + enter를 누르세요"></textarea>	
			</div>
		</div>
 		-->
	</div>
	
	<div class="tag_container container clr">
		<div class="tag_wrap">
			<h4>#태그(최대5개)</h4>
			<div class="tag_input_wrap">
				<ul class="tag_list clr">
				<li>
					<div class="tag_info">
						<div class="link_tag">
							#태그<button class="tag_remove">
							<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</li>
				<li>
					<div class="tag_input">
						<input type="text" placeholder="원하는 태그를 입력한후 스페이스를 입력하세요">
					</div>
				</li>
				</ul>
			</div>
		</div>
	</div>
</div>