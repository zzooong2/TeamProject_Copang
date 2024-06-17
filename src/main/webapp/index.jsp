<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/common/index.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<div class="img_animaion">
		<video class="bg_video_content" autoplay muted loop>
			<source src="/resources/img/business.mp4" type="video/mp4">
		</video>
		<div class="video_text">
			</p>
			지속 가능한 성장을 위한 최고의 선택
			</p>
		</div>
	</div>
		<main class="main">
			</main>


	<div class="icons">


		<div class="icons_area">

			<div class="icon_title">
				<p>다양한 카테고리가 있어요</p>
			</div>

			<div class="icon_container">

				<div class="icon_space" alt="IT">
					<a href="/category/list.do?type=IT·프로그래밍&middleCategory=&subCategory=&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/it.png" alt="IT">
						</div>
						<p>IT·프로그래밍</p>
					</a>
				</div>
				<div class="icon_space" alt="디자인">

					<a href="/category/list.do?type=디자인&middleCategory=&subCategory=&cPage=1">

						<div class="icon_img">
							<img src="/resources/img/design.png" alt="design">
						</div>
						<p>디자인</p>
					</a>
				</div>
				<div class="icon_space" alt="영상·사진">
					<a href="/category/list.do?type=영상·사진&middleCategory=&subCategory=&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/media.png" alt="media">
						</div>
						<p>영상·사진</p>
					</a>
				</div>
				<div class="icon_space" alt="마케팅">

					<a href="/category/list.do?type=마케팅&middleCategory=&subCategory=&cPage=1">

						<div class="icon_img">
							<img src="/resources/img/market.png" alt="marketing">
						</div>
						<p>마케팅</p>
					</a>
				</div>
				<div class="icon_space" alt="교육">

					<a href="/category/list.do?type=교육&middleCategory=&subCategory=&cPage=1">

						<div class="icon_img">
							<img src="/resources/img/edu.png" alt="education">
						</div>
						<p>교육</p>
					</a>
				</div>


			</div>

		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>

