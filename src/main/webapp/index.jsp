<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/common/index.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<div class="img_animaion">

		<main class="main"></main>

	</div>

	<div class="icons">


		<div class="icons_area">

			<div class="icon_title">
				<p>다양한 카테고리가 있어요</p>
			</div>

			<div class="icon_container">

				<div class="icon_space" alt="IT">
					<a href="/category/list.do?type=ITㆍ프로그래밍&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/it.png" alt="IT">
						</div>
						<p>ITㆍ프로그래밍</p>
					</a>
				</div>
				<div class="icon_space" alt="디자인">
					<a href="/category/list.do?type=디자인&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/design.png" alt="design">
						</div>
						<p>디자인</p>
					</a>
				</div>
				<div class="icon_space" alt="영상ㆍ사진">
					<a href="/category/list.do?type=영상ㆍ사진&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/media.png" alt="media">
						</div>
						<p>영상ㆍ사진</p>
					</a>
				</div>
				<div class="icon_space" alt="마케팅">
					<a href="/category/list.do?type=마케팅&cPage=1">
						<div class="icon_img">
							<img src="/resources/img/market.png" alt="marketing">
						</div>
						<p>마케팅</p>
					</a>
				</div>
				<div class="icon_space" alt="교육">
					<a href="/category/list.do?type=교육&cPage=1">
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

