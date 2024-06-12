<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="/resources/img/tapIcon.png">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProEnroll1.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProEnroll2.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProEnroll3.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProEnroll4.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProEnroll5.css">
    <script src="https://kit.fontawesome.com/1992e1ad9e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/resources/js/boardProEnroll/smartEditor.js"></script>
    
    <%@ include file="/views/common/head.jsp"%>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>

    <main class="main">
        <form class="BoardProEnroll_formStyle" action="/BoardPro/enroll.do" id="enrollForm" method="POST" enctype="multipart/form-data">
        	<div class="BoardProEnroll_alignStyle">
	            <div class="Detail_down">
	    
	                <!-- =============================================================== Left Contents =============================================================== -->
	    
	                <div class="Detail_left_Contents">
	                    <div class="Detail_left_guide">
	                        <div class="Detail_left_number Detail_left_guide1" id="Detail_left_guide1">1</div><span class="Detail_left_text Detail_left_text1" id="Detail_left_text1">기본정보</span>
	                    </div>
	                    <div class="Detail_left_guide">
	                        <div class="Detail_left_number Detail_left_guide2" id="Detail_left_guide2">2</div><span class="Detail_left_text Detail_left_text2" id="Detail_left_text2">가격설정</span>
	                    </div>
	                    <div class="Detail_left_guide">
	                        <div class="Detail_left_number Detail_left_guide3" id="Detail_left_guide3">3</div><span class="Detail_left_text Detail_left_text3" id="Detail_left_text3">서비스 설명</span>
	                    </div>
	                    <div class="Detail_left_guide">
	                        <div class="Detail_left_number Detail_left_guide4" id="Detail_left_guide4">4</div><span class="Detail_left_text Detail_left_text4" id="Detail_left_text4">이미지</span>
	                    </div>
	                </div>
	                
	
	
					<div class="Detail_right_Contents" id="Detail_right_Contents1" style="display: block;">
	                <!-- =============================================================== Right Contents 1 =============================================================== -->
						<div class="Detail_right_Contents1_Title">
							<div class="Detail_right_Contents1_box1">
								<span class="Detail_right_type_box">&nbsp;&nbsp;제목<span class="Detail_right_check">*</span></span> 
								<input class="Detail_right_Contents1_Title_Input" type="text" placeholder="제목을 입력해주세요." name="enroll_Title" oninput="Counter(this, 90)">
							</div>
						</div>
						<div class="Detail_right_Contents1_Category">
							<div class="Detail_right_Contents1_box">
								<span class="Detail_right_type_box_Category">&nbsp;&nbsp;카테고리<span class="Detail_right_check">*</span></span>
								<div class="Detail_right_Catecory_List">
									<div class="Detail_right_Contents1_box2">
										<span class="Detail_right_type_box">&nbsp;&nbsp;대분류<span class="Detail_right_check">*</span></span> 
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_Contents1_Category_Style" name="enroll_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">카테고리를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="IT·프로그래밍">IT·프로그래밍</option>
											<option class="Detail_right_Contents1_Category_Style" value="디자인">디자인</option>
											<option class="Detail_right_Contents1_Category_Style" value="영상·사진">영상·사진</option>
											<option class="Detail_right_Contents1_Category_Style" value="마케팅">마케팅</option>
											<option class="Detail_right_Contents1_Category_Style" value="교육">교육</option>
										</select>
									</div>
									
									
									
									<!-- ---------- 중분류 ---------- -->
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
										</select>
									</div>
									
									
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select1" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
											<option class="Detail_right_Contents1_Category_Style" value="UX기획">UX기획</option>
											<option class="Detail_right_Contents1_Category_Style" value="웹">웹</option>
											<option class="Detail_right_Contents1_Category_Style" value="프로그램">프로그램</option>
											<option class="Detail_right_Contents1_Category_Style" value="커머스">커머스</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select2" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
											<option class=Detail_right_Contents1_Category_Style value="로고·브랜딩">로고·브랜딩</option>
											<option class=Detail_right_Contents1_Category_Style value="인쇄 홍보물">인쇄 홍보물</option>
											<option class="Detail_right_Contents1_Category_Style" value="마케팅 디자인">마케팅 디자인</option>
											<option class="Detail_right_Contents1_Category_Style" value="웹·모바일 디자인">웹·모바일 디자인</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory3" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select3" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
											<option class="Detail_right_Contents1_Category_Style" value="영상">영상</option>
											<option class="Detail_right_Contents1_Category_Style" value="사진">사진</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory4" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select4" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
											<option class="Detail_right_Contents1_Category_Style" value="채널 활성화">채널 활성화</option>
											<option class="Detail_right_Contents1_Category_Style" value="바이럴·체험단">바이럴·체험단</option>
											<option class="Detail_right_Contents1_Category_Style" value="PR·행사">PR·행사</option>
											<option class="Detail_right_Contents1_Category_Style" value="업종·목적별">업종·목적별</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_middleCategory5" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;중분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_middleCategory_select5" name="enroll_Middle_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">중분류를 선택해주세요.</option>
											<option class="Detail_right_Contents1_Category_Style" value="외국어">외국어</option>
											<option class="Detail_right_Contents1_Category_Style" value="미술·글쓰기">미술·글쓰기</option>
											<option class="Detail_right_Contents1_Category_Style" value="댄스·뮤직">댄스·뮤직</option>
										</select>
									</div>
									
									
									
									<!-- ---------- 소분류 ---------- -->
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
										</select>
									</div>
									
									
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory1-1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select1-1" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="스토리보드">스토리보드</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 기획">기타 기획</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory1-2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select1-2" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="홈페이지">홈페이지</option>
											<option class="Detail_right_Contents1_Category_Style" value="퍼블리싱">퍼블리싱</option>
											<option class="Detail_right_Contents1_Category_Style" value="유지보수">유지보수</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory1-3" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select1-3" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class=Detail_right_Contents1_Category_Style value="PC·웹프로그램">PC·웹프로그램</option>
											<option class="Detail_right_Contents1_Category_Style" value="서버·클라우드">서버·클라우드</option>
											<option class="Detail_right_Contents1_Category_Style" value="봇·챗봇">봇·챗봇</option>
										</select>
									</div><div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory1-4" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select1-4" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="쇼핑몰">쇼핑몰</option>
											<option class="Detail_right_Contents1_Category_Style" value="쇼핑몰(웹빌더·CMS)">쇼핑몰(웹빌더·CMS)</option>
											<option class="Detail_right_Contents1_Category_Style" value="쇼핑몰(카페24)">쇼핑몰(카페24)</option>
											<option class="Detail_right_Contents1_Category_Style" value="쇼핑몰 수정·유지보수">쇼핑몰 수정·유지보수</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory2-1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select2-1" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="로고 디자인">로고 디자인</option>
											<option class="Detail_right_Contents1_Category_Style" value="브랜드 디자인 가이드">브랜드 디자인 가이드</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory2-2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select2-2" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="명함">명함</option>
											<option class="Detail_right_Contents1_Category_Style" value="전단지·포스터·인쇄물">전단지·포스터·인쇄물</option>
											<option class=Detail_right_Contents1_Category_Style value="현수막·X배너">현수막·X배너</option>
											<option class="Detail_right_Contents1_Category_Style" value="메뉴판">메뉴판</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory2-3" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select2-3" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="상세페이지">상세페이지</option>
											<option class="Detail_right_Contents1_Category_Style" value="SNS·썸네일 디자인">SNS·썸네일 디자인</option>
											<option class="Detail_right_Contents1_Category_Style" value="채널아트 디자인">채널아트 디자인</option>
											<option class="Detail_right_Contents1_Category_Style" value="방송용 아바타">방송용 아바타</option>
											<option class="Detail_right_Contents1_Category_Style" value="배너·배달어플">배너·배달어플</option>
											<option class="Detail_right_Contents1_Category_Style" value="블로그·카페 디자인">블로그·카페 디자인</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory2-4" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select2-4" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="명함">명함</option>
											<option class="Detail_right_Contents1_Category_Style" value="전단지·포스터·인쇄물">전단지·포스터·인쇄물</option>
											<option class="Detail_right_Contents1_Category_Style" value="현수막·X배너">현수막·X배너</option>
											<option class="Detail_right_Contents1_Category_Style" value="메뉴판">메뉴판</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory3-1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select3-1" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="광고·홍보영상">광고·홍보영상</option>
											<option class="Detail_right_Contents1_Category_Style" value="업종별 영상">업종별 영상</option>
											<option class="Detail_right_Contents1_Category_Style" value="제품영상">제품영상</option>
											<option class="Detail_right_Contents1_Category_Style" value="교육영상">교육영상</option>
											<option class="Detail_right_Contents1_Category_Style" value="애니메이션">애니메이션</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory3-2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select3-2" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="제품·홍보사진">제품·홍보사진</option>
											<option class="Detail_right_Contents1_Category_Style" value="개인·프로필사진">개인·프로필사진</option>
											<option class="Detail_right_Contents1_Category_Style" value="사진보정">사진보정</option>
											<option class="Detail_right_Contents1_Category_Style" value="이벤트 사진">이벤트 사진</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory4-1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select4-1" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="블로그 관리">블로그 관리</option>
											<option class="Detail_right_Contents1_Category_Style" value="카페 관리">카페 관리</option>
											<option class="Detail_right_Contents1_Category_Style" value="인스타그램 관리">인스타그램 관리</option>
											<option class="Detail_right_Contents1_Category_Style" value="유튜브 관리">유튜브 관리</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory4-2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select4-2" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="체험단·기자단">체험단·기자단</option>
											<option class="Detail_right_Contents1_Category_Style" value="개인 인플루언서">개인 인플루언서</option>
											<option class="Detail_right_Contents1_Category_Style" value="바이럴·포스팅">바이럴·포스팅</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory4-3" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents_Category_Style_select" id="Detail_right_SubcatCategory_select4-3" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="언론홍보">언론홍보</option>
											<option class="Detail_right_Contents1_Category_Style" value="행사·이벤트">행사·이벤트</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory4-4" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select4-4" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="종합광고대행">종합광고대행</option>
											<option class="Detail_right_Contents1_Category_Style" value="스토어 마케팅">스토어 마케팅</option>
											<option class="Detail_right_Contents1_Category_Style" value="지도 마케팅">지도 마케팅</option>
											<option class="Detail_right_Contents1_Category_Style" value="라이브커머스">라이브커머스</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory5-1" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select5-1" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="영어 레슨">영어 레슨</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 외국어 레슨">기타 외국어 레슨</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory5-2" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select5-2" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="영어 레슨">미술·드로잉 레슨</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 외국어 레슨">글쓰기 레슨</option>
										</select>
									</div>
									<div class="Detail_right_Contents1_box2" id="Detail_right_SubcatCategory5-3" style="display: none;">
										<span class="Detail_right_type_box">&nbsp;&nbsp;소분류<span class="Detail_right_check">*</span></span>
										<select class="Detail_right_Contents1_Category_Style" id="Detail_right_SubcatCategory_select5-3" name="enroll_Subcat_Category">
											<option class="Detail_right_Contents1_Category_Style" value="">소분류를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="영어 레슨">댄스 레슨</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 외국어 레슨">보컬·랩 레슨</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 외국어 레슨">악기 레슨</option>
											<option class="Detail_right_Contents1_Category_Style" value="기타 외국어 레슨">미디·작곡·편곡 레슨</option>
										</select>
									</div>
								</div>
							</div>
								<div class="Detail_right_Contents1_Service" >
									<div class="Detail_right_Contents1_box2">
										<span class="Detail_right_type_box">&nbsp;&nbsp;서비스 타입<span class="Detail_right_check">*</span></span> 
										<select class="Detail_right_Contents1_Category_Style" name="enroll_Service">
											<option class="Detail_right_Contents1_Category_Style" value="">서비스 형태를 선택하여주세요</option>
											<option class="Detail_right_Contents1_Category_Style" value="문서제공">문서제공</option>
											<option class="Detail_right_Contents1_Category_Style" value="온라인제공">온라인제공</option>
											<option class="Detail_right_Contents1_Category_Style" value="파견근무">파견근무</option>
											<option class="Detail_right_Contents1_Category_Style" value="유선상담">유선상담</option>
										</select>
									</div>
								</div>
								<div class="Detail_right_Contents1_company">
								<span class="Detail_right_type_box">&nbsp;&nbsp;기업명<span class="Detail_right_check">*</span></span> 
								<input class="Detail_right_Contents1_Title_Input" type="text" placeholder="기업 이름을 입력해주세요." name="enroll_Company" oninput="Counter(this, 90)">
							</div>
								<div class="Detail_right_Contents1_imgbox">
									<img class="Detail_right_Contents1_img"
										src="../../resources/img/Business-card.jpg" alt="Business_Card">
								</div>
							</div>
						</div>
	
	
							<!-- =============================================================== Right Contents 2 =============================================================== -->
	
							<div class="Detail_right_Contents" id="Detail_right_Contents2" style="display: none;">
	
								<div class="Detail_right_TopTitle">
									<span class="Detail_right_PayData">가격 정보</span>
											<div class="Detail_right_toggleButon">
											    <input type="checkbox" class="right_toggle_checkbox" id="right_toggle_slider">
											    <label for="right_toggle_slider" class="toggle-label" id="right_toggle_sliderLabel"><span>패키지로 가격 설정</span></label>
											</div>
								</div>
	
								<!-- -------------------------------- Toggle Off -------------------------------- -->
								<div class="Detail_right_Type1" id="toggleContentOff">
									<span class="Detail_right_Type_Text">SINGLE</span>
									<div class="Detail_right_Type_Title">
										<div class="Detail_right_type_box1">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;제목<span class="Detail_right_check">*</span></span> 
											<input class="type_box_Input input_select" type="text" placeholder="제목을 입력해주세요." name="enroll_ServiceName" oninput="Counter(this, 60)">
										</div>
										<div class="Detail_right_type_box2">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;설명<span class="Detail_right_check">*</span></span> 
											<textarea class="type_box_Input2 input_select" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_ServiceGuide" oninput="Counter(this, 300)"></textarea>
										</div>
										<div class="Detail_right_type_box1">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;금액(VAT포함)<span class="Detail_right_check">*</span></span> 
											<input class="type_box_Input3 input_select" type="text" placeholder="금액을 입력해주세요." name="enroll_ServicePay" maxlength="9"><span class="Detail_right_unit">원</span>
										</div>
										
										
										<div class="Detail_right_type_box1" id="Detail_right_SingleData">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text1_input" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Data" maxlength="9" value="0"><span class="Detail_right_unit">개</span>
										</div>
												
										<div class="Detail_right_type_box1" id="Detail_right_SingleData_IT">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;페이지</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text1_input" type="text" placeholder="제공할 페이지수를 입력해주세요." name="enroll_Data" maxlength="9"><span class="Detail_right_unit">페이지</span>
										</div>
										<div class="Detail_right_type_box1" id="Detail_right_SingleData_Design">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;시안</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text1_input" type="text" placeholder="제공할 시안수를 입력해주세요." name="enroll_Data" maxlength="9"><span class="Detail_right_unit">개</span>
										</div>
										<div class="Detail_right_type_box1" id="Detail_right_SingleData_Media">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;촬영시간(분)</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text1_input" type="text" placeholder="제공할 촬영시간(분)을 입력해주세요." name="enroll_Data" maxlength="9"><span class="Detail_right_unit">분</span>
										</div>
										<div class="Detail_right_type_box1" id="Detail_right_SingleData_Marketing">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;A/S기간</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text1_input" type="text" placeholder="제공할 A/S기간을 입력해주세요." name="enroll_Data" maxlength="9"><span class="Detail_right_unit">일</span>
										</div>
										
										
										
										<div class="Detail_right_type_box1" id="Detail_right_SingleFunction">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text2_input" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Function" maxlength="9" value="0"><span class="Detail_right_unit"></span>
										</div>
										
										<div class="Detail_right_type_box1" id="Detail_right_SingleFunction_IT">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;기능</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text2_input" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Function" maxlength="9"><span class="Detail_right_unit">개</span>
										</div>
										<div class="Detail_right_type_box1" id="Detail_right_SingleFunction_Media">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;런닝타입(초)</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text2_input" type="text" placeholder="런닝타입(초)을 입력해주세요." name="enroll_Function" maxlength="9"><span class="Detail_right_unit">초</span>
										</div>
										<div class="Detail_right_type_box1" id="Detail_right_SingleFunction_Photo">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;컷수</span>
											<input class="type_box_Input3 input_select" id="Detail_right_box1_text2_input" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Function" maxlength="9"><span class="Detail_right_unit">장</span>
										</div>
										
										
										
										
										<div class="Detail_right_type_box1">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;작업 기간<span class="Detail_right_check">*</span></span> 
											<select class="Detail_right_workday dropMenuStyle_origin input_select" name="enroll_WorkDay">
												<option class="dropMenuStyle_origin" value="">기간을 선택하여주세요</option>
												<option class="dropMenuStyle" value="1">1</option>
												<option class="dropMenuStyle" value="2">2</option>
												<option class="dropMenuStyle" value="3">3</option>
												<option class="dropMenuStyle" value="4">4</option>
												<option class="dropMenuStyle" value="5">5</option>
												<option class="dropMenuStyle" value="6">6</option>
												<option class="dropMenuStyle" value="7">7</option>
												<option class="dropMenuStyle" value="8">8</option>
												<option class="dropMenuStyle" value="9">9</option>
												<option class="dropMenuStyle" value="10">10</option>
												<option class="dropMenuStyle" value="11">11</option>
												<option class="dropMenuStyle" value="12">12</option>
												<option class="dropMenuStyle" value="13">13</option>
												<option class="dropMenuStyle" value="14">14</option>
												<option class="dropMenuStyle" value="15">15</option>
												<option class="dropMenuStyle" value="16">16</option>
												<option class="dropMenuStyle" value="17">17</option>
												<option class="dropMenuStyle" value="18">18</option>
												<option class="dropMenuStyle" value="19">19</option>
												<option class="dropMenuStyle" value="20">20</option>
												<option class="dropMenuStyle" value="21">21</option>
												<option class="dropMenuStyle" value="22">22</option>
												<option class="dropMenuStyle" value="23">23</option>
												<option class="dropMenuStyle" value="24">24</option>
												<option class="dropMenuStyle" value="25">25</option>
												<option class="dropMenuStyle" value="26">26</option>
												<option class="dropMenuStyle" value="27">27</option>
												<option class="dropMenuStyle" value="28">28</option>
												<option class="dropMenuStyle" value="29">29</option>
												<option class="dropMenuStyle" value="30">30</option>
												<option class="dropMenuStyle" value="30">31</option>
												<option class="dropMenuStyle" value="30">32</option>
												<option class="dropMenuStyle" value="30">33</option>
												<option class="dropMenuStyle" value="30">34</option>
												<option class="dropMenuStyle" value="30">35</option>
												<option class="dropMenuStyle" value="30">36</option>
												<option class="dropMenuStyle" value="30">37</option>
												<option class="dropMenuStyle" value="30">38</option>
												<option class="dropMenuStyle" value="30">39</option>
												<option class="dropMenuStyle" value="30">40</option>
												<option class="dropMenuStyle" value="30">41</option>
												<option class="dropMenuStyle" value="30">42</option>
												<option class="dropMenuStyle" value="30">43</option>
												<option class="dropMenuStyle" value="30">44</option>
												<option class="dropMenuStyle" value="30">45</option>
												<option class="dropMenuStyle" value="30">46</option>
												<option class="dropMenuStyle" value="30">47</option>
												<option class="dropMenuStyle" value="30">48</option>
												<option class="dropMenuStyle" value="30">49</option>
												<option class="dropMenuStyle" value="30">50</option>
											</select><span class="Detail_right_unit">일</span>
										</div>
										<div class="Detail_right_type_box1 Detail_right_Box_margin">
											<span class="Detail_right_box1_text">&nbsp;&nbsp;수정 횟수<span class="Detail_right_check">*</span></span> 
											<select class="Detail_right_retouch dropMenuStyle_origin input_select" name="enroll_Retouch">
												<option class="dropMenuStyle_origin" value="">수정 회수를 선택하여주세요</option>
												<option class="dropMenuStyle" value="1">1</option>
												<option class="dropMenuStyle" value="2">2</option>
												<option class="dropMenuStyle" value="3">3</option>
												<option class="dropMenuStyle" value="4">4</option>
												<option class="dropMenuStyle" value="5">5</option>
												<option class="dropMenuStyle" value="6">6</option>
												<option class="dropMenuStyle" value="7">7</option>
												<option class="dropMenuStyle" value="8">8</option>
												<option class="dropMenuStyle" value="9">9</option>
												<option class="dropMenuStyle" value="10">10</option>
												<option class="dropMenuStyle" value="9999">제한없음</option>
											</select><span class="Detail_right_unit">회</span>
										</div>

									</div>
								</div>
	
								<!-- -------------------------------- Toggle On -------------------------------- -->
								<div class="toggleContent" id="toggleContentOn" style="display: none;">
									<div class="Detail_right_Type2_ON">
										<div class="Detail_right_Type2_TextAll">
											<span class="Detail_right_Type2_Title">STANDARD</span> 
											<span class="Detail_right_Type2_Title">DELUXE</span> 
											<span class="Detail_right_Type2_Title">PREMIUM</span>
										</div>
										<div class="Detail_right_Type_Title">
											<div class="Detail_right_Type2_Box1">
												<div class="Detail_right_Type2_ON_smallbox2">
													<span class="Detail_right_Type2_Text">제목<span class="Detail_right_Type2_check">*</span></span>
												</div>
												<input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Standard_Name" oninput="Counter(this, 60)">
												<input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Deluxe_Name" oninput="Counter(this, 60)">
												<input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Premium_Name" oninput="Counter(this, 60)">
											</div>
											<div class="Detail_right_Type2_Box2">
												<div class="Detail_right_Type2_ON_smallbox2">
													<span class="Detail_right_Type2_Text">설명<span class="Detail_right_Type2_check">*</span></span>
												</div>
												<textarea id="GuideText1" class="Detail_right_Type2_input3" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Standard_ServiceGuide" oninput="Counter(this, 300)"></textarea> 
												<textarea id="GuideText2" class="Detail_right_Type2_input3" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Deluxe_ServiceGuide" oninput="Counter(this, 300)"></textarea>
												<textarea id="GuideText3" class="Detail_right_Type2_input3" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Premium_ServiceGuide" oninput="Counter(this, 300)"></textarea>
											</div>
											<div class="Detail_right_Type2_Box">
												<div class="Detail_right_Type2_ON_smallbox2">
													<span class="Detail_right_Type2_Text">금액(VAT포함)<span class="Detail_right_Type2_check">*</span></span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="금액을 입력해주세요." name="enroll_Standard_Pay"><span class="Detail_right_Type2_unit">원</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="금액을 입력해주세요." name="enroll_Deluxe_Pay"><span class="Detail_right_Type2_unit">원</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="금액을 입력해주세요." name="enroll_Premium_Pay"><span class="Detail_right_Type2_unit">원</span>
												</div>
											</div>
											<div class="Detail_right_Type2_Box" id="Detail_right_data_list_package">
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Data">
												</div>
												
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Data_IT">
													<span class="Detail_right_Type2_Text">페이지</span>
												</div>
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Data_Design">
													<span class="Detail_right_Type2_Text">시안</span>
												</div>
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Data_Media">
													<span class="Detail_right_Type2_Text">촬영시간(분)</span>
												</div>
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Data_Marketing">
													<span class="Detail_right_Type2_Text">A/S기간</span>
												</div>
												
	
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Standard_Data" value="0">
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Deluxe_Data" value="0">
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Premium_Data" value="0">
												</div>
											</div>
											<div class="Detail_right_Type3_Box" id="Detail_right_function_list_package">
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Function">
												</div>
												
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Function_IT">
													<span class="Detail_right_Type2_Text">기능</span>
												</div>
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Function_Media">
													<span class="Detail_right_Type2_Text">런닝타입(초)</span>
												</div>
												<div class="Detail_right_Type2_ON_smallbox2" id="Detail_right_Function_Photo">
													<span class="Detail_right_Type2_Text">컷수</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Standard_Function" value="0">
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Deluxe_Function" value="0">
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Premium_Function" value="0">
												</div>
											</div>
											<div class="Detail_right_Type2_Box">
												<div class="Detail_right_Type2_ON_smallbox2">
													<span class="Detail_right_Type2_Text">작업 기간<span class="Detail_right_Type2_check">*</span></span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Standard_WorkDay">
														<option class="dropMenuStyle" value="">기간을 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="11">11</option>
														<option class="dropMenuStyle" value="12">12</option>
														<option class="dropMenuStyle" value="13">13</option>
														<option class="dropMenuStyle" value="14">14</option>
														<option class="dropMenuStyle" value="15">15</option>
														<option class="dropMenuStyle" value="16">16</option>
														<option class="dropMenuStyle" value="17">17</option>
														<option class="dropMenuStyle" value="18">18</option>
														<option class="dropMenuStyle" value="19">19</option>
														<option class="dropMenuStyle" value="20">20</option>
														<option class="dropMenuStyle" value="21">21</option>
														<option class="dropMenuStyle" value="22">22</option>
														<option class="dropMenuStyle" value="23">23</option>
														<option class="dropMenuStyle" value="24">24</option>
														<option class="dropMenuStyle" value="25">25</option>
														<option class="dropMenuStyle" value="26">26</option>
														<option class="dropMenuStyle" value="27">27</option>
														<option class="dropMenuStyle" value="28">28</option>
														<option class="dropMenuStyle" value="29">29</option>
														<option class="dropMenuStyle" value="30">30</option>
														<option class="dropMenuStyle" value="30">31</option>
														<option class="dropMenuStyle" value="30">32</option>
														<option class="dropMenuStyle" value="30">33</option>
														<option class="dropMenuStyle" value="30">34</option>
														<option class="dropMenuStyle" value="30">35</option>
														<option class="dropMenuStyle" value="30">36</option>
														<option class="dropMenuStyle" value="30">37</option>
														<option class="dropMenuStyle" value="30">38</option>
														<option class="dropMenuStyle" value="30">39</option>
														<option class="dropMenuStyle" value="30">40</option>
														<option class="dropMenuStyle" value="30">41</option>
														<option class="dropMenuStyle" value="30">42</option>
														<option class="dropMenuStyle" value="30">43</option>
														<option class="dropMenuStyle" value="30">44</option>
														<option class="dropMenuStyle" value="30">45</option>
														<option class="dropMenuStyle" value="30">46</option>
														<option class="dropMenuStyle" value="30">47</option>
														<option class="dropMenuStyle" value="30">48</option>
														<option class="dropMenuStyle" value="30">49</option>
														<option class="dropMenuStyle" value="30">50</option>
													</select><span class="Detail_right_Type2_unit">일</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Deluxe_WorkDay">
														<option class="dropMenuStyle" value="">기간을 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="11">11</option>
														<option class="dropMenuStyle" value="12">12</option>
														<option class="dropMenuStyle" value="13">13</option>
														<option class="dropMenuStyle" value="14">14</option>
														<option class="dropMenuStyle" value="15">15</option>
														<option class="dropMenuStyle" value="16">16</option>
														<option class="dropMenuStyle" value="17">17</option>
														<option class="dropMenuStyle" value="18">18</option>
														<option class="dropMenuStyle" value="19">19</option>
														<option class="dropMenuStyle" value="20">20</option>
														<option class="dropMenuStyle" value="21">21</option>
														<option class="dropMenuStyle" value="22">22</option>
														<option class="dropMenuStyle" value="23">23</option>
														<option class="dropMenuStyle" value="24">24</option>
														<option class="dropMenuStyle" value="25">25</option>
														<option class="dropMenuStyle" value="26">26</option>
														<option class="dropMenuStyle" value="27">27</option>
														<option class="dropMenuStyle" value="28">28</option>
														<option class="dropMenuStyle" value="29">29</option>
														<option class="dropMenuStyle" value="30">30</option>
														<option class="dropMenuStyle" value="30">31</option>
														<option class="dropMenuStyle" value="30">32</option>
														<option class="dropMenuStyle" value="30">33</option>
														<option class="dropMenuStyle" value="30">34</option>
														<option class="dropMenuStyle" value="30">35</option>
														<option class="dropMenuStyle" value="30">36</option>
														<option class="dropMenuStyle" value="30">37</option>
														<option class="dropMenuStyle" value="30">38</option>
														<option class="dropMenuStyle" value="30">39</option>
														<option class="dropMenuStyle" value="30">40</option>
														<option class="dropMenuStyle" value="30">41</option>
														<option class="dropMenuStyle" value="30">42</option>
														<option class="dropMenuStyle" value="30">43</option>
														<option class="dropMenuStyle" value="30">44</option>
														<option class="dropMenuStyle" value="30">45</option>
														<option class="dropMenuStyle" value="30">46</option>
														<option class="dropMenuStyle" value="30">47</option>
														<option class="dropMenuStyle" value="30">48</option>
														<option class="dropMenuStyle" value="30">49</option>
														<option class="dropMenuStyle" value="30">50</option>
													</select><span class="Detail_right_Type2_unit">일</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Premium_WorkDay">
														<option class="dropMenuStyle" value="">기간을 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="11">11</option>
														<option class="dropMenuStyle" value="12">12</option>
														<option class="dropMenuStyle" value="13">13</option>
														<option class="dropMenuStyle" value="14">14</option>
														<option class="dropMenuStyle" value="15">15</option>
														<option class="dropMenuStyle" value="16">16</option>
														<option class="dropMenuStyle" value="17">17</option>
														<option class="dropMenuStyle" value="18">18</option>
														<option class="dropMenuStyle" value="19">19</option>
														<option class="dropMenuStyle" value="20">20</option>
														<option class="dropMenuStyle" value="21">21</option>
														<option class="dropMenuStyle" value="22">22</option>
														<option class="dropMenuStyle" value="23">23</option>
														<option class="dropMenuStyle" value="24">24</option>
														<option class="dropMenuStyle" value="25">25</option>
														<option class="dropMenuStyle" value="26">26</option>
														<option class="dropMenuStyle" value="27">27</option>
														<option class="dropMenuStyle" value="28">28</option>
														<option class="dropMenuStyle" value="29">29</option>
														<option class="dropMenuStyle" value="30">30</option>
														<option class="dropMenuStyle" value="30">31</option>
														<option class="dropMenuStyle" value="30">32</option>
														<option class="dropMenuStyle" value="30">33</option>
														<option class="dropMenuStyle" value="30">34</option>
														<option class="dropMenuStyle" value="30">35</option>
														<option class="dropMenuStyle" value="30">36</option>
														<option class="dropMenuStyle" value="30">37</option>
														<option class="dropMenuStyle" value="30">38</option>
														<option class="dropMenuStyle" value="30">39</option>
														<option class="dropMenuStyle" value="30">40</option>
														<option class="dropMenuStyle" value="30">41</option>
														<option class="dropMenuStyle" value="30">42</option>
														<option class="dropMenuStyle" value="30">43</option>
														<option class="dropMenuStyle" value="30">44</option>
														<option class="dropMenuStyle" value="30">45</option>
														<option class="dropMenuStyle" value="30">46</option>
														<option class="dropMenuStyle" value="30">47</option>
														<option class="dropMenuStyle" value="30">48</option>
														<option class="dropMenuStyle" value="30">49</option>
														<option class="dropMenuStyle" value="30">50</option>
													</select><span class="Detail_right_Type2_unit">일</span>
												</div>
											</div>
											<div
												class="Detail_right_Type2_Box Detail_right_Type2_Box_margin">
												<div class="Detail_right_Type2_ON_smallbox2">
													<span class="Detail_right_Type2_Text">수정 횟수<span class="Detail_right_Type2_check">*</span></span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Standard_Retouch">
														<option class="dropMenuStyle" value="">수정 회수를 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="9999">제한없음</option>
													</select><span class="Detail_right_Type2_unit">회</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Deluxe_Retouch">
														<option class="dropMenuStyle" value="">수정 회수를 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="9999">제한없음</option>
													</select><span class="Detail_right_Type2_unit">회</span>
												</div>
												<div class="Detail_right_Type2_ON_selectbox">
													<select class="Detail_right_Type2_select" name="enroll_Premium_Retouch">
														<option class="dropMenuStyle" value="">수정 회수를 선택하여주세요</option>
														<option class="dropMenuStyle" value="1">1</option>
														<option class="dropMenuStyle" value="2">2</option>
														<option class="dropMenuStyle" value="3">3</option>
														<option class="dropMenuStyle" value="4">4</option>
														<option class="dropMenuStyle" value="5">5</option>
														<option class="dropMenuStyle" value="6">6</option>
														<option class="dropMenuStyle" value="7">7</option>
														<option class="dropMenuStyle" value="8">8</option>
														<option class="dropMenuStyle" value="9">9</option>
														<option class="dropMenuStyle" value="10">10</option>
														<option class="dropMenuStyle" value="9999">제한없음</option>
													</select><span class="Detail_right_Type2_unit">회</span>
												</div>
											</div>
	
										</div>
									</div>
								</div>
							</div>
	
	
	
							<!-- =============================================================== Right Contents 3 =============================================================== -->
							<div class="Detail_right_Contents3" id="Detail_right_Contents3"
								style="display: none;">
								<div class="Detail_right_Contents3_box">
									<div class="Detail_right_Contents3_Titlebox">
										<span class="Detail_right_type_box_Title">서비스 설명<span class="Detail_right_check">*</span></span>
									</div>
									<div id="smarteditor">
										<textarea class="smarteditor" id="editorTxt" name="editorTxt"></textarea>
									</div>
								</div>
							</div>
	
	
	
							<!-- =============================================================== Right Contents 4 =============================================================== -->
							<div class="Detail_right_Contents4" id="Detail_right_Contents4" style="display: none;">
								<div class="Detail_right_Contents4_box1">
									<div class="Detail_right_Contents4_UploadTitle">
										<label for="Detail_right_Contents4_fileInput1" class="Detail_right_Contents4_fileInput1">메인 이미지 :</label>
										<div id="imageCountDisplay1" class="imageCountDisplay">0/1</div>
									</div>
									<input class="Detail_right_Contents4_input" type="file" id="Detail_right_Contents4_fileInput1" accept="image/*" name="mUploadFile">
									<div class="Detail_right_Contents4_preview1" id="Detail_right_Contents4_imagePreviews1"></div>
								</div>
								<div class="Detail_right_Contents4_box2">
									<div class="Detail_right_Contents4_UploadTitle">
										<label for="Detail_right_Contents4_fileInput2" class="Detail_right_Contents4_fileInput2">상세페이지 이미지 :</label>
										<div id="imageCountDisplay2" class="imageCountDisplay">0/5</div>
									</div>
									<input class="Detail_right_Contents4_input" type="file" id="Detail_right_Contents4_fileInput2" accept="image/*" name="dUploadFile" multiple>
									<div class="Detail_right_Contents4_preview2" id="Detail_right_Contents4_imagePreviews2"></div>
								</div>
							</div>
	
	
	
							<!-- =============================================================================================================================================== -->
						
					</div>
					<div class="boardProEnroll_Button_All">
						<button type="button" class="boardProEnroll_ButtonStyle1" id="boardProEnroll_Next_Button1">이전으로</button>
						<button type="button" class="boardProEnroll_ButtonStyle2" id="boardProEnroll_Next_Button2" onclick="save()">다음으로</button>
						<button type="submit" class="boardProEnroll_ButtonStyle3" id="boardProEnroll_Next_Button3">제출</button>
					</div>
				</div>
			</form>
    </main>
    <%@ include file="/views/common/footer.jsp"%>
 
</body>
<script src="../../resources/js/boardProEnroll/boardProEnroll1.js"></script>
<script src="../../resources/js/boardProEnroll/boardProEnroll2.js"></script>
<script src="../../resources/js/boardProEnroll/boardProEnroll3.js"></script>
<script src="../../resources/js/boardProEnroll/boardProEnroll_FileUpload.js"></script>
</html>

