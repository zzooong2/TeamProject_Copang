<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/category/category.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<main class="main">

		<div class="bar">
			<p>
				<a href="/">홈</a> > 영상ㆍ사진
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">
			<ul>
				영상
				<li><a href="">광고ㆍ홍보영상</a></li>
				<li><a href="">업종별 영상</a></li>
				<li><a href="">제품영상</a></li>
				<li><a href="">교육영상</a></li>
				<li><a href="">애니메이션</a></li>
			</ul>
			<ul>
				사진
				<li><a href="">제품ㆍ홍보사진</a></li>
				<li><a href="">개인ㆍ프로필사진</a></li>
				<li><a href="">사진보정</a></li>
				<li><a href="">이벤트 사진</a></li>
			</ul>
		</div>

		<!-- 카테고리 게시글 모음 -->

		<div class="detail_area">

			<!-- grid 전체 -->
			<div class="thumb_container">
				<c:forEach var="item" items="${list}">
				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/${item.fileName}" alt="">
						<p>${item.boardTitle}</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
			<c:choose> 
			<c:when test="${item.priceOption == single}">			
						</p>
						${item.price}
						</p>
			</c:when>			
			<c:otherwise>
						<p>
						${item.price} ~
						</p>
			</c:otherwise>						
			</c:choose>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>
						${item.company}
						</p>
					</div>
				</div>

			</c:forEach>

<!-- 
				grid 개별 영역
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb2.jpg" alt="">
						<p>로고제작 전문기업</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					가격
					<div class="price">
						</p>
						150,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						지구컴즈
						</p>
					</div>
				</div>

				grid 개별 영역
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb3.jpg" alt="">
						<p>로고제작 랭킹 1위 어워즈 수상</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.7)</p>
					</div>

					가격
					<div class="price">
						</p>
						70,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						앨리스 디자인
						</p>
					</div>
				</div>

				grid 개별 영역
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					가격
					<div class="price">
						</p>
						55,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						에브리 PPT
						</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					가격
					<div class="price">
						</p>
						55,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						에브리 PPT
						</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					가격
					<div class="price">
						</p>
						55,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						에브리 PPT
						</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					별점
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					가격
					<div class="price">
						</p>
						55,000 ~
						</p>
					</div>

					회사명
					<div class="company_name">
						</p>
						에브리 PPT
						</p>
					</div>
				</div>
 -->


			</div>
	</main>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>