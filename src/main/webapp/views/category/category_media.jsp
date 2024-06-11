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
				<a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&cPage=1">영상</a>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&subCategory=광고ㆍ홍보영상&cPage=1">광고ㆍ홍보영상</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&subCategory=업종별 영상&cPage=1">업종별 영상</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&subCategory=제품영상&cPage=1">제품영상</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&subCategory=교육영상&cPage=1">교육영상</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=영상&subCategory=애니메이션&cPage=1">애니메이션</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=영상ㆍ사진&middleCategory=사진&cPage=1">사진</a>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=사진&subCategory=제품ㆍ홍보사진&cPage=1">제품ㆍ홍보사진</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=사진&subCategory=개인ㆍ프로필사진&cPage=1">개인ㆍ프로필사진</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=사진&subCategory=사진보정&cPage=1">사진보정</a></li>
				<li><a href="/category/list.do?type=영상ㆍ사진&middleCategory=사진&subCategory=이벤트 사진&cPage=1">이벤트 사진</a></li>
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
								<c:when test="${item.priceOption == 'single'}">
									<p>${item.price}</p>
								</c:when>
								<c:otherwise>
									<p>${item.price} ~</p>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 회사명 -->
						<div class="company_name">
							<p>${item.company}</p>
						</div>
					</div>

				</c:forEach>


				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb2.jpg" alt="">
						<p>로고제작 전문기업</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>


					<div class="price">
						<p>150,000 ~</p>
					</div>


					<div class="company_name">
						<p>지구컴즈</p>
					</div>
				</div>


				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb3.jpg" alt="">
						<p>로고제작 랭킹 1위 어워즈 수상</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.7)</p>
					</div>


					<div class="price">
						<p>70,000 ~</p>
					</div>


					<div class="company_name">
						<p>앨리스 디자인</p>
					</div>
				</div>


				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>


					<div class="price">
						<p>55,000 ~</p>
					</div>


					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>


					<div class="price">
						<p>55,000 ~</p>
					</div>


					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>


					<div class="price">
						<p>55,000 ~</p>
					</div>


					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>


					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>


					<div class="price">
						<p>55,000 ~</p>
					</div>


					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

			</div>
		</div>



		<div aria-label="Page navigation example"
			style="background-color: white;">

			<ul class="pagination"
				style="justify-content: center; list-style: none; display: flex; margin: 0 auto; padding: 0; text-align: center; position: absolute; right: 41%; bottom: -40%;">
				<!-- 왼쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == 1}">
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link" href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link"
							href="/category/list.do?type=영상ㆍ사진&cPage=${pi.cPage-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>


				<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item" style="margin-right: 20px"><a
						class="page-link"
						href="/category/list.do?type=영상ㆍ사진&cPage=${page}">${page}</a></li>
				</c:forEach>

				<!-- 오른쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == pi.maxPage}">
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link"
							href="/category/list.do?type=영상ㆍ사진&cPage=${pi.cPage+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</main>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>