<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="header_group">
	<header class="header_all">
<!-- sidebar button -->
		<input type="checkbox" id="side_button">
		<label for="side_button">
		<span></span>
		<span></span>
		<span></span>
		</label>
<!-- sidebar -->
 		<div class="left_side_bar">
 			<div class="side_logo">
 				<img src="/resources/img/Logo.png" alt="side_logo">
 			</div>
 				<div class="side_nav">
					<ul>
						<li><a href="/category/list.do?type=IT·프로그래밍&middleCategory=&subCategory=&cPage=1">IT·프로그래밍</a></li>
						<li><a href="/category/list.do?type=디자인&middleCategory=&subCategory=&cPage=1">디자인</a></li>
						<li><a href="/category/list.do?type=영상·사진&middleCategory=&subCategory=&cPage=1">영상·사진</a></li>
						<li><a href="/category/list.do?type=마케팅&middleCategory=&subCategory=&cPage=1">마케팅</a></li>
						<li><a href="/category/list.do?type=교육&middleCategory=&subCategory=&cPage=1">교육</a></li>
					</ul>
 				</div>
			</div>
			
		<!-- 로고 -->
		<a href="/"> <img class="Logo" src="/resources/img/Logo.png"
			alt="logo">
		</a>
		<!-- Search(돋보기) -->

		<form class="search-box" action="/category/list.do" method="get" class="formSetting">
			<input class="search-txt" type="text" name="searchTxt" value="">
			<button class="search-btn" type="submit">
				<i class="fa-solid fa-magnifying-glass" style="color: #ff8e47;"></i>
			</button>
		</form>
		<!-- 네비게이션 -->
		<div class="nav">

		<c:choose>
			<c:when test="${sessionScope.userName != null}">
			
				<li><a href="/views/member/myPage.jsp"><span style="color: blue; font-weight: bold;">${sessionScope.userName}</span> 님</a></li>		
				
				<li><a href="/views/member/myPage.jsp">마이페이지</a></li>		

				<li class="log"><a href="/member/logout.do">로그아웃</a></li>

			</c:when>
			<c:otherwise>
				
				<li><a href="/form/registerForm.do">회원가입</a></li>

				<li class="log"><a href="/form/loginForm.do">로그인</a></li>

			</c:otherwise>
		</c:choose>

		</div>
	</header>
</div>
