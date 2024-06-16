<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kr.co.copang.boardPro.model.dto.BoardProDto" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="/resources/img/tapIcon.png">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board/boardProDetail.css">
    <%@ include file="/views/common/head.jsp"%>
    <script src="https://kit.fontawesome.com/1992e1ad9e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/resources/js/boardProDetail/boardProDetail.js"></script>
    
    <%
        BoardProDto result = (BoardProDto) request.getAttribute("result");
        BoardProDto resultSingle = (BoardProDto) request.getAttribute("resultSingle");
        BoardProDto resultS = (BoardProDto) request.getAttribute("resultS");
        BoardProDto resultD = (BoardProDto) request.getAttribute("resultD");
        BoardProDto resultP = (BoardProDto) request.getAttribute("resultP");
        BoardProDto resultF = (BoardProDto) request.getAttribute("resultF");
        BoardProDto mainFile = (BoardProDto) request.getAttribute("mainFile");
        String avg = (String) request.getAttribute("avg");
        ArrayList<BoardProDto> fileList = (ArrayList<BoardProDto>) request.getAttribute("fileList");
        ArrayList<BoardProDto> reviewList = (ArrayList<BoardProDto>) request.getAttribute("reviewList");
        
        out.println("<script>");
        if (result != null) {
            out.println("console.log('result: " + result + "');");
        }
        if (resultSingle != null) {
            out.println("console.log('resultSingle: " + resultSingle + "');");
        }
        if (resultS != null) {
            out.println("console.log('resultS: " + resultS + "');");
        }
        if (resultD != null) {
            out.println("console.log('resultD: " + resultD + "');");
        }
        if (resultP != null) {
            out.println("console.log('resultP: " + resultP + "');");
        }
        if (resultF != null) {
            out.println("console.log('resultF: " + resultF + "');");
        }
        if (mainFile != null) {
            out.println("console.log('mainFile: " + mainFile + "');");
        }
        if (avg != null) {
            out.println("console.log('avg: " + avg + "');");
        }
        if (fileList != null) {
            out.println("console.log('fileList: " + fileList + "');");
        }
        if (reviewList != null) {
            out.println("console.log('reviewList: " + reviewList + "');");
        }
        out.println("</script>");
    %>
    
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>

    <main class="main_Detail">
        <div class="detail_containor">
    
            <!---------------------------- Contents Left ---------------------------->
    
            <div class="left_contents">
                <div class="Detail_Left_MainImage_box">
                	<img src="${pageContext.request.contextPath}/resources/upload/main/${mainFile.fileName}" alt="${mainFile.fileName}" class="Detail_Left_MainImage">
                </div>
            	
                <div class="Detail_Left_Star_Decision">
                    <span class="Detail_Left_Star_Decision_point Detail_Left_Star_Decision_pointOn" value="1"></span>
                    <span class="Detail_Left_Star_Decision_point" value="2"></span>
                    <span class="Detail_Left_Star_Decision_point" value="3"></span>
                    <span class="Detail_Left_Star_Decision_point" value="4"></span>
                    <span class="Detail_Left_Star_Decision_point" value="5"></span>
                    <span class="Detail_Left_Star_Decision_Average" id="Detail_Left_Star_Decision_Average" value="${avg}">${avg}</span>
                </div>

                <div class="left_TabList">
                    <input type="radio" name="tabmenu01" id="tabList01" checked>
                    <label class="tabMenuLabel" for="tabList01">서비스 설명</label>
                    <input type="radio" name="tabmenu01" id="tabList02">
                    <label class="tabMenuLabel tabpoint" id="con2" for="tabList02">가격 정보</label>
                    <input type="radio" name="tabmenu01" id="tabList03">
                    <label class="tabMenuLabel tabpoint" for="tabList03">수정·재진행</label>
                    <input type="radio" name="tabmenu01" id="tabList04">
                    <label class="tabMenuLabel tabpoint" for="tabList04">취소·환불</label>
                    <input type="radio" name="tabmenu01" id="tabList05">
                    <label class="tabMenuLabel tabpoint" for="tabList05">서비스 리뷰</label>

                    <div class="conbox con1">
					    ${result.boardProContents} <!-- 게시물 내용 -->
					    <c:forEach var="file" items="${fileList}">
					        <c:choose>
					            <c:when test="${file.fileContentType.startsWith('image/')}">
					                <!-- 이미지 파일일 경우 -->
					                <img src="${pageContext.request.contextPath}/resources/upload/detail/${file.fileName}" alt="${file.fileName}" class="Detail_Left_DetailImage">
					            </c:when>
					            <c:when test="${file.fileContentType == 'video/mp4'}">
					                <!-- 영상 파일일 경우 -->
					                <video width="100%" height="auto" controls>
					                    <source src="${pageContext.request.contextPath}/resources/upload/detail/${file.fileName}" type="video/mp4">
					                    Your browser does not support the video tag.
					                </video>
					            </c:when>
					            <c:otherwise>
					                <!-- 다른 형식의 파일 처리 -->
					                <p>Unsupported file format: ${file.fileName}</p>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					</div>
                    <div class="conbox con2">
					    <p class="leftTabList_title">가격 정보</p>
						    <c:choose>
						    	<c:when test="${result.businessServiceType.equals('SINGLE')}">
						    		<section>
					                	<c:if test="${result.boardProCategory.equals('IT·프로그래밍')}">
					                		<div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_IT">
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">반응형 웹</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">광고 기능</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_inner">
						                        	<c:if test="${resultSingle.businessServiceFunction != 0}">
							                        	<div class="rightBox_check_list">
							                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceFunction}</span>개</span>
							                            </div>
							                        </c:if>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>페이지</span>
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceRetouch}</span>회</span>
						                            </div>
						                        </div>
						                        <button type="submit" class="rightBox_buy_button rightBox_buy_button_Single">구매하기</button>
						                    </div>
					                    </c:if>
					                    <c:if test="${result.boardProCategory.equals('디자인')}">
					                    	<div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_IT">
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">응용 디자인</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_inner">
												    <c:if test="${resultSingle.businessServiceData != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">시안개수</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceData}</span>개
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceWorkDate != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">작업일</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceWorkDate}</span>일
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceRetouch != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">수정 횟수</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceRetouch}</span>회
												            </span>
												        </div>
												    </c:if>
												</div>
						                        <button class="rightBox_buy_button rightBox_buy_button_Single" onclick="">구매하기</button>
						                    </div>
					                    </c:if>
					                    <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('영상')}">
						                    <div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_IT">
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">배경 음악</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                            </div>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_inner">
												    <c:if test="${resultSingle.businessServiceData != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">촬영시간(분)</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceData}</span>분
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceFunction != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">러닝타임(초)</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceFunction}</span>초
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceWorkDate != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">작업일</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceWorkDate}</span>일
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceRetouch != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">수정 횟수</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceRetouch}</span>회
												            </span>
												        </div>
												    </c:if>
												</div>
						                        <button class="rightBox_buy_button rightBox_buy_button_Single" onclick="">구매하기</button>
						                    </div>
					                    </c:if>
					                    <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('사진')}">
						                    <div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <div class="rightBox_check_list_IT">
						                            <div class="rightBox_check_list">
						                                <span class="rightBox_check_list_text">보정 작업</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
						                        	</div>
						                        	<br>
							                        <div class="rightBox_check_list_inner">
													    <c:if test="${resultSingle.businessServiceData != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">촬영시간(분)</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceData}</span>분
													            </span>
													        </div>
													    </c:if>
													    <c:if test="${resultSingle.businessServiceFunction != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">컷 수</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceFunction}</span>컷
													            </span>
													        </div>
													    </c:if>
													    <c:if test="${resultSingle.businessServiceWorkDate != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">작업일</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceWorkDate}</span>일
													            </span>
													        </div>
													    </c:if>
													    <c:if test="${resultSingle.businessServiceRetouch != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">수정 횟수</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceRetouch}</span>회
													            </span>
													        </div>
													    </c:if>
													</div>
						                        	<button class="rightBox_buy_button rightBox_buy_button_Single" onclick="">구매하기</button>
						                   		 </div>
					                   		 </div>
				                   		 </c:if>
				                   		 <c:if test="${result.boardProCategory.equals('마케팅')}">
						                    <div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_inner">
						                        	<c:choose>
													    <c:when test="${result.boardProSubcatCategory.equals('인스타그램 관리') && resultSingle.businessServiceData != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">A/S기간(일)</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceData}</span>일
													            </span>
													        </div>
													    </c:when>
													    <c:when test="${result.boardProSubcatCategory.equals('체험단·기자단') && resultSingle.businessServiceData != 0}">
													        <div class="rightBox_check_list">
													            <span class="rightBox_check_list_text">유지기간(일)</span>
													            <span class="rightBox_business_inner">
													                <span>${resultSingle.businessServiceData}</span>일
													            </span>
													        </div>
													    </c:when>
													    <c:otherwise>
													        
													    </c:otherwise>
													</c:choose>

						                            <c:if test="${resultSingle.businessServiceWorkDate != 0}">
													    <div class="rightBox_check_list">
													        <span class="rightBox_check_list_text">작업일</span>
													        <span class="rightBox_business_inner">
													            <span>${resultSingle.businessServiceWorkDate}</span>일
													        </span>
													    </div>
													</c:if>
													
													<c:if test="${resultSingle.businessServiceRetouch != 0}">
													    <div class="rightBox_check_list">
													        <span class="rightBox_check_list_text">수정 횟수</span>
													        <span class="rightBox_business_inner">
													            <span>${resultSingle.businessServiceRetouch}</span>회
													        </span>
													    </div>
													</c:if>
						                        </div>
						                        <button class="rightBox_buy_button rightBox_buy_button_Single" onclick="">구매하기</button>
						                    </div>
					                    </c:if>
					                    <c:if test="${result.boardProCategory.equals('교육')}">
						                    <div class="rightConbox rightCon1 rightConboxSingle">
						                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
						                        <span class="vat">(VAT포함)</span>
						                        <div class="rightBox_second_title">
						                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
						                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
						                        </div>
						                        <br>
						                        <div class="rightBox_check_list_inner">
												    <c:if test="${resultSingle.businessServiceFunction != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">1회당 레슨시간(분)</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceFunction}</span>분
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceData != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">레슨 횟수</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceData}</span>회
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceWorkDate != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">작업일</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceWorkDate}</span>일
												            </span>
												        </div>
												    </c:if>
												    <c:if test="${resultSingle.businessServiceRetouch != 0}">
												        <div class="rightBox_check_list">
												            <span class="rightBox_check_list_text">수정 횟수</span>
												            <span class="rightBox_business_inner">
												                <span>${resultSingle.businessServiceRetouch}</span>회
												            </span>
												        </div>
												    </c:if>
												</div>
						                        <button class="rightBox_buy_button rightBox_buy_button_Single" onclick="">구매하기</button>
						                    </div>
					                    </c:if>
									</section>
						    	</c:when>
						    	<c:when test="${result.businessServiceType.equals('STANDARD')}">
									<table class="leftPayList">
										<thead class="tableLine0">
											<tr>
												<th class="tableTitle"></th>
												<th class="tableTitle">STANDARD</th>
												<th class="tableTitle">DELUXE</th>
												<th class="tableTitle">PREMIUM</th>
											</tr>
										</thead>
										<c:if test="${result.boardProCategory.equals('IT·프로그래밍')}">
											<tbody id="Detail_Category_BusinessMenu_IT" class="categoryTable">
												<tr>
													<td class="tableLine">페이지</td>
													<td class="tableLine">${resultS.businessServiceData}페이지</td>
													<td class="tableLine">${resultD.businessServiceData}페이지</td>
													<td class="tableLine">${resultP.businessServiceData}페이지</td>
												</tr>
												<c:if test="${resultS.businessServiceFunction != '0' && resultD.businessServiceFunction != '0' && resultP.businessServiceFunction != '0'}">
													<tr>
														<td class="tableLine">기능</td>
														<td class="tableLine">${resultS.businessServiceFunction}개</td>
														<td class="tableLine">${resultD.businessServiceFunction}개</td>
														<td class="tableLine">${resultP.businessServiceFunction}개</td>
													</tr>
												</c:if>
												<tr>
												    <td class="tableLine">수정 횟수</td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${result.boardProCategory.equals('디자인')}">
											<tbody id="Detail_Category_BusinessMenu_Design" class="categoryTable">
												<tr>
												    <c:if test="${resultS.businessServiceData != 0}">
												        <td class="tableLine">시안</td>
												        <td class="tableLine">${resultS.businessServiceData}개</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceData != 0}">
												        <td class="tableLine">${resultD.businessServiceData}개</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceData != 0}">
												        <td class="tableLine">${resultP.businessServiceData}개</td>
												    </c:if>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceRetouch != 0}">
												        <td class="tableLine">수정 횟수</td>
												        <td class="tableLine">
												            <c:choose>
												                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												                <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												            </c:choose>
												        </td>
												    </c:if>
												    <c:if test="${resultD.businessServiceRetouch != 0}">
												        <td class="tableLine">
												            <c:choose>
												                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												                <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												            </c:choose>
												        </td>
												    </c:if>
												    <c:if test="${resultP.businessServiceRetouch != 0}">
												        <td class="tableLine">
												            <c:choose>
												                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												                <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												            </c:choose>
												        </td>
												    </c:if>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('영상')}">
											<tbody id="Detail_Category_BusinessMenu_Video" class="categoryTable">
												<tr>
												    <c:if test="${resultS.businessServiceData != 0}">
												        <td class="tableLine">촬영시간(분)</td>
												        <c:if test="${resultS.businessServiceData != 0}">
												            <td class="tableLine">${resultS.businessServiceData}분</td>
												        </c:if>
												        <c:if test="${resultD.businessServiceData != 0}">
												            <td class="tableLine">${resultD.businessServiceData}분</td>
												        </c:if>
												        <c:if test="${resultP.businessServiceData != 0}">
												            <td class="tableLine">${resultP.businessServiceData}분</td>
												        </c:if>
												    </c:if>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceFunction != 0}">
												        <td class="tableLine">런닝타임(초)</td>
												        <c:if test="${resultS.businessServiceFunction != 0}">
												            <td class="tableLine">${resultS.businessServiceFunction}초</td>
												        </c:if>
												        <c:if test="${resultD.businessServiceFunction != 0}">
												            <td class="tableLine">${resultD.businessServiceFunction}초</td>
												        </c:if>
												        <c:if test="${resultP.businessServiceFunction != 0}">
												            <td class="tableLine">${resultP.businessServiceFunction}초</td>
												        </c:if>
												    </c:if>
												</tr>
												<tr>
													<td class="tableLine">수정 횟수</td>
													<td class="tableLine">
												        <c:choose>
												            <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('사진')}">
											<tbody id="Detail_Category_BusinessMenu_Photo" class="categoryTable">
												<tr>
												    <c:if test="${resultS.businessServiceData != 0}">
												        <td class="tableLine">촬영시간(분)</td>
												        <c:if test="${resultS.businessServiceData != 0}">
												            <td class="tableLine">${resultS.businessServiceData}분</td>
												        </c:if>
												        <c:if test="${resultD.businessServiceData != 0}">
												            <td class="tableLine">${resultD.businessServiceData}분</td>
												        </c:if>
												        <c:if test="${resultP.businessServiceData != 0}">
												            <td class="tableLine">${resultP.businessServiceData}분</td>
												        </c:if>
												    </c:if>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceFunction != 0}">
												        <td class="tableLine">컷수</td>
												        <c:if test="${resultS.businessServiceFunction != 0}">
												            <td class="tableLine">${resultS.businessServiceFunction}장</td>
												        </c:if>
												        <c:if test="${resultD.businessServiceFunction != 0}">
												            <td class="tableLine">${resultD.businessServiceFunction}장</td>
												        </c:if>
												        <c:if test="${resultP.businessServiceFunction != 0}">
												            <td class="tableLine">${resultP.businessServiceFunction}장</td>
												        </c:if>
												    </c:if>
												</tr>
												<tr>
													<td class="tableLine">수정 횟수</td>
													<td class="tableLine">
												        <c:choose>
												            <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${result.boardProCategory.equals('마케팅')}">
											<tbody id="Detail_Category_BusinessMenu_Marketing" class="categoryTable">
												<tr>
												    <c:choose>
												        <c:when test="${result.boardProSubcatCategory.equals('인스타그램 관리')}">
												            <td class="tableLine">A/S기간</td>
												            <td class="tableLine">${resultS.businessServiceData}일</td>
												            <td class="tableLine">${resultD.businessServiceData}일</td>
												            <td class="tableLine">${resultP.businessServiceData}일</td>
												        </c:when>
												        <c:when test="${result.boardProSubcatCategory.equals('체험단·기자단')}">
												            <td class="tableLine">유지기간</td>
												            <td class="tableLine">${resultS.businessServiceData}일</td>
												            <td class="tableLine">${resultD.businessServiceData}일</td>
												            <td class="tableLine">${resultP.businessServiceData}일</td>
												        </c:when>
												        <c:otherwise>
												            
												        </c:otherwise>
												    </c:choose>
												</tr>
												<tr>
													<td class="tableLine">수정 횟수</td>
													<td class="tableLine">
												        <c:choose>
												            <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
										<c:if test="${result.boardProCategory.equals('교육')}">
											<tbody id="Detail_Category_BusinessMenu_Study" class="categoryTable">
												<tr>
													<td class="tableLine">수정 횟수</td>
													<td class="tableLine">
												        <c:choose>
												            <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultS.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultD.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												    <td class="tableLine">
												        <c:choose>
												            <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
												            <c:otherwise>${resultP.businessServiceRetouch}회</c:otherwise>
												        </c:choose>
												    </td>
												</tr>
												<tr>
												    <c:if test="${resultS.businessServiceWorkDate != 0}">
												        <td class="tableLine">작업일</td>
												        <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultD.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
												    </c:if>
												    <c:if test="${resultP.businessServiceWorkDate != 0}">
												        <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
												    </c:if>
												</tr>
												<tr class="tableLine2">
												    <c:if test="${resultS.businessServicePay != 0}">
												        <td class="tableLine">금액</td>
												        <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultD.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
												    </c:if>
												    <c:if test="${resultP.businessServicePay != 0}">
												        <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
												    </c:if>
												</tr>
												<tr>
													<td></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
													<td><button onclick="" class="leftBuy">구매</button></td>
												</tr>
											</tbody>
										</c:if>
									</table>
								</c:when>
							</c:choose>
						</div>
	                    <div class="conbox con3">
	                        <ul class="leftTabList_Retouch">
	                            <li class="leftTabList_Retouch_title">수정 및 재진행</li>
	                            <li class="leftTabList_Retouch_contents">의뢰인이 제공한 설명대로 제작되지 않은 경우나 불가피하게 프로그램의 간단한 수정 사항이 발생한 경우 수정을 요청할 수 있습니다.</li>
	                        </ul>
	                    </div>
	                    <div class="conbox con4">
	                        <ul class="leftTabList_Cencle">
	                            <li class="leftTabList_Cencle_title">취소 및 환불 규정</li>
	                            <li class="leftTabList_Cencle_contents">가. 기본 환불 규정</li>
	                            <li class="leftTabList_Cencle_contents">1. 전문가와 의뢰인의 상호 협의하에 청약 철회 및 환불이 가능합니다.</li>
	                            <li class="leftTabList_Cencle_contents">2. 작업이 완료된 이후 또는 자료, 프로그램 등 서비스가 제공된 이후에는 환불이 불가합니다.</li>
	                            <li class="leftTabList_Cencle_contents">( 소비자보호법 17조 2항의 5조. 용역 또는 「문화산업진흥 기본법」 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우에 해당)</li>
	                            <li class="leftTabList_Cencle_contents">나. 전문가 책임 사유</li>
	                            <li class="leftTabList_Cencle_contents">전문가의 귀책사유로 당초 약정했던 서비스 미이행 혹은 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.</li>
	                            <li class="leftTabList_Cencle_contents">다. 의뢰인 책임 사유</li>
	                            <li class="leftTabList_Cencle_contents">서비스 진행 도중 의뢰인의 귀책사유로 인해 환불을 요청할 경우, 사용 금액을 아래와 같이 계산 후 총 금액의 10%를 공제하여 환불합니다.</li>
	                            <li class="leftTabList_Cencle_contents">1> 총 작업량의 1/3 경과 전 : 이미 납부한 요금의 2/3해당액</li>
	                            <li class="leftTabList_Cencle_contents">2> 총 작업량의 1/2 경과 전 : 이미 납부한 요금의 1/2해당액</li>
	                            <li class="leftTabList_Cencle_contents">3> 총 작업량의 1/2 경과 후 : 반환하지 않음</li>
	                        </ul>
	
	                    </div>
	                    <div class="conbox con5">
	                    	<div class="Detail_Left_Star_Rating">
		                    	<span class="Detail_Left_Star Detail_Left_Star_On" value="1"></span>
			                    <span class="Detail_Left_Star" value="2"></span>
			                    <span class="Detail_Left_Star" value="3"></span>
			                    <span class="Detail_Left_Star" value="4"></span>
			                    <span class="Detail_Left_Star" value="5"></span>
	                    	</div>
	                    	<div class="Detail_Left_review_box">
	                    	<textarea name="Detail_Left_Review_Content" class="Detail_Left_Star_Review" placeholder="리뷰 내용을 작성해주세요."></textarea>
	                    	<button type="button" class="Detail_Left_Star_Review_Button" value="${result.boardProNo}">리뷰 등록</button>
	                    	</div>
	                    	<div class="Detail_Left_ReviewTable">
	                    		<table class="Detail_Left_ReviewTable_box">
	                   				<c:choose>
	                   					<c:when test="${empty reviewList}">
	                   						<tr>
	                   							<td colspan="3">등록된 리뷰가 없습니다.</td>
	                   						</tr>
	                   					</c:when>
	                   					<c:otherwise>
	                   						<c:forEach var="item" items="${reviewList}" varStatus="status">
										        	<tr>
												    	<td>
													    	<div class="Detail_Left_Reviews">
														        <div class="Detail_Left_ReviewBlock">
														            <div class="Detail_Left_ReviewStar">
														                <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 1 ? 'Detail_Left_Reviw_Star_On' : ''}" value="1"></span>
														                <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 2 ? 'Detail_Left_Reviw_Star_On' : ''}" value="2"></span>
														                <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 3 ? 'Detail_Left_Reviw_Star_On' : ''}" value="3"></span>
														                <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 4 ? 'Detail_Left_Reviw_Star_On' : ''}" value="4"></span>
														                <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 5 ? 'Detail_Left_Reviw_Star_On' : ''}" value="5"></span>
														                <span class="Detail_Left_Reviw_Star_value"><fmt:formatNumber value="${item.reviewStarPoint}" pattern="#,##0.0" /></span>
														            </div>
														            <div class="Detail_Left_ReviewInfo">
														                <span class="Detail_Left_ReviewUser">${item.userName}</span>
														                <p class="Detail_Left_ReviewIndate">${item.reviewIndate}</p>
														            </div>
														        </div>
													            <div class="Detail_Left_ReviewContent">
													                <span>${item.reviewContent}</span>
													            </div>
												            </div>
												    	</td>
										        	</tr>
											</c:forEach>
	                   					</c:otherwise>
	                   				</c:choose>
	                    		</table>
	                    	</div>
                    	</div>
	                </div>
	            </div>
    
            <!---------------------------- Contents Right ---------------------------->
    
            <div class="right_contents">
                <div class="right_up">
                   	<img src="/resources/img/Link_img.png" alt="공유하기_Link_img" class="img_link" id="shareButton">
                    <span class="right_up_text">${result.boardProTitle}</span>
                </div>
                <form>
					<c:choose>
						<c:when test="${result.businessServiceType.equals('SINGLE')}">
							<section class="right_payTabList">
			                	<c:if test="${result.boardProCategory.equals('IT·프로그래밍')}">
			                		<div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">반응형 웹</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">광고 기능</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
				                        <div class="rightBox_check_list_inner">
											<c:if test="${resultSingle.businessServiceData != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">페이지 수</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>페이지</span>
											    </div>
											</c:if>
				                        	<c:if test="${resultSingle.businessServiceFunction != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">기능 추가</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceFunction}</span>개</span>
											    </div>
											</c:if>
				                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">작업일</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
											    </div>
											</c:if>
				                            <div class="rightBox_check_list">
											    <span class="rightBox_check_list_text">수정 횟수</span>
											    <span class="rightBox_business_inner">
											        <c:choose>
											            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
											            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
											        </c:choose>
											    </span>
											</div>
				                        </div>
				                        <button type="submit" class="rightBox_buy_button">구매하기</button>
				                    </div>
			                    </c:if>
			                    <c:if test="${result.boardProCategory.equals('디자인')}">
			                    	<div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">응용 디자인</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
				                        <div class="rightBox_check_list_inner">
				                            <c:if test="${resultSingle.businessServiceData != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">시안 갯수</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>개</span>
											    </div>
											</c:if>
				                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">작업일</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
											    </div>
											</c:if>
				                            <div class="rightBox_check_list">
											    <span class="rightBox_check_list_text">수정 횟수</span>
											    <span class="rightBox_business_inner">
											        <c:choose>
											            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
											            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
											        </c:choose>
											    </span>
											</div>
				                        </div>
				                        <button class="rightBox_buy_button" onclick="">구매하기</button>
				                    </div>
			                    </c:if>
			                    <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('영상')}">
				                    <div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">배경 음악</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
				                        <div class="rightBox_check_list_inner">
				                            
											<c:if test="${resultSingle.businessServiceData != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">촬영시간(분)</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>분</span>
											    </div>
											</c:if>
											<c:if test="${resultSingle.businessServiceFunction != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">런닝타입(초)</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceFunction}</span>초</span>
											    </div>
											</c:if>
				                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">작업일</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
											    </div>
											</c:if>
				                            <div class="rightBox_check_list">
											    <span class="rightBox_check_list_text">수정 횟수</span>
											    <span class="rightBox_business_inner">
											        <c:choose>
											            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
											            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
											        </c:choose>
											    </span>
											</div>
				                        </div>
				                        <button class="rightBox_buy_button" onclick="">구매하기</button>
				                    </div>
			                    </c:if>
			                    <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('사진')}">
				                    <div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">보정 작업</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                        	</div>
					                        <div class="rightBox_check_list_inner">
					                            <c:if test="${resultSingle.businessServiceData != '0'}">
												    <div class="rightBox_check_list">
												        <span class="rightBox_check_list_text">촬영시간(분)</span>
												        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>분</span>
												    </div>
												</c:if>
												<c:if test="${resultSingle.businessServiceFunction != '0'}">
												    <div class="rightBox_check_list">
												        <span class="rightBox_check_list_text">컷수</span>
												        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceFunction}</span>장</span>
												    </div>
												</c:if>
					                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
												    <div class="rightBox_check_list">
												        <span class="rightBox_check_list_text">작업일</span>
												        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
												    </div>
												</c:if>
					                            <div class="rightBox_check_list">
												    <span class="rightBox_check_list_text">수정 횟수</span>
												    <span class="rightBox_business_inner">
											        <c:choose>
											            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
											            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
											        </c:choose>
											    </span>
											</div>
					                        </div>
				                        	<button class="rightBox_buy_button" onclick="">구매하기</button>
				                   		 </div>
			                   		 </div>
		                   		 </c:if>
		                   		 <c:if test="${result.boardProCategory.equals('마케팅')}">
				                    <div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_inner">
				                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">작업일</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
											    </div>
											</c:if>
				                            <div class="rightBox_check_list">
											    <span class="rightBox_check_list_text">수정 횟수</span>
											    <span class="rightBox_business_inner">
										        <c:choose>
										            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
										            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
										        </c:choose>
											    </span>
											</div>
				                        </div>
				                        <button class="rightBox_buy_button" onclick="">구매하기</button>
				                    </div>
			                    </c:if>
			                    <c:if test="${result.boardProCategory.equals('교육')}">
				                    <div class="rightConbox rightCon1 rightConboxSingle">
				                        <span class="rightBox_businessMenuPay businessServicePay">${resultSingle.businessServicePay}원</span>
				                        <span class="vat">(VAT포함)</span>
				                        <div class="rightBox_second_title">
				                            <span class="rightBox_sample1">${resultSingle.businessServiceName}</span>
				                            <span class="rightBox_sample2">${resultSingle.businessServiceGuide}</span>
				                        </div>
				                        <div class="rightBox_check_list_inner">
				                        	<div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">1회당 레슨시간(분)</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceFunction}</span>분</span>
				                            </div>
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">레슨 횟수</span><span class="rightBox_business_inner"><span>${resultSingle.businessServiceData}</span>회</span>
				                            </div>
				                            <c:if test="${resultSingle.businessServiceWorkDate != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">작업일</span>
											        <span class="rightBox_business_inner"><span>${resultSingle.businessServiceWorkDate}</span>일</span>
											    </div>
											</c:if>
				                            <div class="rightBox_check_list">
											    <span class="rightBox_check_list_text">수정 횟수</span>
											    <span class="rightBox_business_inner">
										        <c:choose>
										            <c:when test="${resultSingle.businessServiceRetouch == '9999'}">제한없음</c:when>
										            <c:otherwise><span>${resultSingle.businessServiceRetouch}</span>회</c:otherwise>
										        </c:choose>
											    </span>
											</div>
				                        </div>
				                        <button class="rightBox_buy_button" onclick="">구매하기</button>
				                    </div>
			                    </c:if>
						</section>
	               	</c:when>
	               	<c:when test="${result.businessServiceType.equals('STANDARD')}">
		                <section class="right_payTabList">
		                	<c:if test="${result.boardProCategory.equals('IT·프로그래밍')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">반응형 웹</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">광고 기능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                        	<c:if test="${resultS.businessServiceFunction != '0'}">
				                        	<div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>개</span>
				                            </div>
			                            </c:if>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>페이지</span>
			                            </div>
			                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">반응형 웹</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">광고 기능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
		                            </div>
			                        <div class="rightBox_check_list_inner">
			                        	<c:if test="${resultD.businessServiceFunction != '0'}">
				                        	<div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>개</span>
				                            </div>
			                            </c:if>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>페이지</span>
			                            </div>
			                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">반응형 웹</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">광고 기능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
		                            </div>
			                        <div class="rightBox_check_list_inner">
			                        	<c:if test="${resultP.businessServiceFunction != '0'}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>개</span>
				                            </div>
			                            </c:if>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>페이지</span>
			                            </div>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                    </c:if>
		                    <c:if test="${result.boardProCategory.equals('디자인')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">응용 디자인</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultS.businessServiceData != '0'}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>개</span>
				                            </div>
			                            </c:if>
			                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">응용 디자인</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
		                            </div>
			                        	<div class="rightBox_check_list_inner">
			                        		<c:if test="${resultD.businessServiceData != '0'}">
					                            <div class="rightBox_check_list">
					                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>개</span>
					                            </div>
				                            </c:if>
				                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
				                            <c:if test="${resultD.businessServiceRetouch != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">수정 횟수</span>
											        <span class="rightBox_business_inner">
											            <c:choose>
											                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
											                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
											            </c:choose>
											        </span>
											    </div>
											</c:if>
			                        	</div>
		                        	<button class="rightBox_buy_button" onclick="">구매하기</button>
		                    	</div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">응용 디자인</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="/resources/img/check.png" alt="rightBox_check_png"
			                                    class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                        	<c:if test="${resultP.businessServiceData != '0'}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>개</span>
				                            </div>
			                            </c:if>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                   </c:if>
		                   <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('영상')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">배경 음악</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultS.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">러닝타임(초)</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>초</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">배경 음악</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultD.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">러닝타임(초)</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>초</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">배경 음악</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                            </div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultP.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">러닝타임(초)</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>초</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                   </c:if>
		                   <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('사진')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">보정 작업</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                        	</div>
				                        <div class="rightBox_check_list_inner">
				                            <c:if test="${resultS.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">컷수</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>컷</span>
										    </div>
										</c:if>
				                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
				                            <c:if test="${resultS.businessServiceRetouch != '0'}">
											    <div class="rightBox_check_list">
											        <span class="rightBox_check_list_text">수정 횟수</span>
											        <span class="rightBox_business_inner">
											            <c:choose>
											                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
											                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
											            </c:choose>
											        </span>
											    </div>
											</c:if>
				                        </div>
			                        	<button class="rightBox_buy_button" onclick="">구매하기</button>
		                   		 	</div>
	                   		 	</div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">보정 작업</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                        	</div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultD.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">컷수</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>컷</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                            <div class="rightBox_check_list">
			                                <span class="rightBox_check_list_text">보정 작업</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
			                        	</div>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultP.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">촬영시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>분</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">컷수</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>컷</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                   </c:if>
		                   <c:if test="${result.boardProCategory.equals('마케팅')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
		                        	<c:if test="${result.boardProSubcatCategory.equals('언론홍보')}">
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">원고 수정</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
		                            </c:if>
			                        <div class="rightBox_check_list_inner">
			                        	<c:choose>
										    <c:when test="${result.boardProSubcatCategory.equals('인스타그램 관리')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">A/S기간</span>
										            <span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:when test="${result.boardProSubcatCategory.equals('체험단·기자단')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">유지 기간(일)</span>
										            <span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:otherwise>
										    
										    </c:otherwise>
										</c:choose>
			                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <c:if test="${result.boardProSubcatCategory.equals('언론홍보')}">
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">원고 수정</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
		                            </c:if>
			                        <div class="rightBox_check_list_inner">
			                            <c:choose>
										    <c:when test="${result.boardProSubcatCategory.equals('인스타그램 관리')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">A/S기간</span>
										            <span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:when test="${result.boardProSubcatCategory.equals('체험단·기자단')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">유지 기간(일)</span>
										            <span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:otherwise>
										    
										    </c:otherwise>
										</c:choose>
			                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <c:if test="${result.boardProSubcatCategory.equals('언론홍보')}">
				                        <div class="rightBox_check_list_IT">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">원고 수정</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
				                        </div>
		                            </c:if>
			                        <div class="rightBox_check_list_inner">
			                            <c:choose>
										    <c:when test="${result.boardProSubcatCategory.equals('인스타그램 관리')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">A/S기간</span>
										            <span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:when test="${result.boardProSubcatCategory.equals('체험단·기자단')}">
										        <div class="rightBox_check_list">
										            <span class="rightBox_check_list_text">유지 기간(일)</span>
										            <span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>일</span>
										        </div>
										    </c:when>
										    <c:otherwise>
										    
										    </c:otherwise>
										</c:choose>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                   </c:if>
		                   <c:if test="${result.boardProCategory.equals('교육')}">
			                    <input type="radio" name="rightTabList01" id="rightTabList01" checked>
			                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList02">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
			                    <input type="radio" name="rightTabList01" id="rightTabList03">
			                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
			                
			                    <div class="rightConbox rightCon1">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultS.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                        	<c:if test="${result.boardProMiddleCategory.equals('외국어 레슨' || '미술·글쓰기')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의자료제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                        	<c:if test="${result.boardProMiddleCategory.equals('댄스·뮤직')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의실 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultS.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">1회당 레슨시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>분</span>
										    </div>
										</c:if>
										<c:if test="${resultS.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">레슨횟수</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>회</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultS.businessServiceRetouch != 0}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultS.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultS.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon2">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultD.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
			                        	<c:if test="${result.boardProMiddleCategory.equals('외국어 레슨' || '미술·글쓰기')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의자료제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                            <c:if test="${result.boardProMiddleCategory.equals('댄스·뮤직')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의실 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultD.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">1회당 레슨시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>분</span>
										    </div>
										</c:if>
										<c:if test="${resultD.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">레슨횟수</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>회</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultD.businessServiceRetouch != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultD.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultD.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
			                    <div class="rightConbox rightCon3">
			                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
			                        <span class="vat">(VAT포함)</span>
			                        <div class="rightBox_second_title">
			                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
			                            <span class="rightBox_sample2">${resultP.businessServiceGuide}</span>
			                        </div>
			                        <div class="rightBox_check_list_IT">
				                        <c:if test="${result.boardProMiddleCategory.equals('외국어 레슨' || '미술·글쓰기')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의자료제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                            <c:if test="${result.boardProMiddleCategory.equals('댄스·뮤직')}">
				                            <div class="rightBox_check_list">
				                                <span class="rightBox_check_list_text">강의실 제공</span><img src="/resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
				                            </div>
			                            </c:if>
			                        </div>
			                        <div class="rightBox_check_list_inner">
			                            <c:if test="${resultP.businessServiceData != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">1회당 레슨시간(분)</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>분</span>
										    </div>
										</c:if>
										<c:if test="${resultP.businessServiceFunction != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">레슨횟수</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>회</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceWorkDate != '0'}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">작업일</span>
										        <span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
										    </div>
										</c:if>
			                            <c:if test="${resultP.businessServiceRetouch != 0}">
										    <div class="rightBox_check_list">
										        <span class="rightBox_check_list_text">수정 횟수</span>
										        <span class="rightBox_business_inner">
										            <c:choose>
										                <c:when test="${resultP.businessServiceRetouch == '9999'}">제한없음</c:when>
										                <c:otherwise><span>${resultP.businessServiceRetouch}</span>회</c:otherwise>
										            </c:choose>
										        </span>
										    </div>
										</c:if>
			                        </div>
			                        <button class="rightBox_buy_button" onclick="">구매하기</button>
			                    </div>
		                   </c:if>
		                </section>
	                </c:when>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.userNo == result.userNo}">
							<div class="Detail_MasterPage">
								<button type="button" class="Detail_Edit_button" onclick="location.href='/BoardPro/Edit.do?boardProNo=${result.boardProNo}'" name="Edit_Page_No">수정하기</button>
								<button type="button" class="BoardPro_Delete_button" onclick="location.href='/boardPro/delete.do?boardProNo=${result.boardProNo}'">삭제하기</button>
							</div>
						</c:when>
					</c:choose>
                </form>
            </div>
        </div>
    </main>
        <div class="Detail_TopButton">
        	<a href="#" onclick="window.scrollTo(0, 0);"><img src="/resources/img/Up_Point.png" class="Detail_TopButton_Png"></a>
        </div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
