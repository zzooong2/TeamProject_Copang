<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" href="../../resources/css/common/index_Detail_Insert01.css">
    <link rel="stylesheet" href="../../resources/css/common/header.css">
    <link rel="stylesheet" href="../../resources/css/common/footer.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/Detail_Insert/Detail_Insert01.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/Detail_Insert/Detail_Insert02.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/Detail_Insert/Detail_Insert03.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/Detail_Insert/Detail_Insert04.css">
    <script src="https://kit.fontawesome.com/1992e1ad9e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <%@ include file="/views/common/head.jsp"%>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>

    <main class="main">
        <form class="BoardProEnroll_formStyle" action="/BoardPro/enroll.do" id="enrollForm" method="POST" enctype="multipart/form-data">
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
                


                <!-- =============================================================== Right Contents 1 =============================================================== -->
                <div class="Detail_right_Contents" id="Detail_right_Contents1" style="display: block;">
                    <div class="Detail_right_Contents1_Title">
                        <div class="Detail_right_Contents1_box1"><span class="Detail_right_type_box">&nbsp;&nbsp;제목<span class="Detail_right_check">*</span></span>
                            <input class="Detail_right_Contents1_Title_Input" type="text" placeholder="제목을 입력해주세요." name="enroll_Title"><span  class="Detail_right_Contents1_unit1">드립니다.</span>
                        </div>
                    </div>
                    <div class="Detail_right_Contents1_Category">
                        <div class="Detail_right_Contents1_box1"><span class="Detail_right_type_box">&nbsp;&nbsp;카테고리<span class="Detail_right_check">*</span></span>
                                <select class="Detail_right_Contents1_Category_Style" name="enroll_Category">
                                    <option class="Detail_right_Contents1_Category_Style" value="">카테고리를 선택하여주세요</option>
                                    <option class="Detail_right_Contents1_Category_Style" value="IT·프로그래밍">IT·프로그래밍</option>
                                    <option class="Detail_right_Contents1_Category_Style" value="디자인">디자인</option>
                                    <option class="Detail_right_Contents1_Category_Style" value="영상·사진">영상·사진</option>
                                    <option class="Detail_right_Contents1_Category_Style" value="마케팅">마케팅</option>
                                    <option class="Detail_right_Contents1_Category_Style" value="교육">교육</option>
                                </select>
                        </div>
                    </div>
                    <div class="Detail_right_Contents1_Service">
                        <div class="Detail_right_Contents1_box1"><span class="Detail_right_type_box">&nbsp;&nbsp;서비스 타입<span class="Detail_right_check">*</span></span>
                            <select class="Detail_right_Contents1_Category_Style" name="enroll_Service">
                                <option class="Detail_right_Contents1_Category_Style" value="">서비스 방식을 선택하여주세요</option>
                                <option class="Detail_right_Contents1_Category_Style" value="문서제공">문서제공</option>
                                <option class="Detail_right_Contents1_Category_Style" value="온라인제공">온라인제공</option>
                                <option class="Detail_right_Contents1_Category_Style" value="파견근무">파견근무</option>
                                <option class="Detail_right_Contents1_Category_Style" value="유선상담">유선상담</option>
                            </select>
                        </div>
                    </div>
                    <div class="Detail_right_Contents1_imgbox">
                        <img class="Detail_right_Contents1_img" src="../../resources/img/Business-card.jpg" alt="Business_Card">
                    </div>
                </div>



                <!-- =============================================================== Right Contents 2 =============================================================== -->
    
                <div class="Detail_right_Contents" id="Detail_right_Contents2" style="display: none;">
    
                    <div class="Detail_right_TopTitle">
                        <span class="Detail_right_PayData">가격 정보</span>
    
                        <div class="Detail_right_toggleButon">
                            <div class="toggle_button">
                                <input type="checkbox" class="right_toggle_checkbox" id="right_toggle_slider">
                                <span class="toggle_slider"></span>
                            </div>
                            <label for="right_toggle_slider" class="toggle-label" id="right_toggle_sliderLabel"><span>패키지로 가격 설정</span></label>
                        </div>
                    </div>
    
                    <!-- -------------------------------- Toggle Off -------------------------------- -->
                    <div>
                        <div class="Detail_right_Type1" id="toggleContentOff" style="display: block;">
                            <span class="Detail_right_Type_Text">STANDARD</span>
                            <div class="Detail_right_Type_Title">
                                <div class="Detail_right_type_box1"><span class="Detail_right_box1_text">&nbsp;&nbsp;제목<span class="Detail_right_check">*</span></span>
                                    <input class="type_box_Input input_select" type="text" placeholder="제목을 입력해주세요." name="enroll_ServiceName" maxlength="20">
                                </div>
                                <div class="Detail_right_type_box2"><span class="Detail_right_box1_text">&nbsp;&nbsp;설명<span class="Detail_right_check">*</span></span>
                                    <input class="type_box_Input2 input_select" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_ServiceGuide" maxlength="30">
                                </div>
                                <div class="Detail_right_type_box1"><span class="Detail_right_box1_text">&nbsp;&nbsp;금액(VAT포함)<span class="Detail_right_check">*</span></span>
                                    <input class="type_box_Input3 input_select" type="text" placeholder="금액을 입력해주세요." name="enroll_ServicePay" maxlength="9"><span  class="Detail_right_unit">원</span>
                                </div>
                                <div class="Detail_right_type_box1"><span class="Detail_right_box1_text">&nbsp;&nbsp;자료</span>
                                	<input class="type_box_Input3 input_select" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Data" maxlength="9"><span  class="Detail_right_unit">개</span>
                                </div>
                                <div class="Detail_right_type_box3"><span class="Detail_right_box1_text">&nbsp;&nbsp;기능</span>
                                	<input class="type_box_Input3 input_select" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Data" maxlength="9"><span  class="Detail_right_unit">개</span>
                                </div>
                                <div class="Detail_right_type_box1"><span class="Detail_right_box1_text">&nbsp;&nbsp;작업 기간<span  class="Detail_right_check">*</span></span>
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
                                <div class="Detail_right_type_box1 Detail_right_Box_margin"><span class="Detail_right_box1_text">&nbsp;&nbsp;수정 횟수<span class="Detail_right_check">*</span></span>
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
                                    </select><span class="Detail_right_unit">회</span>
                                </div>

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
                                        <span class="Detail_right_Type2_Text">제목<span  class="Detail_right_Type2_check">*</span></span>
                                    </div>
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Standard_Title">
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Deluxe_Title">
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="제목을 입력해주세요." name="enroll_Premium_Title">
                                </div>
                                <div class="Detail_right_Type2_Box2">
                                    <div class="Detail_right_Type2_ON_smallbox2">
                                        <span class="Detail_right_Type2_Text">설명<span  class="Detail_right_Type2_check">*</span></span>
                                    </div>
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Standard_ServiceGuide">
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Deluxe_ServiceGuide">
                                    <input class=" Detail_right_Type2_input" type="text" placeholder="상세 설명을 입력해주세요." name="enroll_Premium_ServiceGuide">
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
                                <div class="Detail_right_Type2_Box">
                                    <div class="Detail_right_Type2_ON_smallbox2">
                                    	<c:choose>
                                        	<span class="Detail_right_Type2_Text">자료</span>
                                        </c:choose>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Standard_Data"><span class="Detail_right_Type2_unit">개</span>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Deluxe_Data"><span class="Detail_right_Type2_unit">개</span>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 자료수를 입력해주세요." name="enroll_Premium_Data"><span class="Detail_right_Type2_unit">개</span>
                                    </div>
                                </div>
                                <div class="Detail_right_Type2_Box ">
                                    <div class="Detail_right_Type2_ON_smallbox2">
                                        <span class="Detail_right_Type2_Text">기능</span>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Standard_Function"><span class="Detail_right_Type2_unit">개</span>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Deluxe_Function"><span class="Detail_right_Type2_unit">개</span>
                                    </div>
                                    <div class="Detail_right_Type2_ON_selectbox">
                                        <input class=" Detail_right_Type2_input2" type="text" placeholder="제공할 기능수를 입력해주세요." name="enroll_Premium_Function"><span class="Detail_right_Type2_unit">개</span>
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
                                        </select><span class="Detail_right_Type2_unit" >일</span>
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
                                        </select><span class="Detail_right_Type2_unit" >일</span>
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
                                        </select><span class="Detail_right_Type2_unit" >일</span>
                                    </div>
                                </div>
                                <div class="Detail_right_Type2_Box Detail_right_Type2_Box_margin">
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
                                        </select><span class="Detail_right_Type2_unit" >회</span>
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
                                    
                                        </select><span class="Detail_right_Type2_unit" >회</span>
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
                                        </select><span class="Detail_right_Type2_unit" >회</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>



                <!-- =============================================================== Right Contents 3 =============================================================== -->
                <div class="Detail_right_Contents3" id="Detail_right_Contents3" style="display: none;">
                    <div class="Detail_right_Contents3_box">
                        <div class="Detail_right_Contents3_Titlebox">
                            <span class="Detail_right_type_box_Title">서비스 설명<span class="Detail_right_check">*</span></span>
                        </div>
                        <div class="Detail_right_Contents3_Textbox">
                            <div class="Detail_right_Contents3_Textbox_buttonAll">
                                <button type="button" class="Detail_right_Contents3_Boldbutton" id="boldButton">B</button>
                                <button type="button" class="Detail_right_Contents3_Italicbutton" id="italicButton">I</button>
                                <button type="button" class="Detail_right_Contents3_Underlinebutton" id="underlineButton">U</button>
                            </div>
                            <div class="Detail_right_Contents3_Textarea" id="Detail_right_Contents3_Textarea" contenteditable="true" name="enroll_ServiceContents"></div>
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
                        <input class="Detail_right_Contents4_input" type="file" id="Detail_right_Contents4_fileInput1" accept="image/*">
                        <div class="Detail_right_Contents4_preview1" id="Detail_right_Contents4_imagePreviews1"></div>
                    </div>
                    <div class="Detail_right_Contents4_box2">
                        <div class="Detail_right_Contents4_UploadTitle">
                            <label for="Detail_right_Contents4_fileInput2" class="Detail_right_Contents4_fileInput2">상세페이지 이미지 :</label>
                            <div id="imageCountDisplay2" class="imageCountDisplay">0/5</div>
                        </div>
                        <input class="Detail_right_Contents4_input" type="file" id="Detail_right_Contents4_fileInput2" accept="image/*" multiple>
                        <div class="Detail_right_Contents4_preview2" id="Detail_right_Contents4_imagePreviews2"></div>
                    </div>
                </div>



                <!-- =============================================================================================================================================== -->
            </div>
            <div class="boardProEnroll_Button_All">
                <button type="button" class="boardProEnroll_ButtonStyle1" id="boardProEnroll_Next_Button1">이전으로</button><button type="button" class="boardProEnroll_ButtonStyle2" id="boardProEnroll_Next_Button2">다음으로</button><button type="submit" class="boardProEnroll_ButtonStyle3" id="boardProEnroll_Next_Button3">제출</button>
            </div>
        </form>
    </main>
    <%-- <%@ include file="/views/common/footer.jsp"%> --%>
    <footer>
        <div class="team">
                <h3>Copang</h3>
                <br>
                <p>김현중   김이석</p>
                <br>
                <p>유상현   정은식</p>
            </div>
            
            <div class="academy">
                <h3>ACADEMY INFO</h3>
                <br>
                <p>그린컴퓨터아트학원</p>
                <br>
                <p>주소 : 경기도 안양시 만안구 안양로 303, S210, S213,215, S802-S804호
                    <br>(안양동, 메쎄포스빌)</p>
            </div>
        </footer>
</body>
<script src="../../resources/js/boardProEnroll/Detail_Insert02.js"></script>
<script src="../../resources/js/boardProEnroll/Detail_Insert03.js"></script>
<script src="../../resources/js/boardProEnroll/fileUpload.js"></script>
</html>

