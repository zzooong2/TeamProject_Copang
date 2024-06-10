<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" href="../../resources/css/common/header.css">
    <link rel="stylesheet" href="../../resources/css/common/footer.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/board/boardProDetail.css">
    <%@ include file="/views/common/head.jsp"%>
    <script src="https://kit.fontawesome.com/1992e1ad9e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../../resources/js/boardProDetail/boardProDetail.js"></script>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>

    <main class="main_Detail">
        <div class="detail_containor">
    

            <!---------------------------- Contents Left ---------------------------->
    
            <div class="left_contents">
                <div class="Detail_Left_MainImage_box">
                	<img src="${pageContext.request.contextPath}/resources/upload/main/${resultF.fileName}" alt="${resultF.fileName}" class="Detail_Left_MainImage">
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

                    <div class="conbox con1">${result.boardProContents}</div>
                    <div class="conbox con2">
					    <p class="leftTabList_title">가격 정보</p>
					    <table class="leftPayList">
					        <thead class="tableLine0">
					            <tr>
					                <th class="tableTitle"></th>
					                <th class="tableTitle">STANDARD</th>
					                <th class="tableTitle">DELUXE</th>
					                <th class="tableTitle">PREMIUM</th>
					            </tr>
					        </thead>
					        <!-- IT·프로그래밍 카테고리 -->
					        <tbody id="Detail_Category_BusinessMenu_IT" class="categoryTable">
					            <tr>
					                <td class="tableLine">페이지</td>
					                <td class="tableLine">${resultS.businessServiceData}페이지</td>
					                <td class="tableLine">${resultD.businessServiceData}페이지</td>
					                <td class="tableLine">${resultP.businessServiceData}페이지</td>
					            </tr>
					            <tr>
					                <td class="tableLine">기능</td>
					                <td class="tableLine">${resultS.businessServiceFunction}개</td>
					                <td class="tableLine">${resultD.businessServiceFunction}개</td>
					                <td class="tableLine">${resultP.businessServiceFunction}개</td>
					            </tr>
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					        <!-- 디자인 카테고리 -->
					        <tbody id="Detail_Category_BusinessMenu_Design" class="categoryTable">
					            <tr>
					                <td class="tableLine">시안</td>
					                <td class="tableLine">${resultS.businessServiceData}개</td>
					                <td class="tableLine">${resultD.businessServiceData}개</td>
					                <td class="tableLine">${resultP.businessServiceData}개</td>
					            </tr>
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					        <!-- 영상·사진 카테고리 - 영상 -->
					        <tbody id="Detail_Category_BusinessMenu_Video" class="categoryTable">
					            <tr>
					                <td class="tableLine">촬영시간(분)</td>
					                <td class="tableLine">${resultS.businessServiceData}분</td>
					                <td class="tableLine">${resultD.businessServiceData}분</td>
					                <td class="tableLine">${resultP.businessServiceData}분</td>
					            </tr>
					            <tr>
					                <td class="tableLine">런닝타임(초)</td>
					                <td class="tableLine">${resultS.businessServiceFunction}초</td>
					                <td class="tableLine">${resultD.businessServiceFunction}초</td>
					                <td class="tableLine">${resultP.businessServiceFunction}초</td>
					            </tr>
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					        <!-- 영상·사진 카테고리 - 사진 -->
					        <tbody id="Detail_Category_BusinessMenu_Photo" class="categoryTable">
					            <tr>
					                <td class="tableLine">촬영시간(분)</td>
					                <td class="tableLine">${resultS.businessServiceData}분</td>
					                <td class="tableLine">${resultD.businessServiceData}분</td>
					                <td class="tableLine">${resultP.businessServiceData}분</td>
					            </tr>
					            <tr>
					                <td class="tableLine">컷수</td>
					                <td class="tableLine">${resultS.businessServiceFunction}장</td>
					                <td class="tableLine">${resultD.businessServiceFunction}장</td>
					                <td class="tableLine">${resultP.businessServiceFunction}장</td>
					            </tr>
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					        <!-- 마케팅 카테고리 -->
					        <tbody id="Detail_Category_BusinessMenu_Marketing" class="categoryTable">
					            <tr>
					                <td class="tableLine">A/S기간</td>
					                <td class="tableLine">${resultS.businessServiceData}일</td>
					                <td class="tableLine">${resultD.businessServiceData}일</td>
					                <td class="tableLine">${resultP.businessServiceData}일</td>
					            </tr>
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					        <!-- 교육 카테고리 -->
					        <tbody id="Detail_Category_BusinessMenu_Study" class="categoryTable">
					            <tr>
					                <td class="tableLine">수정 횟수</td>
					                <td class="tableLine">${resultS.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultD.businessServiceRetouch}회</td>
					                <td class="tableLine">${resultP.businessServiceRetouch}회</td>
					            </tr>
					            <tr>
					                <td class="tableLine">작업일</td>
					                <td class="tableLine">${resultS.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultD.businessServiceWorkDate}일</td>
					                <td class="tableLine">${resultP.businessServiceWorkDate}일</td>
					            </tr>
					            <tr class="tableLine2">
					                <td class="tableLine">금액</td>
					                <td class="tableLine businessServicePay">${resultS.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultD.businessServicePay}원</td>
					                <td class="tableLine businessServicePay">${resultP.businessServicePay}원</td>
					            </tr>
					            <tr>
					                <td></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					                <td><button onclick="" class="leftBuy">구매</button></td>
					            </tr>
					        </tbody>
					    </table>
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
                    <img src="../../resources/img/Link_img.png" alt="공유하기_Link_img" class="img_link">
                    <span class="right_up_text">${result.boardProTitle}</span>
                </div>
                <section class="right_payTabList">
                	<c:if test="${result.boardProCategory.equals('IT·프로그래밍')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                        	<div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>개</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
                            </div>
	                        <div class="rightBox_check_list_inner">
	                        	<div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>개</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
                            </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">기능 추가</span><span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>개</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지 수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                    </c:if>
                    <c:if test="${result.boardProCategory.equals('디자인')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">응용 디자인</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>개</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">응용 디자인</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
                            </div>
	                        	<div class="rightBox_check_list_inner">
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>개</span>
		                            </div>
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
		                            </div>
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
		                            </div>
	                        	</div>
                        	<button class="rightBox_buy_button" onclick="">구매하기</button>
                    	</div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">원본파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">고해상도 파일 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">응용 디자인</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상표등록 가능여부</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">상업적 이용 가능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">시안개수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>개</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                   </c:if>
                   <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('영상')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">배경 음악</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>분</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">러닝타임(초)</span><span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>초</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">배경 음악</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>분</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">러닝타임(초)</span><span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>초</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">배경 음악</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>분</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">러닝타임(초)</span><span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>초</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                   </c:if>
                   <c:if test="${result.boardProCategory.equals('영상·사진') && result.boardProMiddleCategory.equals('사진')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">보정 작업</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                        	</div>
		                        <div class="rightBox_check_list_inner">
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>분</span>
		                            </div>
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">컷 수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceFunction}</span>컷</span>
		                            </div>
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
		                            </div>
		                            <div class="rightBox_check_list">
		                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
		                            </div>
		                        </div>
	                        	<button class="rightBox_buy_button" onclick="">구매하기</button>
	                   		 </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">보정 작업</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                        	</div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>분</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">컷 수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceFunction}</span>컷</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">보정 작업</span><img src="../../resources/img/check.png" alt="rightBox_check_png" class="rightBox_check_png">
	                        	</div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">촬영시간(분)</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>분</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">컷 수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceFunction}</span>컷</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                   </c:if>
                   <c:if test="${result.boardProCategory.equals('마케팅')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                   </c:if>
                   <c:if test="${result.boardProCategory.equals('교육')}">
	                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
	                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
	                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
	                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
	                
	                    <div class="rightConbox rightCon1">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultS.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultS.businessServiceName}</span>
	                            <span class="">${resultS.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultS.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultS.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultS.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon2">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultD.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultD.businessServiceName}</span>
	                            <span class="">${resultD.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultD.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultD.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultD.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
	                    <div class="rightConbox rightCon3">
	                        <span class="rightBox_businessMenuPay businessServicePay">${resultP.businessServicePay}원</span>
	                        <span class="vat">(VAT포함)</span>
	                        <div class="rightBox_second_title">
	                            <span class="rightBox_sample1">${resultP.businessServiceName}</span>
	                            <span class="">${resultP.businessServiceGuide}</span>
	                        </div>
	                        <div class="rightBox_check_list_IT">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">맞춤 디자인 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">반응형 웹</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">크로스 브라우징</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">결제 기능 삽입</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">광고 기능</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">요건정의서</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">소스 코드 제공</span><img src="../../resources/img/check.png" alt="rightBox_check_png"
	                                    class="rightBox_check_png">
	                            </div>
	                        </div>
	                        <div class="rightBox_check_list_inner">
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner"><span>${resultP.businessServiceData}</span>페이지</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner"><span>${resultP.businessServiceWorkDate}</span>일</span>
	                            </div>
	                            <div class="rightBox_check_list">
	                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner"><span>${resultP.businessServiceRetouch}</span>회</span>
	                            </div>
	                        </div>
	                        <button class="rightBox_buy_button" onclick="">구매하기</button>
	                    </div>
                   </c:if>
                </section>
            </div>
        </div>
    </main>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
