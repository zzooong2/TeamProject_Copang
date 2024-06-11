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
				<a href="/">홈</a> > 교육
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">
			<ul>
				<a href="/category/list.do?type=교육&middleCategory=외국어&cPage=1">외국어</a>
				<li><a href="/category/list.do?type=교육&middleCategory=외국어&subCategory=영어 레슨&cPage=1">영어 레슨</a></li>
				<li><a href="/category/list.do?type=교육&middleCategory=외국어&subCategory=기타 외국어 레슨&cPage=1">기타 외국어 레슨</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=교육&middleCategory=미술ㆍ글쓰기&cPage=1">미술ㆍ글쓰기</a>
				<li><a href="/category/list.do?type=교육&middleCategory=미술ㆍ글쓰기&subCategory=미술ㆍ드로잉 레슨&cPage=1">미술ㆍ드로잉 레슨</a></li>
				<li><a href="/category/list.do?type=교육&middleCategory=미술ㆍ글쓰기&subCategory=글쓰기 레슨&cPage=1">글쓰기 레슨</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=교육&middleCategory=댄스ㆍ뮤직&cPage=1">댄스ㆍ뮤직</a>
				<li><a href="/category/list.do?type=교육&middleCategory=댄스ㆍ뮤직&subCategory=댄스 레슨&cPage=1">댄스 레슨</a></li>
				<li><a href="/category/list.do?type=교육&middleCategory=댄스ㆍ뮤직&subCategory=보컬ㆍ랩 레슨&cPage=1">보컬ㆍ랩 레슨</a></li>
				<li><a href="/category/list.do?type=교육&middleCategory=댄스ㆍ뮤직&subCategory=악기 레슨&cPage=1">악기 레슨</a></li>
				<li><a href="/category/list.do?type=교육&middleCategory=댄스ㆍ뮤직&subCategory=미디ㆍ작곡ㆍ편곡 레슨&cPage=1">미디ㆍ작곡ㆍ편곡 레슨</a></li>
			</ul>
		</div>

		<!-- 카테고리 게시글 모음 -->

		<div class="detail_area">

			<!-- grid 전체 -->
			<div class="thumb_container">

				<c:forEach var="item" items="${list}">

					<!-- grid 개별 영역 -->
					<div class="detail_thumb" onclick="location.href=''">
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

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb2.jpg" alt="">
						<p>로고제작 전문기업</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>150,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>지구컴즈</p>
					</div>
				</div>

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb3.jpg" alt="">
						<p>로고제작 랭킹 1위 어워즈 수상</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.7)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>70,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>앨리스 디자인</p>
					</div>
				</div>

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href=''">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

			</div>
		</div>

		<div aria-label="Page navigation example"
			style="background-color: white;">

			<ul class="pagination"
				style="justify-content: center; list-style: none; display: flex; margin: 0 auto; padding: 0; text-align: center; position: absolute; right: 41%; bottom: -65%;">
				<!-- 왼쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == 1}">
						<li class="page-item" style="margin-right: 0px"><a
							class="page-link" href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 0px"><a
							class="page-link"
							href="/category/list.do?type=교육&cPage=${pi.cPage-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 
               페이지 버튼 
               for(int i=0; i<10; i++) {  } 
            -->
				<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item" style="margin-right: 0px"><a
						class="page-link" href="/category/list.do?type=교육&cPage=${page}">${page}</a></li>
				</c:forEach>

				<!-- 오른쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == pi.maxPage}">
						<li class="page-item" style="margin-right: 0px"><a
							class="page-link" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 0px"><a
							class="page-link"
							href="/category/list.do?type=교육&cPage=${pi.cPage+1}"
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