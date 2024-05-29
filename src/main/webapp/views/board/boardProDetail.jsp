<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" type="text/css" href="../../resources/css/board/boardProDetail.css">
    <%@ include file="/views/common/head.jsp"%>
</head>
<body>
   	<%@ include file="/views/common/header.jsp"%>

    <div id="main">
        <section class="detail_containor">
    

            <!---------------------------- Contents Left ---------------------------->
    
            <div class="left_contents">
                <div class="main_img">
                    <img src="../../resources/upload/9o1E31716716556.jpg" alt="잡오브브라더스" class="img_main">
                </div>
            
                <div class="left_star">
                    <p class="star_style">★★★★★ <span class="star_point">5.0</span></p>
                </div>

                <section class="left_TabList">
                    <input type="radio" name="tabmenu01" id="tabList01" checked>
                    <label class="tabMenuLabel" for="tabList01">서비스 설명</label>
                    <input type="radio" name="tabmenu01" id="tabList02">
                    <label class="tabMenuLabel tabpoint" id="con2" onclick="testPadding(this.id)"  for="tabList02">가격 정보</label>
                    <input type="radio" name="tabmenu01" id="tabList03">
                    <label class="tabMenuLabel tabpoint" for="tabList03">수정·재진행</label>
                    <input type="radio" name="tabmenu01" id="tabList04">
                    <label class="tabMenuLabel tabpoint" for="tabList04">취소·환불</label>
                    <input type="radio" name="tabmenu01" id="tabList05">
                    <label class="tabMenuLabel tabpoint" for="tabList05">서비스 리뷰</label>

                    <div class="conbox con1"></div>
                    <div class="conbox con2">
                        <p class="leftTabList_title">가격 정보</p>
                        <table class="leftPayList">
                            <thead lass="tableLine0">
                                <th class="tableTitle"></th>
                                <th class="tableTitle">STANDARD</th>
                                <th class="tableTitle">DELUXE</th>
                                <th class="tableTitle">PREMIUM</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="tableLine">기능 구현</td>
                                    <td class="tableLine">응용프로그램</td>
                                    <td class="tableLine">웹</td>
                                    <td class="tableLine">보안</td>
                                </tr>
                                <tr>
                                    <td class="tableLine">수정 횟수</td>
                                    <td class="tableLine">${BUSINESS_RETOUCH}</td>
                                    <td class="tableLine">${BUSINESS_RETOUCH}</td>
                                    <td class="tableLine">${BUSINESS_RETOUCH}</td>
                                </tr>
                                <tr class="tableLine2">
                                    <td class="tableLine">작업일</td>
                                    <td class="tableLine">${BUSINESS_DATE}</td>
                                    <td class="tableLine">${BUSINESS_DATE}</td>
                                    <td class="tableLine">${BUSINESS_DATE}</td>
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
                    <div class="conbox con5"></div>
                </section>
            </div>
    
            <!---------------------------- Contents Right ---------------------------->
    
            <div class="right_contents">
                <div class="right_up">
                    <img src="../../resources/img/Link_img.png" alt="공유하기_Link_img" class="img_link">
                    <p style="font-size: 20px;">Title : 전문가 등록 제목 소스 기재</p>
                </div>

                <section class="right_payTabList">
                    <input type="radio" name="rightTabMenu01" id="rightTabList01" checked>
                    <label class="rightTabMenuLabel" for="rightTabList01">STANDARD</label>
                    <input type="radio" name="rightTabMenu01" id="rightTabList02">
                    <label class="rightTabMenuLabel tabpoint" for="rightTabList02">DELUXE</label>
                    <input type="radio" name="rightTabMenu01" id="rightTabList03">
                    <label class="rightTabMenuLabel tabpoint" for="rightTabList03">PREMIUM</label>
                
                    <div class="rightConbox rightCon1">
                        <p class="rightBox_businessMenuPay">(BUSINESS_MENU)</p>
                        <p class="vat">(VAT포함)</p>
                        <div class="rightBox_second_title">
                            <span class="rightBox_sample1">${secondTitle}</span>
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
                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_TYPE)페이지</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_FUNCTION)일</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_RETOUCH)회</span>
                            </div>
                        </div>
                        <button class="rightBox_buy_button" onclick="">구매하기</button>
                    </div>
                    <div class="rightConbox rightCon2">
                        <p class="rightBox_businessMenuPay">(BUSINESS_MENU)</p>
                        <p class="vat">(VAT포함)</p>
                        <div class="rightBox_second_title">
                            <span class="rightBox_sample1">${secondTitle}</span>
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
                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_TYPE)페이지</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_FUNCTION)일</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_RETOUCH)회</span>
                            </div>
                        </div>
                        <button class="rightBox_buy_button" onclick="">구매하기</button>
                    </div>
                    <div class="rightConbox rightCon3">
                        <p class="rightBox_businessMenuPay">(BUSINESS_MENU)</p>
                        <p class="vat">(VAT포함)</p>
                        <div class="rightBox_second_title">
                            <span class="rightBox_sample1">${secondTitle}</span>
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
                                <span class="rightBox_check_list_text">페이지</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_TYPE)페이지</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">작업일</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_FUNCTION)일</span>
                            </div>
                            <div class="rightBox_check_list">
                                <span class="rightBox_check_list_text">수정 횟수</span><span class="rightBox_business_inner">(BUSINESS_MENU-BM_RETOUCH)회</span>
                            </div>
                        </div>
                        <button class="rightBox_buy_button" onclick="">구매하기</button>
                    </div>
                </section>








            </div>
        </section>
    </div>
	<%-- <%@ include file="/views/common/footer.jsp"%> --%>
</body>
</html>


<script>
    function testPadding(id) {
        console.log(id);
        if(id === 'con2') {
            document.getElementById('main').style.paddingBottom = '300px'; 
        }
    }

</script>